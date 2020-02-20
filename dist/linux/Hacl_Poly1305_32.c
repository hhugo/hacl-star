/* MIT License
 *
 * Copyright (c) 2016-2020 INRIA, CMU and Microsoft Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */


#include "Hacl_Poly1305_32.h"

u32 Hacl_Poly1305_32_blocklen = (u32)16U;

void Hacl_Poly1305_32_poly1305_init(u64 *ctx, u8 *key)
{
  u64 *acc = ctx;
  u64 *pre = ctx + (u32)5U;
  u8 *kr = key;
  u64 u0;
  u64 lo;
  u64 u;
  u64 hi;
  u64 mask0;
  u64 mask1;
  u64 lo1;
  u64 hi1;
  u64 *r;
  u64 *r5;
  u64 *rn;
  u64 *rn_5;
  u64 r_vec0;
  u64 r_vec1;
  u64 f00;
  u64 f10;
  u64 f25;
  u64 f30;
  u64 f40;
  u64 f0;
  u64 f1;
  u64 f2;
  u64 f3;
  u64 f4;
  u64 f20;
  u64 f21;
  u64 f22;
  u64 f23;
  u64 f24;
  acc[0U] = (u64)0U;
  acc[1U] = (u64)0U;
  acc[2U] = (u64)0U;
  acc[3U] = (u64)0U;
  acc[4U] = (u64)0U;
  u0 = load64_le(kr);
  lo = u0;
  u = load64_le(kr + (u32)8U);
  hi = u;
  mask0 = (u64)0x0ffffffc0fffffffU;
  mask1 = (u64)0x0ffffffc0ffffffcU;
  lo1 = lo & mask0;
  hi1 = hi & mask1;
  r = pre;
  r5 = pre + (u32)5U;
  rn = pre + (u32)10U;
  rn_5 = pre + (u32)15U;
  r_vec0 = lo1;
  r_vec1 = hi1;
  f00 = r_vec0 & (u64)0x3ffffffU;
  f10 = r_vec0 >> (u32)26U & (u64)0x3ffffffU;
  f25 = r_vec0 >> (u32)52U | (r_vec1 & (u64)0x3fffU) << (u32)12U;
  f30 = r_vec1 >> (u32)14U & (u64)0x3ffffffU;
  f40 = r_vec1 >> (u32)40U;
  f0 = f00;
  f1 = f10;
  f2 = f25;
  f3 = f30;
  f4 = f40;
  r[0U] = f0;
  r[1U] = f1;
  r[2U] = f2;
  r[3U] = f3;
  r[4U] = f4;
  f20 = r[0U];
  f21 = r[1U];
  f22 = r[2U];
  f23 = r[3U];
  f24 = r[4U];
  r5[0U] = f20 * (u64)5U;
  r5[1U] = f21 * (u64)5U;
  r5[2U] = f22 * (u64)5U;
  r5[3U] = f23 * (u64)5U;
  r5[4U] = f24 * (u64)5U;
  rn[0U] = r[0U];
  rn[1U] = r[1U];
  rn[2U] = r[2U];
  rn[3U] = r[3U];
  rn[4U] = r[4U];
  rn_5[0U] = r5[0U];
  rn_5[1U] = r5[1U];
  rn_5[2U] = r5[2U];
  rn_5[3U] = r5[3U];
  rn_5[4U] = r5[4U];
}

