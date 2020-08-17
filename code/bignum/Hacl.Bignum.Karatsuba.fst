module Hacl.Bignum.Karatsuba

open FStar.HyperStack
open FStar.HyperStack.ST
open FStar.Mul

open Lib.IntTypes
open Lib.Buffer

open Hacl.Bignum.Definitions
open Hacl.Bignum.Base
open Hacl.Impl.Lib

open Hacl.Bignum.Addition
open Hacl.Bignum.Multiplication

module ST = FStar.HyperStack.ST
module LSeq = Lib.Sequence
module B = LowStar.Buffer
module Loops = Lib.LoopCombinators
module K = Hacl.Spec.Bignum.Karatsuba


#set-options "--z3rlimit 50 --fuel 0 --ifuel 0"

inline_for_extraction noextract
val bn_sign_abs:
    #aLen:size_t
  -> a:lbignum aLen
  -> b:lbignum aLen
  -> tmp:lbignum aLen
  -> res:lbignum aLen ->
  Stack carry
  (requires fun h ->
    live h a /\ live h b /\ live h res /\ live h tmp /\
    eq_or_disjoint a b /\ disjoint a res /\ disjoint b res /\
    disjoint a tmp /\ disjoint b tmp /\ disjoint tmp res)
  (ensures  fun h0 c h1 -> modifies (loc res |+| loc tmp) h0 h1 /\
    (c, as_seq h1 res) == K.bn_sign_abs (as_seq h0 a) (as_seq h0 b))

let bn_sign_abs #aLen a b tmp res =
  let c0 = bn_sub_eq_len aLen a b tmp in
  let c1 = bn_sub_eq_len aLen b a res in
  map2T aLen res (Hacl.Spec.Bignum.Definitions.mask_select (u64 0 -. c0)) res tmp;
  c0


inline_for_extraction noextract
val bn_middle_karatsuba:
    #aLen:size_t
  -> c0:carry
  -> c1:carry
  -> c2:carry
  -> t01:lbignum aLen
  -> t23:lbignum aLen
  -> tmp:lbignum aLen
  -> res:lbignum aLen ->
  Stack uint64
  (requires fun h ->
    live h t01 /\ live h t23 /\ live h tmp /\ live h res /\
    disjoint t01 t23 /\ disjoint tmp res /\ disjoint t01 res /\
    disjoint t01 tmp /\ disjoint t23 tmp /\ disjoint t23 res)
  (ensures  fun h0 c h1 -> modifies (loc tmp |+| loc res) h0 h1 /\
    (c, as_seq h1 res) == K.bn_middle_karatsuba c0 c1 c2 (as_seq h0 t01) (as_seq h0 t23))

let bn_middle_karatsuba #aLen c0 c1 c2 t01 t23 tmp res =
  let c_sign = c0 ^. c1 in
  let c3 = bn_sub_eq_len aLen t01 t23 tmp in let c3 = c2 -. c3 in
  let c4 = bn_add_eq_len aLen t01 t23 res in let c4 = c2 +. c4 in
  let mask = u64 0 -. c_sign in
  map2T aLen res (Hacl.Spec.Bignum.Definitions.mask_select mask) res tmp;
  Hacl.Spec.Bignum.Definitions.mask_select mask c4 c3


inline_for_extraction noextract
val bn_lshift_add_in_place:
    #aLen:size_t
  -> #bLen:size_t
  -> a:lbignum aLen
  -> b:lbignum bLen
  -> i:size_t{v i + v bLen <= v aLen} ->
  Stack carry
  (requires fun h -> live h a /\ live h b /\ disjoint a b)
  (ensures  fun h0 c h1 -> modifies (loc a) h0 h1 /\
    (c, as_seq h1 a) == K.bn_lshift_add (as_seq h0 a) (as_seq h0 b) (v i))

let bn_lshift_add_in_place #aLen #bLen a b i =
  let r = sub a i (aLen -! i) in
  let h0 = ST.get () in
  update_sub_f_carry h0 a i (aLen -! i)
  (fun h -> Hacl.Spec.Bignum.Addition.bn_add (as_seq h0 r) (as_seq h0 b))
  (fun _ -> bn_add (aLen -! i) r bLen b r)


inline_for_extraction noextract
val bn_lshift_add_early_stop_in_place:
    #aLen:size_t
  -> #bLen:size_t
  -> a:lbignum aLen
  -> b:lbignum bLen
  -> i:size_t{v i + v bLen <= v aLen} ->
  Stack carry
  (requires fun h -> live h a /\ live h b /\ disjoint a b)
  (ensures  fun h0 c h1 -> modifies (loc a) h0 h1 /\
    (c, as_seq h1 a) == K.bn_lshift_add_early_stop (as_seq h0 a) (as_seq h0 b) (v i))

let bn_lshift_add_early_stop_in_place #aLen #bLen a b i =
  let r = sub a i bLen in
  let h0 = ST.get () in
  update_sub_f_carry h0 a i bLen
  (fun h -> Hacl.Spec.Bignum.Addition.bn_add (as_seq h0 r) (as_seq h0 b))
  (fun _ -> bn_add_eq_len bLen r b r)


inline_for_extraction noextract
val bn_karatsuba_res:
    #aLen:size_t{2 * v aLen <= max_size_t /\ 1 <= v aLen / 2}
  -> r01:lbignum aLen
  -> r23:lbignum aLen
  -> c5:uint64
  -> t45:lbignum aLen
  -> res:lbignum (aLen +! aLen) ->
  Stack carry
  (requires fun h ->
    live h r01 /\ live h r23 /\ live h t45 /\ live h res /\ disjoint t45 res /\
    as_seq h res == LSeq.concat (as_seq h r01) (as_seq h r23))
  (ensures  fun h0 c h1 -> modifies (loc res) h0 h1 /\
    (c, as_seq h1 res) == K.bn_karatsuba_res (as_seq h0 r01) (as_seq h0 r23) c5 (as_seq h0 t45))

