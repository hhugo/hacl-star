module Frodo.KEM

open Lib.IntTypes
open Lib.Sequence
open Lib.ByteSequence

open Spec.Frodo.Params
open Spec.Frodo.KEM

val crypto_kem_keypair:
     unit
  -> tuple2 (lbytes crypto_publickeybytes) (lbytes crypto_secretkeybytes)
let crypto_kem_keypair () = Spec.Frodo.KEM.KeyGen.crypto_kem_keypair ()

val crypto_kem_enc:
    pk:lbytes crypto_publickeybytes
  -> tuple2 (lbytes crypto_ciphertextbytes) (lbytes crypto_bytes)
let crypto_kem_enc pk = Spec.Frodo.KEM.Encaps.crypto_kem_enc pk

val crypto_kem_dec:
     ct:lbytes crypto_ciphertextbytes
  -> sk:lbytes crypto_secretkeybytes
  -> ss:lbytes crypto_bytes
let crypto_kem_dec ct sk = Spec.Frodo.KEM.Decaps.crypto_kem_dec ct sk