void Hacl_Poly1305_32_poly1305_update1(u64 *ctx, u8 *text)
{
  u64 *pre = ctx + (u32)5U;
  u64 *acc = ctx;
  u64 e[5U] = { 0U };
  u64 u0 = load64_le(text);
  u64 lo = u0;
  u64 u = load64_le(text + (u32)8U);
  u64 hi = u;
  u64 f0 = lo;
  u64 f1 = hi;
  u64 f010 = f0 & (u64)0x3ffffffU;
  u64 f110 = f0 >> (u32)26U & (u64)0x3ffffffU;
  u64 f20 = f0 >> (u32)52U | (f1 & (u64)0x3fffU) << (u32)12U;
  u64 f30 = f1 >> (u32)14U & (u64)0x3ffffffU;
  u64 f40 = f1 >> (u32)40U;
  u64 f01 = f010;
  u64 f111 = f110;
  u64 f2 = f20;
  u64 f3 = f30;
  u64 f41 = f40;
  u64 b;
  u64 mask;
  u64 f4;
  u64 *r;
  u64 *r5;
  u64 r0;
  u64 r1;
  u64 r2;
  u64 r3;
  u64 r4;
  u64 r51;
  u64 r52;
  u64 r53;
  u64 r54;
  u64 f10;
  u64 f11;
  u64 f12;
  u64 f13;
  u64 f14;
  u64 a0;
  u64 a1;
  u64 a2;
  u64 a3;
  u64 a4;
  u64 a01;
  u64 a11;
  u64 a21;
  u64 a31;
  u64 a41;
  u64 a02;
  u64 a12;
  u64 a22;
  u64 a32;
  u64 a42;
  u64 a03;
  u64 a13;
  u64 a23;
  u64 a33;
  u64 a43;
  u64 a04;
  u64 a14;
  u64 a24;
  u64 a34;
  u64 a44;
  u64 a05;
  u64 a15;
  u64 a25;
  u64 a35;
  u64 a45;
  u64 a06;
  u64 a16;
  u64 a26;
  u64 a36;
  u64 a46;
  u64 t0;
  u64 t1;
  u64 t2;
  u64 t3;
  u64 t4;
  u64 mask261;
  u64 z0;
  u64 z1;
  u64 x0;
  u64 x3;
  u64 x1;
  u64 x4;
  u64 z01;
  u64 z11;
  u64 t;
  u64 z12;
  u64 x11;
  u64 x41;
  u64 x2;
  u64 x01;
  u64 z02;
  u64 z13;
  u64 x21;
  u64 x02;
  u64 x31;
  u64 x12;
  u64 z03;
  u64 x32;
  u64 x42;
  u64 o0;
  u64 o1;
  u64 o2;
  u64 o3;
  u64 o4;
  e[0U] = f01;
  e[1U] = f111;
  e[2U] = f2;
  e[3U] = f3;
  e[4U] = f41;
  b = (u64)0x1000000U;
  mask = b;
  f4 = e[4U];
  e[4U] = f4 | mask;
  r = pre;
  r5 = pre + (u32)5U;
  r0 = r[0U];
  r1 = r[1U];
  r2 = r[2U];
  r3 = r[3U];
  r4 = r[4U];
  r51 = r5[1U];
  r52 = r5[2U];
  r53 = r5[3U];
  r54 = r5[4U];
  f10 = e[0U];
  f11 = e[1U];
  f12 = e[2U];
  f13 = e[3U];
  f14 = e[4U];
  a0 = acc[0U];
  a1 = acc[1U];
  a2 = acc[2U];
  a3 = acc[3U];
  a4 = acc[4U];
  a01 = a0 + f10;
  a11 = a1 + f11;
  a21 = a2 + f12;
  a31 = a3 + f13;
  a41 = a4 + f14;
  a02 = r0 * a01;
  a12 = r1 * a01;
  a22 = r2 * a01;
  a32 = r3 * a01;
  a42 = r4 * a01;
  a03 = a02 + r54 * a11;
  a13 = a12 + r0 * a11;
  a23 = a22 + r1 * a11;
  a33 = a32 + r2 * a11;
  a43 = a42 + r3 * a11;
  a04 = a03 + r53 * a21;
  a14 = a13 + r54 * a21;
  a24 = a23 + r0 * a21;
  a34 = a33 + r1 * a21;
  a44 = a43 + r2 * a21;
  a05 = a04 + r52 * a31;
  a15 = a14 + r53 * a31;
  a25 = a24 + r54 * a31;
  a35 = a34 + r0 * a31;
  a45 = a44 + r1 * a31;
  a06 = a05 + r51 * a41;
  a16 = a15 + r52 * a41;
  a26 = a25 + r53 * a41;
  a36 = a35 + r54 * a41;
  a46 = a45 + r0 * a41;
  t0 = a06;
  t1 = a16;
  t2 = a26;
  t3 = a36;
  t4 = a46;
  mask261 = (u64)0x3ffffffU;
  z0 = t0 >> (u32)26U;
  z1 = t3 >> (u32)26U;
  x0 = t0 & mask261;
  x3 = t3 & mask261;
  x1 = t1 + z0;
  x4 = t4 + z1;
  z01 = x1 >> (u32)26U;
  z11 = x4 >> (u32)26U;
  t = z11 << (u32)2U;
  z12 = z11 + t;
  x11 = x1 & mask261;
  x41 = x4 & mask261;
  x2 = t2 + z01;
  x01 = x0 + z12;
  z02 = x2 >> (u32)26U;
  z13 = x01 >> (u32)26U;
  x21 = x2 & mask261;
  x02 = x01 & mask261;
  x31 = x3 + z02;
  x12 = x11 + z13;
  z03 = x31 >> (u32)26U;
  x32 = x31 & mask261;
  x42 = x41 + z03;
  o0 = x02;
  o1 = x12;
  o2 = x21;
  o3 = x32;
  o4 = x42;
  acc[0U] = o0;
  acc[1U] = o1;
  acc[2U] = o2;
  acc[3U] = o3;
  acc[4U] = o4;
}

