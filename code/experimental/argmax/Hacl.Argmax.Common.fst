module Hacl.Argmax.Common

open FStar.Math.Lemmas
open FStar.Math.Lib
open FStar.Constructive
open FStar.Mul


(* Primes and composite numbers *)

type big = x:int{x > 1}

val isprm: p:big -> bool
let isprm _ = magic()

type prm = n:big{isprm n}

val iscomp: n:big -> Type0
let iscomp n = exists (p:prm) (q:prm). n = p * q

type comp = n:big{iscomp n}

(* Basic algebra *)

val field_el: #n:big -> a:int -> bool
let field_el #n a = a >= 0 && a < n

type fe n = x:int{field_el #n x}

val to_fe: #n:big -> a:nat -> r:fe n
let to_fe #n a = lemma_mod_lt a n; a % n

type binop = #n:big -> fe n -> fe n -> fe n
val ( +% ): binop
val ( *% ): binop
let ( +% ) #n n1 n2 = (n1 + n2) % n
let ( *% ) #n n1 n2 = (n1 * n2) % n

val sqr: #n:big -> fe n -> fe n
let sqr #n a = a *% a

val mul_comm: #n:big -> a:fe n -> b:fe n -> Lemma
  (ensures (a *% b = b *% a))
  [SMTPat (a *% b)]
let mul_comm #n a b = ()

val mul_one: #n:big -> a:fe n -> Lemma
  (ensures (a *% 1 = a /\ 1 *% a = a))
  [SMTPat (1 *% a); SMTPat (a *% 1)]
let mul_one #n a = ()

val fexp: #n:big -> fe n -> e:nat -> Tot (fe n) (decreases e)
let rec fexp #n g e =
  if e = 1 then g
  else if e = 0 then 1
  else
     if n % 2 = 0
     then fexp (g *% g) (e / 2)
     else fexp (g *% g) ((e - 1) / 2) *% g

(* GCD and LCM *)

type divides (a:pos) (b:pos) = cexists (fun (c:pos) -> a * c == b)

type is_gcd (a:pos) (b:pos) (gcd:pos) =
    (forall (d:pos). divides d a /\ divides d b ==> divides d gcd)
    /\ divides gcd a
    /\ divides gcd b

val gcd: a:pos -> b:pos -> Tot (r:pos{is_gcd a b r}) (decreases b)
let rec gcd a b =
  admit();
  let c = a % b in
  if c = 0 then b else gcd b c

val lcm: pos -> pos -> pos
let lcm a b = abs ((a / (gcd a b)) * b)

val isunit: #n:big -> a:fe n -> Type0
let isunit #n a = exists x. a *% x = 1

val finv: #n:big -> a:fe n{isunit a} -> b:fe n{b *% a = 1}
let finv #n a = admit()

val finv_comm2: #n:comp -> x:fe n{isunit x} -> y:fe n{isunit y} -> Lemma
  (ensures (isunit #n (x *% y) /\ finv (x *% y) = finv x *% finv y))
  [SMTPat (finv x *% finv y); SMTPat (finv (x *% y))]
let finv_comm2 #n x y =
  // tactics?
  assume(forall (a:fe n) b c d. (a *% b) *% (c *% d) = (a *% c) *% (b *% d));
  assert((x *% y) *% (finv x *% finv y) = 1);
  admit()