let bn_karatsuba_res #aLen r01 r23 c5 t45 res =
  push_frame ();
  let aLen2 = aLen /. 2ul in
  [@inline_let]
  let resLen = aLen +! aLen in
  let c6 = bn_lshift_add_early_stop_in_place res t45 aLen2 in
  let c7 = c5 +. c6 in
  let c7 = create 1ul c7 in
  let c8 = bn_lshift_add_in_place res c7 (aLen +! aLen2) in
  pop_frame ();
  c8


#set-options "--z3rlimit 150"

val bn_karatsuba_mul_:
    i:size_t
  -> aLen:size_t{4 * v aLen <= max_size_t /\ v aLen == pow2 (v i)}
  -> a:lbignum aLen
  -> b:lbignum aLen
  -> tmp:lbignum (4ul *! aLen)
  -> res:lbignum (aLen +! aLen) ->
  Stack unit
  (requires fun h ->
    live h a /\ live h b /\ live h res /\ live h tmp /\
    disjoint res tmp /\ disjoint tmp a /\ disjoint tmp b /\
    disjoint res a /\ disjoint res b /\ eq_or_disjoint a b)
  (ensures  fun h0 _ h1 -> modifies (loc res |+| loc tmp) h0 h1)
//    as_seq h1 res == K.bn_karatsuba_mul_ (v i) (v aLen) (as_seq h0 a) (as_seq h0 b))

[@CInline]
let rec bn_karatsuba_mul_ i aLen a b tmp res =
  let h0 = ST.get () in
  if aLen <. 16ul then
    bn_mul aLen a aLen b res
  else begin
    let aLen2 = aLen /. 2ul in
    let i2 = i -! 1ul in
    Math.Lemmas.pow2_double_mult (v i - 1);

    let a0 = sub a 0ul aLen2 in
    let a1 = sub a aLen2 aLen2 in

    let b0 = sub b 0ul aLen2 in
    let b1 = sub b aLen2 aLen2 in

    // tmp = [ t0_aLen2; t1_aLen2; ..]
    let t0 = sub tmp 0ul aLen2 in
    let t1 = sub tmp aLen2 aLen2 in
    let tmp' = sub tmp aLen aLen2 in

    let c0 = bn_sign_abs a0 a1 tmp' t0 in
    let c1 = bn_sign_abs b0 b1 tmp' t1 in

    // tmp = [ t0_aLen2; t1_aLen2; t23_aLen; ..]
    let t23 = sub tmp aLen aLen in
    let tmp1 = sub tmp (aLen +! aLen) (aLen +! aLen) in
    bn_karatsuba_mul_ i2 aLen2 t0 t1 tmp1 t23;

    let r01 = sub res 0ul aLen in
    let r23 = sub res aLen aLen in
    let h0 = ST.get () in
    bn_karatsuba_mul_ i2 aLen2 a0 b0 tmp1 r01;
    let h1 = ST.get () in
    B.modifies_buffer_elim (B.gsub #uint64 res aLen aLen) (loc r01 |+| loc tmp1) h0 h1;
    bn_karatsuba_mul_ i2 aLen2 a1 b1 tmp1 r23;
    let h2 = ST.get () in
    B.modifies_buffer_elim (B.gsub #uint64 res 0ul aLen) (loc r23 |+| loc tmp1) h1 h2;
    LSeq.lemma_concat2 (v aLen) (as_seq h2 r01) (v aLen) (as_seq h2 r23) (as_seq h2 res);

    let t01 = sub tmp 0ul aLen in
    let c2 = bn_add_eq_len aLen r01 r23 t01 in

    let t45 = sub tmp (aLen +! aLen) aLen in
    let t67 = sub tmp (3ul *! aLen) aLen in
    let c5 = bn_middle_karatsuba c0 c1 c2 t01 t23 t67 t45 in
    let c = bn_karatsuba_res r01 r23 c5 t45 res in
    () end


inline_for_extraction noextract
val get_len_pow2: aLen:size_t -> Tot (res:size_t{v res > 0 ==> v aLen = pow2 (v res)})
let get_len_pow2 aLen =
  match aLen with
  | 16ul -> assert_norm (pow2 4 = 16); 4ul
  | 32ul -> assert_norm (pow2 5 = 32); 5ul
  | 64ul -> assert_norm (pow2 6 = 64); 6ul
  | 128ul -> assert_norm (pow2 7 = 128); 7ul
  | _ -> 0ul


val bn_karatsuba_mul:
    aLen:size_t{0 < v aLen /\ 4 * v aLen <= max_size_t}
  -> a:lbignum aLen
  -> b:lbignum aLen
  -> res:lbignum (aLen +! aLen) ->
  Stack unit
  (requires fun h ->
    live h a /\ live h b /\ live h res /\
    disjoint res a /\ disjoint res b /\ eq_or_disjoint a b)
  (ensures  fun h0 _ h1 -> modifies (loc res) h0 h1 /\
    as_seq h1 res == K.bn_karatsuba_mul (as_seq h0 a) (as_seq h0 b))

[@CInline]
let bn_karatsuba_mul aLen a b res =
  push_frame ();
  let tmp = create (4ul *! aLen) (u64 0) in
  let i = get_len_pow2 aLen in
  if i >. 0ul then begin
    bn_karatsuba_mul_ i aLen a b tmp res;
    admit() end
  else
    bn_mul aLen a aLen b res;
  pop_frame ()