void Hacl_Poly1305_32_poly1305_update(u64 *ctx, u32 len, u8 *text)
{
  u64 *pre = ctx + (u32)5U;
  u64 *acc = ctx;
  u32 nb = len / (u32)16U;
  u32 rem1 = len % (u32)16U;
  {
    u32 i;
    for (i = (u32)0U; i < nb; i++)
    {
      u8 *block = text + i * (u32)16U;
      u64 e[5U] = { 0U };
      u64 u0 = load64_le(block);
      u64 lo = u0;
      u64 u = load64_le(block + (u32)8U);
      u64 hi = u;
      u64 f0 = lo;
      u64 f1 = hi;
      u64 f010 = f0 & (u64)0x3ffffffU;
      u64 f110 = f0 >> (u32)26U & (u64)0x3ffffffU;
      u64 f20 = f0 >> (u32)52U | (f1 & (u64)0x3fffU) << (u32)12U;
      u64 f30 = f1 >> (u32)14U & (u64)0x3ffffffU;
      u64 f40 = f1 >> (u32)40U;
      u64 f01 = f010;
      u64 f111 = f110;
      u64 f2 = f20;
      u64 f3 = f30;
      u64 f41 = f40;
      e[0U] = f01;
      e[1U] = f111;
      e[2U] = f2;
      e[3U] = f3;
      e[4U] = f41;
      {
        u64 b = (u64)0x1000000U;
        u64 mask = b;
        u64 f4 = e[4U];
        e[4U] = f4 | mask;
        {
          u64 *r = pre;
          u64 *r5 = pre + (u32)5U;
          u64 r0 = r[0U];
          u64 r1 = r[1U];
          u64 r2 = r[2U];
          u64 r3 = r[3U];
          u64 r4 = r[4U];
          u64 r51 = r5[1U];
          u64 r52 = r5[2U];
          u64 r53 = r5[3U];
          u64 r54 = r5[4U];
          u64 f10 = e[0U];
          u64 f11 = e[1U];
          u64 f12 = e[2U];
          u64 f13 = e[3U];
          u64 f14 = e[4U];
          u64 a0 = acc[0U];
          u64 a1 = acc[1U];
          u64 a2 = acc[2U];
          u64 a3 = acc[3U];
          u64 a4 = acc[4U];
          u64 a01 = a0 + f10;
          u64 a11 = a1 + f11;
          u64 a21 = a2 + f12;
          u64 a31 = a3 + f13;
          u64 a41 = a4 + f14;
          u64 a02 = r0 * a01;
          u64 a12 = r1 * a01;
          u64 a22 = r2 * a01;
          u64 a32 = r3 * a01;
          u64 a42 = r4 * a01;
          u64 a03 = a02 + r54 * a11;
          u64 a13 = a12 + r0 * a11;
          u64 a23 = a22 + r1 * a11;
          u64 a33 = a32 + r2 * a11;
          u64 a43 = a42 + r3 * a11;
          u64 a04 = a03 + r53 * a21;
          u64 a14 = a13 + r54 * a21;
          u64 a24 = a23 + r0 * a21;
          u64 a34 = a33 + r1 * a21;
          u64 a44 = a43 + r2 * a21;
          u64 a05 = a04 + r52 * a31;
          u64 a15 = a14 + r53 * a31;
          u64 a25 = a24 + r54 * a31;
          u64 a35 = a34 + r0 * a31;
          u64 a45 = a44 + r1 * a31;
          u64 a06 = a05 + r51 * a41;
          u64 a16 = a15 + r52 * a41;
          u64 a26 = a25 + r53 * a41;
          u64 a36 = a35 + r54 * a41;
          u64 a46 = a45 + r0 * a41;
          u64 t0 = a06;
          u64 t1 = a16;
          u64 t2 = a26;
          u64 t3 = a36;
          u64 t4 = a46;
          u64 mask261 = (u64)0x3ffffffU;
          u64 z0 = t0 >> (u32)26U;
          u64 z1 = t3 >> (u32)26U;
          u64 x0 = t0 & mask261;
          u64 x3 = t3 & mask261;
          u64 x1 = t1 + z0;
          u64 x4 = t4 + z1;
          u64 z01 = x1 >> (u32)26U;
          u64 z11 = x4 >> (u32)26U;
          u64 t = z11 << (u32)2U;
          u64 z12 = z11 + t;
          u64 x11 = x1 & mask261;
          u64 x41 = x4 & mask261;
          u64 x2 = t2 + z01;
          u64 x01 = x0 + z12;
          u64 z02 = x2 >> (u32)26U;
          u64 z13 = x01 >> (u32)26U;
          u64 x21 = x2 & mask261;
          u64 x02 = x01 & mask261;
          u64 x31 = x3 + z02;
          u64 x12 = x11 + z13;
          u64 z03 = x31 >> (u32)26U;
          u64 x32 = x31 & mask261;
          u64 x42 = x41 + z03;
          u64 o0 = x02;
          u64 o1 = x12;
          u64 o2 = x21;
          u64 o3 = x32;
          u64 o4 = x42;
          acc[0U] = o0;
          acc[1U] = o1;
          acc[2U] = o2;
          acc[3U] = o3;
          acc[4U] = o4;
        }
      }
    }
  }
  if (rem1 > (u32)0U)
  {
    u8 *last1 = text + nb * (u32)16U;
    u64 e[5U] = { 0U };
    u8 tmp[16U] = { 0U };
    u64 u0;
    u64 lo;
    u64 u;
    u64 hi;
    u64 f0;
    u64 f1;
    u64 f010;
    u64 f110;
    u64 f20;
    u64 f30;
    u64 f40;
    u64 f01;
    u64 f111;
    u64 f2;
    u64 f3;
    u64 f4;
    u64 b;
    u64 mask;
    u64 fi;
    u64 *r;
    u64 *r5;
    u64 r0;
    u64 r1;
    u64 r2;
    u64 r3;
    u64 r4;
    u64 r51;
    u64 r52;
    u64 r53;
    u64 r54;
    u64 f10;
    u64 f11;
    u64 f12;
    u64 f13;
    u64 f14;
    u64 a0;
    u64 a1;
    u64 a2;
    u64 a3;
    u64 a4;
    u64 a01;
    u64 a11;
    u64 a21;
    u64 a31;
    u64 a41;
    u64 a02;
    u64 a12;
    u64 a22;
    u64 a32;
    u64 a42;
    u64 a03;
    u64 a13;
    u64 a23;
    u64 a33;
    u64 a43;
    u64 a04;
    u64 a14;
    u64 a24;
    u64 a34;
    u64 a44;
    u64 a05;
    u64 a15;
    u64 a25;
    u64 a35;
    u64 a45;
    u64 a06;
    u64 a16;
    u64 a26;
    u64 a36;
    u64 a46;
    u64 t0;
    u64 t1;
    u64 t2;
    u64 t3;
    u64 t4;
    u64 mask261;
    u64 z0;
    u64 z1;
    u64 x0;
    u64 x3;
    u64 x1;
    u64 x4;
    u64 z01;
    u64 z11;
    u64 t;
    u64 z12;
    u64 x11;
    u64 x41;
    u64 x2;
    u64 x01;
    u64 z02;
    u64 z13;
    u64 x21;
    u64 x02;
    u64 x31;
    u64 x12;
    u64 z03;
    u64 x32;
    u64 x42;
    u64 o0;
    u64 o1;
    u64 o2;
    u64 o3;
    u64 o4;
    memcpy(tmp, (u8 *)last1, rem1 * sizeof (((u8 *)last1)[0U]));
    u0 = load64_le(tmp);
    lo = u0;
    u = load64_le(tmp + (u32)8U);
    hi = u;
    f0 = lo;
    f1 = hi;
    f010 = f0 & (u64)0x3ffffffU;
    f110 = f0 >> (u32)26U & (u64)0x3ffffffU;
    f20 = f0 >> (u32)52U | (f1 & (u64)0x3fffU) << (u32)12U;
    f30 = f1 >> (u32)14U & (u64)0x3ffffffU;
    f40 = f1 >> (u32)40U;
    f01 = f010;
    f111 = f110;
    f2 = f20;
    f3 = f30;
    f4 = f40;
    e[0U] = f01;
    e[1U] = f111;
    e[2U] = f2;
    e[3U] = f3;
    e[4U] = f4;
    b = (u64)1U << rem1 * (u32)8U % (u32)26U;
    mask = b;
    fi = e[rem1 * (u32)8U / (u32)26U];
    e[rem1 * (u32)8U / (u32)26U] = fi | mask;
    r = pre;
    r5 = pre + (u32)5U;
    r0 = r[0U];
    r1 = r[1U];
    r2 = r[2U];
    r3 = r[3U];
    r4 = r[4U];
    r51 = r5[1U];
    r52 = r5[2U];
    r53 = r5[3U];
    r54 = r5[4U];
    f10 = e[0U];
    f11 = e[1U];
    f12 = e[2U];
    f13 = e[3U];
    f14 = e[4U];
    a0 = acc[0U];
    a1 = acc[1U];
    a2 = acc[2U];
    a3 = acc[3U];
    a4 = acc[4U];
    a01 = a0 + f10;
    a11 = a1 + f11;
    a21 = a2 + f12;
    a31 = a3 + f13;
    a41 = a4 + f14;
    a02 = r0 * a01;
    a12 = r1 * a01;
    a22 = r2 * a01;
    a32 = r3 * a01;
    a42 = r4 * a01;
    a03 = a02 + r54 * a11;
    a13 = a12 + r0 * a11;
    a23 = a22 + r1 * a11;
    a33 = a32 + r2 * a11;
    a43 = a42 + r3 * a11;
    a04 = a03 + r53 * a21;
    a14 = a13 + r54 * a21;
    a24 = a23 + r0 * a21;
    a34 = a33 + r1 * a21;
    a44 = a43 + r2 * a21;
    a05 = a04 + r52 * a31;
    a15 = a14 + r53 * a31;
    a25 = a24 + r54 * a31;
    a35 = a34 + r0 * a31;
    a45 = a44 + r1 * a31;
    a06 = a05 + r51 * a41;
    a16 = a15 + r52 * a41;
    a26 = a25 + r53 * a41;
    a36 = a35 + r54 * a41;
    a46 = a45 + r0 * a41;
    t0 = a06;
    t1 = a16;
    t2 = a26;
    t3 = a36;
    t4 = a46;
    mask261 = (u64)0x3ffffffU;
    z0 = t0 >> (u32)26U;
    z1 = t3 >> (u32)26U;
    x0 = t0 & mask261;
    x3 = t3 & mask261;
    x1 = t1 + z0;
    x4 = t4 + z1;
    z01 = x1 >> (u32)26U;
    z11 = x4 >> (u32)26U;
    t = z11 << (u32)2U;
    z12 = z11 + t;
    x11 = x1 & mask261;
    x41 = x4 & mask261;
    x2 = t2 + z01;
    x01 = x0 + z12;
    z02 = x2 >> (u32)26U;
    z13 = x01 >> (u32)26U;
    x21 = x2 & mask261;
    x02 = x01 & mask261;
    x31 = x3 + z02;
    x12 = x11 + z13;
    z03 = x31 >> (u32)26U;
    x32 = x31 & mask261;
    x42 = x41 + z03;
    o0 = x02;
    o1 = x12;
    o2 = x21;
    o3 = x32;
    o4 = x42;
    acc[0U] = o0;
    acc[1U] = o1;
    acc[2U] = o2;
    acc[3U] = o3;
    acc[4U] = o4;
    return;
  }
}

