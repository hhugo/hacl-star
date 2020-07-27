module Hacl.Impl.P256.PointAdd

open FStar.HyperStack.All
open FStar.HyperStack
module ST = FStar.HyperStack.ST

open Lib.IntTypes
open Hacl.Impl.P256.Arithmetics

open Lib.Buffer

(* open Spec.P256.Lemmas *)
open Hacl.Spec.P256.Definition
open Spec.P256
open Hacl.Impl.SolinasReduction
open Hacl.Spec.P256.MontgomeryMultiplication
open Hacl.Impl.P256.LowLevel 
open Hacl.Impl.P256.LowLevel.PrimeSpecific
open Hacl.Impl.P256.MontgomeryMultiplication
open Spec.P256
open Hacl.Impl.P256.Math 

open Hacl.Impl.P256.PointDouble

open FStar.Tactics 
open FStar.Tactics.Canon

open FStar.Math.Lemmas

open FStar.Mul

#reset-options "--z3rlimit 300" 

val point_add: #c: curve -> p: point c -> q: point c -> result: point c -> tempBuffer: lbuffer uint64 (size 88) -> 
   Stack unit (requires fun h -> live h p /\ live h q /\ live h result /\ live h tempBuffer /\ 
   eq_or_disjoint q result /\
   disjoint p q /\ disjoint p tempBuffer /\ disjoint q tempBuffer /\ disjoint p result /\ disjoint result tempBuffer /\  
    as_nat c h (gsub p (size 8) (size 4)) < prime256 /\ 
    as_nat c h (gsub p (size 0) (size 4)) < prime256 /\ 
    as_nat c h (gsub p (size 4) (size 4)) < prime256 /\
    as_nat c h (gsub q (size 8) (size 4)) < prime256 /\ 
    as_nat c h (gsub q (size 0) (size 4)) < prime256 /\  
    as_nat c h (gsub q (size 4) (size 4)) < prime256 
    ) 
   (ensures fun h0 _ h1 -> 
     modifies (loc tempBuffer |+| loc result) h0 h1 /\ 
     as_nat c h1 (gsub result (size 8) (size 4)) < prime256 /\ 
     as_nat c h1 (gsub result (size 0) (size 4)) < prime256 /\ 
     as_nat c h1 (gsub result (size 4) (size 4)) < prime256 /\
     (
       let pX, pY, pZ = gsub p (size 0) (size 4), gsub p (size 4) (size 4), gsub p (size 8) (size 4) in 
       let qX, qY, qZ = gsub q (size 0) (size 4), gsub q (size 4) (size 4), gsub q (size 8) (size 4) in 
       let x3, y3, z3 = gsub result (size 0) (size 4), gsub result (size 4) (size 4), gsub result (size 8) (size 4) in 
       
       let pxD, pyD, pzD = fromDomain_ #c (as_nat c h0 pX), fromDomain_ #c (as_nat c h0 pY), fromDomain_ #c (as_nat c h0 pZ) in 
       let qxD, qyD, qzD = fromDomain_ #c (as_nat c h0 qX), fromDomain_ #c (as_nat c h0 qY), fromDomain_ #c (as_nat c h0 qZ) in 
       let x3D, y3D, z3D = fromDomain_ #c (as_nat c h1 x3), fromDomain_ #c (as_nat c h1 y3), fromDomain_ #c (as_nat c h1 z3) in
      
       let xN, yN, zN = _point_add #c (pxD, pyD, pzD) (qxD, qyD, qzD) in 
       x3D == xN /\ y3D == yN /\ z3D == zN
  )
)