void Hacl_Poly1305_32_poly1305_finish(u8 *tag, u8 *key, u64 *ctx)
{
  u64 *acc = ctx;
  u8 *ks = key + (u32)16U;
  u64 f00 = acc[0U];
  u64 f13 = acc[1U];
  u64 f23 = acc[2U];
  u64 f33 = acc[3U];
  u64 f40 = acc[4U];
  u64 l0 = f00 + (u64)0U;
  u64 tmp00 = l0 & (u64)0x3ffffffU;
  u64 c00 = l0 >> (u32)26U;
  u64 l1 = f13 + c00;
  u64 tmp10 = l1 & (u64)0x3ffffffU;
  u64 c10 = l1 >> (u32)26U;
  u64 l2 = f23 + c10;
  u64 tmp20 = l2 & (u64)0x3ffffffU;
  u64 c20 = l2 >> (u32)26U;
  u64 l3 = f33 + c20;
  u64 tmp30 = l3 & (u64)0x3ffffffU;
  u64 c30 = l3 >> (u32)26U;
  u64 l4 = f40 + c30;
  u64 tmp40 = l4 & (u64)0x3ffffffU;
  u64 c40 = l4 >> (u32)26U;
  u64 f010 = tmp00 + c40 * (u64)5U;
  u64 f110 = tmp10;
  u64 f210 = tmp20;
  u64 f310 = tmp30;
  u64 f410 = tmp40;
  u64 l = f010 + (u64)0U;
  u64 tmp0 = l & (u64)0x3ffffffU;
  u64 c0 = l >> (u32)26U;
  u64 l5 = f110 + c0;
  u64 tmp1 = l5 & (u64)0x3ffffffU;
  u64 c1 = l5 >> (u32)26U;
  u64 l6 = f210 + c1;
  u64 tmp2 = l6 & (u64)0x3ffffffU;
  u64 c2 = l6 >> (u32)26U;
  u64 l7 = f310 + c2;
  u64 tmp3 = l7 & (u64)0x3ffffffU;
  u64 c3 = l7 >> (u32)26U;
  u64 l8 = f410 + c3;
  u64 tmp4 = l8 & (u64)0x3ffffffU;
  u64 c4 = l8 >> (u32)26U;
  u64 f02 = tmp0 + c4 * (u64)5U;
  u64 f12 = tmp1;
  u64 f22 = tmp2;
  u64 f32 = tmp3;
  u64 f42 = tmp4;
  u64 mh = (u64)0x3ffffffU;
  u64 ml = (u64)0x3fffffbU;
  u64 mask = FStar_UInt64_eq_mask(f42, mh);
  u64 mask1 = mask & FStar_UInt64_eq_mask(f32, mh);
  u64 mask2 = mask1 & FStar_UInt64_eq_mask(f22, mh);
  u64 mask3 = mask2 & FStar_UInt64_eq_mask(f12, mh);
  u64 mask4 = mask3 & ~~FStar_UInt64_gte_mask(f02, ml);
  u64 ph = mask4 & mh;
  u64 pl = mask4 & ml;
  u64 o0 = f02 - pl;
  u64 o1 = f12 - ph;
  u64 o2 = f22 - ph;
  u64 o3 = f32 - ph;
  u64 o4 = f42 - ph;
  u64 f011 = o0;
  u64 f111 = o1;
  u64 f211 = o2;
  u64 f311 = o3;
  u64 f411 = o4;
  u64 f0;
  u64 f1;
  u64 f2;
  u64 f3;
  u64 f4;
  u64 f01;
  u64 f112;
  u64 f212;
  u64 f312;
  u64 f41;
  u64 lo0;
  u64 hi0;
  u64 f10;
  u64 f11;
  u64 u0;
  u64 lo;
  u64 u;
  u64 hi;
  u64 f20;
  u64 f21;
  u64 r0;
  u64 r1;
  u64 c;
  u64 r11;
  u64 f30;
  u64 f31;
  acc[0U] = f011;
  acc[1U] = f111;
  acc[2U] = f211;
  acc[3U] = f311;
  acc[4U] = f411;
  f0 = acc[0U];
  f1 = acc[1U];
  f2 = acc[2U];
  f3 = acc[3U];
  f4 = acc[4U];
  f01 = f0;
  f112 = f1;
  f212 = f2;
  f312 = f3;
  f41 = f4;
  lo0 = (f01 | f112 << (u32)26U) | f212 << (u32)52U;
  hi0 = (f212 >> (u32)12U | f312 << (u32)14U) | f41 << (u32)40U;
  f10 = lo0;
  f11 = hi0;
  u0 = load64_le(ks);
  lo = u0;
  u = load64_le(ks + (u32)8U);
  hi = u;
  f20 = lo;
  f21 = hi;
  r0 = f10 + f20;
  r1 = f11 + f21;
  c = (r0 ^ ((r0 ^ f20) | ((r0 - f20) ^ f20))) >> (u32)63U;
  r11 = r1 + c;
  f30 = r0;
  f31 = r11;
  store64_le(tag, f30);
  store64_le(tag + (u32)8U, f31);
}

void Hacl_Poly1305_32_poly1305_mac(u8 *tag, u32 len, u8 *text, u8 *key)
{
  u64 ctx[25U] = { 0U };
  Hacl_Poly1305_32_poly1305_init(ctx, key);
  Hacl_Poly1305_32_poly1305_update(ctx, len, text);
  Hacl_Poly1305_32_poly1305_finish(tag, key, ctx);
}

