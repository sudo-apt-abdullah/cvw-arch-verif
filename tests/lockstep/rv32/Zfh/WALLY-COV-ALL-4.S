//
// Copyright (C) 2024 Harvey Mudd College & Oklahoma State University, Habib University, UET Lahore
//
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
///////////////////////////////////////////

#include "macros.h"

.section .text.init
.globl rvtest_entry_point

rvtest_entry_point:

# initialize signature pointer
la x4, begin_signature

    

// ******************
// Tests from: WALLY-COV-fcvt.h.s.S
// ******************


# initialize signature pointer
la x4, begin_signature

    
# set mstatus.FS to 01 to enable fp
li t0,0x4000
csrs mstatus, t0


# Testcase cp_gpr/fpr_hazard nohaz test
add x27, x20, x3 # perform first operation
fcvt.h.s f29, f13 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x31, x6, x18 # perform first operation
fcvt.h.s f20, f14 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x22, x2, x12 # perform first operation
fcvt.h.s f26, f18 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
fmul.s f7, f24, f18 # perform first operation
fcvt.h.s f20, f7 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x2, x24, x7 # perform first operation
fcvt.h.s f24, f10 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x14, x8, x18 # perform first operation
fcvt.h.s f18, f5 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f8, f26, f7 # perform first operation
fcvt.h.s f8, f2 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f23, f2, f7 # perform first operation
fcvt.h.s f23, f24 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f24, f9, f26 # perform first operation
fcvt.h.s f24, f15 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f9, f27, f31 # perform first operation
fcvt.h.s f27, f17 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f13, f24, f15 # perform first operation
fcvt.h.s f15, f5 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f22, f23, f8 # perform first operation
fcvt.h.s f30, f17 # perform second (triggering) operation

# Testcase cp_fs1 (Test source fs1 = f0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc5532934 # load x3 with value 0xc5532934
sw x3, 0(x2) # store 0xc5532934 in memory
flw f0, 0(x2) # load 0xc5532934 from memory into f0
fcvt.h.s f9, f0 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x5e6887e0 # load x3 with value 0x5e6887e0
sw x3, 0(x2) # store 0x5e6887e0 in memory
flw f1, 0(x2) # load 0x5e6887e0 from memory into f1
fcvt.h.s f12, f1 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f2)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x37816f5a # load x3 with value 0x37816f5a
sw x3, 0(x2) # store 0x37816f5a in memory
flw f2, 0(x2) # load 0x37816f5a from memory into f2
fcvt.h.s f5, f2 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xefdff5b7 # load x3 with value 0xefdff5b7
sw x3, 0(x2) # store 0xefdff5b7 in memory
flw f3, 0(x2) # load 0xefdff5b7 from memory into f3
fcvt.h.s f9, f3 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x78e86bf5 # load x3 with value 0x78e86bf5
sw x3, 0(x2) # store 0x78e86bf5 in memory
flw f4, 0(x2) # load 0x78e86bf5 from memory into f4
fcvt.h.s f27, f4 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xafbf64ae # load x3 with value 0xafbf64ae
sw x3, 0(x2) # store 0xafbf64ae in memory
flw f5, 0(x2) # load 0xafbf64ae from memory into f5
fcvt.h.s f21, f5 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xea0398c0 # load x3 with value 0xea0398c0
sw x3, 0(x2) # store 0xea0398c0 in memory
flw f6, 0(x2) # load 0xea0398c0 from memory into f6
fcvt.h.s f31, f6 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x1c6771ee # load x3 with value 0x1c6771ee
sw x3, 0(x2) # store 0x1c6771ee in memory
flw f7, 0(x2) # load 0x1c6771ee from memory into f7
fcvt.h.s f10, f7 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xb73d83ba # load x3 with value 0xb73d83ba
sw x3, 0(x2) # store 0xb73d83ba in memory
flw f8, 0(x2) # load 0xb73d83ba from memory into f8
fcvt.h.s f14, f8 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f9)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7c7d21b7 # load x3 with value 0x7c7d21b7
sw x3, 0(x2) # store 0x7c7d21b7 in memory
flw f9, 0(x2) # load 0x7c7d21b7 from memory into f9
fcvt.h.s f11, f9 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f10)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc4639dad # load x3 with value 0xc4639dad
sw x3, 0(x2) # store 0xc4639dad in memory
flw f10, 0(x2) # load 0xc4639dad from memory into f10
fcvt.h.s f24, f10 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f11)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfddc8378 # load x3 with value 0xfddc8378
sw x3, 0(x2) # store 0xfddc8378 in memory
flw f11, 0(x2) # load 0xfddc8378 from memory into f11
fcvt.h.s f1, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x14465770 # load x3 with value 0x14465770
sw x3, 0(x2) # store 0x14465770 in memory
flw f12, 0(x2) # load 0x14465770 from memory into f12
fcvt.h.s f29, f12 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f13)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xaf7a2130 # load x3 with value 0xaf7a2130
sw x3, 0(x2) # store 0xaf7a2130 in memory
flw f13, 0(x2) # load 0xaf7a2130 from memory into f13
fcvt.h.s f7, f13 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f14)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbcad04d3 # load x3 with value 0xbcad04d3
sw x3, 0(x2) # store 0xbcad04d3 in memory
flw f14, 0(x2) # load 0xbcad04d3 from memory into f14
fcvt.h.s f26, f14 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f15)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x1564153b # load x3 with value 0x1564153b
sw x3, 0(x2) # store 0x1564153b in memory
flw f15, 0(x2) # load 0x1564153b from memory into f15
fcvt.h.s f8, f15 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f16)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xcdc74fa9 # load x3 with value 0xcdc74fa9
sw x3, 0(x2) # store 0xcdc74fa9 in memory
flw f16, 0(x2) # load 0xcdc74fa9 from memory into f16
fcvt.h.s f18, f16 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f17)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x1a0f4b58 # load x3 with value 0x1a0f4b58
sw x3, 0(x2) # store 0x1a0f4b58 in memory
flw f17, 0(x2) # load 0x1a0f4b58 from memory into f17
fcvt.h.s f2, f17 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f18)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc77d9781 # load x3 with value 0xc77d9781
sw x3, 0(x2) # store 0xc77d9781 in memory
flw f18, 0(x2) # load 0xc77d9781 from memory into f18
fcvt.h.s f9, f18 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f19)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x8f5ee2e1 # load x3 with value 0x8f5ee2e1
sw x3, 0(x2) # store 0x8f5ee2e1 in memory
flw f19, 0(x2) # load 0x8f5ee2e1 from memory into f19
fcvt.h.s f16, f19 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f20)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x1e451cd1 # load x3 with value 0x1e451cd1
sw x3, 0(x2) # store 0x1e451cd1 in memory
flw f20, 0(x2) # load 0x1e451cd1 from memory into f20
fcvt.h.s f10, f20 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f21)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0d3764e7 # load x3 with value 0x0d3764e7
sw x3, 0(x2) # store 0x0d3764e7 in memory
flw f21, 0(x2) # load 0x0d3764e7 from memory into f21
fcvt.h.s f14, f21 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f22)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x8285b63b # load x3 with value 0x8285b63b
sw x3, 0(x2) # store 0x8285b63b in memory
flw f22, 0(x2) # load 0x8285b63b from memory into f22
fcvt.h.s f29, f22 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f23)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe990f49c # load x3 with value 0xe990f49c
sw x3, 0(x2) # store 0xe990f49c in memory
flw f23, 0(x2) # load 0xe990f49c from memory into f23
fcvt.h.s f31, f23 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f24)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xb47241ed # load x3 with value 0xb47241ed
sw x3, 0(x2) # store 0xb47241ed in memory
flw f24, 0(x2) # load 0xb47241ed from memory into f24
fcvt.h.s f16, f24 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f25)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7b0e807f # load x3 with value 0x7b0e807f
sw x3, 0(x2) # store 0x7b0e807f in memory
flw f25, 0(x2) # load 0x7b0e807f from memory into f25
fcvt.h.s f26, f25 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f26)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x1e463e92 # load x3 with value 0x1e463e92
sw x3, 0(x2) # store 0x1e463e92 in memory
flw f26, 0(x2) # load 0x1e463e92 from memory into f26
fcvt.h.s f28, f26 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfc3faf5d # load x3 with value 0xfc3faf5d
sw x3, 0(x2) # store 0xfc3faf5d in memory
flw f27, 0(x2) # load 0xfc3faf5d from memory into f27
fcvt.h.s f19, f27 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f28)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x13969b0e # load x3 with value 0x13969b0e
sw x3, 0(x2) # store 0x13969b0e in memory
flw f28, 0(x2) # load 0x13969b0e from memory into f28
fcvt.h.s f6, f28 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f29)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xae0a2efc # load x3 with value 0xae0a2efc
sw x3, 0(x2) # store 0xae0a2efc in memory
flw f29, 0(x2) # load 0xae0a2efc from memory into f29
fcvt.h.s f22, f29 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f30)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x79748a1c # load x3 with value 0x79748a1c
sw x3, 0(x2) # store 0x79748a1c in memory
flw f30, 0(x2) # load 0x79748a1c from memory into f30
fcvt.h.s f11, f30 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa32e81bb # load x3 with value 0xa32e81bb
sw x3, 0(x2) # store 0xa32e81bb in memory
flw f31, 0(x2) # load 0xa32e81bb from memory into f31
fcvt.h.s f15, f31 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x142bdc4b # load x3 with value 0x142bdc4b
sw x3, 0(x2) # store 0x142bdc4b in memory
flw f23, 0(x2) # load 0x142bdc4b from memory into f23
fcvt.h.s f0, f23 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x92199fc7 # load x3 with value 0x92199fc7
sw x3, 0(x2) # store 0x92199fc7 in memory
flw f27, 0(x2) # load 0x92199fc7 from memory into f27
fcvt.h.s f1, f27 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x2)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x96ed986e # load x3 with value 0x96ed986e
sw x3, 0(x2) # store 0x96ed986e in memory
flw f25, 0(x2) # load 0x96ed986e from memory into f25
fcvt.h.s f2, f25 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x020e838c # load x3 with value 0x020e838c
sw x3, 0(x2) # store 0x020e838c in memory
flw f9, 0(x2) # load 0x020e838c from memory into f9
fcvt.h.s f3, f9 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0ed166a7 # load x3 with value 0x0ed166a7
sw x3, 0(x2) # store 0x0ed166a7 in memory
flw f17, 0(x2) # load 0x0ed166a7 from memory into f17
fcvt.h.s f4, f17 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfbe428bc # load x3 with value 0xfbe428bc
sw x3, 0(x2) # store 0xfbe428bc in memory
flw f23, 0(x2) # load 0xfbe428bc from memory into f23
fcvt.h.s f5, f23 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x07be5d45 # load x3 with value 0x07be5d45
sw x3, 0(x2) # store 0x07be5d45 in memory
flw f28, 0(x2) # load 0x07be5d45 from memory into f28
fcvt.h.s f6, f28 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe0302bc9 # load x3 with value 0xe0302bc9
sw x3, 0(x2) # store 0xe0302bc9 in memory
flw f8, 0(x2) # load 0xe0302bc9 from memory into f8
fcvt.h.s f7, f8 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xb4314d2a # load x3 with value 0xb4314d2a
sw x3, 0(x2) # store 0xb4314d2a in memory
flw f22, 0(x2) # load 0xb4314d2a from memory into f22
fcvt.h.s f8, f22 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x9)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xdcbfcddf # load x3 with value 0xdcbfcddf
sw x3, 0(x2) # store 0xdcbfcddf in memory
flw f9, 0(x2) # load 0xdcbfcddf from memory into f9
fcvt.h.s f9, f9 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x10)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x6b8e9e40 # load x3 with value 0x6b8e9e40
sw x3, 0(x2) # store 0x6b8e9e40 in memory
flw f13, 0(x2) # load 0x6b8e9e40 from memory into f13
fcvt.h.s f10, f13 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x11)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbd58c9e5 # load x3 with value 0xbd58c9e5
sw x3, 0(x2) # store 0xbd58c9e5 in memory
flw f19, 0(x2) # load 0xbd58c9e5 from memory into f19
fcvt.h.s f11, f19 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x9e3e90ac # load x3 with value 0x9e3e90ac
sw x3, 0(x2) # store 0x9e3e90ac in memory
flw f11, 0(x2) # load 0x9e3e90ac from memory into f11
fcvt.h.s f12, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x13)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x583d0976 # load x3 with value 0x583d0976
sw x3, 0(x2) # store 0x583d0976 in memory
flw f9, 0(x2) # load 0x583d0976 from memory into f9
fcvt.h.s f13, f9 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x14)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xb0811f64 # load x3 with value 0xb0811f64
sw x3, 0(x2) # store 0xb0811f64 in memory
flw f30, 0(x2) # load 0xb0811f64 from memory into f30
fcvt.h.s f14, f30 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x15)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbe8551ed # load x3 with value 0xbe8551ed
sw x3, 0(x2) # store 0xbe8551ed in memory
flw f24, 0(x2) # load 0xbe8551ed from memory into f24
fcvt.h.s f15, f24 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x16)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa1ec6fc0 # load x3 with value 0xa1ec6fc0
sw x3, 0(x2) # store 0xa1ec6fc0 in memory
flw f3, 0(x2) # load 0xa1ec6fc0 from memory into f3
fcvt.h.s f16, f3 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x17)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xd99f77a4 # load x3 with value 0xd99f77a4
sw x3, 0(x2) # store 0xd99f77a4 in memory
flw f7, 0(x2) # load 0xd99f77a4 from memory into f7
fcvt.h.s f17, f7 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x18)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x89ecc6ea # load x3 with value 0x89ecc6ea
sw x3, 0(x2) # store 0x89ecc6ea in memory
flw f28, 0(x2) # load 0x89ecc6ea from memory into f28
fcvt.h.s f18, f28 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x19)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xca0c3e18 # load x3 with value 0xca0c3e18
sw x3, 0(x2) # store 0xca0c3e18 in memory
flw f3, 0(x2) # load 0xca0c3e18 from memory into f3
fcvt.h.s f19, f3 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x20)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xb109b8fa # load x3 with value 0xb109b8fa
sw x3, 0(x2) # store 0xb109b8fa in memory
flw f12, 0(x2) # load 0xb109b8fa from memory into f12
fcvt.h.s f20, f12 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x21)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x2c97482a # load x3 with value 0x2c97482a
sw x3, 0(x2) # store 0x2c97482a in memory
flw f15, 0(x2) # load 0x2c97482a from memory into f15
fcvt.h.s f21, f15 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x22)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x2a07f6e5 # load x3 with value 0x2a07f6e5
sw x3, 0(x2) # store 0x2a07f6e5 in memory
flw f10, 0(x2) # load 0x2a07f6e5 from memory into f10
fcvt.h.s f22, f10 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x23)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xf7367789 # load x3 with value 0xf7367789
sw x3, 0(x2) # store 0xf7367789 in memory
flw f7, 0(x2) # load 0xf7367789 from memory into f7
fcvt.h.s f23, f7 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x24)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x65bc1bf9 # load x3 with value 0x65bc1bf9
sw x3, 0(x2) # store 0x65bc1bf9 in memory
flw f11, 0(x2) # load 0x65bc1bf9 from memory into f11
fcvt.h.s f24, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x25)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x966f05e9 # load x3 with value 0x966f05e9
sw x3, 0(x2) # store 0x966f05e9 in memory
flw f19, 0(x2) # load 0x966f05e9 from memory into f19
fcvt.h.s f25, f19 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x26)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xff7a5656 # load x3 with value 0xff7a5656
sw x3, 0(x2) # store 0xff7a5656 in memory
flw f5, 0(x2) # load 0xff7a5656 from memory into f5
fcvt.h.s f26, f5 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x411eb442 # load x3 with value 0x411eb442
sw x3, 0(x2) # store 0x411eb442 in memory
flw f13, 0(x2) # load 0x411eb442 from memory into f13
fcvt.h.s f27, f13 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x28)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x92002d42 # load x3 with value 0x92002d42
sw x3, 0(x2) # store 0x92002d42 in memory
flw f13, 0(x2) # load 0x92002d42 from memory into f13
fcvt.h.s f28, f13 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x29)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa544c49c # load x3 with value 0xa544c49c
sw x3, 0(x2) # store 0xa544c49c in memory
flw f17, 0(x2) # load 0xa544c49c from memory into f17
fcvt.h.s f29, f17 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x30)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xafddb8f1 # load x3 with value 0xafddb8f1
sw x3, 0(x2) # store 0xafddb8f1 in memory
flw f18, 0(x2) # load 0xafddb8f1 from memory into f18
fcvt.h.s f30, f18 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4f28cad7 # load x3 with value 0x4f28cad7
sw x3, 0(x2) # store 0x4f28cad7 in memory
flw f26, 0(x2) # load 0x4f28cad7 from memory into f26
fcvt.h.s f31, f26 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f20, 0(x2) # load 0x00000000 from memory into f20
fcvt.h.s f22, f20 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x80000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80000000 # load x3 with value 0x80000000
sw x3, 0(x2) # store 0x80000000 in memory
flw f10, 0(x2) # load 0x80000000 from memory into f10
fcvt.h.s f25, f10 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x3f800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3f800000 # load x3 with value 0x3f800000
sw x3, 0(x2) # store 0x3f800000 in memory
flw f17, 0(x2) # load 0x3f800000 from memory into f17
fcvt.h.s f9, f17 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xbf800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbf800000 # load x3 with value 0xbf800000
sw x3, 0(x2) # store 0xbf800000 in memory
flw f2, 0(x2) # load 0xbf800000 from memory into f2
fcvt.h.s f5, f2 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x3fc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3fc00000 # load x3 with value 0x3fc00000
sw x3, 0(x2) # store 0x3fc00000 in memory
flw f15, 0(x2) # load 0x3fc00000 from memory into f15
fcvt.h.s f30, f15 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xbfc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbfc00000 # load x3 with value 0xbfc00000
sw x3, 0(x2) # store 0xbfc00000 in memory
flw f29, 0(x2) # load 0xbfc00000 from memory into f29
fcvt.h.s f14, f29 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x40000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x40000000 # load x3 with value 0x40000000
sw x3, 0(x2) # store 0x40000000 in memory
flw f20, 0(x2) # load 0x40000000 from memory into f20
fcvt.h.s f29, f20 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xc0000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc0000000 # load x3 with value 0xc0000000
sw x3, 0(x2) # store 0xc0000000 in memory
flw f21, 0(x2) # load 0xc0000000 from memory into f21
fcvt.h.s f24, f21 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00800000 # load x3 with value 0x00800000
sw x3, 0(x2) # store 0x00800000 in memory
flw f17, 0(x2) # load 0x00800000 from memory into f17
fcvt.h.s f22, f17 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x80800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80800000 # load x3 with value 0x80800000
sw x3, 0(x2) # store 0x80800000 in memory
flw f19, 0(x2) # load 0x80800000 from memory into f19
fcvt.h.s f10, f19 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7f7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f7fffff # load x3 with value 0x7f7fffff
sw x3, 0(x2) # store 0x7f7fffff in memory
flw f3, 0(x2) # load 0x7f7fffff from memory into f3
fcvt.h.s f18, f3 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xff7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xff7fffff # load x3 with value 0xff7fffff
sw x3, 0(x2) # store 0xff7fffff in memory
flw f2, 0(x2) # load 0xff7fffff from memory into f2
fcvt.h.s f13, f2 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x007fffff # load x3 with value 0x007fffff
sw x3, 0(x2) # store 0x007fffff in memory
flw f25, 0(x2) # load 0x007fffff from memory into f25
fcvt.h.s f12, f25 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x807fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x807fffff # load x3 with value 0x807fffff
sw x3, 0(x2) # store 0x807fffff in memory
flw f18, 0(x2) # load 0x807fffff from memory into f18
fcvt.h.s f16, f18 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x400000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00400000 # load x3 with value 0x00400000
sw x3, 0(x2) # store 0x00400000 in memory
flw f14, 0(x2) # load 0x00400000 from memory into f14
fcvt.h.s f31, f14 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x80400000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80400000 # load x3 with value 0x80400000
sw x3, 0(x2) # store 0x80400000 in memory
flw f14, 0(x2) # load 0x80400000 from memory into f14
fcvt.h.s f12, f14 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flw f17, 0(x2) # load 0x00000001 from memory into f17
fcvt.h.s f10, f17 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x80000001)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80000001 # load x3 with value 0x80000001
sw x3, 0(x2) # store 0x80000001 in memory
flw f21, 0(x2) # load 0x80000001 from memory into f21
fcvt.h.s f6, f21 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7f800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f800000 # load x3 with value 0x7f800000
sw x3, 0(x2) # store 0x7f800000 in memory
flw f6, 0(x2) # load 0x7f800000 from memory into f6
fcvt.h.s f25, f6 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xff800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xff800000 # load x3 with value 0xff800000
sw x3, 0(x2) # store 0xff800000 in memory
flw f23, 0(x2) # load 0xff800000 from memory into f23
fcvt.h.s f17, f23 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fc00000 # load x3 with value 0x7fc00000
sw x3, 0(x2) # store 0x7fc00000 in memory
flw f9, 0(x2) # load 0x7fc00000 from memory into f9
fcvt.h.s f30, f9 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fffffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fffffff # load x3 with value 0x7fffffff
sw x3, 0(x2) # store 0x7fffffff in memory
flw f11, 0(x2) # load 0x7fffffff from memory into f11
fcvt.h.s f20, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xffffffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffffffff # load x3 with value 0xffffffff
sw x3, 0(x2) # store 0xffffffff in memory
flw f6, 0(x2) # load 0xffffffff from memory into f6
fcvt.h.s f5, f6 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7f800001)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f800001 # load x3 with value 0x7f800001
sw x3, 0(x2) # store 0x7f800001 in memory
flw f27, 0(x2) # load 0x7f800001 from memory into f27
fcvt.h.s f7, f27 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fbfffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fbfffff # load x3 with value 0x7fbfffff
sw x3, 0(x2) # store 0x7fbfffff in memory
flw f1, 0(x2) # load 0x7fbfffff from memory into f1
fcvt.h.s f20, f1 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xffbfffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffbfffff # load x3 with value 0xffbfffff
sw x3, 0(x2) # store 0xffbfffff in memory
flw f25, 0(x2) # load 0xffbfffff from memory into f25
fcvt.h.s f2, f25 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7ef8654f)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7ef8654f # load x3 with value 0x7ef8654f
sw x3, 0(x2) # store 0x7ef8654f in memory
flw f11, 0(x2) # load 0x7ef8654f from memory into f11
fcvt.h.s f7, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x813d9ab0)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x813d9ab0 # load x3 with value 0x813d9ab0
sw x3, 0(x2) # store 0x813d9ab0 in memory
flw f26, 0(x2) # load 0x813d9ab0 from memory into f26
fcvt.h.s f24, f26 # perform operation second time to make sure flags don't change

# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f10, 0(x2) # load 0x00000000 from memory into f10
fcvt.h.s f21, f10, dyn # perform operation
fcvt.h.s f21, f10, rdn # perform operation
fcvt.h.s f21, f10, rmm # perform operation
fcvt.h.s f21, f10, rne # perform operation
fcvt.h.s f21, f10, rtz # perform operation
fcvt.h.s f21, f10, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f21, f10 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f21, f10 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f21, f10 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f21, f10 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f21, f10 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x80000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80000000 # load x3 with value 0x80000000
sw x3, 0(x2) # store 0x80000000 in memory
flw f22, 0(x2) # load 0x80000000 from memory into f22
fcvt.h.s f8, f22, dyn # perform operation
fcvt.h.s f8, f22, rdn # perform operation
fcvt.h.s f8, f22, rmm # perform operation
fcvt.h.s f8, f22, rne # perform operation
fcvt.h.s f8, f22, rtz # perform operation
fcvt.h.s f8, f22, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f8, f22 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f8, f22 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f8, f22 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f8, f22 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f8, f22 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x3f800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3f800000 # load x3 with value 0x3f800000
sw x3, 0(x2) # store 0x3f800000 in memory
flw f16, 0(x2) # load 0x3f800000 from memory into f16
fcvt.h.s f23, f16, dyn # perform operation
fcvt.h.s f23, f16, rdn # perform operation
fcvt.h.s f23, f16, rmm # perform operation
fcvt.h.s f23, f16, rne # perform operation
fcvt.h.s f23, f16, rtz # perform operation
fcvt.h.s f23, f16, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f23, f16 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f23, f16 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f23, f16 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f23, f16 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f23, f16 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xbf800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbf800000 # load x3 with value 0xbf800000
sw x3, 0(x2) # store 0xbf800000 in memory
flw f22, 0(x2) # load 0xbf800000 from memory into f22
fcvt.h.s f6, f22, dyn # perform operation
fcvt.h.s f6, f22, rdn # perform operation
fcvt.h.s f6, f22, rmm # perform operation
fcvt.h.s f6, f22, rne # perform operation
fcvt.h.s f6, f22, rtz # perform operation
fcvt.h.s f6, f22, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f6, f22 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f6, f22 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f6, f22 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f6, f22 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f6, f22 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x3fc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3fc00000 # load x3 with value 0x3fc00000
sw x3, 0(x2) # store 0x3fc00000 in memory
flw f30, 0(x2) # load 0x3fc00000 from memory into f30
fcvt.h.s f3, f30, dyn # perform operation
fcvt.h.s f3, f30, rdn # perform operation
fcvt.h.s f3, f30, rmm # perform operation
fcvt.h.s f3, f30, rne # perform operation
fcvt.h.s f3, f30, rtz # perform operation
fcvt.h.s f3, f30, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f3, f30 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f3, f30 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f3, f30 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f3, f30 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f3, f30 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xbfc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbfc00000 # load x3 with value 0xbfc00000
sw x3, 0(x2) # store 0xbfc00000 in memory
flw f19, 0(x2) # load 0xbfc00000 from memory into f19
fcvt.h.s f1, f19, dyn # perform operation
fcvt.h.s f1, f19, rdn # perform operation
fcvt.h.s f1, f19, rmm # perform operation
fcvt.h.s f1, f19, rne # perform operation
fcvt.h.s f1, f19, rtz # perform operation
fcvt.h.s f1, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f1, f19 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f1, f19 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f1, f19 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f1, f19 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f1, f19 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x40000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x40000000 # load x3 with value 0x40000000
sw x3, 0(x2) # store 0x40000000 in memory
flw f25, 0(x2) # load 0x40000000 from memory into f25
fcvt.h.s f20, f25, dyn # perform operation
fcvt.h.s f20, f25, rdn # perform operation
fcvt.h.s f20, f25, rmm # perform operation
fcvt.h.s f20, f25, rne # perform operation
fcvt.h.s f20, f25, rtz # perform operation
fcvt.h.s f20, f25, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f20, f25 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f20, f25 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f20, f25 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f20, f25 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f20, f25 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xc0000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc0000000 # load x3 with value 0xc0000000
sw x3, 0(x2) # store 0xc0000000 in memory
flw f7, 0(x2) # load 0xc0000000 from memory into f7
fcvt.h.s f17, f7, dyn # perform operation
fcvt.h.s f17, f7, rdn # perform operation
fcvt.h.s f17, f7, rmm # perform operation
fcvt.h.s f17, f7, rne # perform operation
fcvt.h.s f17, f7, rtz # perform operation
fcvt.h.s f17, f7, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f17, f7 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f17, f7 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f17, f7 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f17, f7 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f17, f7 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00800000 # load x3 with value 0x00800000
sw x3, 0(x2) # store 0x00800000 in memory
flw f12, 0(x2) # load 0x00800000 from memory into f12
fcvt.h.s f25, f12, dyn # perform operation
fcvt.h.s f25, f12, rdn # perform operation
fcvt.h.s f25, f12, rmm # perform operation
fcvt.h.s f25, f12, rne # perform operation
fcvt.h.s f25, f12, rtz # perform operation
fcvt.h.s f25, f12, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f25, f12 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f25, f12 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f25, f12 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f25, f12 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f25, f12 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x80800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80800000 # load x3 with value 0x80800000
sw x3, 0(x2) # store 0x80800000 in memory
flw f31, 0(x2) # load 0x80800000 from memory into f31
fcvt.h.s f9, f31, dyn # perform operation
fcvt.h.s f9, f31, rdn # perform operation
fcvt.h.s f9, f31, rmm # perform operation
fcvt.h.s f9, f31, rne # perform operation
fcvt.h.s f9, f31, rtz # perform operation
fcvt.h.s f9, f31, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f9, f31 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f9, f31 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f9, f31 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f9, f31 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f9, f31 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7f7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f7fffff # load x3 with value 0x7f7fffff
sw x3, 0(x2) # store 0x7f7fffff in memory
flw f14, 0(x2) # load 0x7f7fffff from memory into f14
fcvt.h.s f17, f14, dyn # perform operation
fcvt.h.s f17, f14, rdn # perform operation
fcvt.h.s f17, f14, rmm # perform operation
fcvt.h.s f17, f14, rne # perform operation
fcvt.h.s f17, f14, rtz # perform operation
fcvt.h.s f17, f14, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f17, f14 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f17, f14 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f17, f14 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f17, f14 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f17, f14 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xff7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xff7fffff # load x3 with value 0xff7fffff
sw x3, 0(x2) # store 0xff7fffff in memory
flw f24, 0(x2) # load 0xff7fffff from memory into f24
fcvt.h.s f23, f24, dyn # perform operation
fcvt.h.s f23, f24, rdn # perform operation
fcvt.h.s f23, f24, rmm # perform operation
fcvt.h.s f23, f24, rne # perform operation
fcvt.h.s f23, f24, rtz # perform operation
fcvt.h.s f23, f24, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f23, f24 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f23, f24 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f23, f24 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f23, f24 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f23, f24 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x007fffff # load x3 with value 0x007fffff
sw x3, 0(x2) # store 0x007fffff in memory
flw f12, 0(x2) # load 0x007fffff from memory into f12
fcvt.h.s f27, f12, dyn # perform operation
fcvt.h.s f27, f12, rdn # perform operation
fcvt.h.s f27, f12, rmm # perform operation
fcvt.h.s f27, f12, rne # perform operation
fcvt.h.s f27, f12, rtz # perform operation
fcvt.h.s f27, f12, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f27, f12 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f27, f12 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f27, f12 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f27, f12 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f27, f12 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x807fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x807fffff # load x3 with value 0x807fffff
sw x3, 0(x2) # store 0x807fffff in memory
flw f9, 0(x2) # load 0x807fffff from memory into f9
fcvt.h.s f1, f9, dyn # perform operation
fcvt.h.s f1, f9, rdn # perform operation
fcvt.h.s f1, f9, rmm # perform operation
fcvt.h.s f1, f9, rne # perform operation
fcvt.h.s f1, f9, rtz # perform operation
fcvt.h.s f1, f9, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f1, f9 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f1, f9 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f1, f9 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f1, f9 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f1, f9 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x400000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00400000 # load x3 with value 0x00400000
sw x3, 0(x2) # store 0x00400000 in memory
flw f16, 0(x2) # load 0x00400000 from memory into f16
fcvt.h.s f14, f16, dyn # perform operation
fcvt.h.s f14, f16, rdn # perform operation
fcvt.h.s f14, f16, rmm # perform operation
fcvt.h.s f14, f16, rne # perform operation
fcvt.h.s f14, f16, rtz # perform operation
fcvt.h.s f14, f16, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f14, f16 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f14, f16 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f14, f16 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f14, f16 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f14, f16 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x80400000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80400000 # load x3 with value 0x80400000
sw x3, 0(x2) # store 0x80400000 in memory
flw f5, 0(x2) # load 0x80400000 from memory into f5
fcvt.h.s f10, f5, dyn # perform operation
fcvt.h.s f10, f5, rdn # perform operation
fcvt.h.s f10, f5, rmm # perform operation
fcvt.h.s f10, f5, rne # perform operation
fcvt.h.s f10, f5, rtz # perform operation
fcvt.h.s f10, f5, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f10, f5 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f10, f5 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f10, f5 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f10, f5 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f10, f5 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flw f10, 0(x2) # load 0x00000001 from memory into f10
fcvt.h.s f7, f10, dyn # perform operation
fcvt.h.s f7, f10, rdn # perform operation
fcvt.h.s f7, f10, rmm # perform operation
fcvt.h.s f7, f10, rne # perform operation
fcvt.h.s f7, f10, rtz # perform operation
fcvt.h.s f7, f10, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f7, f10 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f7, f10 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f7, f10 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f7, f10 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f7, f10 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x80000001)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80000001 # load x3 with value 0x80000001
sw x3, 0(x2) # store 0x80000001 in memory
flw f1, 0(x2) # load 0x80000001 from memory into f1
fcvt.h.s f20, f1, dyn # perform operation
fcvt.h.s f20, f1, rdn # perform operation
fcvt.h.s f20, f1, rmm # perform operation
fcvt.h.s f20, f1, rne # perform operation
fcvt.h.s f20, f1, rtz # perform operation
fcvt.h.s f20, f1, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f20, f1 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f20, f1 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f20, f1 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f20, f1 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f20, f1 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7f800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f800000 # load x3 with value 0x7f800000
sw x3, 0(x2) # store 0x7f800000 in memory
flw f17, 0(x2) # load 0x7f800000 from memory into f17
fcvt.h.s f21, f17, dyn # perform operation
fcvt.h.s f21, f17, rdn # perform operation
fcvt.h.s f21, f17, rmm # perform operation
fcvt.h.s f21, f17, rne # perform operation
fcvt.h.s f21, f17, rtz # perform operation
fcvt.h.s f21, f17, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f21, f17 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f21, f17 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f21, f17 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f21, f17 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f21, f17 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xff800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xff800000 # load x3 with value 0xff800000
sw x3, 0(x2) # store 0xff800000 in memory
flw f17, 0(x2) # load 0xff800000 from memory into f17
fcvt.h.s f30, f17, dyn # perform operation
fcvt.h.s f30, f17, rdn # perform operation
fcvt.h.s f30, f17, rmm # perform operation
fcvt.h.s f30, f17, rne # perform operation
fcvt.h.s f30, f17, rtz # perform operation
fcvt.h.s f30, f17, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f30, f17 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f30, f17 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f30, f17 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f30, f17 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f30, f17 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7fc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fc00000 # load x3 with value 0x7fc00000
sw x3, 0(x2) # store 0x7fc00000 in memory
flw f7, 0(x2) # load 0x7fc00000 from memory into f7
fcvt.h.s f15, f7, dyn # perform operation
fcvt.h.s f15, f7, rdn # perform operation
fcvt.h.s f15, f7, rmm # perform operation
fcvt.h.s f15, f7, rne # perform operation
fcvt.h.s f15, f7, rtz # perform operation
fcvt.h.s f15, f7, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f15, f7 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f15, f7 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f15, f7 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f15, f7 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f15, f7 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7fffffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fffffff # load x3 with value 0x7fffffff
sw x3, 0(x2) # store 0x7fffffff in memory
flw f8, 0(x2) # load 0x7fffffff from memory into f8
fcvt.h.s f13, f8, dyn # perform operation
fcvt.h.s f13, f8, rdn # perform operation
fcvt.h.s f13, f8, rmm # perform operation
fcvt.h.s f13, f8, rne # perform operation
fcvt.h.s f13, f8, rtz # perform operation
fcvt.h.s f13, f8, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f13, f8 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f13, f8 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f13, f8 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f13, f8 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f13, f8 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xffffffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffffffff # load x3 with value 0xffffffff
sw x3, 0(x2) # store 0xffffffff in memory
flw f9, 0(x2) # load 0xffffffff from memory into f9
fcvt.h.s f6, f9, dyn # perform operation
fcvt.h.s f6, f9, rdn # perform operation
fcvt.h.s f6, f9, rmm # perform operation
fcvt.h.s f6, f9, rne # perform operation
fcvt.h.s f6, f9, rtz # perform operation
fcvt.h.s f6, f9, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f6, f9 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f6, f9 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f6, f9 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f6, f9 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f6, f9 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7f800001)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f800001 # load x3 with value 0x7f800001
sw x3, 0(x2) # store 0x7f800001 in memory
flw f23, 0(x2) # load 0x7f800001 from memory into f23
fcvt.h.s f31, f23, dyn # perform operation
fcvt.h.s f31, f23, rdn # perform operation
fcvt.h.s f31, f23, rmm # perform operation
fcvt.h.s f31, f23, rne # perform operation
fcvt.h.s f31, f23, rtz # perform operation
fcvt.h.s f31, f23, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f31, f23 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f31, f23 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f31, f23 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f31, f23 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f31, f23 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7fbfffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fbfffff # load x3 with value 0x7fbfffff
sw x3, 0(x2) # store 0x7fbfffff in memory
flw f14, 0(x2) # load 0x7fbfffff from memory into f14
fcvt.h.s f13, f14, dyn # perform operation
fcvt.h.s f13, f14, rdn # perform operation
fcvt.h.s f13, f14, rmm # perform operation
fcvt.h.s f13, f14, rne # perform operation
fcvt.h.s f13, f14, rtz # perform operation
fcvt.h.s f13, f14, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f13, f14 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f13, f14 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f13, f14 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f13, f14 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f13, f14 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xffbfffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffbfffff # load x3 with value 0xffbfffff
sw x3, 0(x2) # store 0xffbfffff in memory
flw f7, 0(x2) # load 0xffbfffff from memory into f7
fcvt.h.s f18, f7, dyn # perform operation
fcvt.h.s f18, f7, rdn # perform operation
fcvt.h.s f18, f7, rmm # perform operation
fcvt.h.s f18, f7, rne # perform operation
fcvt.h.s f18, f7, rtz # perform operation
fcvt.h.s f18, f7, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f18, f7 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f18, f7 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f18, f7 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f18, f7 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f18, f7 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7ef8654f)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7ef8654f # load x3 with value 0x7ef8654f
sw x3, 0(x2) # store 0x7ef8654f in memory
flw f14, 0(x2) # load 0x7ef8654f from memory into f14
fcvt.h.s f29, f14, dyn # perform operation
fcvt.h.s f29, f14, rdn # perform operation
fcvt.h.s f29, f14, rmm # perform operation
fcvt.h.s f29, f14, rne # perform operation
fcvt.h.s f29, f14, rtz # perform operation
fcvt.h.s f29, f14, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f29, f14 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f29, f14 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f29, f14 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f29, f14 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f29, f14 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x813d9ab0)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x813d9ab0 # load x3 with value 0x813d9ab0
sw x3, 0(x2) # store 0x813d9ab0 in memory
flw f28, 0(x2) # load 0x813d9ab0 from memory into f28
fcvt.h.s f12, f28, dyn # perform operation
fcvt.h.s f12, f28, rdn # perform operation
fcvt.h.s f12, f28, rmm # perform operation
fcvt.h.s f12, f28, rne # perform operation
fcvt.h.s f12, f28, rtz # perform operation
fcvt.h.s f12, f28, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f12, f28 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f12, f28 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f12, f28 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f12, f28 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f12, f28 # perform operation


# Testcase cmp_fd_fs1 (Test fd = fs1 = f0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xd3ce2a80 # load x3 with value 0xd3ce2a80
sw x3, 0(x2) # store 0xd3ce2a80 in memory
flw f0, 0(x2) # load 0xd3ce2a80 from memory into f0
fcvt.h.s f0, f0 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x75e0405d # load x3 with value 0x75e0405d
sw x3, 0(x2) # store 0x75e0405d in memory
flw f1, 0(x2) # load 0x75e0405d from memory into f1
fcvt.h.s f1, f1 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f2)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe96608a1 # load x3 with value 0xe96608a1
sw x3, 0(x2) # store 0xe96608a1 in memory
flw f2, 0(x2) # load 0xe96608a1 from memory into f2
fcvt.h.s f2, f2 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0cb0e9af # load x3 with value 0x0cb0e9af
sw x3, 0(x2) # store 0x0cb0e9af in memory
flw f3, 0(x2) # load 0x0cb0e9af from memory into f3
fcvt.h.s f3, f3 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xf3e84bb0 # load x3 with value 0xf3e84bb0
sw x3, 0(x2) # store 0xf3e84bb0 in memory
flw f4, 0(x2) # load 0xf3e84bb0 from memory into f4
fcvt.h.s f4, f4 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x56f4657c # load x3 with value 0x56f4657c
sw x3, 0(x2) # store 0x56f4657c in memory
flw f5, 0(x2) # load 0x56f4657c from memory into f5
fcvt.h.s f5, f5 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x88dbf970 # load x3 with value 0x88dbf970
sw x3, 0(x2) # store 0x88dbf970 in memory
flw f6, 0(x2) # load 0x88dbf970 from memory into f6
fcvt.h.s f6, f6 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x1ee02574 # load x3 with value 0x1ee02574
sw x3, 0(x2) # store 0x1ee02574 in memory
flw f7, 0(x2) # load 0x1ee02574 from memory into f7
fcvt.h.s f7, f7 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfb16a683 # load x3 with value 0xfb16a683
sw x3, 0(x2) # store 0xfb16a683 in memory
flw f8, 0(x2) # load 0xfb16a683 from memory into f8
fcvt.h.s f8, f8 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f9)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xdfcd4a5c # load x3 with value 0xdfcd4a5c
sw x3, 0(x2) # store 0xdfcd4a5c in memory
flw f9, 0(x2) # load 0xdfcd4a5c from memory into f9
fcvt.h.s f9, f9 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f10)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x37406fd1 # load x3 with value 0x37406fd1
sw x3, 0(x2) # store 0x37406fd1 in memory
flw f10, 0(x2) # load 0x37406fd1 from memory into f10
fcvt.h.s f10, f10 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f11)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xda1be458 # load x3 with value 0xda1be458
sw x3, 0(x2) # store 0xda1be458 in memory
flw f11, 0(x2) # load 0xda1be458 from memory into f11
fcvt.h.s f11, f11 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x9449c26e # load x3 with value 0x9449c26e
sw x3, 0(x2) # store 0x9449c26e in memory
flw f12, 0(x2) # load 0x9449c26e from memory into f12
fcvt.h.s f12, f12 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f13)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbd91ff9d # load x3 with value 0xbd91ff9d
sw x3, 0(x2) # store 0xbd91ff9d in memory
flw f13, 0(x2) # load 0xbd91ff9d from memory into f13
fcvt.h.s f13, f13 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f14)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x6454c0d7 # load x3 with value 0x6454c0d7
sw x3, 0(x2) # store 0x6454c0d7 in memory
flw f14, 0(x2) # load 0x6454c0d7 from memory into f14
fcvt.h.s f14, f14 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f15)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc840df71 # load x3 with value 0xc840df71
sw x3, 0(x2) # store 0xc840df71 in memory
flw f15, 0(x2) # load 0xc840df71 from memory into f15
fcvt.h.s f15, f15 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f16)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x60353880 # load x3 with value 0x60353880
sw x3, 0(x2) # store 0x60353880 in memory
flw f16, 0(x2) # load 0x60353880 from memory into f16
fcvt.h.s f16, f16 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f17)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x29d67f33 # load x3 with value 0x29d67f33
sw x3, 0(x2) # store 0x29d67f33 in memory
flw f17, 0(x2) # load 0x29d67f33 from memory into f17
fcvt.h.s f17, f17 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f18)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xefe5faaf # load x3 with value 0xefe5faaf
sw x3, 0(x2) # store 0xefe5faaf in memory
flw f18, 0(x2) # load 0xefe5faaf from memory into f18
fcvt.h.s f18, f18 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f19)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa9af1fc4 # load x3 with value 0xa9af1fc4
sw x3, 0(x2) # store 0xa9af1fc4 in memory
flw f19, 0(x2) # load 0xa9af1fc4 from memory into f19
fcvt.h.s f19, f19 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f20)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3d716209 # load x3 with value 0x3d716209
sw x3, 0(x2) # store 0x3d716209 in memory
flw f20, 0(x2) # load 0x3d716209 from memory into f20
fcvt.h.s f20, f20 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f21)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x82392c54 # load x3 with value 0x82392c54
sw x3, 0(x2) # store 0x82392c54 in memory
flw f21, 0(x2) # load 0x82392c54 from memory into f21
fcvt.h.s f21, f21 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f22)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x44d6736c # load x3 with value 0x44d6736c
sw x3, 0(x2) # store 0x44d6736c in memory
flw f22, 0(x2) # load 0x44d6736c from memory into f22
fcvt.h.s f22, f22 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f23)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x94062468 # load x3 with value 0x94062468
sw x3, 0(x2) # store 0x94062468 in memory
flw f23, 0(x2) # load 0x94062468 from memory into f23
fcvt.h.s f23, f23 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f24)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe5799c6a # load x3 with value 0xe5799c6a
sw x3, 0(x2) # store 0xe5799c6a in memory
flw f24, 0(x2) # load 0xe5799c6a from memory into f24
fcvt.h.s f24, f24 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f25)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbdfb6c1e # load x3 with value 0xbdfb6c1e
sw x3, 0(x2) # store 0xbdfb6c1e in memory
flw f25, 0(x2) # load 0xbdfb6c1e from memory into f25
fcvt.h.s f25, f25 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f26)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x918fe416 # load x3 with value 0x918fe416
sw x3, 0(x2) # store 0x918fe416 in memory
flw f26, 0(x2) # load 0x918fe416 from memory into f26
fcvt.h.s f26, f26 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x13e466c1 # load x3 with value 0x13e466c1
sw x3, 0(x2) # store 0x13e466c1 in memory
flw f27, 0(x2) # load 0x13e466c1 from memory into f27
fcvt.h.s f27, f27 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f28)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xf5eea0ba # load x3 with value 0xf5eea0ba
sw x3, 0(x2) # store 0xf5eea0ba in memory
flw f28, 0(x2) # load 0xf5eea0ba from memory into f28
fcvt.h.s f28, f28 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f29)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xec1924fe # load x3 with value 0xec1924fe
sw x3, 0(x2) # store 0xec1924fe in memory
flw f29, 0(x2) # load 0xec1924fe from memory into f29
fcvt.h.s f29, f29 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f30)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7d822789 # load x3 with value 0x7d822789
sw x3, 0(x2) # store 0x7d822789 in memory
flw f30, 0(x2) # load 0x7d822789 from memory into f30
fcvt.h.s f30, f30 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa32830fc # load x3 with value 0xa32830fc
sw x3, 0(x2) # store 0xa32830fc in memory
flw f31, 0(x2) # load 0xa32830fc from memory into f31
fcvt.h.s f31, f31 # perform operation second time to make sure flags don't change

# Testcase cp_frm
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xd4dd3db5 # load x3 with value 0xd4dd3db5
sw x3, 0(x2) # store 0xd4dd3db5 in memory
flw f1, 0(x2) # load 0xd4dd3db5 from memory into f1
fcvt.h.s f5, f1, dyn # perform operation
fcvt.h.s f5, f1, rdn # perform operation
fcvt.h.s f5, f1, rmm # perform operation
fcvt.h.s f5, f1, rne # perform operation
fcvt.h.s f5, f1, rtz # perform operation
fcvt.h.s f5, f1, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f5, f1 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f5, f1 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f5, f1 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f5, f1 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f5, f1 # perform operation


# Testcase Random test for cp_NaNBox 
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3b3d6ea1 # load x3 with value 0x3b3d6ea1
sw x3, 0(x2) # store 0x3b3d6ea1 in memory
flw f15, 0(x2) # load 0x3b3d6ea1 from memory into f15
fcvt.h.s f7, f15 # perform operation second time to make sure flags don't change

#.EQU SIGSIZE,0


// ******************
// Tests from: WALLY-COV-fsgnj.h.S
// ******************


# initialize signature pointer
la x4, begin_signature

    
# set mstatus.FS to 01 to enable fp
li t0,0x4000
csrs mstatus, t0


# Testcase cp_gpr/fpr_hazard nohaz test
add x6, x8, x25 # perform first operation
fsgnj.h f18, f21, f11 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x25, x18, x15 # perform first operation
fsgnj.h f11, f12, f22 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x1, x25, x17 # perform first operation
fsgnj.h f14, f7, f29 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
fmul.s f3, f15, f18 # perform first operation
fsgnj.h f18, f28, f3 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
fmul.s f8, f19, f16 # perform first operation
fsgnj.h f16, f8, f8 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x12, x22, x9 # perform first operation
fsgnj.h f9, f28, f29 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f23, f21, f5 # perform first operation
fsgnj.h f23, f31, f8 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f18, f24, f10 # perform first operation
fsgnj.h f18, f16, f1 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f10, f7, f24 # perform first operation
fsgnj.h f10, f2, f22 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f14, f11, f26 # perform first operation
fsgnj.h f11, f21, f2 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f17, f11, f8 # perform first operation
fsgnj.h f8, f25, f18 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f24, f22, f13 # perform first operation
fsgnj.h f30, f2, f3 # perform second (triggering) operation

# Testcase cp_fs1 (Test source fs1 = f0)
la x2, scratch
li x3, 0xaa43a2b6 # load x3 with value 0xaa43a2b6
sw x3, 0(x2) # store 0xaa43a2b6 in memory
flh f0, 0(x2) # load 0xaa43a2b6 from memory into f0
la x2, scratch
li x3, 0x683085fd # load x3 with value 0x683085fd
sw x3, 0(x2) # store 0x683085fd in memory
flh f29, 0(x2) # load 0x683085fd from memory into f29
fsgnj.h f20, f0, f29 # perform operation

# Testcase cp_fs1 (Test source fs1 = f1)
la x2, scratch
li x3, 0x121bab93 # load x3 with value 0x121bab93
sw x3, 0(x2) # store 0x121bab93 in memory
flh f1, 0(x2) # load 0x121bab93 from memory into f1
la x2, scratch
li x3, 0x653134fd # load x3 with value 0x653134fd
sw x3, 0(x2) # store 0x653134fd in memory
flh f11, 0(x2) # load 0x653134fd from memory into f11
fsgnj.h f29, f1, f11 # perform operation

# Testcase cp_fs1 (Test source fs1 = f2)
la x2, scratch
li x3, 0xe65be9cf # load x3 with value 0xe65be9cf
sw x3, 0(x2) # store 0xe65be9cf in memory
flh f2, 0(x2) # load 0xe65be9cf from memory into f2
la x2, scratch
li x3, 0x89c05706 # load x3 with value 0x89c05706
sw x3, 0(x2) # store 0x89c05706 in memory
flh f1, 0(x2) # load 0x89c05706 from memory into f1
fsgnj.h f17, f2, f1 # perform operation

# Testcase cp_fs1 (Test source fs1 = f3)
la x2, scratch
li x3, 0x1791d0e3 # load x3 with value 0x1791d0e3
sw x3, 0(x2) # store 0x1791d0e3 in memory
flh f3, 0(x2) # load 0x1791d0e3 from memory into f3
la x2, scratch
li x3, 0x96edaaa7 # load x3 with value 0x96edaaa7
sw x3, 0(x2) # store 0x96edaaa7 in memory
flh f21, 0(x2) # load 0x96edaaa7 from memory into f21
fsgnj.h f2, f3, f21 # perform operation

# Testcase cp_fs1 (Test source fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x5277b559 # load x3 with value 0x5277b559
sw x3, 0(x2) # store 0x5277b559 in memory
flh f4, 0(x2) # load 0x5277b559 from memory into f4
la x2, scratch
li x3, 0x28e2e68b # load x3 with value 0x28e2e68b
sw x3, 0(x2) # store 0x28e2e68b in memory
flh f27, 0(x2) # load 0x28e2e68b from memory into f27
fsgnj.h f14, f4, f27 # perform operation

# Testcase cp_fs1 (Test source fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xb7cd65eb # load x3 with value 0xb7cd65eb
sw x3, 0(x2) # store 0xb7cd65eb in memory
flh f5, 0(x2) # load 0xb7cd65eb from memory into f5
la x2, scratch
li x3, 0x73b7c7a5 # load x3 with value 0x73b7c7a5
sw x3, 0(x2) # store 0x73b7c7a5 in memory
flh f20, 0(x2) # load 0x73b7c7a5 from memory into f20
fsgnj.h f23, f5, f20 # perform operation

# Testcase cp_fs1 (Test source fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x696ecc08 # load x3 with value 0x696ecc08
sw x3, 0(x2) # store 0x696ecc08 in memory
flh f6, 0(x2) # load 0x696ecc08 from memory into f6
la x2, scratch
li x3, 0x46458420 # load x3 with value 0x46458420
sw x3, 0(x2) # store 0x46458420 in memory
flh f9, 0(x2) # load 0x46458420 from memory into f9
fsgnj.h f2, f6, f9 # perform operation

# Testcase cp_fs1 (Test source fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x36d310c9 # load x3 with value 0x36d310c9
sw x3, 0(x2) # store 0x36d310c9 in memory
flh f7, 0(x2) # load 0x36d310c9 from memory into f7
la x2, scratch
li x3, 0xc0907bab # load x3 with value 0xc0907bab
sw x3, 0(x2) # store 0xc0907bab in memory
flh f20, 0(x2) # load 0xc0907bab from memory into f20
fsgnj.h f16, f7, f20 # perform operation

# Testcase cp_fs1 (Test source fs1 = f8)
la x2, scratch
li x3, 0x2e7b54fc # load x3 with value 0x2e7b54fc
sw x3, 0(x2) # store 0x2e7b54fc in memory
flh f8, 0(x2) # load 0x2e7b54fc from memory into f8
la x2, scratch
li x3, 0xae64bcd0 # load x3 with value 0xae64bcd0
sw x3, 0(x2) # store 0xae64bcd0 in memory
flh f29, 0(x2) # load 0xae64bcd0 from memory into f29
fsgnj.h f14, f8, f29 # perform operation

# Testcase cp_fs1 (Test source fs1 = f9)
la x2, scratch
li x3, 0x3a153173 # load x3 with value 0x3a153173
sw x3, 0(x2) # store 0x3a153173 in memory
flh f9, 0(x2) # load 0x3a153173 from memory into f9
la x2, scratch
li x3, 0xd5859e7b # load x3 with value 0xd5859e7b
sw x3, 0(x2) # store 0xd5859e7b in memory
flh f30, 0(x2) # load 0xd5859e7b from memory into f30
fsgnj.h f19, f9, f30 # perform operation

# Testcase cp_fs1 (Test source fs1 = f10)
la x2, scratch
li x3, 0x07144a3a # load x3 with value 0x07144a3a
sw x3, 0(x2) # store 0x07144a3a in memory
flh f10, 0(x2) # load 0x07144a3a from memory into f10
la x2, scratch
li x3, 0x38b00efb # load x3 with value 0x38b00efb
sw x3, 0(x2) # store 0x38b00efb in memory
flh f28, 0(x2) # load 0x38b00efb from memory into f28
fsgnj.h f30, f10, f28 # perform operation

# Testcase cp_fs1 (Test source fs1 = f11)
la x2, scratch
li x3, 0xc039e37c # load x3 with value 0xc039e37c
sw x3, 0(x2) # store 0xc039e37c in memory
flh f11, 0(x2) # load 0xc039e37c from memory into f11
la x2, scratch
li x3, 0xbfa1f228 # load x3 with value 0xbfa1f228
sw x3, 0(x2) # store 0xbfa1f228 in memory
flh f31, 0(x2) # load 0xbfa1f228 from memory into f31
fsgnj.h f1, f11, f31 # perform operation

# Testcase cp_fs1 (Test source fs1 = f12)
la x2, scratch
li x3, 0x518f5f43 # load x3 with value 0x518f5f43
sw x3, 0(x2) # store 0x518f5f43 in memory
flh f12, 0(x2) # load 0x518f5f43 from memory into f12
la x2, scratch
li x3, 0x22cbb937 # load x3 with value 0x22cbb937
sw x3, 0(x2) # store 0x22cbb937 in memory
flh f22, 0(x2) # load 0x22cbb937 from memory into f22
fsgnj.h f12, f12, f22 # perform operation

# Testcase cp_fs1 (Test source fs1 = f13)
la x2, scratch
li x3, 0xaf80c753 # load x3 with value 0xaf80c753
sw x3, 0(x2) # store 0xaf80c753 in memory
flh f13, 0(x2) # load 0xaf80c753 from memory into f13
la x2, scratch
li x3, 0xc9cb4d23 # load x3 with value 0xc9cb4d23
sw x3, 0(x2) # store 0xc9cb4d23 in memory
flh f24, 0(x2) # load 0xc9cb4d23 from memory into f24
fsgnj.h f18, f13, f24 # perform operation

# Testcase cp_fs1 (Test source fs1 = f14)
la x2, scratch
li x3, 0x36aaaaf7 # load x3 with value 0x36aaaaf7
sw x3, 0(x2) # store 0x36aaaaf7 in memory
flh f14, 0(x2) # load 0x36aaaaf7 from memory into f14
la x2, scratch
li x3, 0xcc6cbbbc # load x3 with value 0xcc6cbbbc
sw x3, 0(x2) # store 0xcc6cbbbc in memory
flh f12, 0(x2) # load 0xcc6cbbbc from memory into f12
fsgnj.h f30, f14, f12 # perform operation

# Testcase cp_fs1 (Test source fs1 = f15)
la x2, scratch
li x3, 0xd0056deb # load x3 with value 0xd0056deb
sw x3, 0(x2) # store 0xd0056deb in memory
flh f15, 0(x2) # load 0xd0056deb from memory into f15
la x2, scratch
li x3, 0xd2c020b4 # load x3 with value 0xd2c020b4
sw x3, 0(x2) # store 0xd2c020b4 in memory
flh f29, 0(x2) # load 0xd2c020b4 from memory into f29
fsgnj.h f9, f15, f29 # perform operation

# Testcase cp_fs1 (Test source fs1 = f16)
la x2, scratch
li x3, 0x7f90983a # load x3 with value 0x7f90983a
sw x3, 0(x2) # store 0x7f90983a in memory
flh f16, 0(x2) # load 0x7f90983a from memory into f16
la x2, scratch
li x3, 0x9f01d8f3 # load x3 with value 0x9f01d8f3
sw x3, 0(x2) # store 0x9f01d8f3 in memory
flh f13, 0(x2) # load 0x9f01d8f3 from memory into f13
fsgnj.h f11, f16, f13 # perform operation

# Testcase cp_fs1 (Test source fs1 = f17)
la x2, scratch
li x3, 0x68ad7525 # load x3 with value 0x68ad7525
sw x3, 0(x2) # store 0x68ad7525 in memory
flh f17, 0(x2) # load 0x68ad7525 from memory into f17
la x2, scratch
li x3, 0xa93ed50f # load x3 with value 0xa93ed50f
sw x3, 0(x2) # store 0xa93ed50f in memory
flh f10, 0(x2) # load 0xa93ed50f from memory into f10
fsgnj.h f5, f17, f10 # perform operation

# Testcase cp_fs1 (Test source fs1 = f18)
la x2, scratch
li x3, 0x3dfab10d # load x3 with value 0x3dfab10d
sw x3, 0(x2) # store 0x3dfab10d in memory
flh f18, 0(x2) # load 0x3dfab10d from memory into f18
la x2, scratch
li x3, 0x3545d660 # load x3 with value 0x3545d660
sw x3, 0(x2) # store 0x3545d660 in memory
flh f8, 0(x2) # load 0x3545d660 from memory into f8
fsgnj.h f9, f18, f8 # perform operation

# Testcase cp_fs1 (Test source fs1 = f19)
la x2, scratch
li x3, 0x40c16613 # load x3 with value 0x40c16613
sw x3, 0(x2) # store 0x40c16613 in memory
flh f19, 0(x2) # load 0x40c16613 from memory into f19
la x2, scratch
li x3, 0x3aaf2fee # load x3 with value 0x3aaf2fee
sw x3, 0(x2) # store 0x3aaf2fee in memory
flh f17, 0(x2) # load 0x3aaf2fee from memory into f17
fsgnj.h f18, f19, f17 # perform operation

# Testcase cp_fs1 (Test source fs1 = f20)
la x2, scratch
li x3, 0x8af445bc # load x3 with value 0x8af445bc
sw x3, 0(x2) # store 0x8af445bc in memory
flh f20, 0(x2) # load 0x8af445bc from memory into f20
la x2, scratch
li x3, 0xe4abe243 # load x3 with value 0xe4abe243
sw x3, 0(x2) # store 0xe4abe243 in memory
flh f30, 0(x2) # load 0xe4abe243 from memory into f30
fsgnj.h f7, f20, f30 # perform operation

# Testcase cp_fs1 (Test source fs1 = f21)
la x2, scratch
li x3, 0x17795d83 # load x3 with value 0x17795d83
sw x3, 0(x2) # store 0x17795d83 in memory
flh f21, 0(x2) # load 0x17795d83 from memory into f21
la x2, scratch
li x3, 0x70e8593c # load x3 with value 0x70e8593c
sw x3, 0(x2) # store 0x70e8593c in memory
flh f10, 0(x2) # load 0x70e8593c from memory into f10
fsgnj.h f15, f21, f10 # perform operation

# Testcase cp_fs1 (Test source fs1 = f22)
la x2, scratch
li x3, 0x6d122754 # load x3 with value 0x6d122754
sw x3, 0(x2) # store 0x6d122754 in memory
flh f22, 0(x2) # load 0x6d122754 from memory into f22
la x2, scratch
li x3, 0x5147efef # load x3 with value 0x5147efef
sw x3, 0(x2) # store 0x5147efef in memory
flh f15, 0(x2) # load 0x5147efef from memory into f15
fsgnj.h f16, f22, f15 # perform operation

# Testcase cp_fs1 (Test source fs1 = f23)
la x2, scratch
li x3, 0xb5915acc # load x3 with value 0xb5915acc
sw x3, 0(x2) # store 0xb5915acc in memory
flh f23, 0(x2) # load 0xb5915acc from memory into f23
la x2, scratch
li x3, 0x1cde7b46 # load x3 with value 0x1cde7b46
sw x3, 0(x2) # store 0x1cde7b46 in memory
flh f18, 0(x2) # load 0x1cde7b46 from memory into f18
fsgnj.h f21, f23, f18 # perform operation

# Testcase cp_fs1 (Test source fs1 = f24)
la x2, scratch
li x3, 0xf7eebfc7 # load x3 with value 0xf7eebfc7
sw x3, 0(x2) # store 0xf7eebfc7 in memory
flh f24, 0(x2) # load 0xf7eebfc7 from memory into f24
la x2, scratch
li x3, 0x785c9e56 # load x3 with value 0x785c9e56
sw x3, 0(x2) # store 0x785c9e56 in memory
flh f12, 0(x2) # load 0x785c9e56 from memory into f12
fsgnj.h f6, f24, f12 # perform operation

# Testcase cp_fs1 (Test source fs1 = f25)
la x2, scratch
li x3, 0x05f4b5c9 # load x3 with value 0x05f4b5c9
sw x3, 0(x2) # store 0x05f4b5c9 in memory
flh f25, 0(x2) # load 0x05f4b5c9 from memory into f25
la x2, scratch
li x3, 0x5fcb2bb0 # load x3 with value 0x5fcb2bb0
sw x3, 0(x2) # store 0x5fcb2bb0 in memory
flh f14, 0(x2) # load 0x5fcb2bb0 from memory into f14
fsgnj.h f1, f25, f14 # perform operation

# Testcase cp_fs1 (Test source fs1 = f26)
la x2, scratch
li x3, 0x4fa0e797 # load x3 with value 0x4fa0e797
sw x3, 0(x2) # store 0x4fa0e797 in memory
flh f26, 0(x2) # load 0x4fa0e797 from memory into f26
la x2, scratch
li x3, 0x25c41ff5 # load x3 with value 0x25c41ff5
sw x3, 0(x2) # store 0x25c41ff5 in memory
flh f9, 0(x2) # load 0x25c41ff5 from memory into f9
fsgnj.h f30, f26, f9 # perform operation

# Testcase cp_fs1 (Test source fs1 = f27)
la x2, scratch
li x3, 0x4d445201 # load x3 with value 0x4d445201
sw x3, 0(x2) # store 0x4d445201 in memory
flh f27, 0(x2) # load 0x4d445201 from memory into f27
la x2, scratch
li x3, 0xf1c9bff7 # load x3 with value 0xf1c9bff7
sw x3, 0(x2) # store 0xf1c9bff7 in memory
flh f26, 0(x2) # load 0xf1c9bff7 from memory into f26
fsgnj.h f14, f27, f26 # perform operation

# Testcase cp_fs1 (Test source fs1 = f28)
la x2, scratch
li x3, 0x91b76c82 # load x3 with value 0x91b76c82
sw x3, 0(x2) # store 0x91b76c82 in memory
flh f28, 0(x2) # load 0x91b76c82 from memory into f28
la x2, scratch
li x3, 0x1123f69a # load x3 with value 0x1123f69a
sw x3, 0(x2) # store 0x1123f69a in memory
flh f13, 0(x2) # load 0x1123f69a from memory into f13
fsgnj.h f11, f28, f13 # perform operation

# Testcase cp_fs1 (Test source fs1 = f29)
la x2, scratch
li x3, 0x8529f096 # load x3 with value 0x8529f096
sw x3, 0(x2) # store 0x8529f096 in memory
flh f29, 0(x2) # load 0x8529f096 from memory into f29
la x2, scratch
li x3, 0x54c9bf99 # load x3 with value 0x54c9bf99
sw x3, 0(x2) # store 0x54c9bf99 in memory
flh f17, 0(x2) # load 0x54c9bf99 from memory into f17
fsgnj.h f11, f29, f17 # perform operation

# Testcase cp_fs1 (Test source fs1 = f30)
la x2, scratch
li x3, 0x4f4c7181 # load x3 with value 0x4f4c7181
sw x3, 0(x2) # store 0x4f4c7181 in memory
flh f30, 0(x2) # load 0x4f4c7181 from memory into f30
la x2, scratch
li x3, 0xf8446420 # load x3 with value 0xf8446420
sw x3, 0(x2) # store 0xf8446420 in memory
flh f11, 0(x2) # load 0xf8446420 from memory into f11
fsgnj.h f6, f30, f11 # perform operation

# Testcase cp_fs1 (Test source fs1 = f31)
la x2, scratch
li x3, 0x9e0c83fb # load x3 with value 0x9e0c83fb
sw x3, 0(x2) # store 0x9e0c83fb in memory
flh f31, 0(x2) # load 0x9e0c83fb from memory into f31
la x2, scratch
li x3, 0x8f1ce253 # load x3 with value 0x8f1ce253
sw x3, 0(x2) # store 0x8f1ce253 in memory
flh f8, 0(x2) # load 0x8f1ce253 from memory into f8
fsgnj.h f27, f31, f8 # perform operation

# Testcase cp_fs2 (Test source fs2 = f0)
la x2, scratch
li x3, 0x2e11506a # load x3 with value 0x2e11506a
sw x3, 0(x2) # store 0x2e11506a in memory
flh f14, 0(x2) # load 0x2e11506a from memory into f14
la x2, scratch
li x3, 0x447e57f0 # load x3 with value 0x447e57f0
sw x3, 0(x2) # store 0x447e57f0 in memory
flh f0, 0(x2) # load 0x447e57f0 from memory into f0
fsgnj.h f5, f14, f0 # perform operation

# Testcase cp_fs2 (Test source fs2 = f1)
la x2, scratch
li x3, 0xbdc15369 # load x3 with value 0xbdc15369
sw x3, 0(x2) # store 0xbdc15369 in memory
flh f25, 0(x2) # load 0xbdc15369 from memory into f25
la x2, scratch
li x3, 0xd763eeec # load x3 with value 0xd763eeec
sw x3, 0(x2) # store 0xd763eeec in memory
flh f1, 0(x2) # load 0xd763eeec from memory into f1
fsgnj.h f24, f25, f1 # perform operation

# Testcase cp_fs2 (Test source fs2 = f2)
la x2, scratch
li x3, 0x02f034a8 # load x3 with value 0x02f034a8
sw x3, 0(x2) # store 0x02f034a8 in memory
flh f3, 0(x2) # load 0x02f034a8 from memory into f3
la x2, scratch
li x3, 0x34e6e62e # load x3 with value 0x34e6e62e
sw x3, 0(x2) # store 0x34e6e62e in memory
flh f2, 0(x2) # load 0x34e6e62e from memory into f2
fsgnj.h f13, f3, f2 # perform operation

# Testcase cp_fs2 (Test source fs2 = f3)
la x2, scratch
li x3, 0xaa186d87 # load x3 with value 0xaa186d87
sw x3, 0(x2) # store 0xaa186d87 in memory
flh f15, 0(x2) # load 0xaa186d87 from memory into f15
la x2, scratch
li x3, 0xbfd1e153 # load x3 with value 0xbfd1e153
sw x3, 0(x2) # store 0xbfd1e153 in memory
flh f3, 0(x2) # load 0xbfd1e153 from memory into f3
fsgnj.h f16, f15, f3 # perform operation

# Testcase cp_fs2 (Test source fs2 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xe14d01f9 # load x3 with value 0xe14d01f9
sw x3, 0(x2) # store 0xe14d01f9 in memory
flh f19, 0(x2) # load 0xe14d01f9 from memory into f19
la x2, scratch
li x3, 0x9aefd610 # load x3 with value 0x9aefd610
sw x3, 0(x2) # store 0x9aefd610 in memory
flh f4, 0(x2) # load 0x9aefd610 from memory into f4
fsgnj.h f11, f19, f4 # perform operation

# Testcase cp_fs2 (Test source fs2 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xdfb441a2 # load x3 with value 0xdfb441a2
sw x3, 0(x2) # store 0xdfb441a2 in memory
flh f1, 0(x2) # load 0xdfb441a2 from memory into f1
la x2, scratch
li x3, 0xb9663389 # load x3 with value 0xb9663389
sw x3, 0(x2) # store 0xb9663389 in memory
flh f5, 0(x2) # load 0xb9663389 from memory into f5
fsgnj.h f27, f1, f5 # perform operation

# Testcase cp_fs2 (Test source fs2 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x3352c75b # load x3 with value 0x3352c75b
sw x3, 0(x2) # store 0x3352c75b in memory
flh f26, 0(x2) # load 0x3352c75b from memory into f26
la x2, scratch
li x3, 0xb97ce090 # load x3 with value 0xb97ce090
sw x3, 0(x2) # store 0xb97ce090 in memory
flh f6, 0(x2) # load 0xb97ce090 from memory into f6
fsgnj.h f3, f26, f6 # perform operation

# Testcase cp_fs2 (Test source fs2 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x3d47ecb8 # load x3 with value 0x3d47ecb8
sw x3, 0(x2) # store 0x3d47ecb8 in memory
flh f18, 0(x2) # load 0x3d47ecb8 from memory into f18
la x2, scratch
li x3, 0x3b9ed61a # load x3 with value 0x3b9ed61a
sw x3, 0(x2) # store 0x3b9ed61a in memory
flh f7, 0(x2) # load 0x3b9ed61a from memory into f7
fsgnj.h f22, f18, f7 # perform operation

# Testcase cp_fs2 (Test source fs2 = f8)
la x2, scratch
li x3, 0x2b6d32c8 # load x3 with value 0x2b6d32c8
sw x3, 0(x2) # store 0x2b6d32c8 in memory
flh f11, 0(x2) # load 0x2b6d32c8 from memory into f11
la x2, scratch
li x3, 0xb5a620e7 # load x3 with value 0xb5a620e7
sw x3, 0(x2) # store 0xb5a620e7 in memory
flh f8, 0(x2) # load 0xb5a620e7 from memory into f8
fsgnj.h f20, f11, f8 # perform operation

# Testcase cp_fs2 (Test source fs2 = f9)
la x2, scratch
li x3, 0xbc750f18 # load x3 with value 0xbc750f18
sw x3, 0(x2) # store 0xbc750f18 in memory
flh f20, 0(x2) # load 0xbc750f18 from memory into f20
la x2, scratch
li x3, 0x8350b20e # load x3 with value 0x8350b20e
sw x3, 0(x2) # store 0x8350b20e in memory
flh f9, 0(x2) # load 0x8350b20e from memory into f9
fsgnj.h f22, f20, f9 # perform operation

# Testcase cp_fs2 (Test source fs2 = f10)
la x2, scratch
li x3, 0x836ba1d8 # load x3 with value 0x836ba1d8
sw x3, 0(x2) # store 0x836ba1d8 in memory
flh f9, 0(x2) # load 0x836ba1d8 from memory into f9
la x2, scratch
li x3, 0x8ab7f8f8 # load x3 with value 0x8ab7f8f8
sw x3, 0(x2) # store 0x8ab7f8f8 in memory
flh f10, 0(x2) # load 0x8ab7f8f8 from memory into f10
fsgnj.h f21, f9, f10 # perform operation

# Testcase cp_fs2 (Test source fs2 = f11)
la x2, scratch
li x3, 0x323da1c1 # load x3 with value 0x323da1c1
sw x3, 0(x2) # store 0x323da1c1 in memory
flh f12, 0(x2) # load 0x323da1c1 from memory into f12
la x2, scratch
li x3, 0x13d3a804 # load x3 with value 0x13d3a804
sw x3, 0(x2) # store 0x13d3a804 in memory
flh f11, 0(x2) # load 0x13d3a804 from memory into f11
fsgnj.h f19, f12, f11 # perform operation

# Testcase cp_fs2 (Test source fs2 = f12)
la x2, scratch
li x3, 0x297139af # load x3 with value 0x297139af
sw x3, 0(x2) # store 0x297139af in memory
flh f29, 0(x2) # load 0x297139af from memory into f29
la x2, scratch
li x3, 0x156c819f # load x3 with value 0x156c819f
sw x3, 0(x2) # store 0x156c819f in memory
flh f12, 0(x2) # load 0x156c819f from memory into f12
fsgnj.h f6, f29, f12 # perform operation

# Testcase cp_fs2 (Test source fs2 = f13)
la x2, scratch
li x3, 0xd3d8f7fe # load x3 with value 0xd3d8f7fe
sw x3, 0(x2) # store 0xd3d8f7fe in memory
flh f2, 0(x2) # load 0xd3d8f7fe from memory into f2
la x2, scratch
li x3, 0xc473c632 # load x3 with value 0xc473c632
sw x3, 0(x2) # store 0xc473c632 in memory
flh f13, 0(x2) # load 0xc473c632 from memory into f13
fsgnj.h f14, f2, f13 # perform operation

# Testcase cp_fs2 (Test source fs2 = f14)
la x2, scratch
li x3, 0x50bc7c7f # load x3 with value 0x50bc7c7f
sw x3, 0(x2) # store 0x50bc7c7f in memory
flh f26, 0(x2) # load 0x50bc7c7f from memory into f26
la x2, scratch
li x3, 0x09c36691 # load x3 with value 0x09c36691
sw x3, 0(x2) # store 0x09c36691 in memory
flh f14, 0(x2) # load 0x09c36691 from memory into f14
fsgnj.h f31, f26, f14 # perform operation

# Testcase cp_fs2 (Test source fs2 = f15)
la x2, scratch
li x3, 0xd0fe7a48 # load x3 with value 0xd0fe7a48
sw x3, 0(x2) # store 0xd0fe7a48 in memory
flh f29, 0(x2) # load 0xd0fe7a48 from memory into f29
la x2, scratch
li x3, 0xfc4e17f6 # load x3 with value 0xfc4e17f6
sw x3, 0(x2) # store 0xfc4e17f6 in memory
flh f15, 0(x2) # load 0xfc4e17f6 from memory into f15
fsgnj.h f22, f29, f15 # perform operation

# Testcase cp_fs2 (Test source fs2 = f16)
la x2, scratch
li x3, 0x33710655 # load x3 with value 0x33710655
sw x3, 0(x2) # store 0x33710655 in memory
flh f3, 0(x2) # load 0x33710655 from memory into f3
la x2, scratch
li x3, 0x0015e9a9 # load x3 with value 0x0015e9a9
sw x3, 0(x2) # store 0x0015e9a9 in memory
flh f16, 0(x2) # load 0x0015e9a9 from memory into f16
fsgnj.h f9, f3, f16 # perform operation

# Testcase cp_fs2 (Test source fs2 = f17)
la x2, scratch
li x3, 0x85b40466 # load x3 with value 0x85b40466
sw x3, 0(x2) # store 0x85b40466 in memory
flh f10, 0(x2) # load 0x85b40466 from memory into f10
la x2, scratch
li x3, 0x5c2ef3c1 # load x3 with value 0x5c2ef3c1
sw x3, 0(x2) # store 0x5c2ef3c1 in memory
flh f17, 0(x2) # load 0x5c2ef3c1 from memory into f17
fsgnj.h f9, f10, f17 # perform operation

# Testcase cp_fs2 (Test source fs2 = f18)
la x2, scratch
li x3, 0x69db4f8e # load x3 with value 0x69db4f8e
sw x3, 0(x2) # store 0x69db4f8e in memory
flh f24, 0(x2) # load 0x69db4f8e from memory into f24
la x2, scratch
li x3, 0xb05324b0 # load x3 with value 0xb05324b0
sw x3, 0(x2) # store 0xb05324b0 in memory
flh f18, 0(x2) # load 0xb05324b0 from memory into f18
fsgnj.h f20, f24, f18 # perform operation

# Testcase cp_fs2 (Test source fs2 = f19)
la x2, scratch
li x3, 0xdea6eed9 # load x3 with value 0xdea6eed9
sw x3, 0(x2) # store 0xdea6eed9 in memory
flh f23, 0(x2) # load 0xdea6eed9 from memory into f23
la x2, scratch
li x3, 0x41a9dd7e # load x3 with value 0x41a9dd7e
sw x3, 0(x2) # store 0x41a9dd7e in memory
flh f19, 0(x2) # load 0x41a9dd7e from memory into f19
fsgnj.h f27, f23, f19 # perform operation

# Testcase cp_fs2 (Test source fs2 = f20)
la x2, scratch
li x3, 0x86203376 # load x3 with value 0x86203376
sw x3, 0(x2) # store 0x86203376 in memory
flh f30, 0(x2) # load 0x86203376 from memory into f30
la x2, scratch
li x3, 0x94609671 # load x3 with value 0x94609671
sw x3, 0(x2) # store 0x94609671 in memory
flh f20, 0(x2) # load 0x94609671 from memory into f20
fsgnj.h f22, f30, f20 # perform operation

# Testcase cp_fs2 (Test source fs2 = f21)
la x2, scratch
li x3, 0xf98fb8c6 # load x3 with value 0xf98fb8c6
sw x3, 0(x2) # store 0xf98fb8c6 in memory
flh f6, 0(x2) # load 0xf98fb8c6 from memory into f6
la x2, scratch
li x3, 0xb4402705 # load x3 with value 0xb4402705
sw x3, 0(x2) # store 0xb4402705 in memory
flh f21, 0(x2) # load 0xb4402705 from memory into f21
fsgnj.h f31, f6, f21 # perform operation

# Testcase cp_fs2 (Test source fs2 = f22)
la x2, scratch
li x3, 0x9ce87d58 # load x3 with value 0x9ce87d58
sw x3, 0(x2) # store 0x9ce87d58 in memory
flh f7, 0(x2) # load 0x9ce87d58 from memory into f7
la x2, scratch
li x3, 0x0b0028cc # load x3 with value 0x0b0028cc
sw x3, 0(x2) # store 0x0b0028cc in memory
flh f22, 0(x2) # load 0x0b0028cc from memory into f22
fsgnj.h f20, f7, f22 # perform operation

# Testcase cp_fs2 (Test source fs2 = f23)
la x2, scratch
li x3, 0xd1d56c38 # load x3 with value 0xd1d56c38
sw x3, 0(x2) # store 0xd1d56c38 in memory
flh f29, 0(x2) # load 0xd1d56c38 from memory into f29
la x2, scratch
li x3, 0x95f7208a # load x3 with value 0x95f7208a
sw x3, 0(x2) # store 0x95f7208a in memory
flh f23, 0(x2) # load 0x95f7208a from memory into f23
fsgnj.h f28, f29, f23 # perform operation

# Testcase cp_fs2 (Test source fs2 = f24)
la x2, scratch
li x3, 0xea47bead # load x3 with value 0xea47bead
sw x3, 0(x2) # store 0xea47bead in memory
flh f18, 0(x2) # load 0xea47bead from memory into f18
la x2, scratch
li x3, 0xfcf5d1ab # load x3 with value 0xfcf5d1ab
sw x3, 0(x2) # store 0xfcf5d1ab in memory
flh f24, 0(x2) # load 0xfcf5d1ab from memory into f24
fsgnj.h f6, f18, f24 # perform operation

# Testcase cp_fs2 (Test source fs2 = f25)
la x2, scratch
li x3, 0xd612c050 # load x3 with value 0xd612c050
sw x3, 0(x2) # store 0xd612c050 in memory
flh f10, 0(x2) # load 0xd612c050 from memory into f10
la x2, scratch
li x3, 0xb71ab72d # load x3 with value 0xb71ab72d
sw x3, 0(x2) # store 0xb71ab72d in memory
flh f25, 0(x2) # load 0xb71ab72d from memory into f25
fsgnj.h f31, f10, f25 # perform operation

# Testcase cp_fs2 (Test source fs2 = f26)
la x2, scratch
li x3, 0x3507f977 # load x3 with value 0x3507f977
sw x3, 0(x2) # store 0x3507f977 in memory
flh f16, 0(x2) # load 0x3507f977 from memory into f16
la x2, scratch
li x3, 0x1fdb6c28 # load x3 with value 0x1fdb6c28
sw x3, 0(x2) # store 0x1fdb6c28 in memory
flh f26, 0(x2) # load 0x1fdb6c28 from memory into f26
fsgnj.h f24, f16, f26 # perform operation

# Testcase cp_fs2 (Test source fs2 = f27)
la x2, scratch
li x3, 0xb329b712 # load x3 with value 0xb329b712
sw x3, 0(x2) # store 0xb329b712 in memory
flh f30, 0(x2) # load 0xb329b712 from memory into f30
la x2, scratch
li x3, 0x78622932 # load x3 with value 0x78622932
sw x3, 0(x2) # store 0x78622932 in memory
flh f27, 0(x2) # load 0x78622932 from memory into f27
fsgnj.h f21, f30, f27 # perform operation

# Testcase cp_fs2 (Test source fs2 = f28)
la x2, scratch
li x3, 0x848b6156 # load x3 with value 0x848b6156
sw x3, 0(x2) # store 0x848b6156 in memory
flh f10, 0(x2) # load 0x848b6156 from memory into f10
la x2, scratch
li x3, 0xf943905b # load x3 with value 0xf943905b
sw x3, 0(x2) # store 0xf943905b in memory
flh f28, 0(x2) # load 0xf943905b from memory into f28
fsgnj.h f23, f10, f28 # perform operation

# Testcase cp_fs2 (Test source fs2 = f29)
la x2, scratch
li x3, 0x7c7d775d # load x3 with value 0x7c7d775d
sw x3, 0(x2) # store 0x7c7d775d in memory
flh f9, 0(x2) # load 0x7c7d775d from memory into f9
la x2, scratch
li x3, 0xb21af7ff # load x3 with value 0xb21af7ff
sw x3, 0(x2) # store 0xb21af7ff in memory
flh f29, 0(x2) # load 0xb21af7ff from memory into f29
fsgnj.h f7, f9, f29 # perform operation

# Testcase cp_fs2 (Test source fs2 = f30)
la x2, scratch
li x3, 0xb1fe49fa # load x3 with value 0xb1fe49fa
sw x3, 0(x2) # store 0xb1fe49fa in memory
flh f24, 0(x2) # load 0xb1fe49fa from memory into f24
la x2, scratch
li x3, 0x8c66aab4 # load x3 with value 0x8c66aab4
sw x3, 0(x2) # store 0x8c66aab4 in memory
flh f30, 0(x2) # load 0x8c66aab4 from memory into f30
fsgnj.h f20, f24, f30 # perform operation

# Testcase cp_fs2 (Test source fs2 = f31)
la x2, scratch
li x3, 0xb98a532d # load x3 with value 0xb98a532d
sw x3, 0(x2) # store 0xb98a532d in memory
flh f6, 0(x2) # load 0xb98a532d from memory into f6
la x2, scratch
li x3, 0xc39edfe6 # load x3 with value 0xc39edfe6
sw x3, 0(x2) # store 0xc39edfe6 in memory
flh f31, 0(x2) # load 0xc39edfe6 from memory into f31
fsgnj.h f18, f6, f31 # perform operation

# Testcase cp_fd (Test destination fd = x0)
la x2, scratch
li x3, 0x741891b7 # load x3 with value 0x741891b7
sw x3, 0(x2) # store 0x741891b7 in memory
flh f8, 0(x2) # load 0x741891b7 from memory into f8
la x2, scratch
li x3, 0xde54d85f # load x3 with value 0xde54d85f
sw x3, 0(x2) # store 0xde54d85f in memory
flh f10, 0(x2) # load 0xde54d85f from memory into f10
fsgnj.h f0, f8, f10 # perform operation

# Testcase cp_fd (Test destination fd = x1)
la x2, scratch
li x3, 0x7508edb1 # load x3 with value 0x7508edb1
sw x3, 0(x2) # store 0x7508edb1 in memory
flh f8, 0(x2) # load 0x7508edb1 from memory into f8
la x2, scratch
li x3, 0xe73597a6 # load x3 with value 0xe73597a6
sw x3, 0(x2) # store 0xe73597a6 in memory
flh f18, 0(x2) # load 0xe73597a6 from memory into f18
fsgnj.h f1, f8, f18 # perform operation

# Testcase cp_fd (Test destination fd = x2)
la x2, scratch
li x3, 0x9f036608 # load x3 with value 0x9f036608
sw x3, 0(x2) # store 0x9f036608 in memory
flh f18, 0(x2) # load 0x9f036608 from memory into f18
la x2, scratch
li x3, 0x9c3318e3 # load x3 with value 0x9c3318e3
sw x3, 0(x2) # store 0x9c3318e3 in memory
flh f11, 0(x2) # load 0x9c3318e3 from memory into f11
fsgnj.h f2, f18, f11 # perform operation

# Testcase cp_fd (Test destination fd = x3)
la x2, scratch
li x3, 0xc55f307e # load x3 with value 0xc55f307e
sw x3, 0(x2) # store 0xc55f307e in memory
flh f13, 0(x2) # load 0xc55f307e from memory into f13
la x2, scratch
li x3, 0x3599b103 # load x3 with value 0x3599b103
sw x3, 0(x2) # store 0x3599b103 in memory
flh f17, 0(x2) # load 0x3599b103 from memory into f17
fsgnj.h f3, f13, f17 # perform operation

# Testcase cp_fd (Test destination fd = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x1078007a # load x3 with value 0x1078007a
sw x3, 0(x2) # store 0x1078007a in memory
flh f27, 0(x2) # load 0x1078007a from memory into f27
la x2, scratch
li x3, 0x1a1960ba # load x3 with value 0x1a1960ba
sw x3, 0(x2) # store 0x1a1960ba in memory
flh f24, 0(x2) # load 0x1a1960ba from memory into f24
fsgnj.h f4, f27, f24 # perform operation

# Testcase cp_fd (Test destination fd = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x8ff8962f # load x3 with value 0x8ff8962f
sw x3, 0(x2) # store 0x8ff8962f in memory
flh f26, 0(x2) # load 0x8ff8962f from memory into f26
la x2, scratch
li x3, 0x3842d30c # load x3 with value 0x3842d30c
sw x3, 0(x2) # store 0x3842d30c in memory
flh f7, 0(x2) # load 0x3842d30c from memory into f7
fsgnj.h f5, f26, f7 # perform operation

# Testcase cp_fd (Test destination fd = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xf5919564 # load x3 with value 0xf5919564
sw x3, 0(x2) # store 0xf5919564 in memory
flh f29, 0(x2) # load 0xf5919564 from memory into f29
la x2, scratch
li x3, 0x278140c6 # load x3 with value 0x278140c6
sw x3, 0(x2) # store 0x278140c6 in memory
flh f3, 0(x2) # load 0x278140c6 from memory into f3
fsgnj.h f6, f29, f3 # perform operation

# Testcase cp_fd (Test destination fd = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x1c677015 # load x3 with value 0x1c677015
sw x3, 0(x2) # store 0x1c677015 in memory
flh f13, 0(x2) # load 0x1c677015 from memory into f13
la x2, scratch
li x3, 0xff4a16e0 # load x3 with value 0xff4a16e0
sw x3, 0(x2) # store 0xff4a16e0 in memory
flh f20, 0(x2) # load 0xff4a16e0 from memory into f20
fsgnj.h f7, f13, f20 # perform operation

# Testcase cp_fd (Test destination fd = x8)
la x2, scratch
li x3, 0x29ef8acf # load x3 with value 0x29ef8acf
sw x3, 0(x2) # store 0x29ef8acf in memory
flh f26, 0(x2) # load 0x29ef8acf from memory into f26
la x2, scratch
li x3, 0x9c3b74fb # load x3 with value 0x9c3b74fb
sw x3, 0(x2) # store 0x9c3b74fb in memory
flh f22, 0(x2) # load 0x9c3b74fb from memory into f22
fsgnj.h f8, f26, f22 # perform operation

# Testcase cp_fd (Test destination fd = x9)
la x2, scratch
li x3, 0xac49128e # load x3 with value 0xac49128e
sw x3, 0(x2) # store 0xac49128e in memory
flh f3, 0(x2) # load 0xac49128e from memory into f3
la x2, scratch
li x3, 0xe134ec06 # load x3 with value 0xe134ec06
sw x3, 0(x2) # store 0xe134ec06 in memory
flh f10, 0(x2) # load 0xe134ec06 from memory into f10
fsgnj.h f9, f3, f10 # perform operation

# Testcase cp_fd (Test destination fd = x10)
la x2, scratch
li x3, 0xf907b1c9 # load x3 with value 0xf907b1c9
sw x3, 0(x2) # store 0xf907b1c9 in memory
flh f12, 0(x2) # load 0xf907b1c9 from memory into f12
la x2, scratch
li x3, 0x7684751a # load x3 with value 0x7684751a
sw x3, 0(x2) # store 0x7684751a in memory
flh f13, 0(x2) # load 0x7684751a from memory into f13
fsgnj.h f10, f12, f13 # perform operation

# Testcase cp_fd (Test destination fd = x11)
la x2, scratch
li x3, 0xf6460bb4 # load x3 with value 0xf6460bb4
sw x3, 0(x2) # store 0xf6460bb4 in memory
flh f5, 0(x2) # load 0xf6460bb4 from memory into f5
la x2, scratch
li x3, 0xc43ea8f8 # load x3 with value 0xc43ea8f8
sw x3, 0(x2) # store 0xc43ea8f8 in memory
flh f9, 0(x2) # load 0xc43ea8f8 from memory into f9
fsgnj.h f11, f5, f9 # perform operation

# Testcase cp_fd (Test destination fd = x12)
la x2, scratch
li x3, 0xbf8dc73d # load x3 with value 0xbf8dc73d
sw x3, 0(x2) # store 0xbf8dc73d in memory
flh f20, 0(x2) # load 0xbf8dc73d from memory into f20
la x2, scratch
li x3, 0x97025b5f # load x3 with value 0x97025b5f
sw x3, 0(x2) # store 0x97025b5f in memory
flh f10, 0(x2) # load 0x97025b5f from memory into f10
fsgnj.h f12, f20, f10 # perform operation

# Testcase cp_fd (Test destination fd = x13)
la x2, scratch
li x3, 0xfabfe183 # load x3 with value 0xfabfe183
sw x3, 0(x2) # store 0xfabfe183 in memory
flh f15, 0(x2) # load 0xfabfe183 from memory into f15
la x2, scratch
li x3, 0x9aa39df1 # load x3 with value 0x9aa39df1
sw x3, 0(x2) # store 0x9aa39df1 in memory
flh f9, 0(x2) # load 0x9aa39df1 from memory into f9
fsgnj.h f13, f15, f9 # perform operation

# Testcase cp_fd (Test destination fd = x14)
la x2, scratch
li x3, 0xc32a06fb # load x3 with value 0xc32a06fb
sw x3, 0(x2) # store 0xc32a06fb in memory
flh f20, 0(x2) # load 0xc32a06fb from memory into f20
la x2, scratch
li x3, 0xb2570404 # load x3 with value 0xb2570404
sw x3, 0(x2) # store 0xb2570404 in memory
flh f10, 0(x2) # load 0xb2570404 from memory into f10
fsgnj.h f14, f20, f10 # perform operation

# Testcase cp_fd (Test destination fd = x15)
la x2, scratch
li x3, 0x0aad4b7b # load x3 with value 0x0aad4b7b
sw x3, 0(x2) # store 0x0aad4b7b in memory
flh f26, 0(x2) # load 0x0aad4b7b from memory into f26
la x2, scratch
li x3, 0x673a1448 # load x3 with value 0x673a1448
sw x3, 0(x2) # store 0x673a1448 in memory
flh f29, 0(x2) # load 0x673a1448 from memory into f29
fsgnj.h f15, f26, f29 # perform operation

# Testcase cp_fd (Test destination fd = x16)
la x2, scratch
li x3, 0x583696c8 # load x3 with value 0x583696c8
sw x3, 0(x2) # store 0x583696c8 in memory
flh f7, 0(x2) # load 0x583696c8 from memory into f7
la x2, scratch
li x3, 0x6011d40e # load x3 with value 0x6011d40e
sw x3, 0(x2) # store 0x6011d40e in memory
flh f22, 0(x2) # load 0x6011d40e from memory into f22
fsgnj.h f16, f7, f22 # perform operation

# Testcase cp_fd (Test destination fd = x17)
la x2, scratch
li x3, 0x67d5b987 # load x3 with value 0x67d5b987
sw x3, 0(x2) # store 0x67d5b987 in memory
flh f3, 0(x2) # load 0x67d5b987 from memory into f3
la x2, scratch
li x3, 0x7c27e187 # load x3 with value 0x7c27e187
sw x3, 0(x2) # store 0x7c27e187 in memory
flh f8, 0(x2) # load 0x7c27e187 from memory into f8
fsgnj.h f17, f3, f8 # perform operation

# Testcase cp_fd (Test destination fd = x18)
la x2, scratch
li x3, 0x6b998018 # load x3 with value 0x6b998018
sw x3, 0(x2) # store 0x6b998018 in memory
flh f14, 0(x2) # load 0x6b998018 from memory into f14
la x2, scratch
li x3, 0x8d74bd3d # load x3 with value 0x8d74bd3d
sw x3, 0(x2) # store 0x8d74bd3d in memory
flh f1, 0(x2) # load 0x8d74bd3d from memory into f1
fsgnj.h f18, f14, f1 # perform operation

# Testcase cp_fd (Test destination fd = x19)
la x2, scratch
li x3, 0x17fe9a34 # load x3 with value 0x17fe9a34
sw x3, 0(x2) # store 0x17fe9a34 in memory
flh f5, 0(x2) # load 0x17fe9a34 from memory into f5
la x2, scratch
li x3, 0x7ae254b6 # load x3 with value 0x7ae254b6
sw x3, 0(x2) # store 0x7ae254b6 in memory
flh f10, 0(x2) # load 0x7ae254b6 from memory into f10
fsgnj.h f19, f5, f10 # perform operation

# Testcase cp_fd (Test destination fd = x20)
la x2, scratch
li x3, 0x1e3c4c40 # load x3 with value 0x1e3c4c40
sw x3, 0(x2) # store 0x1e3c4c40 in memory
flh f1, 0(x2) # load 0x1e3c4c40 from memory into f1
la x2, scratch
li x3, 0x50794e63 # load x3 with value 0x50794e63
sw x3, 0(x2) # store 0x50794e63 in memory
flh f18, 0(x2) # load 0x50794e63 from memory into f18
fsgnj.h f20, f1, f18 # perform operation

# Testcase cp_fd (Test destination fd = x21)
la x2, scratch
li x3, 0x061e9980 # load x3 with value 0x061e9980
sw x3, 0(x2) # store 0x061e9980 in memory
flh f28, 0(x2) # load 0x061e9980 from memory into f28
la x2, scratch
li x3, 0xb8da7a09 # load x3 with value 0xb8da7a09
sw x3, 0(x2) # store 0xb8da7a09 in memory
flh f17, 0(x2) # load 0xb8da7a09 from memory into f17
fsgnj.h f21, f28, f17 # perform operation

# Testcase cp_fd (Test destination fd = x22)
la x2, scratch
li x3, 0x04095cdb # load x3 with value 0x04095cdb
sw x3, 0(x2) # store 0x04095cdb in memory
flh f23, 0(x2) # load 0x04095cdb from memory into f23
la x2, scratch
li x3, 0xb70dfd0d # load x3 with value 0xb70dfd0d
sw x3, 0(x2) # store 0xb70dfd0d in memory
flh f6, 0(x2) # load 0xb70dfd0d from memory into f6
fsgnj.h f22, f23, f6 # perform operation

# Testcase cp_fd (Test destination fd = x23)
la x2, scratch
li x3, 0xc8350059 # load x3 with value 0xc8350059
sw x3, 0(x2) # store 0xc8350059 in memory
flh f26, 0(x2) # load 0xc8350059 from memory into f26
la x2, scratch
li x3, 0x977d6dd1 # load x3 with value 0x977d6dd1
sw x3, 0(x2) # store 0x977d6dd1 in memory
flh f9, 0(x2) # load 0x977d6dd1 from memory into f9
fsgnj.h f23, f26, f9 # perform operation

# Testcase cp_fd (Test destination fd = x24)
la x2, scratch
li x3, 0xd448fa7c # load x3 with value 0xd448fa7c
sw x3, 0(x2) # store 0xd448fa7c in memory
flh f17, 0(x2) # load 0xd448fa7c from memory into f17
la x2, scratch
li x3, 0x544cbfb2 # load x3 with value 0x544cbfb2
sw x3, 0(x2) # store 0x544cbfb2 in memory
flh f14, 0(x2) # load 0x544cbfb2 from memory into f14
fsgnj.h f24, f17, f14 # perform operation

# Testcase cp_fd (Test destination fd = x25)
la x2, scratch
li x3, 0x3875d393 # load x3 with value 0x3875d393
sw x3, 0(x2) # store 0x3875d393 in memory
flh f12, 0(x2) # load 0x3875d393 from memory into f12
la x2, scratch
li x3, 0xc674e6ee # load x3 with value 0xc674e6ee
sw x3, 0(x2) # store 0xc674e6ee in memory
flh f3, 0(x2) # load 0xc674e6ee from memory into f3
fsgnj.h f25, f12, f3 # perform operation

# Testcase cp_fd (Test destination fd = x26)
la x2, scratch
li x3, 0x3ad422fa # load x3 with value 0x3ad422fa
sw x3, 0(x2) # store 0x3ad422fa in memory
flh f25, 0(x2) # load 0x3ad422fa from memory into f25
la x2, scratch
li x3, 0xebd1bb84 # load x3 with value 0xebd1bb84
sw x3, 0(x2) # store 0xebd1bb84 in memory
flh f7, 0(x2) # load 0xebd1bb84 from memory into f7
fsgnj.h f26, f25, f7 # perform operation

# Testcase cp_fd (Test destination fd = x27)
la x2, scratch
li x3, 0xf25186a7 # load x3 with value 0xf25186a7
sw x3, 0(x2) # store 0xf25186a7 in memory
flh f9, 0(x2) # load 0xf25186a7 from memory into f9
la x2, scratch
li x3, 0xd24c8908 # load x3 with value 0xd24c8908
sw x3, 0(x2) # store 0xd24c8908 in memory
flh f26, 0(x2) # load 0xd24c8908 from memory into f26
fsgnj.h f27, f9, f26 # perform operation

# Testcase cp_fd (Test destination fd = x28)
la x2, scratch
li x3, 0xe893ded2 # load x3 with value 0xe893ded2
sw x3, 0(x2) # store 0xe893ded2 in memory
flh f29, 0(x2) # load 0xe893ded2 from memory into f29
la x2, scratch
li x3, 0xdb9b9ad3 # load x3 with value 0xdb9b9ad3
sw x3, 0(x2) # store 0xdb9b9ad3 in memory
flh f25, 0(x2) # load 0xdb9b9ad3 from memory into f25
fsgnj.h f28, f29, f25 # perform operation

# Testcase cp_fd (Test destination fd = x29)
la x2, scratch
li x3, 0xa4a0739f # load x3 with value 0xa4a0739f
sw x3, 0(x2) # store 0xa4a0739f in memory
flh f27, 0(x2) # load 0xa4a0739f from memory into f27
la x2, scratch
li x3, 0x9a6eb25e # load x3 with value 0x9a6eb25e
sw x3, 0(x2) # store 0x9a6eb25e in memory
flh f7, 0(x2) # load 0x9a6eb25e from memory into f7
fsgnj.h f29, f27, f7 # perform operation

# Testcase cp_fd (Test destination fd = x30)
la x2, scratch
li x3, 0x7c415e3e # load x3 with value 0x7c415e3e
sw x3, 0(x2) # store 0x7c415e3e in memory
flh f5, 0(x2) # load 0x7c415e3e from memory into f5
la x2, scratch
li x3, 0x68a44af2 # load x3 with value 0x68a44af2
sw x3, 0(x2) # store 0x68a44af2 in memory
flh f16, 0(x2) # load 0x68a44af2 from memory into f16
fsgnj.h f30, f5, f16 # perform operation

# Testcase cp_fd (Test destination fd = x31)
la x2, scratch
li x3, 0xb6c94b85 # load x3 with value 0xb6c94b85
sw x3, 0(x2) # store 0xb6c94b85 in memory
flh f12, 0(x2) # load 0xb6c94b85 from memory into f12
la x2, scratch
li x3, 0x935b5843 # load x3 with value 0x935b5843
sw x3, 0(x2) # store 0x935b5843 in memory
flh f26, 0(x2) # load 0x935b5843 from memory into f26
fsgnj.h f31, f12, f26 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f13, 0(x2) # load 0x00000000 from memory into f13
la x2, scratch
li x3, 0x0639a1a2 # load x3 with value 0x0639a1a2
sw x3, 0(x2) # store 0x0639a1a2 in memory
flh f23, 0(x2) # load 0x0639a1a2 from memory into f23
fsgnj.h f3, f13, f23 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f27, 0(x2) # load 0x00008000 from memory into f27
la x2, scratch
li x3, 0x368cc025 # load x3 with value 0x368cc025
sw x3, 0(x2) # store 0x368cc025 in memory
flh f1, 0(x2) # load 0x368cc025 from memory into f1
fsgnj.h f23, f27, f1 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f1, 0(x2) # load 0x00003c00 from memory into f1
la x2, scratch
li x3, 0x7f31d8ad # load x3 with value 0x7f31d8ad
sw x3, 0(x2) # store 0x7f31d8ad in memory
flh f14, 0(x2) # load 0x7f31d8ad from memory into f14
fsgnj.h f2, f1, f14 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f19, 0(x2) # load 0x0000bc00 from memory into f19
la x2, scratch
li x3, 0xfe89bfd6 # load x3 with value 0xfe89bfd6
sw x3, 0(x2) # store 0xfe89bfd6 in memory
flh f1, 0(x2) # load 0xfe89bfd6 from memory into f1
fsgnj.h f3, f19, f1 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f27, 0(x2) # load 0x00003e00 from memory into f27
la x2, scratch
li x3, 0x8fb954fe # load x3 with value 0x8fb954fe
sw x3, 0(x2) # store 0x8fb954fe in memory
flh f3, 0(x2) # load 0x8fb954fe from memory into f3
fsgnj.h f2, f27, f3 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f17, 0(x2) # load 0x0000be00 from memory into f17
la x2, scratch
li x3, 0xccfd894e # load x3 with value 0xccfd894e
sw x3, 0(x2) # store 0xccfd894e in memory
flh f20, 0(x2) # load 0xccfd894e from memory into f20
fsgnj.h f16, f17, f20 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f1, 0(x2) # load 0x00004000 from memory into f1
la x2, scratch
li x3, 0xdbaf77ae # load x3 with value 0xdbaf77ae
sw x3, 0(x2) # store 0xdbaf77ae in memory
flh f19, 0(x2) # load 0xdbaf77ae from memory into f19
fsgnj.h f30, f1, f19 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f19, 0(x2) # load 0x0000c000 from memory into f19
la x2, scratch
li x3, 0x24bbaf18 # load x3 with value 0x24bbaf18
sw x3, 0(x2) # store 0x24bbaf18 in memory
flh f22, 0(x2) # load 0x24bbaf18 from memory into f22
fsgnj.h f5, f19, f22 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f11, 0(x2) # load 0x00000400 from memory into f11
la x2, scratch
li x3, 0x2369f48d # load x3 with value 0x2369f48d
sw x3, 0(x2) # store 0x2369f48d in memory
flh f29, 0(x2) # load 0x2369f48d from memory into f29
fsgnj.h f1, f11, f29 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f30, 0(x2) # load 0x00008400 from memory into f30
la x2, scratch
li x3, 0xec76a4bb # load x3 with value 0xec76a4bb
sw x3, 0(x2) # store 0xec76a4bb in memory
flh f8, 0(x2) # load 0xec76a4bb from memory into f8
fsgnj.h f9, f30, f8 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f14, 0(x2) # load 0x00007bff from memory into f14
la x2, scratch
li x3, 0xe59be33f # load x3 with value 0xe59be33f
sw x3, 0(x2) # store 0xe59be33f in memory
flh f20, 0(x2) # load 0xe59be33f from memory into f20
fsgnj.h f15, f14, f20 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f1, 0(x2) # load 0x0000fbff from memory into f1
la x2, scratch
li x3, 0x22a54c36 # load x3 with value 0x22a54c36
sw x3, 0(x2) # store 0x22a54c36 in memory
flh f23, 0(x2) # load 0x22a54c36 from memory into f23
fsgnj.h f24, f1, f23 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f6, 0(x2) # load 0x000003ff from memory into f6
la x2, scratch
li x3, 0x8938e76c # load x3 with value 0x8938e76c
sw x3, 0(x2) # store 0x8938e76c in memory
flh f26, 0(x2) # load 0x8938e76c from memory into f26
fsgnj.h f23, f6, f26 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f24, 0(x2) # load 0x000083ff from memory into f24
la x2, scratch
li x3, 0x401a4962 # load x3 with value 0x401a4962
sw x3, 0(x2) # store 0x401a4962 in memory
flh f19, 0(x2) # load 0x401a4962 from memory into f19
fsgnj.h f29, f24, f19 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f28, 0(x2) # load 0x00000200 from memory into f28
la x2, scratch
li x3, 0xd6ef6db3 # load x3 with value 0xd6ef6db3
sw x3, 0(x2) # store 0xd6ef6db3 in memory
flh f25, 0(x2) # load 0xd6ef6db3 from memory into f25
fsgnj.h f29, f28, f25 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f25, 0(x2) # load 0x00008200 from memory into f25
la x2, scratch
li x3, 0x037dcb58 # load x3 with value 0x037dcb58
sw x3, 0(x2) # store 0x037dcb58 in memory
flh f27, 0(x2) # load 0x037dcb58 from memory into f27
fsgnj.h f15, f25, f27 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f17, 0(x2) # load 0x00000001 from memory into f17
la x2, scratch
li x3, 0x52a2309a # load x3 with value 0x52a2309a
sw x3, 0(x2) # store 0x52a2309a in memory
flh f15, 0(x2) # load 0x52a2309a from memory into f15
fsgnj.h f22, f17, f15 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f25, 0(x2) # load 0x00008001 from memory into f25
la x2, scratch
li x3, 0x69169e7b # load x3 with value 0x69169e7b
sw x3, 0(x2) # store 0x69169e7b in memory
flh f19, 0(x2) # load 0x69169e7b from memory into f19
fsgnj.h f8, f25, f19 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f29, 0(x2) # load 0x00007c00 from memory into f29
la x2, scratch
li x3, 0xd772afd7 # load x3 with value 0xd772afd7
sw x3, 0(x2) # store 0xd772afd7 in memory
flh f9, 0(x2) # load 0xd772afd7 from memory into f9
fsgnj.h f2, f29, f9 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f25, 0(x2) # load 0x0000fc00 from memory into f25
la x2, scratch
li x3, 0x7366e362 # load x3 with value 0x7366e362
sw x3, 0(x2) # store 0x7366e362 in memory
flh f29, 0(x2) # load 0x7366e362 from memory into f29
fsgnj.h f28, f25, f29 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f9, 0(x2) # load 0x00007e00 from memory into f9
la x2, scratch
li x3, 0x5da60d08 # load x3 with value 0x5da60d08
sw x3, 0(x2) # store 0x5da60d08 in memory
flh f24, 0(x2) # load 0x5da60d08 from memory into f24
fsgnj.h f2, f9, f24 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f17, 0(x2) # load 0x00007fff from memory into f17
la x2, scratch
li x3, 0xa2de1e8e # load x3 with value 0xa2de1e8e
sw x3, 0(x2) # store 0xa2de1e8e in memory
flh f15, 0(x2) # load 0xa2de1e8e from memory into f15
fsgnj.h f1, f17, f15 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f12, 0(x2) # load 0x0000fe00 from memory into f12
la x2, scratch
li x3, 0xbc3bfe9e # load x3 with value 0xbc3bfe9e
sw x3, 0(x2) # store 0xbc3bfe9e in memory
flh f19, 0(x2) # load 0xbc3bfe9e from memory into f19
fsgnj.h f9, f12, f19 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f25, 0(x2) # load 0x00007c01 from memory into f25
la x2, scratch
li x3, 0x1af110cc # load x3 with value 0x1af110cc
sw x3, 0(x2) # store 0x1af110cc in memory
flh f23, 0(x2) # load 0x1af110cc from memory into f23
fsgnj.h f11, f25, f23 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f26, 0(x2) # load 0x00007dff from memory into f26
la x2, scratch
li x3, 0x5f98aec8 # load x3 with value 0x5f98aec8
sw x3, 0(x2) # store 0x5f98aec8 in memory
flh f29, 0(x2) # load 0x5f98aec8 from memory into f29
fsgnj.h f5, f26, f29 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f3, 0(x2) # load 0x0000fc01 from memory into f3
la x2, scratch
li x3, 0x49d79a8d # load x3 with value 0x49d79a8d
sw x3, 0(x2) # store 0x49d79a8d in memory
flh f17, 0(x2) # load 0x49d79a8d from memory into f17
fsgnj.h f24, f3, f17 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f14, 0(x2) # load 0x000058b4 from memory into f14
la x2, scratch
li x3, 0xa8b5021b # load x3 with value 0xa8b5021b
sw x3, 0(x2) # store 0xa8b5021b in memory
flh f30, 0(x2) # load 0xa8b5021b from memory into f30
fsgnj.h f21, f14, f30 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f13, 0(x2) # load 0x0000c93a from memory into f13
la x2, scratch
li x3, 0xee30320a # load x3 with value 0xee30320a
sw x3, 0(x2) # store 0xee30320a in memory
flh f11, 0(x2) # load 0xee30320a from memory into f11
fsgnj.h f2, f13, f11 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x0)
la x2, scratch
li x3, 0xcbcd428a # load x3 with value 0xcbcd428a
sw x3, 0(x2) # store 0xcbcd428a in memory
flh f20, 0(x2) # load 0xcbcd428a from memory into f20
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f26, 0(x2) # load 0x00000000 from memory into f26
fsgnj.h f29, f20, f26 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x8000)
la x2, scratch
li x3, 0x750c28a8 # load x3 with value 0x750c28a8
sw x3, 0(x2) # store 0x750c28a8 in memory
flh f23, 0(x2) # load 0x750c28a8 from memory into f23
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f14, 0(x2) # load 0x00008000 from memory into f14
fsgnj.h f28, f23, f14 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x3c00)
la x2, scratch
li x3, 0x2560778b # load x3 with value 0x2560778b
sw x3, 0(x2) # store 0x2560778b in memory
flh f3, 0(x2) # load 0x2560778b from memory into f3
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f31, 0(x2) # load 0x00003c00 from memory into f31
fsgnj.h f1, f3, f31 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xbc00)
la x2, scratch
li x3, 0x661ae0b7 # load x3 with value 0x661ae0b7
sw x3, 0(x2) # store 0x661ae0b7 in memory
flh f22, 0(x2) # load 0x661ae0b7 from memory into f22
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f5, 0(x2) # load 0x0000bc00 from memory into f5
fsgnj.h f20, f22, f5 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x3e00)
la x2, scratch
li x3, 0x8b575c39 # load x3 with value 0x8b575c39
sw x3, 0(x2) # store 0x8b575c39 in memory
flh f1, 0(x2) # load 0x8b575c39 from memory into f1
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f11, 0(x2) # load 0x00003e00 from memory into f11
fsgnj.h f24, f1, f11 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xbe00)
la x2, scratch
li x3, 0x4ee12b43 # load x3 with value 0x4ee12b43
sw x3, 0(x2) # store 0x4ee12b43 in memory
flh f24, 0(x2) # load 0x4ee12b43 from memory into f24
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f7, 0(x2) # load 0x0000be00 from memory into f7
fsgnj.h f16, f24, f7 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x4000)
la x2, scratch
li x3, 0x2013e347 # load x3 with value 0x2013e347
sw x3, 0(x2) # store 0x2013e347 in memory
flh f26, 0(x2) # load 0x2013e347 from memory into f26
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
fsgnj.h f1, f26, f21 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xc000)
la x2, scratch
li x3, 0x9dee340a # load x3 with value 0x9dee340a
sw x3, 0(x2) # store 0x9dee340a in memory
flh f29, 0(x2) # load 0x9dee340a from memory into f29
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f20, 0(x2) # load 0x0000c000 from memory into f20
fsgnj.h f28, f29, f20 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x400)
la x2, scratch
li x3, 0xa69a97ef # load x3 with value 0xa69a97ef
sw x3, 0(x2) # store 0xa69a97ef in memory
flh f10, 0(x2) # load 0xa69a97ef from memory into f10
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f23, 0(x2) # load 0x00000400 from memory into f23
fsgnj.h f3, f10, f23 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x8400)
la x2, scratch
li x3, 0x9299e80f # load x3 with value 0x9299e80f
sw x3, 0(x2) # store 0x9299e80f in memory
flh f20, 0(x2) # load 0x9299e80f from memory into f20
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f31, 0(x2) # load 0x00008400 from memory into f31
fsgnj.h f27, f20, f31 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7bff)
la x2, scratch
li x3, 0xb8b0dd5d # load x3 with value 0xb8b0dd5d
sw x3, 0(x2) # store 0xb8b0dd5d in memory
flh f1, 0(x2) # load 0xb8b0dd5d from memory into f1
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f3, 0(x2) # load 0x00007bff from memory into f3
fsgnj.h f13, f1, f3 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfbff)
la x2, scratch
li x3, 0x9a29fb05 # load x3 with value 0x9a29fb05
sw x3, 0(x2) # store 0x9a29fb05 in memory
flh f1, 0(x2) # load 0x9a29fb05 from memory into f1
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f23, 0(x2) # load 0x0000fbff from memory into f23
fsgnj.h f29, f1, f23 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x3ff)
la x2, scratch
li x3, 0x98d5a827 # load x3 with value 0x98d5a827
sw x3, 0(x2) # store 0x98d5a827 in memory
flh f3, 0(x2) # load 0x98d5a827 from memory into f3
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f11, 0(x2) # load 0x000003ff from memory into f11
fsgnj.h f15, f3, f11 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x83ff)
la x2, scratch
li x3, 0xb42b13e1 # load x3 with value 0xb42b13e1
sw x3, 0(x2) # store 0xb42b13e1 in memory
flh f13, 0(x2) # load 0xb42b13e1 from memory into f13
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f20, 0(x2) # load 0x000083ff from memory into f20
fsgnj.h f19, f13, f20 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x200)
la x2, scratch
li x3, 0xc710bfac # load x3 with value 0xc710bfac
sw x3, 0(x2) # store 0xc710bfac in memory
flh f12, 0(x2) # load 0xc710bfac from memory into f12
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f22, 0(x2) # load 0x00000200 from memory into f22
fsgnj.h f29, f12, f22 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x8200)
la x2, scratch
li x3, 0x24c3e24c # load x3 with value 0x24c3e24c
sw x3, 0(x2) # store 0x24c3e24c in memory
flh f3, 0(x2) # load 0x24c3e24c from memory into f3
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f12, 0(x2) # load 0x00008200 from memory into f12
fsgnj.h f31, f3, f12 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x1)
la x2, scratch
li x3, 0x3487fcb3 # load x3 with value 0x3487fcb3
sw x3, 0(x2) # store 0x3487fcb3 in memory
flh f12, 0(x2) # load 0x3487fcb3 from memory into f12
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f18, 0(x2) # load 0x00000001 from memory into f18
fsgnj.h f6, f12, f18 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x8001)
la x2, scratch
li x3, 0x481e925b # load x3 with value 0x481e925b
sw x3, 0(x2) # store 0x481e925b in memory
flh f2, 0(x2) # load 0x481e925b from memory into f2
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f14, 0(x2) # load 0x00008001 from memory into f14
fsgnj.h f11, f2, f14 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7c00)
la x2, scratch
li x3, 0x99f68509 # load x3 with value 0x99f68509
sw x3, 0(x2) # store 0x99f68509 in memory
flh f6, 0(x2) # load 0x99f68509 from memory into f6
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f24, 0(x2) # load 0x00007c00 from memory into f24
fsgnj.h f22, f6, f24 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfc00)
la x2, scratch
li x3, 0xb6cb7741 # load x3 with value 0xb6cb7741
sw x3, 0(x2) # store 0xb6cb7741 in memory
flh f16, 0(x2) # load 0xb6cb7741 from memory into f16
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f19, 0(x2) # load 0x0000fc00 from memory into f19
fsgnj.h f7, f16, f19 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7e00)
la x2, scratch
li x3, 0x8e730cd2 # load x3 with value 0x8e730cd2
sw x3, 0(x2) # store 0x8e730cd2 in memory
flh f5, 0(x2) # load 0x8e730cd2 from memory into f5
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f3, 0(x2) # load 0x00007e00 from memory into f3
fsgnj.h f1, f5, f3 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7fff)
la x2, scratch
li x3, 0x4612e065 # load x3 with value 0x4612e065
sw x3, 0(x2) # store 0x4612e065 in memory
flh f8, 0(x2) # load 0x4612e065 from memory into f8
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f31, 0(x2) # load 0x00007fff from memory into f31
fsgnj.h f12, f8, f31 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfe00)
la x2, scratch
li x3, 0x35b724a9 # load x3 with value 0x35b724a9
sw x3, 0(x2) # store 0x35b724a9 in memory
flh f22, 0(x2) # load 0x35b724a9 from memory into f22
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f11, 0(x2) # load 0x0000fe00 from memory into f11
fsgnj.h f2, f22, f11 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7c01)
la x2, scratch
li x3, 0x6daf43fa # load x3 with value 0x6daf43fa
sw x3, 0(x2) # store 0x6daf43fa in memory
flh f20, 0(x2) # load 0x6daf43fa from memory into f20
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f25, 0(x2) # load 0x00007c01 from memory into f25
fsgnj.h f17, f20, f25 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7dff)
la x2, scratch
li x3, 0xb856dd36 # load x3 with value 0xb856dd36
sw x3, 0(x2) # store 0xb856dd36 in memory
flh f14, 0(x2) # load 0xb856dd36 from memory into f14
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f27, 0(x2) # load 0x00007dff from memory into f27
fsgnj.h f22, f14, f27 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfc01)
la x2, scratch
li x3, 0xd1fc76a2 # load x3 with value 0xd1fc76a2
sw x3, 0(x2) # store 0xd1fc76a2 in memory
flh f11, 0(x2) # load 0xd1fc76a2 from memory into f11
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f1, 0(x2) # load 0x0000fc01 from memory into f1
fsgnj.h f30, f11, f1 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x58b4)
la x2, scratch
li x3, 0x4a82e128 # load x3 with value 0x4a82e128
sw x3, 0(x2) # store 0x4a82e128 in memory
flh f12, 0(x2) # load 0x4a82e128 from memory into f12
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f23, 0(x2) # load 0x000058b4 from memory into f23
fsgnj.h f21, f12, f23 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xc93a)
la x2, scratch
li x3, 0x2faaad2e # load x3 with value 0x2faaad2e
sw x3, 0(x2) # store 0x2faaad2e in memory
flh f5, 0(x2) # load 0x2faaad2e from memory into f5
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f29, 0(x2) # load 0x0000c93a from memory into f29
fsgnj.h f27, f5, f29 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f0)
la x2, scratch
li x3, 0xcb61c887 # load x3 with value 0xcb61c887
sw x3, 0(x2) # store 0xcb61c887 in memory
flh f0, 0(x2) # load 0xcb61c887 from memory into f0
la x2, scratch
li x3, 0xea5f0e54 # load x3 with value 0xea5f0e54
sw x3, 0(x2) # store 0xea5f0e54 in memory
flh f18, 0(x2) # load 0xea5f0e54 from memory into f18
fsgnj.h f0, f0, f18 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f1)
la x2, scratch
li x3, 0x016aeaa4 # load x3 with value 0x016aeaa4
sw x3, 0(x2) # store 0x016aeaa4 in memory
flh f1, 0(x2) # load 0x016aeaa4 from memory into f1
la x2, scratch
li x3, 0x67418ffa # load x3 with value 0x67418ffa
sw x3, 0(x2) # store 0x67418ffa in memory
flh f31, 0(x2) # load 0x67418ffa from memory into f31
fsgnj.h f1, f1, f31 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f2)
la x2, scratch
li x3, 0x8d88491c # load x3 with value 0x8d88491c
sw x3, 0(x2) # store 0x8d88491c in memory
flh f2, 0(x2) # load 0x8d88491c from memory into f2
la x2, scratch
li x3, 0x2827beb0 # load x3 with value 0x2827beb0
sw x3, 0(x2) # store 0x2827beb0 in memory
flh f18, 0(x2) # load 0x2827beb0 from memory into f18
fsgnj.h f2, f2, f18 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f3)
la x2, scratch
li x3, 0xfd05f538 # load x3 with value 0xfd05f538
sw x3, 0(x2) # store 0xfd05f538 in memory
flh f3, 0(x2) # load 0xfd05f538 from memory into f3
la x2, scratch
li x3, 0xf1b526bc # load x3 with value 0xf1b526bc
sw x3, 0(x2) # store 0xf1b526bc in memory
flh f2, 0(x2) # load 0xf1b526bc from memory into f2
fsgnj.h f3, f3, f2 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x665fc6b3 # load x3 with value 0x665fc6b3
sw x3, 0(x2) # store 0x665fc6b3 in memory
flh f4, 0(x2) # load 0x665fc6b3 from memory into f4
la x2, scratch
li x3, 0x8dead4a6 # load x3 with value 0x8dead4a6
sw x3, 0(x2) # store 0x8dead4a6 in memory
flh f30, 0(x2) # load 0x8dead4a6 from memory into f30
fsgnj.h f4, f4, f30 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xe8e02bd0 # load x3 with value 0xe8e02bd0
sw x3, 0(x2) # store 0xe8e02bd0 in memory
flh f5, 0(x2) # load 0xe8e02bd0 from memory into f5
la x2, scratch
li x3, 0xf407cd04 # load x3 with value 0xf407cd04
sw x3, 0(x2) # store 0xf407cd04 in memory
flh f31, 0(x2) # load 0xf407cd04 from memory into f31
fsgnj.h f5, f5, f31 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x197e5907 # load x3 with value 0x197e5907
sw x3, 0(x2) # store 0x197e5907 in memory
flh f6, 0(x2) # load 0x197e5907 from memory into f6
la x2, scratch
li x3, 0xde317af1 # load x3 with value 0xde317af1
sw x3, 0(x2) # store 0xde317af1 in memory
flh f26, 0(x2) # load 0xde317af1 from memory into f26
fsgnj.h f6, f6, f26 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x0fd8248c # load x3 with value 0x0fd8248c
sw x3, 0(x2) # store 0x0fd8248c in memory
flh f7, 0(x2) # load 0x0fd8248c from memory into f7
la x2, scratch
li x3, 0x153097ae # load x3 with value 0x153097ae
sw x3, 0(x2) # store 0x153097ae in memory
flh f24, 0(x2) # load 0x153097ae from memory into f24
fsgnj.h f7, f7, f24 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f8)
la x2, scratch
li x3, 0x2ecaf63a # load x3 with value 0x2ecaf63a
sw x3, 0(x2) # store 0x2ecaf63a in memory
flh f8, 0(x2) # load 0x2ecaf63a from memory into f8
la x2, scratch
li x3, 0xf950ad9f # load x3 with value 0xf950ad9f
sw x3, 0(x2) # store 0xf950ad9f in memory
flh f11, 0(x2) # load 0xf950ad9f from memory into f11
fsgnj.h f8, f8, f11 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f9)
la x2, scratch
li x3, 0x94b73136 # load x3 with value 0x94b73136
sw x3, 0(x2) # store 0x94b73136 in memory
flh f9, 0(x2) # load 0x94b73136 from memory into f9
la x2, scratch
li x3, 0xc1c79952 # load x3 with value 0xc1c79952
sw x3, 0(x2) # store 0xc1c79952 in memory
flh f26, 0(x2) # load 0xc1c79952 from memory into f26
fsgnj.h f9, f9, f26 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f10)
la x2, scratch
li x3, 0x74323b99 # load x3 with value 0x74323b99
sw x3, 0(x2) # store 0x74323b99 in memory
flh f10, 0(x2) # load 0x74323b99 from memory into f10
la x2, scratch
li x3, 0x99eb3c75 # load x3 with value 0x99eb3c75
sw x3, 0(x2) # store 0x99eb3c75 in memory
flh f16, 0(x2) # load 0x99eb3c75 from memory into f16
fsgnj.h f10, f10, f16 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f11)
la x2, scratch
li x3, 0x5e5586ae # load x3 with value 0x5e5586ae
sw x3, 0(x2) # store 0x5e5586ae in memory
flh f11, 0(x2) # load 0x5e5586ae from memory into f11
la x2, scratch
li x3, 0x38e7916a # load x3 with value 0x38e7916a
sw x3, 0(x2) # store 0x38e7916a in memory
flh f19, 0(x2) # load 0x38e7916a from memory into f19
fsgnj.h f11, f11, f19 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f12)
la x2, scratch
li x3, 0x24fa9661 # load x3 with value 0x24fa9661
sw x3, 0(x2) # store 0x24fa9661 in memory
flh f12, 0(x2) # load 0x24fa9661 from memory into f12
la x2, scratch
li x3, 0x0849571d # load x3 with value 0x0849571d
sw x3, 0(x2) # store 0x0849571d in memory
flh f31, 0(x2) # load 0x0849571d from memory into f31
fsgnj.h f12, f12, f31 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f13)
la x2, scratch
li x3, 0xa789f07c # load x3 with value 0xa789f07c
sw x3, 0(x2) # store 0xa789f07c in memory
flh f13, 0(x2) # load 0xa789f07c from memory into f13
la x2, scratch
li x3, 0x470b0cdc # load x3 with value 0x470b0cdc
sw x3, 0(x2) # store 0x470b0cdc in memory
flh f23, 0(x2) # load 0x470b0cdc from memory into f23
fsgnj.h f13, f13, f23 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f14)
la x2, scratch
li x3, 0xbc9462fd # load x3 with value 0xbc9462fd
sw x3, 0(x2) # store 0xbc9462fd in memory
flh f14, 0(x2) # load 0xbc9462fd from memory into f14
la x2, scratch
li x3, 0xa65af9df # load x3 with value 0xa65af9df
sw x3, 0(x2) # store 0xa65af9df in memory
flh f29, 0(x2) # load 0xa65af9df from memory into f29
fsgnj.h f14, f14, f29 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f15)
la x2, scratch
li x3, 0x098f9b76 # load x3 with value 0x098f9b76
sw x3, 0(x2) # store 0x098f9b76 in memory
flh f15, 0(x2) # load 0x098f9b76 from memory into f15
la x2, scratch
li x3, 0x6e06a028 # load x3 with value 0x6e06a028
sw x3, 0(x2) # store 0x6e06a028 in memory
flh f25, 0(x2) # load 0x6e06a028 from memory into f25
fsgnj.h f15, f15, f25 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f16)
la x2, scratch
li x3, 0xd5bd912e # load x3 with value 0xd5bd912e
sw x3, 0(x2) # store 0xd5bd912e in memory
flh f16, 0(x2) # load 0xd5bd912e from memory into f16
la x2, scratch
li x3, 0xb3c0ad86 # load x3 with value 0xb3c0ad86
sw x3, 0(x2) # store 0xb3c0ad86 in memory
flh f14, 0(x2) # load 0xb3c0ad86 from memory into f14
fsgnj.h f16, f16, f14 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f17)
la x2, scratch
li x3, 0xf384657a # load x3 with value 0xf384657a
sw x3, 0(x2) # store 0xf384657a in memory
flh f17, 0(x2) # load 0xf384657a from memory into f17
la x2, scratch
li x3, 0x451566e0 # load x3 with value 0x451566e0
sw x3, 0(x2) # store 0x451566e0 in memory
flh f7, 0(x2) # load 0x451566e0 from memory into f7
fsgnj.h f17, f17, f7 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f18)
la x2, scratch
li x3, 0x9d590274 # load x3 with value 0x9d590274
sw x3, 0(x2) # store 0x9d590274 in memory
flh f18, 0(x2) # load 0x9d590274 from memory into f18
la x2, scratch
li x3, 0x02b39c9a # load x3 with value 0x02b39c9a
sw x3, 0(x2) # store 0x02b39c9a in memory
flh f27, 0(x2) # load 0x02b39c9a from memory into f27
fsgnj.h f18, f18, f27 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f19)
la x2, scratch
li x3, 0xaede597f # load x3 with value 0xaede597f
sw x3, 0(x2) # store 0xaede597f in memory
flh f19, 0(x2) # load 0xaede597f from memory into f19
la x2, scratch
li x3, 0xb0fd622a # load x3 with value 0xb0fd622a
sw x3, 0(x2) # store 0xb0fd622a in memory
flh f23, 0(x2) # load 0xb0fd622a from memory into f23
fsgnj.h f19, f19, f23 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f20)
la x2, scratch
li x3, 0x44a6e5ef # load x3 with value 0x44a6e5ef
sw x3, 0(x2) # store 0x44a6e5ef in memory
flh f20, 0(x2) # load 0x44a6e5ef from memory into f20
la x2, scratch
li x3, 0x93bcf0aa # load x3 with value 0x93bcf0aa
sw x3, 0(x2) # store 0x93bcf0aa in memory
flh f11, 0(x2) # load 0x93bcf0aa from memory into f11
fsgnj.h f20, f20, f11 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f21)
la x2, scratch
li x3, 0xb732b0fc # load x3 with value 0xb732b0fc
sw x3, 0(x2) # store 0xb732b0fc in memory
flh f21, 0(x2) # load 0xb732b0fc from memory into f21
la x2, scratch
li x3, 0xbf815054 # load x3 with value 0xbf815054
sw x3, 0(x2) # store 0xbf815054 in memory
flh f30, 0(x2) # load 0xbf815054 from memory into f30
fsgnj.h f21, f21, f30 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f22)
la x2, scratch
li x3, 0x53c106fe # load x3 with value 0x53c106fe
sw x3, 0(x2) # store 0x53c106fe in memory
flh f22, 0(x2) # load 0x53c106fe from memory into f22
la x2, scratch
li x3, 0x9b07f087 # load x3 with value 0x9b07f087
sw x3, 0(x2) # store 0x9b07f087 in memory
flh f6, 0(x2) # load 0x9b07f087 from memory into f6
fsgnj.h f22, f22, f6 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f23)
la x2, scratch
li x3, 0x3f692415 # load x3 with value 0x3f692415
sw x3, 0(x2) # store 0x3f692415 in memory
flh f23, 0(x2) # load 0x3f692415 from memory into f23
la x2, scratch
li x3, 0x92453a82 # load x3 with value 0x92453a82
sw x3, 0(x2) # store 0x92453a82 in memory
flh f14, 0(x2) # load 0x92453a82 from memory into f14
fsgnj.h f23, f23, f14 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f24)
la x2, scratch
li x3, 0x11a72747 # load x3 with value 0x11a72747
sw x3, 0(x2) # store 0x11a72747 in memory
flh f24, 0(x2) # load 0x11a72747 from memory into f24
la x2, scratch
li x3, 0x99889e3f # load x3 with value 0x99889e3f
sw x3, 0(x2) # store 0x99889e3f in memory
flh f3, 0(x2) # load 0x99889e3f from memory into f3
fsgnj.h f24, f24, f3 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f25)
la x2, scratch
li x3, 0x32f3c511 # load x3 with value 0x32f3c511
sw x3, 0(x2) # store 0x32f3c511 in memory
flh f25, 0(x2) # load 0x32f3c511 from memory into f25
la x2, scratch
li x3, 0x6de6760d # load x3 with value 0x6de6760d
sw x3, 0(x2) # store 0x6de6760d in memory
flh f6, 0(x2) # load 0x6de6760d from memory into f6
fsgnj.h f25, f25, f6 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f26)
la x2, scratch
li x3, 0x0c71aa64 # load x3 with value 0x0c71aa64
sw x3, 0(x2) # store 0x0c71aa64 in memory
flh f26, 0(x2) # load 0x0c71aa64 from memory into f26
la x2, scratch
li x3, 0xface3190 # load x3 with value 0xface3190
sw x3, 0(x2) # store 0xface3190 in memory
flh f31, 0(x2) # load 0xface3190 from memory into f31
fsgnj.h f26, f26, f31 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f27)
la x2, scratch
li x3, 0xa175ebbd # load x3 with value 0xa175ebbd
sw x3, 0(x2) # store 0xa175ebbd in memory
flh f27, 0(x2) # load 0xa175ebbd from memory into f27
la x2, scratch
li x3, 0x151a2012 # load x3 with value 0x151a2012
sw x3, 0(x2) # store 0x151a2012 in memory
flh f2, 0(x2) # load 0x151a2012 from memory into f2
fsgnj.h f27, f27, f2 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f28)
la x2, scratch
li x3, 0xbac3a5c2 # load x3 with value 0xbac3a5c2
sw x3, 0(x2) # store 0xbac3a5c2 in memory
flh f28, 0(x2) # load 0xbac3a5c2 from memory into f28
la x2, scratch
li x3, 0x94abe25b # load x3 with value 0x94abe25b
sw x3, 0(x2) # store 0x94abe25b in memory
flh f13, 0(x2) # load 0x94abe25b from memory into f13
fsgnj.h f28, f28, f13 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f29)
la x2, scratch
li x3, 0x7b9000c1 # load x3 with value 0x7b9000c1
sw x3, 0(x2) # store 0x7b9000c1 in memory
flh f29, 0(x2) # load 0x7b9000c1 from memory into f29
la x2, scratch
li x3, 0x60753d03 # load x3 with value 0x60753d03
sw x3, 0(x2) # store 0x60753d03 in memory
flh f22, 0(x2) # load 0x60753d03 from memory into f22
fsgnj.h f29, f29, f22 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f30)
la x2, scratch
li x3, 0x8c167b9b # load x3 with value 0x8c167b9b
sw x3, 0(x2) # store 0x8c167b9b in memory
flh f30, 0(x2) # load 0x8c167b9b from memory into f30
la x2, scratch
li x3, 0x491dd9e7 # load x3 with value 0x491dd9e7
sw x3, 0(x2) # store 0x491dd9e7 in memory
flh f2, 0(x2) # load 0x491dd9e7 from memory into f2
fsgnj.h f30, f30, f2 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f31)
la x2, scratch
li x3, 0x396a61a1 # load x3 with value 0x396a61a1
sw x3, 0(x2) # store 0x396a61a1 in memory
flh f31, 0(x2) # load 0x396a61a1 from memory into f31
la x2, scratch
li x3, 0xd1ce5405 # load x3 with value 0xd1ce5405
sw x3, 0(x2) # store 0xd1ce5405 in memory
flh f8, 0(x2) # load 0xd1ce5405 from memory into f8
fsgnj.h f31, f31, f8 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f0)
la x2, scratch
li x3, 0xa7e58b49 # load x3 with value 0xa7e58b49
sw x3, 0(x2) # store 0xa7e58b49 in memory
flh f22, 0(x2) # load 0xa7e58b49 from memory into f22
la x2, scratch
li x3, 0xa969db83 # load x3 with value 0xa969db83
sw x3, 0(x2) # store 0xa969db83 in memory
flh f0, 0(x2) # load 0xa969db83 from memory into f0
fsgnj.h f0, f22, f0 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f1)
la x2, scratch
li x3, 0xe996e9a5 # load x3 with value 0xe996e9a5
sw x3, 0(x2) # store 0xe996e9a5 in memory
flh f8, 0(x2) # load 0xe996e9a5 from memory into f8
la x2, scratch
li x3, 0x7d9f718b # load x3 with value 0x7d9f718b
sw x3, 0(x2) # store 0x7d9f718b in memory
flh f1, 0(x2) # load 0x7d9f718b from memory into f1
fsgnj.h f1, f8, f1 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f2)
la x2, scratch
li x3, 0x0c79cc4a # load x3 with value 0x0c79cc4a
sw x3, 0(x2) # store 0x0c79cc4a in memory
flh f9, 0(x2) # load 0x0c79cc4a from memory into f9
la x2, scratch
li x3, 0x0863a89f # load x3 with value 0x0863a89f
sw x3, 0(x2) # store 0x0863a89f in memory
flh f2, 0(x2) # load 0x0863a89f from memory into f2
fsgnj.h f2, f9, f2 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f3)
la x2, scratch
li x3, 0x62e275b7 # load x3 with value 0x62e275b7
sw x3, 0(x2) # store 0x62e275b7 in memory
flh f15, 0(x2) # load 0x62e275b7 from memory into f15
la x2, scratch
li x3, 0x5f9025c3 # load x3 with value 0x5f9025c3
sw x3, 0(x2) # store 0x5f9025c3 in memory
flh f3, 0(x2) # load 0x5f9025c3 from memory into f3
fsgnj.h f3, f15, f3 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x9fdaea4e # load x3 with value 0x9fdaea4e
sw x3, 0(x2) # store 0x9fdaea4e in memory
flh f16, 0(x2) # load 0x9fdaea4e from memory into f16
la x2, scratch
li x3, 0xfabe5527 # load x3 with value 0xfabe5527
sw x3, 0(x2) # store 0xfabe5527 in memory
flh f4, 0(x2) # load 0xfabe5527 from memory into f4
fsgnj.h f4, f16, f4 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x832554a7 # load x3 with value 0x832554a7
sw x3, 0(x2) # store 0x832554a7 in memory
flh f17, 0(x2) # load 0x832554a7 from memory into f17
la x2, scratch
li x3, 0x491c5d51 # load x3 with value 0x491c5d51
sw x3, 0(x2) # store 0x491c5d51 in memory
flh f5, 0(x2) # load 0x491c5d51 from memory into f5
fsgnj.h f5, f17, f5 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x22d00712 # load x3 with value 0x22d00712
sw x3, 0(x2) # store 0x22d00712 in memory
flh f27, 0(x2) # load 0x22d00712 from memory into f27
la x2, scratch
li x3, 0x6a2c1404 # load x3 with value 0x6a2c1404
sw x3, 0(x2) # store 0x6a2c1404 in memory
flh f6, 0(x2) # load 0x6a2c1404 from memory into f6
fsgnj.h f6, f27, f6 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x205c2060 # load x3 with value 0x205c2060
sw x3, 0(x2) # store 0x205c2060 in memory
flh f2, 0(x2) # load 0x205c2060 from memory into f2
la x2, scratch
li x3, 0xc972af03 # load x3 with value 0xc972af03
sw x3, 0(x2) # store 0xc972af03 in memory
flh f7, 0(x2) # load 0xc972af03 from memory into f7
fsgnj.h f7, f2, f7 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f8)
la x2, scratch
li x3, 0x72a5d1c4 # load x3 with value 0x72a5d1c4
sw x3, 0(x2) # store 0x72a5d1c4 in memory
flh f23, 0(x2) # load 0x72a5d1c4 from memory into f23
la x2, scratch
li x3, 0xfdb53c25 # load x3 with value 0xfdb53c25
sw x3, 0(x2) # store 0xfdb53c25 in memory
flh f8, 0(x2) # load 0xfdb53c25 from memory into f8
fsgnj.h f8, f23, f8 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f9)
la x2, scratch
li x3, 0xfb28db28 # load x3 with value 0xfb28db28
sw x3, 0(x2) # store 0xfb28db28 in memory
flh f7, 0(x2) # load 0xfb28db28 from memory into f7
la x2, scratch
li x3, 0x734a9641 # load x3 with value 0x734a9641
sw x3, 0(x2) # store 0x734a9641 in memory
flh f9, 0(x2) # load 0x734a9641 from memory into f9
fsgnj.h f9, f7, f9 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f10)
la x2, scratch
li x3, 0x4d313041 # load x3 with value 0x4d313041
sw x3, 0(x2) # store 0x4d313041 in memory
flh f3, 0(x2) # load 0x4d313041 from memory into f3
la x2, scratch
li x3, 0xd8625c05 # load x3 with value 0xd8625c05
sw x3, 0(x2) # store 0xd8625c05 in memory
flh f10, 0(x2) # load 0xd8625c05 from memory into f10
fsgnj.h f10, f3, f10 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f11)
la x2, scratch
li x3, 0xa608efae # load x3 with value 0xa608efae
sw x3, 0(x2) # store 0xa608efae in memory
flh f1, 0(x2) # load 0xa608efae from memory into f1
la x2, scratch
li x3, 0x5a3eaa4c # load x3 with value 0x5a3eaa4c
sw x3, 0(x2) # store 0x5a3eaa4c in memory
flh f11, 0(x2) # load 0x5a3eaa4c from memory into f11
fsgnj.h f11, f1, f11 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f12)
la x2, scratch
li x3, 0xbb7a95b8 # load x3 with value 0xbb7a95b8
sw x3, 0(x2) # store 0xbb7a95b8 in memory
flh f17, 0(x2) # load 0xbb7a95b8 from memory into f17
la x2, scratch
li x3, 0x12dbd757 # load x3 with value 0x12dbd757
sw x3, 0(x2) # store 0x12dbd757 in memory
flh f12, 0(x2) # load 0x12dbd757 from memory into f12
fsgnj.h f12, f17, f12 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f13)
la x2, scratch
li x3, 0x5bb1d3f9 # load x3 with value 0x5bb1d3f9
sw x3, 0(x2) # store 0x5bb1d3f9 in memory
flh f3, 0(x2) # load 0x5bb1d3f9 from memory into f3
la x2, scratch
li x3, 0xd7469495 # load x3 with value 0xd7469495
sw x3, 0(x2) # store 0xd7469495 in memory
flh f13, 0(x2) # load 0xd7469495 from memory into f13
fsgnj.h f13, f3, f13 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f14)
la x2, scratch
li x3, 0x9072e4cd # load x3 with value 0x9072e4cd
sw x3, 0(x2) # store 0x9072e4cd in memory
flh f29, 0(x2) # load 0x9072e4cd from memory into f29
la x2, scratch
li x3, 0xbcbdbe86 # load x3 with value 0xbcbdbe86
sw x3, 0(x2) # store 0xbcbdbe86 in memory
flh f14, 0(x2) # load 0xbcbdbe86 from memory into f14
fsgnj.h f14, f29, f14 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f15)
la x2, scratch
li x3, 0x8ff54792 # load x3 with value 0x8ff54792
sw x3, 0(x2) # store 0x8ff54792 in memory
flh f12, 0(x2) # load 0x8ff54792 from memory into f12
la x2, scratch
li x3, 0x17353318 # load x3 with value 0x17353318
sw x3, 0(x2) # store 0x17353318 in memory
flh f15, 0(x2) # load 0x17353318 from memory into f15
fsgnj.h f15, f12, f15 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f16)
la x2, scratch
li x3, 0x2fdcc9b5 # load x3 with value 0x2fdcc9b5
sw x3, 0(x2) # store 0x2fdcc9b5 in memory
flh f29, 0(x2) # load 0x2fdcc9b5 from memory into f29
la x2, scratch
li x3, 0x7b9c4bf4 # load x3 with value 0x7b9c4bf4
sw x3, 0(x2) # store 0x7b9c4bf4 in memory
flh f16, 0(x2) # load 0x7b9c4bf4 from memory into f16
fsgnj.h f16, f29, f16 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f17)
la x2, scratch
li x3, 0xc9c656bd # load x3 with value 0xc9c656bd
sw x3, 0(x2) # store 0xc9c656bd in memory
flh f28, 0(x2) # load 0xc9c656bd from memory into f28
la x2, scratch
li x3, 0x89934c75 # load x3 with value 0x89934c75
sw x3, 0(x2) # store 0x89934c75 in memory
flh f17, 0(x2) # load 0x89934c75 from memory into f17
fsgnj.h f17, f28, f17 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f18)
la x2, scratch
li x3, 0xe0bed144 # load x3 with value 0xe0bed144
sw x3, 0(x2) # store 0xe0bed144 in memory
flh f25, 0(x2) # load 0xe0bed144 from memory into f25
la x2, scratch
li x3, 0x00bd308c # load x3 with value 0x00bd308c
sw x3, 0(x2) # store 0x00bd308c in memory
flh f18, 0(x2) # load 0x00bd308c from memory into f18
fsgnj.h f18, f25, f18 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f19)
la x2, scratch
li x3, 0xc52d2850 # load x3 with value 0xc52d2850
sw x3, 0(x2) # store 0xc52d2850 in memory
flh f2, 0(x2) # load 0xc52d2850 from memory into f2
la x2, scratch
li x3, 0x716b7dc4 # load x3 with value 0x716b7dc4
sw x3, 0(x2) # store 0x716b7dc4 in memory
flh f19, 0(x2) # load 0x716b7dc4 from memory into f19
fsgnj.h f19, f2, f19 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f20)
la x2, scratch
li x3, 0xe180f53f # load x3 with value 0xe180f53f
sw x3, 0(x2) # store 0xe180f53f in memory
flh f26, 0(x2) # load 0xe180f53f from memory into f26
la x2, scratch
li x3, 0x61d59bbb # load x3 with value 0x61d59bbb
sw x3, 0(x2) # store 0x61d59bbb in memory
flh f20, 0(x2) # load 0x61d59bbb from memory into f20
fsgnj.h f20, f26, f20 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f21)
la x2, scratch
li x3, 0x01c1d4ad # load x3 with value 0x01c1d4ad
sw x3, 0(x2) # store 0x01c1d4ad in memory
flh f14, 0(x2) # load 0x01c1d4ad from memory into f14
la x2, scratch
li x3, 0x70de793b # load x3 with value 0x70de793b
sw x3, 0(x2) # store 0x70de793b in memory
flh f21, 0(x2) # load 0x70de793b from memory into f21
fsgnj.h f21, f14, f21 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f22)
la x2, scratch
li x3, 0x0bdfe9ac # load x3 with value 0x0bdfe9ac
sw x3, 0(x2) # store 0x0bdfe9ac in memory
flh f10, 0(x2) # load 0x0bdfe9ac from memory into f10
la x2, scratch
li x3, 0x8ed2faaf # load x3 with value 0x8ed2faaf
sw x3, 0(x2) # store 0x8ed2faaf in memory
flh f22, 0(x2) # load 0x8ed2faaf from memory into f22
fsgnj.h f22, f10, f22 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f23)
la x2, scratch
li x3, 0x642e7918 # load x3 with value 0x642e7918
sw x3, 0(x2) # store 0x642e7918 in memory
flh f27, 0(x2) # load 0x642e7918 from memory into f27
la x2, scratch
li x3, 0x9ad090cb # load x3 with value 0x9ad090cb
sw x3, 0(x2) # store 0x9ad090cb in memory
flh f23, 0(x2) # load 0x9ad090cb from memory into f23
fsgnj.h f23, f27, f23 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f24)
la x2, scratch
li x3, 0x17afce82 # load x3 with value 0x17afce82
sw x3, 0(x2) # store 0x17afce82 in memory
flh f11, 0(x2) # load 0x17afce82 from memory into f11
la x2, scratch
li x3, 0xf97ab48e # load x3 with value 0xf97ab48e
sw x3, 0(x2) # store 0xf97ab48e in memory
flh f24, 0(x2) # load 0xf97ab48e from memory into f24
fsgnj.h f24, f11, f24 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f25)
la x2, scratch
li x3, 0x829f61ca # load x3 with value 0x829f61ca
sw x3, 0(x2) # store 0x829f61ca in memory
flh f2, 0(x2) # load 0x829f61ca from memory into f2
la x2, scratch
li x3, 0x99ed81a8 # load x3 with value 0x99ed81a8
sw x3, 0(x2) # store 0x99ed81a8 in memory
flh f25, 0(x2) # load 0x99ed81a8 from memory into f25
fsgnj.h f25, f2, f25 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f26)
la x2, scratch
li x3, 0xfff61e7a # load x3 with value 0xfff61e7a
sw x3, 0(x2) # store 0xfff61e7a in memory
flh f8, 0(x2) # load 0xfff61e7a from memory into f8
la x2, scratch
li x3, 0xa2de99bc # load x3 with value 0xa2de99bc
sw x3, 0(x2) # store 0xa2de99bc in memory
flh f26, 0(x2) # load 0xa2de99bc from memory into f26
fsgnj.h f26, f8, f26 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f27)
la x2, scratch
li x3, 0xb2c90621 # load x3 with value 0xb2c90621
sw x3, 0(x2) # store 0xb2c90621 in memory
flh f29, 0(x2) # load 0xb2c90621 from memory into f29
la x2, scratch
li x3, 0x919021a1 # load x3 with value 0x919021a1
sw x3, 0(x2) # store 0x919021a1 in memory
flh f27, 0(x2) # load 0x919021a1 from memory into f27
fsgnj.h f27, f29, f27 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f28)
la x2, scratch
li x3, 0xf79ab16c # load x3 with value 0xf79ab16c
sw x3, 0(x2) # store 0xf79ab16c in memory
flh f19, 0(x2) # load 0xf79ab16c from memory into f19
la x2, scratch
li x3, 0x2c0b6193 # load x3 with value 0x2c0b6193
sw x3, 0(x2) # store 0x2c0b6193 in memory
flh f28, 0(x2) # load 0x2c0b6193 from memory into f28
fsgnj.h f28, f19, f28 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f29)
la x2, scratch
li x3, 0x8baa16d2 # load x3 with value 0x8baa16d2
sw x3, 0(x2) # store 0x8baa16d2 in memory
flh f31, 0(x2) # load 0x8baa16d2 from memory into f31
la x2, scratch
li x3, 0x3e341b0c # load x3 with value 0x3e341b0c
sw x3, 0(x2) # store 0x3e341b0c in memory
flh f29, 0(x2) # load 0x3e341b0c from memory into f29
fsgnj.h f29, f31, f29 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f30)
la x2, scratch
li x3, 0xf62e8351 # load x3 with value 0xf62e8351
sw x3, 0(x2) # store 0xf62e8351 in memory
flh f2, 0(x2) # load 0xf62e8351 from memory into f2
la x2, scratch
li x3, 0x42e1f881 # load x3 with value 0x42e1f881
sw x3, 0(x2) # store 0x42e1f881 in memory
flh f30, 0(x2) # load 0x42e1f881 from memory into f30
fsgnj.h f30, f2, f30 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f31)
la x2, scratch
li x3, 0x160d9121 # load x3 with value 0x160d9121
sw x3, 0(x2) # store 0x160d9121 in memory
flh f11, 0(x2) # load 0x160d9121 from memory into f11
la x2, scratch
li x3, 0xf6a12c68 # load x3 with value 0xf6a12c68
sw x3, 0(x2) # store 0xf6a12c68 in memory
flh f31, 0(x2) # load 0xf6a12c68 from memory into f31
fsgnj.h f31, f11, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f12, 0(x2) # load 0x00000000 from memory into f12
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f29, 0(x2) # load 0x00000000 from memory into f29
fsgnj.h f3, f12, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f22, 0(x2) # load 0x00000000 from memory into f22
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f7, 0(x2) # load 0x00008000 from memory into f7
fsgnj.h f18, f22, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f19, 0(x2) # load 0x00000000 from memory into f19
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f14, 0(x2) # load 0x00003c00 from memory into f14
fsgnj.h f31, f19, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f5, 0(x2) # load 0x00000000 from memory into f5
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f18, 0(x2) # load 0x0000bc00 from memory into f18
fsgnj.h f27, f5, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f2, 0(x2) # load 0x00000000 from memory into f2
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f5, 0(x2) # load 0x00003e00 from memory into f5
fsgnj.h f25, f2, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f3, 0(x2) # load 0x00000000 from memory into f3
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f14, 0(x2) # load 0x0000be00 from memory into f14
fsgnj.h f16, f3, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f23, 0(x2) # load 0x00000000 from memory into f23
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f7, 0(x2) # load 0x00004000 from memory into f7
fsgnj.h f26, f23, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f31, 0(x2) # load 0x00000000 from memory into f31
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f19, 0(x2) # load 0x0000c000 from memory into f19
fsgnj.h f22, f31, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f28, 0(x2) # load 0x00000000 from memory into f28
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f14, 0(x2) # load 0x00000400 from memory into f14
fsgnj.h f10, f28, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f28, 0(x2) # load 0x00000000 from memory into f28
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f13, 0(x2) # load 0x00008400 from memory into f13
fsgnj.h f26, f28, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f25, 0(x2) # load 0x00000000 from memory into f25
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f28, 0(x2) # load 0x00007bff from memory into f28
fsgnj.h f30, f25, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f17, 0(x2) # load 0x00000000 from memory into f17
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f26, 0(x2) # load 0x0000fbff from memory into f26
fsgnj.h f23, f17, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f1, 0(x2) # load 0x00000000 from memory into f1
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f11, 0(x2) # load 0x000003ff from memory into f11
fsgnj.h f27, f1, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f26, 0(x2) # load 0x00000000 from memory into f26
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f15, 0(x2) # load 0x000083ff from memory into f15
fsgnj.h f24, f26, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f17, 0(x2) # load 0x00000000 from memory into f17
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f18, 0(x2) # load 0x00000200 from memory into f18
fsgnj.h f26, f17, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f2, 0(x2) # load 0x00000000 from memory into f2
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f25, 0(x2) # load 0x00008200 from memory into f25
fsgnj.h f15, f2, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f28, 0(x2) # load 0x00000000 from memory into f28
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f26, 0(x2) # load 0x00000001 from memory into f26
fsgnj.h f21, f28, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f14, 0(x2) # load 0x00000000 from memory into f14
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f26, 0(x2) # load 0x00008001 from memory into f26
fsgnj.h f19, f14, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f20, 0(x2) # load 0x00000000 from memory into f20
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f25, 0(x2) # load 0x00007c00 from memory into f25
fsgnj.h f12, f20, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f26, 0(x2) # load 0x00000000 from memory into f26
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f16, 0(x2) # load 0x0000fc00 from memory into f16
fsgnj.h f22, f26, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f27, 0(x2) # load 0x00000000 from memory into f27
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f28, 0(x2) # load 0x00007e00 from memory into f28
fsgnj.h f16, f27, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f19, 0(x2) # load 0x00000000 from memory into f19
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f18, 0(x2) # load 0x00007fff from memory into f18
fsgnj.h f5, f19, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f10, 0(x2) # load 0x00000000 from memory into f10
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f15, 0(x2) # load 0x0000fe00 from memory into f15
fsgnj.h f29, f10, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f3, 0(x2) # load 0x00000000 from memory into f3
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f24, 0(x2) # load 0x00007c01 from memory into f24
fsgnj.h f28, f3, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f11, 0(x2) # load 0x00000000 from memory into f11
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f18, 0(x2) # load 0x00007dff from memory into f18
fsgnj.h f9, f11, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f10, 0(x2) # load 0x00000000 from memory into f10
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
fsgnj.h f18, f10, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f10, 0(x2) # load 0x00000000 from memory into f10
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f3, 0(x2) # load 0x000058b4 from memory into f3
fsgnj.h f7, f10, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f19, 0(x2) # load 0x00000000 from memory into f19
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f2, 0(x2) # load 0x0000c93a from memory into f2
fsgnj.h f26, f19, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f13, 0(x2) # load 0x00008000 from memory into f13
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f29, 0(x2) # load 0x00000000 from memory into f29
fsgnj.h f28, f13, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f20, 0(x2) # load 0x00008000 from memory into f20
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f6, 0(x2) # load 0x00008000 from memory into f6
fsgnj.h f30, f20, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f14, 0(x2) # load 0x00008000 from memory into f14
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f24, 0(x2) # load 0x00003c00 from memory into f24
fsgnj.h f13, f14, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f24, 0(x2) # load 0x00008000 from memory into f24
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f29, 0(x2) # load 0x0000bc00 from memory into f29
fsgnj.h f15, f24, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f19, 0(x2) # load 0x00008000 from memory into f19
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f8, 0(x2) # load 0x00003e00 from memory into f8
fsgnj.h f16, f19, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f28, 0(x2) # load 0x00008000 from memory into f28
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f11, 0(x2) # load 0x0000be00 from memory into f11
fsgnj.h f1, f28, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f27, 0(x2) # load 0x00008000 from memory into f27
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
fsgnj.h f17, f27, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f11, 0(x2) # load 0x00008000 from memory into f11
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f29, 0(x2) # load 0x0000c000 from memory into f29
fsgnj.h f24, f11, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f17, 0(x2) # load 0x00008000 from memory into f17
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f13, 0(x2) # load 0x00000400 from memory into f13
fsgnj.h f16, f17, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f7, 0(x2) # load 0x00008000 from memory into f7
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f12, 0(x2) # load 0x00008400 from memory into f12
fsgnj.h f30, f7, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f10, 0(x2) # load 0x00008000 from memory into f10
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f22, 0(x2) # load 0x00007bff from memory into f22
fsgnj.h f28, f10, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f7, 0(x2) # load 0x00008000 from memory into f7
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f24, 0(x2) # load 0x0000fbff from memory into f24
fsgnj.h f31, f7, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f21, 0(x2) # load 0x00008000 from memory into f21
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f8, 0(x2) # load 0x000003ff from memory into f8
fsgnj.h f11, f21, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f2, 0(x2) # load 0x00008000 from memory into f2
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f5, 0(x2) # load 0x000083ff from memory into f5
fsgnj.h f19, f2, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f11, 0(x2) # load 0x00008000 from memory into f11
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f2, 0(x2) # load 0x00000200 from memory into f2
fsgnj.h f27, f11, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f28, 0(x2) # load 0x00008000 from memory into f28
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f30, 0(x2) # load 0x00008200 from memory into f30
fsgnj.h f26, f28, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f24, 0(x2) # load 0x00008000 from memory into f24
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f9, 0(x2) # load 0x00000001 from memory into f9
fsgnj.h f17, f24, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f6, 0(x2) # load 0x00008000 from memory into f6
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f22, 0(x2) # load 0x00008001 from memory into f22
fsgnj.h f14, f6, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f24, 0(x2) # load 0x00008000 from memory into f24
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f17, 0(x2) # load 0x00007c00 from memory into f17
fsgnj.h f28, f24, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f23, 0(x2) # load 0x00008000 from memory into f23
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f18, 0(x2) # load 0x0000fc00 from memory into f18
fsgnj.h f17, f23, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f18, 0(x2) # load 0x00008000 from memory into f18
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f27, 0(x2) # load 0x00007e00 from memory into f27
fsgnj.h f26, f18, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f27, 0(x2) # load 0x00008000 from memory into f27
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f18, 0(x2) # load 0x00007fff from memory into f18
fsgnj.h f8, f27, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f15, 0(x2) # load 0x00008000 from memory into f15
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f12, 0(x2) # load 0x0000fe00 from memory into f12
fsgnj.h f19, f15, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f5, 0(x2) # load 0x00008000 from memory into f5
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f29, 0(x2) # load 0x00007c01 from memory into f29
fsgnj.h f25, f5, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f30, 0(x2) # load 0x00008000 from memory into f30
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f8, 0(x2) # load 0x00007dff from memory into f8
fsgnj.h f3, f30, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f7, 0(x2) # load 0x00008000 from memory into f7
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f20, 0(x2) # load 0x0000fc01 from memory into f20
fsgnj.h f31, f7, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f6, 0(x2) # load 0x00008000 from memory into f6
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f10, 0(x2) # load 0x000058b4 from memory into f10
fsgnj.h f1, f6, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f3, 0(x2) # load 0x00008000 from memory into f3
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f18, 0(x2) # load 0x0000c93a from memory into f18
fsgnj.h f28, f3, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f20, 0(x2) # load 0x00003c00 from memory into f20
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f13, 0(x2) # load 0x00000000 from memory into f13
fsgnj.h f18, f20, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f29, 0(x2) # load 0x00003c00 from memory into f29
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f14, 0(x2) # load 0x00008000 from memory into f14
fsgnj.h f24, f29, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f7, 0(x2) # load 0x00003c00 from memory into f7
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f19, 0(x2) # load 0x00003c00 from memory into f19
fsgnj.h f22, f7, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f14, 0(x2) # load 0x00003c00 from memory into f14
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f5, 0(x2) # load 0x0000bc00 from memory into f5
fsgnj.h f8, f14, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f12, 0(x2) # load 0x00003c00 from memory into f12
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f6, 0(x2) # load 0x00003e00 from memory into f6
fsgnj.h f1, f12, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f21, 0(x2) # load 0x00003c00 from memory into f21
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f28, 0(x2) # load 0x0000be00 from memory into f28
fsgnj.h f18, f21, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f29, 0(x2) # load 0x00003c00 from memory into f29
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f7, 0(x2) # load 0x00004000 from memory into f7
fsgnj.h f3, f29, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f31, 0(x2) # load 0x00003c00 from memory into f31
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f7, 0(x2) # load 0x0000c000 from memory into f7
fsgnj.h f16, f31, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f16, 0(x2) # load 0x00003c00 from memory into f16
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f25, 0(x2) # load 0x00000400 from memory into f25
fsgnj.h f18, f16, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f7, 0(x2) # load 0x00003c00 from memory into f7
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f16, 0(x2) # load 0x00008400 from memory into f16
fsgnj.h f1, f7, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f1, 0(x2) # load 0x00003c00 from memory into f1
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f11, 0(x2) # load 0x00007bff from memory into f11
fsgnj.h f27, f1, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f15, 0(x2) # load 0x00003c00 from memory into f15
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f9, 0(x2) # load 0x0000fbff from memory into f9
fsgnj.h f17, f15, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f21, 0(x2) # load 0x00003c00 from memory into f21
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f24, 0(x2) # load 0x000003ff from memory into f24
fsgnj.h f25, f21, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f15, 0(x2) # load 0x00003c00 from memory into f15
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f11, 0(x2) # load 0x000083ff from memory into f11
fsgnj.h f6, f15, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f2, 0(x2) # load 0x00003c00 from memory into f2
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f9, 0(x2) # load 0x00000200 from memory into f9
fsgnj.h f6, f2, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f3, 0(x2) # load 0x00003c00 from memory into f3
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f13, 0(x2) # load 0x00008200 from memory into f13
fsgnj.h f31, f3, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f1, 0(x2) # load 0x00003c00 from memory into f1
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f18, 0(x2) # load 0x00000001 from memory into f18
fsgnj.h f5, f1, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f15, 0(x2) # load 0x00003c00 from memory into f15
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f21, 0(x2) # load 0x00008001 from memory into f21
fsgnj.h f8, f15, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f13, 0(x2) # load 0x00003c00 from memory into f13
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f17, 0(x2) # load 0x00007c00 from memory into f17
fsgnj.h f8, f13, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f24, 0(x2) # load 0x00003c00 from memory into f24
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f7, 0(x2) # load 0x0000fc00 from memory into f7
fsgnj.h f5, f24, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f16, 0(x2) # load 0x00003c00 from memory into f16
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f25, 0(x2) # load 0x00007e00 from memory into f25
fsgnj.h f20, f16, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f30, 0(x2) # load 0x00003c00 from memory into f30
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f1, 0(x2) # load 0x00007fff from memory into f1
fsgnj.h f16, f30, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f12, 0(x2) # load 0x00003c00 from memory into f12
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f6, 0(x2) # load 0x0000fe00 from memory into f6
fsgnj.h f28, f12, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f26, 0(x2) # load 0x00003c00 from memory into f26
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f17, 0(x2) # load 0x00007c01 from memory into f17
fsgnj.h f21, f26, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f21, 0(x2) # load 0x00003c00 from memory into f21
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f25, 0(x2) # load 0x00007dff from memory into f25
fsgnj.h f14, f21, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f29, 0(x2) # load 0x00003c00 from memory into f29
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f17, 0(x2) # load 0x0000fc01 from memory into f17
fsgnj.h f16, f29, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f20, 0(x2) # load 0x00003c00 from memory into f20
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f18, 0(x2) # load 0x000058b4 from memory into f18
fsgnj.h f2, f20, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f20, 0(x2) # load 0x00003c00 from memory into f20
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f9, 0(x2) # load 0x0000c93a from memory into f9
fsgnj.h f19, f20, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f29, 0(x2) # load 0x0000bc00 from memory into f29
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f2, 0(x2) # load 0x00000000 from memory into f2
fsgnj.h f24, f29, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f14, 0(x2) # load 0x0000bc00 from memory into f14
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f2, 0(x2) # load 0x00008000 from memory into f2
fsgnj.h f7, f14, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f27, 0(x2) # load 0x0000bc00 from memory into f27
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f2, 0(x2) # load 0x00003c00 from memory into f2
fsgnj.h f7, f27, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f2, 0(x2) # load 0x0000bc00 from memory into f2
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f8, 0(x2) # load 0x0000bc00 from memory into f8
fsgnj.h f21, f2, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f1, 0(x2) # load 0x0000bc00 from memory into f1
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f2, 0(x2) # load 0x00003e00 from memory into f2
fsgnj.h f30, f1, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f10, 0(x2) # load 0x0000bc00 from memory into f10
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f3, 0(x2) # load 0x0000be00 from memory into f3
fsgnj.h f21, f10, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f27, 0(x2) # load 0x0000bc00 from memory into f27
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f3, 0(x2) # load 0x00004000 from memory into f3
fsgnj.h f5, f27, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f7, 0(x2) # load 0x0000bc00 from memory into f7
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f13, 0(x2) # load 0x0000c000 from memory into f13
fsgnj.h f2, f7, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f24, 0(x2) # load 0x0000bc00 from memory into f24
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f29, 0(x2) # load 0x00000400 from memory into f29
fsgnj.h f2, f24, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f20, 0(x2) # load 0x0000bc00 from memory into f20
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f9, 0(x2) # load 0x00008400 from memory into f9
fsgnj.h f2, f20, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f7, 0(x2) # load 0x0000bc00 from memory into f7
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f12, 0(x2) # load 0x00007bff from memory into f12
fsgnj.h f25, f7, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f31, 0(x2) # load 0x0000bc00 from memory into f31
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f17, 0(x2) # load 0x0000fbff from memory into f17
fsgnj.h f10, f31, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f30, 0(x2) # load 0x0000bc00 from memory into f30
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f7, 0(x2) # load 0x000003ff from memory into f7
fsgnj.h f16, f30, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f16, 0(x2) # load 0x0000bc00 from memory into f16
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f9, 0(x2) # load 0x000083ff from memory into f9
fsgnj.h f19, f16, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f29, 0(x2) # load 0x0000bc00 from memory into f29
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f28, 0(x2) # load 0x00000200 from memory into f28
fsgnj.h f24, f29, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f28, 0(x2) # load 0x0000bc00 from memory into f28
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f30, 0(x2) # load 0x00008200 from memory into f30
fsgnj.h f10, f28, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f25, 0(x2) # load 0x0000bc00 from memory into f25
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f28, 0(x2) # load 0x00000001 from memory into f28
fsgnj.h f31, f25, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f14, 0(x2) # load 0x0000bc00 from memory into f14
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f29, 0(x2) # load 0x00008001 from memory into f29
fsgnj.h f18, f14, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f8, 0(x2) # load 0x0000bc00 from memory into f8
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f9, 0(x2) # load 0x00007c00 from memory into f9
fsgnj.h f13, f8, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f13, 0(x2) # load 0x0000bc00 from memory into f13
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f14, 0(x2) # load 0x0000fc00 from memory into f14
fsgnj.h f23, f13, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f28, 0(x2) # load 0x0000bc00 from memory into f28
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f9, 0(x2) # load 0x00007e00 from memory into f9
fsgnj.h f22, f28, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f27, 0(x2) # load 0x0000bc00 from memory into f27
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f12, 0(x2) # load 0x00007fff from memory into f12
fsgnj.h f10, f27, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f8, 0(x2) # load 0x0000bc00 from memory into f8
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f12, 0(x2) # load 0x0000fe00 from memory into f12
fsgnj.h f29, f8, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f30, 0(x2) # load 0x0000bc00 from memory into f30
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f20, 0(x2) # load 0x00007c01 from memory into f20
fsgnj.h f19, f30, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f15, 0(x2) # load 0x0000bc00 from memory into f15
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f16, 0(x2) # load 0x00007dff from memory into f16
fsgnj.h f9, f15, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f27, 0(x2) # load 0x0000bc00 from memory into f27
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f22, 0(x2) # load 0x0000fc01 from memory into f22
fsgnj.h f25, f27, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f16, 0(x2) # load 0x0000bc00 from memory into f16
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f5, 0(x2) # load 0x000058b4 from memory into f5
fsgnj.h f18, f16, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f7, 0(x2) # load 0x0000bc00 from memory into f7
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f29, 0(x2) # load 0x0000c93a from memory into f29
fsgnj.h f19, f7, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f24, 0(x2) # load 0x00003e00 from memory into f24
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f26, 0(x2) # load 0x00000000 from memory into f26
fsgnj.h f30, f24, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f25, 0(x2) # load 0x00003e00 from memory into f25
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f30, 0(x2) # load 0x00008000 from memory into f30
fsgnj.h f15, f25, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f3, 0(x2) # load 0x00003e00 from memory into f3
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f27, 0(x2) # load 0x00003c00 from memory into f27
fsgnj.h f6, f3, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f10, 0(x2) # load 0x00003e00 from memory into f10
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f26, 0(x2) # load 0x0000bc00 from memory into f26
fsgnj.h f5, f10, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f24, 0(x2) # load 0x00003e00 from memory into f24
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f11, 0(x2) # load 0x00003e00 from memory into f11
fsgnj.h f21, f24, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f13, 0(x2) # load 0x00003e00 from memory into f13
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f12, 0(x2) # load 0x0000be00 from memory into f12
fsgnj.h f25, f13, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f13, 0(x2) # load 0x00003e00 from memory into f13
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f22, 0(x2) # load 0x00004000 from memory into f22
fsgnj.h f5, f13, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f10, 0(x2) # load 0x00003e00 from memory into f10
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f3, 0(x2) # load 0x0000c000 from memory into f3
fsgnj.h f14, f10, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f10, 0(x2) # load 0x00003e00 from memory into f10
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f19, 0(x2) # load 0x00000400 from memory into f19
fsgnj.h f11, f10, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f24, 0(x2) # load 0x00003e00 from memory into f24
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f11, 0(x2) # load 0x00008400 from memory into f11
fsgnj.h f22, f24, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f27, 0(x2) # load 0x00003e00 from memory into f27
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f3, 0(x2) # load 0x00007bff from memory into f3
fsgnj.h f5, f27, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f1, 0(x2) # load 0x00003e00 from memory into f1
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f27, 0(x2) # load 0x0000fbff from memory into f27
fsgnj.h f21, f1, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f28, 0(x2) # load 0x00003e00 from memory into f28
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f22, 0(x2) # load 0x000003ff from memory into f22
fsgnj.h f18, f28, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f30, 0(x2) # load 0x00003e00 from memory into f30
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f24, 0(x2) # load 0x000083ff from memory into f24
fsgnj.h f10, f30, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f18, 0(x2) # load 0x00003e00 from memory into f18
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f1, 0(x2) # load 0x00000200 from memory into f1
fsgnj.h f19, f18, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f5, 0(x2) # load 0x00003e00 from memory into f5
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f26, 0(x2) # load 0x00008200 from memory into f26
fsgnj.h f9, f5, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f27, 0(x2) # load 0x00003e00 from memory into f27
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f23, 0(x2) # load 0x00000001 from memory into f23
fsgnj.h f31, f27, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f22, 0(x2) # load 0x00003e00 from memory into f22
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f3, 0(x2) # load 0x00008001 from memory into f3
fsgnj.h f11, f22, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f27, 0(x2) # load 0x00003e00 from memory into f27
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f10, 0(x2) # load 0x00007c00 from memory into f10
fsgnj.h f30, f27, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f15, 0(x2) # load 0x00003e00 from memory into f15
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f27, 0(x2) # load 0x0000fc00 from memory into f27
fsgnj.h f2, f15, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f20, 0(x2) # load 0x00003e00 from memory into f20
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f7, 0(x2) # load 0x00007e00 from memory into f7
fsgnj.h f25, f20, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f27, 0(x2) # load 0x00003e00 from memory into f27
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f18, 0(x2) # load 0x00007fff from memory into f18
fsgnj.h f11, f27, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f12, 0(x2) # load 0x00003e00 from memory into f12
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f25, 0(x2) # load 0x0000fe00 from memory into f25
fsgnj.h f7, f12, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f17, 0(x2) # load 0x00003e00 from memory into f17
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f27, 0(x2) # load 0x00007c01 from memory into f27
fsgnj.h f1, f17, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f24, 0(x2) # load 0x00003e00 from memory into f24
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f10, 0(x2) # load 0x00007dff from memory into f10
fsgnj.h f11, f24, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f8, 0(x2) # load 0x00003e00 from memory into f8
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f26, 0(x2) # load 0x0000fc01 from memory into f26
fsgnj.h f30, f8, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f11, 0(x2) # load 0x00003e00 from memory into f11
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f13, 0(x2) # load 0x000058b4 from memory into f13
fsgnj.h f9, f11, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f26, 0(x2) # load 0x00003e00 from memory into f26
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f22, 0(x2) # load 0x0000c93a from memory into f22
fsgnj.h f16, f26, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f12, 0(x2) # load 0x0000be00 from memory into f12
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f17, 0(x2) # load 0x00000000 from memory into f17
fsgnj.h f11, f12, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f10, 0(x2) # load 0x0000be00 from memory into f10
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f24, 0(x2) # load 0x00008000 from memory into f24
fsgnj.h f28, f10, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f21, 0(x2) # load 0x0000be00 from memory into f21
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f15, 0(x2) # load 0x00003c00 from memory into f15
fsgnj.h f9, f21, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f28, 0(x2) # load 0x0000be00 from memory into f28
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f7, 0(x2) # load 0x0000bc00 from memory into f7
fsgnj.h f9, f28, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f13, 0(x2) # load 0x0000be00 from memory into f13
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f11, 0(x2) # load 0x00003e00 from memory into f11
fsgnj.h f29, f13, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f1, 0(x2) # load 0x0000be00 from memory into f1
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f6, 0(x2) # load 0x0000be00 from memory into f6
fsgnj.h f24, f1, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f28, 0(x2) # load 0x0000be00 from memory into f28
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f19, 0(x2) # load 0x00004000 from memory into f19
fsgnj.h f15, f28, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f31, 0(x2) # load 0x0000be00 from memory into f31
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f2, 0(x2) # load 0x0000c000 from memory into f2
fsgnj.h f15, f31, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f12, 0(x2) # load 0x0000be00 from memory into f12
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f24, 0(x2) # load 0x00000400 from memory into f24
fsgnj.h f25, f12, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f23, 0(x2) # load 0x0000be00 from memory into f23
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f5, 0(x2) # load 0x00008400 from memory into f5
fsgnj.h f9, f23, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f27, 0(x2) # load 0x0000be00 from memory into f27
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f26, 0(x2) # load 0x00007bff from memory into f26
fsgnj.h f5, f27, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f9, 0(x2) # load 0x0000be00 from memory into f9
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f18, 0(x2) # load 0x0000fbff from memory into f18
fsgnj.h f2, f9, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f22, 0(x2) # load 0x0000be00 from memory into f22
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f12, 0(x2) # load 0x000003ff from memory into f12
fsgnj.h f13, f22, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f16, 0(x2) # load 0x0000be00 from memory into f16
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f18, 0(x2) # load 0x000083ff from memory into f18
fsgnj.h f10, f16, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f1, 0(x2) # load 0x0000be00 from memory into f1
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f19, 0(x2) # load 0x00000200 from memory into f19
fsgnj.h f12, f1, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f9, 0(x2) # load 0x0000be00 from memory into f9
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f8, 0(x2) # load 0x00008200 from memory into f8
fsgnj.h f21, f9, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f27, 0(x2) # load 0x0000be00 from memory into f27
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f28, 0(x2) # load 0x00000001 from memory into f28
fsgnj.h f3, f27, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f8, 0(x2) # load 0x0000be00 from memory into f8
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f29, 0(x2) # load 0x00008001 from memory into f29
fsgnj.h f14, f8, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f1, 0(x2) # load 0x0000be00 from memory into f1
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f15, 0(x2) # load 0x00007c00 from memory into f15
fsgnj.h f17, f1, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f19, 0(x2) # load 0x0000be00 from memory into f19
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f25, 0(x2) # load 0x0000fc00 from memory into f25
fsgnj.h f7, f19, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f29, 0(x2) # load 0x0000be00 from memory into f29
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f11, 0(x2) # load 0x00007e00 from memory into f11
fsgnj.h f25, f29, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f3, 0(x2) # load 0x0000be00 from memory into f3
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f16, 0(x2) # load 0x00007fff from memory into f16
fsgnj.h f17, f3, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f19, 0(x2) # load 0x0000be00 from memory into f19
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f12, 0(x2) # load 0x0000fe00 from memory into f12
fsgnj.h f7, f19, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f15, 0(x2) # load 0x0000be00 from memory into f15
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f24, 0(x2) # load 0x00007c01 from memory into f24
fsgnj.h f16, f15, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f27, 0(x2) # load 0x0000be00 from memory into f27
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f18, 0(x2) # load 0x00007dff from memory into f18
fsgnj.h f5, f27, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f22, 0(x2) # load 0x0000be00 from memory into f22
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f30, 0(x2) # load 0x0000fc01 from memory into f30
fsgnj.h f18, f22, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f28, 0(x2) # load 0x0000be00 from memory into f28
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f22, 0(x2) # load 0x000058b4 from memory into f22
fsgnj.h f25, f28, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f31, 0(x2) # load 0x0000be00 from memory into f31
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f12, 0(x2) # load 0x0000c93a from memory into f12
fsgnj.h f27, f31, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f2, 0(x2) # load 0x00004000 from memory into f2
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f18, 0(x2) # load 0x00000000 from memory into f18
fsgnj.h f17, f2, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f10, 0(x2) # load 0x00004000 from memory into f10
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f28, 0(x2) # load 0x00008000 from memory into f28
fsgnj.h f29, f10, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f10, 0(x2) # load 0x00004000 from memory into f10
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f22, 0(x2) # load 0x00003c00 from memory into f22
fsgnj.h f15, f10, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f17, 0(x2) # load 0x00004000 from memory into f17
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f26, 0(x2) # load 0x0000bc00 from memory into f26
fsgnj.h f27, f17, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f2, 0(x2) # load 0x00004000 from memory into f2
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f9, 0(x2) # load 0x00003e00 from memory into f9
fsgnj.h f23, f2, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f31, 0(x2) # load 0x00004000 from memory into f31
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f29, 0(x2) # load 0x0000be00 from memory into f29
fsgnj.h f8, f31, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f2, 0(x2) # load 0x00004000 from memory into f2
fsgnj.h f6, f21, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f12, 0(x2) # load 0x00004000 from memory into f12
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f9, 0(x2) # load 0x0000c000 from memory into f9
fsgnj.h f23, f12, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f17, 0(x2) # load 0x00004000 from memory into f17
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f7, 0(x2) # load 0x00000400 from memory into f7
fsgnj.h f23, f17, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f10, 0(x2) # load 0x00008400 from memory into f10
fsgnj.h f5, f21, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f28, 0(x2) # load 0x00004000 from memory into f28
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f8, 0(x2) # load 0x00007bff from memory into f8
fsgnj.h f6, f28, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f31, 0(x2) # load 0x00004000 from memory into f31
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f8, 0(x2) # load 0x0000fbff from memory into f8
fsgnj.h f13, f31, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f27, 0(x2) # load 0x00004000 from memory into f27
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f5, 0(x2) # load 0x000003ff from memory into f5
fsgnj.h f2, f27, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f3, 0(x2) # load 0x00004000 from memory into f3
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f26, 0(x2) # load 0x000083ff from memory into f26
fsgnj.h f6, f3, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f7, 0(x2) # load 0x00004000 from memory into f7
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f29, 0(x2) # load 0x00000200 from memory into f29
fsgnj.h f16, f7, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f5, 0(x2) # load 0x00004000 from memory into f5
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f28, 0(x2) # load 0x00008200 from memory into f28
fsgnj.h f8, f5, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f1, 0(x2) # load 0x00004000 from memory into f1
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f25, 0(x2) # load 0x00000001 from memory into f25
fsgnj.h f3, f1, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f1, 0(x2) # load 0x00004000 from memory into f1
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f7, 0(x2) # load 0x00008001 from memory into f7
fsgnj.h f11, f1, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f31, 0(x2) # load 0x00004000 from memory into f31
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f16, 0(x2) # load 0x00007c00 from memory into f16
fsgnj.h f15, f31, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f9, 0(x2) # load 0x00004000 from memory into f9
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f7, 0(x2) # load 0x0000fc00 from memory into f7
fsgnj.h f5, f9, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f22, 0(x2) # load 0x00004000 from memory into f22
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f28, 0(x2) # load 0x00007e00 from memory into f28
fsgnj.h f24, f22, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f8, 0(x2) # load 0x00007fff from memory into f8
fsgnj.h f29, f21, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f18, 0(x2) # load 0x00004000 from memory into f18
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f30, 0(x2) # load 0x0000fe00 from memory into f30
fsgnj.h f3, f18, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f22, 0(x2) # load 0x00004000 from memory into f22
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f7, 0(x2) # load 0x00007c01 from memory into f7
fsgnj.h f23, f22, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f14, 0(x2) # load 0x00004000 from memory into f14
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f12, 0(x2) # load 0x00007dff from memory into f12
fsgnj.h f22, f14, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f25, 0(x2) # load 0x00004000 from memory into f25
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f12, 0(x2) # load 0x0000fc01 from memory into f12
fsgnj.h f9, f25, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f11, 0(x2) # load 0x00004000 from memory into f11
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f30, 0(x2) # load 0x000058b4 from memory into f30
fsgnj.h f9, f11, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f10, 0(x2) # load 0x00004000 from memory into f10
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f5, 0(x2) # load 0x0000c93a from memory into f5
fsgnj.h f17, f10, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f20, 0(x2) # load 0x0000c000 from memory into f20
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f13, 0(x2) # load 0x00000000 from memory into f13
fsgnj.h f24, f20, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f25, 0(x2) # load 0x0000c000 from memory into f25
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f7, 0(x2) # load 0x00008000 from memory into f7
fsgnj.h f27, f25, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f31, 0(x2) # load 0x0000c000 from memory into f31
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f8, 0(x2) # load 0x00003c00 from memory into f8
fsgnj.h f24, f31, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f25, 0(x2) # load 0x0000c000 from memory into f25
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f18, 0(x2) # load 0x0000bc00 from memory into f18
fsgnj.h f20, f25, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f31, 0(x2) # load 0x0000c000 from memory into f31
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f16, 0(x2) # load 0x00003e00 from memory into f16
fsgnj.h f18, f31, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f3, 0(x2) # load 0x0000c000 from memory into f3
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f2, 0(x2) # load 0x0000be00 from memory into f2
fsgnj.h f27, f3, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f28, 0(x2) # load 0x0000c000 from memory into f28
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f25, 0(x2) # load 0x00004000 from memory into f25
fsgnj.h f17, f28, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f25, 0(x2) # load 0x0000c000 from memory into f25
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f1, 0(x2) # load 0x0000c000 from memory into f1
fsgnj.h f3, f25, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f26, 0(x2) # load 0x0000c000 from memory into f26
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f19, 0(x2) # load 0x00000400 from memory into f19
fsgnj.h f5, f26, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f12, 0(x2) # load 0x0000c000 from memory into f12
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f6, 0(x2) # load 0x00008400 from memory into f6
fsgnj.h f9, f12, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f20, 0(x2) # load 0x0000c000 from memory into f20
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f7, 0(x2) # load 0x00007bff from memory into f7
fsgnj.h f17, f20, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f22, 0(x2) # load 0x0000c000 from memory into f22
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f25, 0(x2) # load 0x0000fbff from memory into f25
fsgnj.h f23, f22, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f1, 0(x2) # load 0x0000c000 from memory into f1
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f19, 0(x2) # load 0x000003ff from memory into f19
fsgnj.h f13, f1, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f15, 0(x2) # load 0x0000c000 from memory into f15
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f13, 0(x2) # load 0x000083ff from memory into f13
fsgnj.h f25, f15, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f8, 0(x2) # load 0x0000c000 from memory into f8
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f5, 0(x2) # load 0x00000200 from memory into f5
fsgnj.h f11, f8, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f10, 0(x2) # load 0x0000c000 from memory into f10
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f6, 0(x2) # load 0x00008200 from memory into f6
fsgnj.h f1, f10, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f13, 0(x2) # load 0x0000c000 from memory into f13
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f14, 0(x2) # load 0x00000001 from memory into f14
fsgnj.h f7, f13, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f8, 0(x2) # load 0x0000c000 from memory into f8
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f3, 0(x2) # load 0x00008001 from memory into f3
fsgnj.h f1, f8, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f11, 0(x2) # load 0x0000c000 from memory into f11
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f19, 0(x2) # load 0x00007c00 from memory into f19
fsgnj.h f3, f11, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f31, 0(x2) # load 0x0000c000 from memory into f31
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f26, 0(x2) # load 0x0000fc00 from memory into f26
fsgnj.h f6, f31, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f30, 0(x2) # load 0x0000c000 from memory into f30
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f25, 0(x2) # load 0x00007e00 from memory into f25
fsgnj.h f1, f30, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f14, 0(x2) # load 0x0000c000 from memory into f14
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f8, 0(x2) # load 0x00007fff from memory into f8
fsgnj.h f26, f14, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f8, 0(x2) # load 0x0000c000 from memory into f8
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f16, 0(x2) # load 0x0000fe00 from memory into f16
fsgnj.h f3, f8, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f29, 0(x2) # load 0x0000c000 from memory into f29
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f25, 0(x2) # load 0x00007c01 from memory into f25
fsgnj.h f10, f29, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f22, 0(x2) # load 0x0000c000 from memory into f22
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f25, 0(x2) # load 0x00007dff from memory into f25
fsgnj.h f19, f22, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f15, 0(x2) # load 0x0000c000 from memory into f15
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f6, 0(x2) # load 0x0000fc01 from memory into f6
fsgnj.h f14, f15, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f18, 0(x2) # load 0x0000c000 from memory into f18
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f10, 0(x2) # load 0x000058b4 from memory into f10
fsgnj.h f9, f18, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f6, 0(x2) # load 0x0000c000 from memory into f6
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f8, 0(x2) # load 0x0000c93a from memory into f8
fsgnj.h f10, f6, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f15, 0(x2) # load 0x00000400 from memory into f15
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f11, 0(x2) # load 0x00000000 from memory into f11
fsgnj.h f10, f15, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f2, 0(x2) # load 0x00000400 from memory into f2
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f22, 0(x2) # load 0x00008000 from memory into f22
fsgnj.h f19, f2, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f31, 0(x2) # load 0x00000400 from memory into f31
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f15, 0(x2) # load 0x00003c00 from memory into f15
fsgnj.h f21, f31, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f7, 0(x2) # load 0x00000400 from memory into f7
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f22, 0(x2) # load 0x0000bc00 from memory into f22
fsgnj.h f17, f7, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f13, 0(x2) # load 0x00000400 from memory into f13
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f7, 0(x2) # load 0x00003e00 from memory into f7
fsgnj.h f22, f13, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f22, 0(x2) # load 0x00000400 from memory into f22
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f27, 0(x2) # load 0x0000be00 from memory into f27
fsgnj.h f26, f22, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f25, 0(x2) # load 0x00000400 from memory into f25
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f5, 0(x2) # load 0x00004000 from memory into f5
fsgnj.h f16, f25, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f31, 0(x2) # load 0x00000400 from memory into f31
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f30, 0(x2) # load 0x0000c000 from memory into f30
fsgnj.h f17, f31, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f18, 0(x2) # load 0x00000400 from memory into f18
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f29, 0(x2) # load 0x00000400 from memory into f29
fsgnj.h f9, f18, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f15, 0(x2) # load 0x00000400 from memory into f15
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f22, 0(x2) # load 0x00008400 from memory into f22
fsgnj.h f19, f15, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f20, 0(x2) # load 0x00000400 from memory into f20
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f21, 0(x2) # load 0x00007bff from memory into f21
fsgnj.h f11, f20, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f2, 0(x2) # load 0x00000400 from memory into f2
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f1, 0(x2) # load 0x0000fbff from memory into f1
fsgnj.h f15, f2, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f31, 0(x2) # load 0x00000400 from memory into f31
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f10, 0(x2) # load 0x000003ff from memory into f10
fsgnj.h f21, f31, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f31, 0(x2) # load 0x00000400 from memory into f31
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f29, 0(x2) # load 0x000083ff from memory into f29
fsgnj.h f30, f31, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f12, 0(x2) # load 0x00000400 from memory into f12
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f11, 0(x2) # load 0x00000200 from memory into f11
fsgnj.h f5, f12, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f5, 0(x2) # load 0x00000400 from memory into f5
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f10, 0(x2) # load 0x00008200 from memory into f10
fsgnj.h f26, f5, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f29, 0(x2) # load 0x00000400 from memory into f29
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f6, 0(x2) # load 0x00000001 from memory into f6
fsgnj.h f25, f29, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f27, 0(x2) # load 0x00000400 from memory into f27
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f15, 0(x2) # load 0x00008001 from memory into f15
fsgnj.h f3, f27, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f24, 0(x2) # load 0x00000400 from memory into f24
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f30, 0(x2) # load 0x00007c00 from memory into f30
fsgnj.h f27, f24, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f16, 0(x2) # load 0x00000400 from memory into f16
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f29, 0(x2) # load 0x0000fc00 from memory into f29
fsgnj.h f22, f16, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f12, 0(x2) # load 0x00000400 from memory into f12
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f3, 0(x2) # load 0x00007e00 from memory into f3
fsgnj.h f26, f12, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f24, 0(x2) # load 0x00000400 from memory into f24
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f26, 0(x2) # load 0x00007fff from memory into f26
fsgnj.h f15, f24, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f8, 0(x2) # load 0x00000400 from memory into f8
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f25, 0(x2) # load 0x0000fe00 from memory into f25
fsgnj.h f3, f8, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f27, 0(x2) # load 0x00000400 from memory into f27
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f28, 0(x2) # load 0x00007c01 from memory into f28
fsgnj.h f19, f27, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f20, 0(x2) # load 0x00000400 from memory into f20
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f3, 0(x2) # load 0x00007dff from memory into f3
fsgnj.h f25, f20, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f14, 0(x2) # load 0x00000400 from memory into f14
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f20, 0(x2) # load 0x0000fc01 from memory into f20
fsgnj.h f2, f14, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f26, 0(x2) # load 0x00000400 from memory into f26
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f19, 0(x2) # load 0x000058b4 from memory into f19
fsgnj.h f25, f26, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f11, 0(x2) # load 0x00000400 from memory into f11
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f10, 0(x2) # load 0x0000c93a from memory into f10
fsgnj.h f1, f11, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f25, 0(x2) # load 0x00000000 from memory into f25
fsgnj.h f31, f18, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f27, 0(x2) # load 0x00008400 from memory into f27
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f26, 0(x2) # load 0x00008000 from memory into f26
fsgnj.h f8, f27, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f25, 0(x2) # load 0x00008400 from memory into f25
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f28, 0(x2) # load 0x00003c00 from memory into f28
fsgnj.h f18, f25, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f23, 0(x2) # load 0x00008400 from memory into f23
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f13, 0(x2) # load 0x0000bc00 from memory into f13
fsgnj.h f5, f23, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f8, 0(x2) # load 0x00008400 from memory into f8
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f26, 0(x2) # load 0x00003e00 from memory into f26
fsgnj.h f31, f8, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f16, 0(x2) # load 0x00008400 from memory into f16
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f2, 0(x2) # load 0x0000be00 from memory into f2
fsgnj.h f18, f16, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f31, 0(x2) # load 0x00008400 from memory into f31
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f11, 0(x2) # load 0x00004000 from memory into f11
fsgnj.h f22, f31, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f9, 0(x2) # load 0x00008400 from memory into f9
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f20, 0(x2) # load 0x0000c000 from memory into f20
fsgnj.h f28, f9, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f2, 0(x2) # load 0x00008400 from memory into f2
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f23, 0(x2) # load 0x00000400 from memory into f23
fsgnj.h f10, f2, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f21, 0(x2) # load 0x00008400 from memory into f21
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f30, 0(x2) # load 0x00008400 from memory into f30
fsgnj.h f31, f21, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f8, 0(x2) # load 0x00008400 from memory into f8
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f23, 0(x2) # load 0x00007bff from memory into f23
fsgnj.h f3, f8, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f28, 0(x2) # load 0x00008400 from memory into f28
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f27, 0(x2) # load 0x0000fbff from memory into f27
fsgnj.h f7, f28, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f6, 0(x2) # load 0x00008400 from memory into f6
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f1, 0(x2) # load 0x000003ff from memory into f1
fsgnj.h f11, f6, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f20, 0(x2) # load 0x00008400 from memory into f20
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f10, 0(x2) # load 0x000083ff from memory into f10
fsgnj.h f6, f20, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f21, 0(x2) # load 0x00008400 from memory into f21
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f17, 0(x2) # load 0x00000200 from memory into f17
fsgnj.h f14, f21, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f30, 0(x2) # load 0x00008400 from memory into f30
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f27, 0(x2) # load 0x00008200 from memory into f27
fsgnj.h f21, f30, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f12, 0(x2) # load 0x00008400 from memory into f12
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f18, 0(x2) # load 0x00000001 from memory into f18
fsgnj.h f10, f12, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f5, 0(x2) # load 0x00008400 from memory into f5
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f28, 0(x2) # load 0x00008001 from memory into f28
fsgnj.h f13, f5, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f31, 0(x2) # load 0x00008400 from memory into f31
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f23, 0(x2) # load 0x00007c00 from memory into f23
fsgnj.h f3, f31, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f17, 0(x2) # load 0x00008400 from memory into f17
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f30, 0(x2) # load 0x0000fc00 from memory into f30
fsgnj.h f8, f17, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f15, 0(x2) # load 0x00008400 from memory into f15
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f25, 0(x2) # load 0x00007e00 from memory into f25
fsgnj.h f28, f15, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f5, 0(x2) # load 0x00008400 from memory into f5
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f27, 0(x2) # load 0x00007fff from memory into f27
fsgnj.h f1, f5, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f14, 0(x2) # load 0x00008400 from memory into f14
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f30, 0(x2) # load 0x0000fe00 from memory into f30
fsgnj.h f11, f14, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f19, 0(x2) # load 0x00008400 from memory into f19
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f31, 0(x2) # load 0x00007c01 from memory into f31
fsgnj.h f9, f19, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f22, 0(x2) # load 0x00008400 from memory into f22
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f9, 0(x2) # load 0x00007dff from memory into f9
fsgnj.h f5, f22, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f20, 0(x2) # load 0x00008400 from memory into f20
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f26, 0(x2) # load 0x0000fc01 from memory into f26
fsgnj.h f27, f20, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f23, 0(x2) # load 0x00008400 from memory into f23
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f7, 0(x2) # load 0x000058b4 from memory into f7
fsgnj.h f24, f23, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f13, 0(x2) # load 0x00008400 from memory into f13
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f20, 0(x2) # load 0x0000c93a from memory into f20
fsgnj.h f23, f13, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f13, 0(x2) # load 0x00007bff from memory into f13
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f27, 0(x2) # load 0x00000000 from memory into f27
fsgnj.h f15, f13, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f10, 0(x2) # load 0x00007bff from memory into f10
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f29, 0(x2) # load 0x00008000 from memory into f29
fsgnj.h f27, f10, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f9, 0(x2) # load 0x00007bff from memory into f9
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f24, 0(x2) # load 0x00003c00 from memory into f24
fsgnj.h f22, f9, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f25, 0(x2) # load 0x00007bff from memory into f25
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f16, 0(x2) # load 0x0000bc00 from memory into f16
fsgnj.h f19, f25, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f14, 0(x2) # load 0x00007bff from memory into f14
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f26, 0(x2) # load 0x00003e00 from memory into f26
fsgnj.h f5, f14, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f27, 0(x2) # load 0x00007bff from memory into f27
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f6, 0(x2) # load 0x0000be00 from memory into f6
fsgnj.h f12, f27, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f24, 0(x2) # load 0x00007bff from memory into f24
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f6, 0(x2) # load 0x00004000 from memory into f6
fsgnj.h f12, f24, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f3, 0(x2) # load 0x00007bff from memory into f3
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f6, 0(x2) # load 0x0000c000 from memory into f6
fsgnj.h f12, f3, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f20, 0(x2) # load 0x00007bff from memory into f20
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f13, 0(x2) # load 0x00000400 from memory into f13
fsgnj.h f9, f20, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f6, 0(x2) # load 0x00007bff from memory into f6
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f2, 0(x2) # load 0x00008400 from memory into f2
fsgnj.h f17, f6, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f25, 0(x2) # load 0x00007bff from memory into f25
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f8, 0(x2) # load 0x00007bff from memory into f8
fsgnj.h f27, f25, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f30, 0(x2) # load 0x00007bff from memory into f30
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f8, 0(x2) # load 0x0000fbff from memory into f8
fsgnj.h f19, f30, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f17, 0(x2) # load 0x00007bff from memory into f17
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f29, 0(x2) # load 0x000003ff from memory into f29
fsgnj.h f19, f17, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f30, 0(x2) # load 0x00007bff from memory into f30
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f16, 0(x2) # load 0x000083ff from memory into f16
fsgnj.h f23, f30, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f7, 0(x2) # load 0x00007bff from memory into f7
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f23, 0(x2) # load 0x00000200 from memory into f23
fsgnj.h f8, f7, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f8, 0(x2) # load 0x00007bff from memory into f8
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f30, 0(x2) # load 0x00008200 from memory into f30
fsgnj.h f13, f8, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f9, 0(x2) # load 0x00007bff from memory into f9
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f28, 0(x2) # load 0x00000001 from memory into f28
fsgnj.h f16, f9, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f23, 0(x2) # load 0x00007bff from memory into f23
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f13, 0(x2) # load 0x00008001 from memory into f13
fsgnj.h f27, f23, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f10, 0(x2) # load 0x00007bff from memory into f10
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f25, 0(x2) # load 0x00007c00 from memory into f25
fsgnj.h f15, f10, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f19, 0(x2) # load 0x00007bff from memory into f19
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f31, 0(x2) # load 0x0000fc00 from memory into f31
fsgnj.h f11, f19, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f3, 0(x2) # load 0x00007bff from memory into f3
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f26, 0(x2) # load 0x00007e00 from memory into f26
fsgnj.h f10, f3, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f7, 0(x2) # load 0x00007bff from memory into f7
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f10, 0(x2) # load 0x00007fff from memory into f10
fsgnj.h f8, f7, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f19, 0(x2) # load 0x00007bff from memory into f19
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f17, 0(x2) # load 0x0000fe00 from memory into f17
fsgnj.h f31, f19, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f22, 0(x2) # load 0x00007bff from memory into f22
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f11, 0(x2) # load 0x00007c01 from memory into f11
fsgnj.h f31, f22, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f10, 0(x2) # load 0x00007bff from memory into f10
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f23, 0(x2) # load 0x00007dff from memory into f23
fsgnj.h f13, f10, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f16, 0(x2) # load 0x00007bff from memory into f16
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
fsgnj.h f26, f16, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f23, 0(x2) # load 0x00007bff from memory into f23
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f5, 0(x2) # load 0x000058b4 from memory into f5
fsgnj.h f1, f23, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f2, 0(x2) # load 0x00007bff from memory into f2
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f14, 0(x2) # load 0x0000c93a from memory into f14
fsgnj.h f25, f2, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f26, 0(x2) # load 0x0000fbff from memory into f26
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f27, 0(x2) # load 0x00000000 from memory into f27
fsgnj.h f10, f26, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f17, 0(x2) # load 0x0000fbff from memory into f17
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f13, 0(x2) # load 0x00008000 from memory into f13
fsgnj.h f2, f17, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f3, 0(x2) # load 0x0000fbff from memory into f3
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f26, 0(x2) # load 0x00003c00 from memory into f26
fsgnj.h f7, f3, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f21, 0(x2) # load 0x0000fbff from memory into f21
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f26, 0(x2) # load 0x0000bc00 from memory into f26
fsgnj.h f22, f21, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f28, 0(x2) # load 0x0000fbff from memory into f28
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f17, 0(x2) # load 0x00003e00 from memory into f17
fsgnj.h f30, f28, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f3, 0(x2) # load 0x0000fbff from memory into f3
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f2, 0(x2) # load 0x0000be00 from memory into f2
fsgnj.h f28, f3, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f12, 0(x2) # load 0x0000fbff from memory into f12
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f5, 0(x2) # load 0x00004000 from memory into f5
fsgnj.h f27, f12, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f5, 0(x2) # load 0x0000fbff from memory into f5
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f20, 0(x2) # load 0x0000c000 from memory into f20
fsgnj.h f10, f5, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f16, 0(x2) # load 0x0000fbff from memory into f16
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f27, 0(x2) # load 0x00000400 from memory into f27
fsgnj.h f31, f16, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f21, 0(x2) # load 0x0000fbff from memory into f21
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f14, 0(x2) # load 0x00008400 from memory into f14
fsgnj.h f2, f21, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f11, 0(x2) # load 0x0000fbff from memory into f11
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f30, 0(x2) # load 0x00007bff from memory into f30
fsgnj.h f13, f11, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f27, 0(x2) # load 0x0000fbff from memory into f27
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f28, 0(x2) # load 0x0000fbff from memory into f28
fsgnj.h f17, f27, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f18, 0(x2) # load 0x0000fbff from memory into f18
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f27, 0(x2) # load 0x000003ff from memory into f27
fsgnj.h f7, f18, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f15, 0(x2) # load 0x0000fbff from memory into f15
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f7, 0(x2) # load 0x000083ff from memory into f7
fsgnj.h f5, f15, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f18, 0(x2) # load 0x0000fbff from memory into f18
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f1, 0(x2) # load 0x00000200 from memory into f1
fsgnj.h f5, f18, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f14, 0(x2) # load 0x0000fbff from memory into f14
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f31, 0(x2) # load 0x00008200 from memory into f31
fsgnj.h f29, f14, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f24, 0(x2) # load 0x0000fbff from memory into f24
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f5, 0(x2) # load 0x00000001 from memory into f5
fsgnj.h f30, f24, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f23, 0(x2) # load 0x0000fbff from memory into f23
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f22, 0(x2) # load 0x00008001 from memory into f22
fsgnj.h f1, f23, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f13, 0(x2) # load 0x0000fbff from memory into f13
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f17, 0(x2) # load 0x00007c00 from memory into f17
fsgnj.h f25, f13, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f26, 0(x2) # load 0x0000fbff from memory into f26
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f30, 0(x2) # load 0x0000fc00 from memory into f30
fsgnj.h f5, f26, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f28, 0(x2) # load 0x0000fbff from memory into f28
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f16, 0(x2) # load 0x00007e00 from memory into f16
fsgnj.h f31, f28, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f18, 0(x2) # load 0x0000fbff from memory into f18
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f23, 0(x2) # load 0x00007fff from memory into f23
fsgnj.h f7, f18, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f12, 0(x2) # load 0x0000fbff from memory into f12
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f15, 0(x2) # load 0x0000fe00 from memory into f15
fsgnj.h f10, f12, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f1, 0(x2) # load 0x0000fbff from memory into f1
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f27, 0(x2) # load 0x00007c01 from memory into f27
fsgnj.h f15, f1, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f9, 0(x2) # load 0x0000fbff from memory into f9
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f23, 0(x2) # load 0x00007dff from memory into f23
fsgnj.h f31, f9, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f19, 0(x2) # load 0x0000fbff from memory into f19
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f15, 0(x2) # load 0x0000fc01 from memory into f15
fsgnj.h f27, f19, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f20, 0(x2) # load 0x0000fbff from memory into f20
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f12, 0(x2) # load 0x000058b4 from memory into f12
fsgnj.h f29, f20, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f9, 0(x2) # load 0x0000fbff from memory into f9
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f22, 0(x2) # load 0x0000c93a from memory into f22
fsgnj.h f31, f9, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f19, 0(x2) # load 0x000003ff from memory into f19
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f31, 0(x2) # load 0x00000000 from memory into f31
fsgnj.h f10, f19, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f21, 0(x2) # load 0x000003ff from memory into f21
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f30, 0(x2) # load 0x00008000 from memory into f30
fsgnj.h f15, f21, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f15, 0(x2) # load 0x000003ff from memory into f15
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f14, 0(x2) # load 0x00003c00 from memory into f14
fsgnj.h f31, f15, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f9, 0(x2) # load 0x000003ff from memory into f9
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f15, 0(x2) # load 0x0000bc00 from memory into f15
fsgnj.h f30, f9, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f2, 0(x2) # load 0x000003ff from memory into f2
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f15, 0(x2) # load 0x00003e00 from memory into f15
fsgnj.h f30, f2, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f5, 0(x2) # load 0x000003ff from memory into f5
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f2, 0(x2) # load 0x0000be00 from memory into f2
fsgnj.h f10, f5, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f6, 0(x2) # load 0x000003ff from memory into f6
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f25, 0(x2) # load 0x00004000 from memory into f25
fsgnj.h f24, f6, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f31, 0(x2) # load 0x000003ff from memory into f31
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f27, 0(x2) # load 0x0000c000 from memory into f27
fsgnj.h f28, f31, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f31, 0(x2) # load 0x000003ff from memory into f31
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f5, 0(x2) # load 0x00000400 from memory into f5
fsgnj.h f15, f31, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f8, 0(x2) # load 0x000003ff from memory into f8
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f13, 0(x2) # load 0x00008400 from memory into f13
fsgnj.h f21, f8, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f2, 0(x2) # load 0x000003ff from memory into f2
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f15, 0(x2) # load 0x00007bff from memory into f15
fsgnj.h f24, f2, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f29, 0(x2) # load 0x000003ff from memory into f29
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f9, 0(x2) # load 0x0000fbff from memory into f9
fsgnj.h f25, f29, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f6, 0(x2) # load 0x000003ff from memory into f6
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f24, 0(x2) # load 0x000003ff from memory into f24
fsgnj.h f27, f6, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f26, 0(x2) # load 0x000003ff from memory into f26
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f19, 0(x2) # load 0x000083ff from memory into f19
fsgnj.h f5, f26, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f31, 0(x2) # load 0x000003ff from memory into f31
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f10, 0(x2) # load 0x00000200 from memory into f10
fsgnj.h f23, f31, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f19, 0(x2) # load 0x000003ff from memory into f19
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f6, 0(x2) # load 0x00008200 from memory into f6
fsgnj.h f13, f19, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f9, 0(x2) # load 0x000003ff from memory into f9
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f20, 0(x2) # load 0x00000001 from memory into f20
fsgnj.h f29, f9, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f23, 0(x2) # load 0x000003ff from memory into f23
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f19, 0(x2) # load 0x00008001 from memory into f19
fsgnj.h f27, f23, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f12, 0(x2) # load 0x000003ff from memory into f12
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f16, 0(x2) # load 0x00007c00 from memory into f16
fsgnj.h f28, f12, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f31, 0(x2) # load 0x000003ff from memory into f31
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f12, 0(x2) # load 0x0000fc00 from memory into f12
fsgnj.h f22, f31, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f5, 0(x2) # load 0x000003ff from memory into f5
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f24, 0(x2) # load 0x00007e00 from memory into f24
fsgnj.h f22, f5, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f10, 0(x2) # load 0x000003ff from memory into f10
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f29, 0(x2) # load 0x00007fff from memory into f29
fsgnj.h f21, f10, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f24, 0(x2) # load 0x000003ff from memory into f24
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f30, 0(x2) # load 0x0000fe00 from memory into f30
fsgnj.h f25, f24, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f21, 0(x2) # load 0x000003ff from memory into f21
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f14, 0(x2) # load 0x00007c01 from memory into f14
fsgnj.h f24, f21, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f29, 0(x2) # load 0x000003ff from memory into f29
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f21, 0(x2) # load 0x00007dff from memory into f21
fsgnj.h f8, f29, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f30, 0(x2) # load 0x000003ff from memory into f30
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f25, 0(x2) # load 0x0000fc01 from memory into f25
fsgnj.h f12, f30, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f1, 0(x2) # load 0x000003ff from memory into f1
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f19, 0(x2) # load 0x000058b4 from memory into f19
fsgnj.h f18, f1, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f2, 0(x2) # load 0x000003ff from memory into f2
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f22, 0(x2) # load 0x0000c93a from memory into f22
fsgnj.h f1, f2, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f28, 0(x2) # load 0x000083ff from memory into f28
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f27, 0(x2) # load 0x00000000 from memory into f27
fsgnj.h f2, f28, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f31, 0(x2) # load 0x000083ff from memory into f31
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f7, 0(x2) # load 0x00008000 from memory into f7
fsgnj.h f30, f31, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f14, 0(x2) # load 0x00003c00 from memory into f14
fsgnj.h f25, f21, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f12, 0(x2) # load 0x000083ff from memory into f12
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f18, 0(x2) # load 0x0000bc00 from memory into f18
fsgnj.h f3, f12, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f26, 0(x2) # load 0x000083ff from memory into f26
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f12, 0(x2) # load 0x00003e00 from memory into f12
fsgnj.h f9, f26, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f13, 0(x2) # load 0x000083ff from memory into f13
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f31, 0(x2) # load 0x0000be00 from memory into f31
fsgnj.h f26, f13, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f20, 0(x2) # load 0x000083ff from memory into f20
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f7, 0(x2) # load 0x00004000 from memory into f7
fsgnj.h f29, f20, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f17, 0(x2) # load 0x000083ff from memory into f17
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f29, 0(x2) # load 0x0000c000 from memory into f29
fsgnj.h f18, f17, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f9, 0(x2) # load 0x000083ff from memory into f9
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f3, 0(x2) # load 0x00000400 from memory into f3
fsgnj.h f18, f9, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f9, 0(x2) # load 0x000083ff from memory into f9
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f21, 0(x2) # load 0x00008400 from memory into f21
fsgnj.h f29, f9, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f30, 0(x2) # load 0x00007bff from memory into f30
fsgnj.h f7, f21, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f22, 0(x2) # load 0x000083ff from memory into f22
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f2, 0(x2) # load 0x0000fbff from memory into f2
fsgnj.h f20, f22, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f31, 0(x2) # load 0x000083ff from memory into f31
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f22, 0(x2) # load 0x000003ff from memory into f22
fsgnj.h f23, f31, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f8, 0(x2) # load 0x000083ff from memory into f8
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f17, 0(x2) # load 0x000083ff from memory into f17
fsgnj.h f10, f8, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f18, 0(x2) # load 0x000083ff from memory into f18
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f6, 0(x2) # load 0x00000200 from memory into f6
fsgnj.h f11, f18, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f16, 0(x2) # load 0x000083ff from memory into f16
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f21, 0(x2) # load 0x00008200 from memory into f21
fsgnj.h f17, f16, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f18, 0(x2) # load 0x00000001 from memory into f18
fsgnj.h f16, f21, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f12, 0(x2) # load 0x000083ff from memory into f12
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f11, 0(x2) # load 0x00008001 from memory into f11
fsgnj.h f27, f12, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f15, 0(x2) # load 0x00007c00 from memory into f15
fsgnj.h f18, f21, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f31, 0(x2) # load 0x000083ff from memory into f31
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f22, 0(x2) # load 0x0000fc00 from memory into f22
fsgnj.h f14, f31, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f14, 0(x2) # load 0x000083ff from memory into f14
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f25, 0(x2) # load 0x00007e00 from memory into f25
fsgnj.h f12, f14, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f25, 0(x2) # load 0x000083ff from memory into f25
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f7, 0(x2) # load 0x00007fff from memory into f7
fsgnj.h f6, f25, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f3, 0(x2) # load 0x000083ff from memory into f3
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f6, 0(x2) # load 0x0000fe00 from memory into f6
fsgnj.h f1, f3, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f14, 0(x2) # load 0x000083ff from memory into f14
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f23, 0(x2) # load 0x00007c01 from memory into f23
fsgnj.h f17, f14, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f14, 0(x2) # load 0x000083ff from memory into f14
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f22, 0(x2) # load 0x00007dff from memory into f22
fsgnj.h f13, f14, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f18, 0(x2) # load 0x000083ff from memory into f18
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f6, 0(x2) # load 0x0000fc01 from memory into f6
fsgnj.h f27, f18, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f8, 0(x2) # load 0x000083ff from memory into f8
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f7, 0(x2) # load 0x000058b4 from memory into f7
fsgnj.h f1, f8, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f12, 0(x2) # load 0x000083ff from memory into f12
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f24, 0(x2) # load 0x0000c93a from memory into f24
fsgnj.h f18, f12, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f1, 0(x2) # load 0x00000200 from memory into f1
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f3, 0(x2) # load 0x00000000 from memory into f3
fsgnj.h f28, f1, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f10, 0(x2) # load 0x00000200 from memory into f10
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f27, 0(x2) # load 0x00008000 from memory into f27
fsgnj.h f15, f10, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f12, 0(x2) # load 0x00000200 from memory into f12
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f9, 0(x2) # load 0x00003c00 from memory into f9
fsgnj.h f15, f12, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f7, 0(x2) # load 0x00000200 from memory into f7
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f27, 0(x2) # load 0x0000bc00 from memory into f27
fsgnj.h f8, f7, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f30, 0(x2) # load 0x00000200 from memory into f30
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f31, 0(x2) # load 0x00003e00 from memory into f31
fsgnj.h f20, f30, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f13, 0(x2) # load 0x00000200 from memory into f13
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f1, 0(x2) # load 0x0000be00 from memory into f1
fsgnj.h f28, f13, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f3, 0(x2) # load 0x00000200 from memory into f3
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f24, 0(x2) # load 0x00004000 from memory into f24
fsgnj.h f25, f3, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f30, 0(x2) # load 0x00000200 from memory into f30
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f31, 0(x2) # load 0x0000c000 from memory into f31
fsgnj.h f27, f30, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f31, 0(x2) # load 0x00000200 from memory into f31
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f20, 0(x2) # load 0x00000400 from memory into f20
fsgnj.h f11, f31, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f15, 0(x2) # load 0x00000200 from memory into f15
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f12, 0(x2) # load 0x00008400 from memory into f12
fsgnj.h f26, f15, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f12, 0(x2) # load 0x00000200 from memory into f12
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f20, 0(x2) # load 0x00007bff from memory into f20
fsgnj.h f24, f12, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f6, 0(x2) # load 0x00000200 from memory into f6
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f8, 0(x2) # load 0x0000fbff from memory into f8
fsgnj.h f29, f6, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f3, 0(x2) # load 0x00000200 from memory into f3
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f25, 0(x2) # load 0x000003ff from memory into f25
fsgnj.h f8, f3, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f20, 0(x2) # load 0x00000200 from memory into f20
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f3, 0(x2) # load 0x000083ff from memory into f3
fsgnj.h f1, f20, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f22, 0(x2) # load 0x00000200 from memory into f22
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f28, 0(x2) # load 0x00000200 from memory into f28
fsgnj.h f1, f22, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f14, 0(x2) # load 0x00000200 from memory into f14
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f3, 0(x2) # load 0x00008200 from memory into f3
fsgnj.h f22, f14, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f18, 0(x2) # load 0x00000200 from memory into f18
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f15, 0(x2) # load 0x00000001 from memory into f15
fsgnj.h f17, f18, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f22, 0(x2) # load 0x00000200 from memory into f22
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f27, 0(x2) # load 0x00008001 from memory into f27
fsgnj.h f5, f22, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f29, 0(x2) # load 0x00000200 from memory into f29
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f30, 0(x2) # load 0x00007c00 from memory into f30
fsgnj.h f26, f29, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f6, 0(x2) # load 0x00000200 from memory into f6
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f20, 0(x2) # load 0x0000fc00 from memory into f20
fsgnj.h f14, f6, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f30, 0(x2) # load 0x00000200 from memory into f30
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f16, 0(x2) # load 0x00007e00 from memory into f16
fsgnj.h f1, f30, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f21, 0(x2) # load 0x00000200 from memory into f21
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f18, 0(x2) # load 0x00007fff from memory into f18
fsgnj.h f24, f21, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f21, 0(x2) # load 0x00000200 from memory into f21
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f28, 0(x2) # load 0x0000fe00 from memory into f28
fsgnj.h f7, f21, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f2, 0(x2) # load 0x00000200 from memory into f2
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f18, 0(x2) # load 0x00007c01 from memory into f18
fsgnj.h f14, f2, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f18, 0(x2) # load 0x00000200 from memory into f18
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f31, 0(x2) # load 0x00007dff from memory into f31
fsgnj.h f9, f18, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f14, 0(x2) # load 0x00000200 from memory into f14
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f29, 0(x2) # load 0x0000fc01 from memory into f29
fsgnj.h f17, f14, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f12, 0(x2) # load 0x00000200 from memory into f12
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f28, 0(x2) # load 0x000058b4 from memory into f28
fsgnj.h f19, f12, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f6, 0(x2) # load 0x00000200 from memory into f6
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f17, 0(x2) # load 0x0000c93a from memory into f17
fsgnj.h f9, f6, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f1, 0(x2) # load 0x00008200 from memory into f1
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f16, 0(x2) # load 0x00000000 from memory into f16
fsgnj.h f20, f1, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f15, 0(x2) # load 0x00008200 from memory into f15
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f23, 0(x2) # load 0x00008000 from memory into f23
fsgnj.h f1, f15, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f29, 0(x2) # load 0x00008200 from memory into f29
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f5, 0(x2) # load 0x00003c00 from memory into f5
fsgnj.h f6, f29, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f9, 0(x2) # load 0x00008200 from memory into f9
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f30, 0(x2) # load 0x0000bc00 from memory into f30
fsgnj.h f2, f9, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f3, 0(x2) # load 0x00008200 from memory into f3
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f25, 0(x2) # load 0x00003e00 from memory into f25
fsgnj.h f28, f3, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f16, 0(x2) # load 0x00008200 from memory into f16
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f15, 0(x2) # load 0x0000be00 from memory into f15
fsgnj.h f8, f16, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f26, 0(x2) # load 0x00008200 from memory into f26
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f5, 0(x2) # load 0x00004000 from memory into f5
fsgnj.h f11, f26, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f14, 0(x2) # load 0x00008200 from memory into f14
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f26, 0(x2) # load 0x0000c000 from memory into f26
fsgnj.h f1, f14, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f22, 0(x2) # load 0x00008200 from memory into f22
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f24, 0(x2) # load 0x00000400 from memory into f24
fsgnj.h f20, f22, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f20, 0(x2) # load 0x00008200 from memory into f20
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f22, 0(x2) # load 0x00008400 from memory into f22
fsgnj.h f10, f20, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f8, 0(x2) # load 0x00008200 from memory into f8
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f24, 0(x2) # load 0x00007bff from memory into f24
fsgnj.h f19, f8, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f16, 0(x2) # load 0x00008200 from memory into f16
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f1, 0(x2) # load 0x0000fbff from memory into f1
fsgnj.h f31, f16, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f10, 0(x2) # load 0x00008200 from memory into f10
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f31, 0(x2) # load 0x000003ff from memory into f31
fsgnj.h f3, f10, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f20, 0(x2) # load 0x00008200 from memory into f20
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f22, 0(x2) # load 0x000083ff from memory into f22
fsgnj.h f12, f20, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f16, 0(x2) # load 0x00008200 from memory into f16
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f25, 0(x2) # load 0x00000200 from memory into f25
fsgnj.h f30, f16, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f5, 0(x2) # load 0x00008200 from memory into f5
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f26, 0(x2) # load 0x00008200 from memory into f26
fsgnj.h f18, f5, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f9, 0(x2) # load 0x00008200 from memory into f9
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f14, 0(x2) # load 0x00000001 from memory into f14
fsgnj.h f21, f9, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f24, 0(x2) # load 0x00008200 from memory into f24
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f23, 0(x2) # load 0x00008001 from memory into f23
fsgnj.h f12, f24, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f17, 0(x2) # load 0x00008200 from memory into f17
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f31, 0(x2) # load 0x00007c00 from memory into f31
fsgnj.h f16, f17, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f2, 0(x2) # load 0x00008200 from memory into f2
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f12, 0(x2) # load 0x0000fc00 from memory into f12
fsgnj.h f1, f2, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f18, 0(x2) # load 0x00008200 from memory into f18
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f30, 0(x2) # load 0x00007e00 from memory into f30
fsgnj.h f26, f18, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f19, 0(x2) # load 0x00008200 from memory into f19
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f27, 0(x2) # load 0x00007fff from memory into f27
fsgnj.h f14, f19, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f3, 0(x2) # load 0x00008200 from memory into f3
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f29, 0(x2) # load 0x0000fe00 from memory into f29
fsgnj.h f18, f3, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f30, 0(x2) # load 0x00008200 from memory into f30
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f25, 0(x2) # load 0x00007c01 from memory into f25
fsgnj.h f1, f30, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f29, 0(x2) # load 0x00008200 from memory into f29
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f24, 0(x2) # load 0x00007dff from memory into f24
fsgnj.h f17, f29, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f13, 0(x2) # load 0x00008200 from memory into f13
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f26, 0(x2) # load 0x0000fc01 from memory into f26
fsgnj.h f3, f13, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f27, 0(x2) # load 0x00008200 from memory into f27
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f30, 0(x2) # load 0x000058b4 from memory into f30
fsgnj.h f12, f27, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f22, 0(x2) # load 0x00008200 from memory into f22
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f9, 0(x2) # load 0x0000c93a from memory into f9
fsgnj.h f20, f22, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f14, 0(x2) # load 0x00000001 from memory into f14
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f28, 0(x2) # load 0x00000000 from memory into f28
fsgnj.h f17, f14, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f23, 0(x2) # load 0x00000001 from memory into f23
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f25, 0(x2) # load 0x00008000 from memory into f25
fsgnj.h f27, f23, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f28, 0(x2) # load 0x00000001 from memory into f28
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f6, 0(x2) # load 0x00003c00 from memory into f6
fsgnj.h f27, f28, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f1, 0(x2) # load 0x00000001 from memory into f1
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f19, 0(x2) # load 0x0000bc00 from memory into f19
fsgnj.h f14, f1, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f21, 0(x2) # load 0x00000001 from memory into f21
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f9, 0(x2) # load 0x00003e00 from memory into f9
fsgnj.h f5, f21, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f3, 0(x2) # load 0x00000001 from memory into f3
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f15, 0(x2) # load 0x0000be00 from memory into f15
fsgnj.h f25, f3, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f23, 0(x2) # load 0x00000001 from memory into f23
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f15, 0(x2) # load 0x00004000 from memory into f15
fsgnj.h f18, f23, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f29, 0(x2) # load 0x00000001 from memory into f29
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f20, 0(x2) # load 0x0000c000 from memory into f20
fsgnj.h f5, f29, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f2, 0(x2) # load 0x00000001 from memory into f2
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f15, 0(x2) # load 0x00000400 from memory into f15
fsgnj.h f17, f2, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f5, 0(x2) # load 0x00000001 from memory into f5
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f13, 0(x2) # load 0x00008400 from memory into f13
fsgnj.h f16, f5, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f15, 0(x2) # load 0x00000001 from memory into f15
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f17, 0(x2) # load 0x00007bff from memory into f17
fsgnj.h f3, f15, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f29, 0(x2) # load 0x00000001 from memory into f29
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f11, 0(x2) # load 0x0000fbff from memory into f11
fsgnj.h f30, f29, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f9, 0(x2) # load 0x00000001 from memory into f9
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f22, 0(x2) # load 0x000003ff from memory into f22
fsgnj.h f31, f9, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f24, 0(x2) # load 0x00000001 from memory into f24
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f1, 0(x2) # load 0x000083ff from memory into f1
fsgnj.h f28, f24, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f31, 0(x2) # load 0x00000001 from memory into f31
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f27, 0(x2) # load 0x00000200 from memory into f27
fsgnj.h f2, f31, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f31, 0(x2) # load 0x00000001 from memory into f31
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f30, 0(x2) # load 0x00008200 from memory into f30
fsgnj.h f3, f31, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f5, 0(x2) # load 0x00000001 from memory into f5
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f16, 0(x2) # load 0x00000001 from memory into f16
fsgnj.h f25, f5, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f26, 0(x2) # load 0x00000001 from memory into f26
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f18, 0(x2) # load 0x00008001 from memory into f18
fsgnj.h f23, f26, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f29, 0(x2) # load 0x00000001 from memory into f29
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f31, 0(x2) # load 0x00007c00 from memory into f31
fsgnj.h f14, f29, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f19, 0(x2) # load 0x00000001 from memory into f19
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f25, 0(x2) # load 0x0000fc00 from memory into f25
fsgnj.h f23, f19, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f15, 0(x2) # load 0x00000001 from memory into f15
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f29, 0(x2) # load 0x00007e00 from memory into f29
fsgnj.h f6, f15, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f22, 0(x2) # load 0x00000001 from memory into f22
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f30, 0(x2) # load 0x00007fff from memory into f30
fsgnj.h f26, f22, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f17, 0(x2) # load 0x00000001 from memory into f17
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f14, 0(x2) # load 0x0000fe00 from memory into f14
fsgnj.h f24, f17, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f15, 0(x2) # load 0x00000001 from memory into f15
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f11, 0(x2) # load 0x00007c01 from memory into f11
fsgnj.h f1, f15, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f25, 0(x2) # load 0x00000001 from memory into f25
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f7, 0(x2) # load 0x00007dff from memory into f7
fsgnj.h f29, f25, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f16, 0(x2) # load 0x00000001 from memory into f16
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f9, 0(x2) # load 0x0000fc01 from memory into f9
fsgnj.h f2, f16, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f11, 0(x2) # load 0x00000001 from memory into f11
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f24, 0(x2) # load 0x000058b4 from memory into f24
fsgnj.h f2, f11, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f18, 0(x2) # load 0x00000001 from memory into f18
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f26, 0(x2) # load 0x0000c93a from memory into f26
fsgnj.h f25, f18, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f15, 0(x2) # load 0x00008001 from memory into f15
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f27, 0(x2) # load 0x00000000 from memory into f27
fsgnj.h f18, f15, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f11, 0(x2) # load 0x00008001 from memory into f11
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f31, 0(x2) # load 0x00008000 from memory into f31
fsgnj.h f22, f11, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f18, 0(x2) # load 0x00008001 from memory into f18
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f13, 0(x2) # load 0x00003c00 from memory into f13
fsgnj.h f12, f18, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f19, 0(x2) # load 0x00008001 from memory into f19
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f10, 0(x2) # load 0x0000bc00 from memory into f10
fsgnj.h f14, f19, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f29, 0(x2) # load 0x00008001 from memory into f29
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f21, 0(x2) # load 0x00003e00 from memory into f21
fsgnj.h f14, f29, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f26, 0(x2) # load 0x00008001 from memory into f26
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f25, 0(x2) # load 0x0000be00 from memory into f25
fsgnj.h f19, f26, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f5, 0(x2) # load 0x00008001 from memory into f5
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
fsgnj.h f29, f5, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f10, 0(x2) # load 0x00008001 from memory into f10
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f31, 0(x2) # load 0x0000c000 from memory into f31
fsgnj.h f14, f10, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f25, 0(x2) # load 0x00008001 from memory into f25
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f17, 0(x2) # load 0x00000400 from memory into f17
fsgnj.h f10, f25, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f23, 0(x2) # load 0x00008001 from memory into f23
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f21, 0(x2) # load 0x00008400 from memory into f21
fsgnj.h f13, f23, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f14, 0(x2) # load 0x00008001 from memory into f14
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f24, 0(x2) # load 0x00007bff from memory into f24
fsgnj.h f11, f14, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f3, 0(x2) # load 0x00008001 from memory into f3
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f21, 0(x2) # load 0x0000fbff from memory into f21
fsgnj.h f27, f3, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f21, 0(x2) # load 0x00008001 from memory into f21
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f2, 0(x2) # load 0x000003ff from memory into f2
fsgnj.h f13, f21, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f24, 0(x2) # load 0x00008001 from memory into f24
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f25, 0(x2) # load 0x000083ff from memory into f25
fsgnj.h f9, f24, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f5, 0(x2) # load 0x00008001 from memory into f5
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f17, 0(x2) # load 0x00000200 from memory into f17
fsgnj.h f21, f5, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f9, 0(x2) # load 0x00008001 from memory into f9
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f3, 0(x2) # load 0x00008200 from memory into f3
fsgnj.h f30, f9, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f7, 0(x2) # load 0x00008001 from memory into f7
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f23, 0(x2) # load 0x00000001 from memory into f23
fsgnj.h f16, f7, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f21, 0(x2) # load 0x00008001 from memory into f21
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f11, 0(x2) # load 0x00008001 from memory into f11
fsgnj.h f31, f21, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f17, 0(x2) # load 0x00008001 from memory into f17
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f11, 0(x2) # load 0x00007c00 from memory into f11
fsgnj.h f31, f17, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f12, 0(x2) # load 0x00008001 from memory into f12
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f30, 0(x2) # load 0x0000fc00 from memory into f30
fsgnj.h f9, f12, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f25, 0(x2) # load 0x00008001 from memory into f25
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f1, 0(x2) # load 0x00007e00 from memory into f1
fsgnj.h f16, f25, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f31, 0(x2) # load 0x00008001 from memory into f31
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f6, 0(x2) # load 0x00007fff from memory into f6
fsgnj.h f27, f31, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f30, 0(x2) # load 0x00008001 from memory into f30
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f12, 0(x2) # load 0x0000fe00 from memory into f12
fsgnj.h f20, f30, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f9, 0(x2) # load 0x00008001 from memory into f9
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f31, 0(x2) # load 0x00007c01 from memory into f31
fsgnj.h f3, f9, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f17, 0(x2) # load 0x00008001 from memory into f17
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f29, 0(x2) # load 0x00007dff from memory into f29
fsgnj.h f6, f17, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f26, 0(x2) # load 0x00008001 from memory into f26
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f11, 0(x2) # load 0x0000fc01 from memory into f11
fsgnj.h f22, f26, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f20, 0(x2) # load 0x00008001 from memory into f20
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f14, 0(x2) # load 0x000058b4 from memory into f14
fsgnj.h f7, f20, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f3, 0(x2) # load 0x00008001 from memory into f3
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f17, 0(x2) # load 0x0000c93a from memory into f17
fsgnj.h f25, f3, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f17, 0(x2) # load 0x00007c00 from memory into f17
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f10, 0(x2) # load 0x00000000 from memory into f10
fsgnj.h f27, f17, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f7, 0(x2) # load 0x00007c00 from memory into f7
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f14, 0(x2) # load 0x00008000 from memory into f14
fsgnj.h f19, f7, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f3, 0(x2) # load 0x00007c00 from memory into f3
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f23, 0(x2) # load 0x00003c00 from memory into f23
fsgnj.h f5, f3, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f6, 0(x2) # load 0x00007c00 from memory into f6
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f1, 0(x2) # load 0x0000bc00 from memory into f1
fsgnj.h f30, f6, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f14, 0(x2) # load 0x00007c00 from memory into f14
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f25, 0(x2) # load 0x00003e00 from memory into f25
fsgnj.h f22, f14, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f14, 0(x2) # load 0x00007c00 from memory into f14
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f12, 0(x2) # load 0x0000be00 from memory into f12
fsgnj.h f3, f14, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f26, 0(x2) # load 0x00007c00 from memory into f26
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f18, 0(x2) # load 0x00004000 from memory into f18
fsgnj.h f5, f26, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f31, 0(x2) # load 0x00007c00 from memory into f31
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f24, 0(x2) # load 0x0000c000 from memory into f24
fsgnj.h f8, f31, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f12, 0(x2) # load 0x00007c00 from memory into f12
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f11, 0(x2) # load 0x00000400 from memory into f11
fsgnj.h f13, f12, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f13, 0(x2) # load 0x00007c00 from memory into f13
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f16, 0(x2) # load 0x00008400 from memory into f16
fsgnj.h f5, f13, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f24, 0(x2) # load 0x00007c00 from memory into f24
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f11, 0(x2) # load 0x00007bff from memory into f11
fsgnj.h f31, f24, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f14, 0(x2) # load 0x00007c00 from memory into f14
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f12, 0(x2) # load 0x0000fbff from memory into f12
fsgnj.h f15, f14, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f16, 0(x2) # load 0x00007c00 from memory into f16
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f27, 0(x2) # load 0x000003ff from memory into f27
fsgnj.h f28, f16, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f1, 0(x2) # load 0x00007c00 from memory into f1
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f8, 0(x2) # load 0x000083ff from memory into f8
fsgnj.h f18, f1, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f20, 0(x2) # load 0x00007c00 from memory into f20
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f13, 0(x2) # load 0x00000200 from memory into f13
fsgnj.h f6, f20, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f14, 0(x2) # load 0x00007c00 from memory into f14
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f24, 0(x2) # load 0x00008200 from memory into f24
fsgnj.h f21, f14, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f28, 0(x2) # load 0x00007c00 from memory into f28
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f18, 0(x2) # load 0x00000001 from memory into f18
fsgnj.h f22, f28, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f6, 0(x2) # load 0x00007c00 from memory into f6
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f22, 0(x2) # load 0x00008001 from memory into f22
fsgnj.h f5, f6, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f23, 0(x2) # load 0x00007c00 from memory into f23
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f18, 0(x2) # load 0x00007c00 from memory into f18
fsgnj.h f19, f23, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f27, 0(x2) # load 0x00007c00 from memory into f27
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f1, 0(x2) # load 0x0000fc00 from memory into f1
fsgnj.h f28, f27, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f24, 0(x2) # load 0x00007c00 from memory into f24
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f30, 0(x2) # load 0x00007e00 from memory into f30
fsgnj.h f15, f24, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f11, 0(x2) # load 0x00007c00 from memory into f11
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f7, 0(x2) # load 0x00007fff from memory into f7
fsgnj.h f27, f11, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f22, 0(x2) # load 0x00007c00 from memory into f22
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f14, 0(x2) # load 0x0000fe00 from memory into f14
fsgnj.h f24, f22, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f1, 0(x2) # load 0x00007c00 from memory into f1
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f5, 0(x2) # load 0x00007c01 from memory into f5
fsgnj.h f27, f1, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f16, 0(x2) # load 0x00007c00 from memory into f16
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f5, 0(x2) # load 0x00007dff from memory into f5
fsgnj.h f12, f16, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f31, 0(x2) # load 0x00007c00 from memory into f31
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f26, 0(x2) # load 0x0000fc01 from memory into f26
fsgnj.h f18, f31, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f29, 0(x2) # load 0x00007c00 from memory into f29
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f7, 0(x2) # load 0x000058b4 from memory into f7
fsgnj.h f22, f29, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f21, 0(x2) # load 0x00007c00 from memory into f21
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f22, 0(x2) # load 0x0000c93a from memory into f22
fsgnj.h f12, f21, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f3, 0(x2) # load 0x0000fc00 from memory into f3
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f19, 0(x2) # load 0x00000000 from memory into f19
fsgnj.h f20, f3, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f25, 0(x2) # load 0x0000fc00 from memory into f25
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f17, 0(x2) # load 0x00008000 from memory into f17
fsgnj.h f11, f25, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f8, 0(x2) # load 0x0000fc00 from memory into f8
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f26, 0(x2) # load 0x00003c00 from memory into f26
fsgnj.h f10, f8, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f11, 0(x2) # load 0x0000fc00 from memory into f11
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f16, 0(x2) # load 0x0000bc00 from memory into f16
fsgnj.h f31, f11, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f15, 0(x2) # load 0x0000fc00 from memory into f15
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f14, 0(x2) # load 0x00003e00 from memory into f14
fsgnj.h f26, f15, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f1, 0(x2) # load 0x0000fc00 from memory into f1
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f11, 0(x2) # load 0x0000be00 from memory into f11
fsgnj.h f27, f1, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f8, 0(x2) # load 0x0000fc00 from memory into f8
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f15, 0(x2) # load 0x00004000 from memory into f15
fsgnj.h f17, f8, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f2, 0(x2) # load 0x0000fc00 from memory into f2
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f7, 0(x2) # load 0x0000c000 from memory into f7
fsgnj.h f5, f2, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f14, 0(x2) # load 0x0000fc00 from memory into f14
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f31, 0(x2) # load 0x00000400 from memory into f31
fsgnj.h f29, f14, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f1, 0(x2) # load 0x0000fc00 from memory into f1
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f26, 0(x2) # load 0x00008400 from memory into f26
fsgnj.h f2, f1, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f18, 0(x2) # load 0x0000fc00 from memory into f18
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f15, 0(x2) # load 0x00007bff from memory into f15
fsgnj.h f24, f18, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f10, 0(x2) # load 0x0000fc00 from memory into f10
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f17, 0(x2) # load 0x0000fbff from memory into f17
fsgnj.h f21, f10, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f16, 0(x2) # load 0x0000fc00 from memory into f16
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f7, 0(x2) # load 0x000003ff from memory into f7
fsgnj.h f18, f16, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f14, 0(x2) # load 0x0000fc00 from memory into f14
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f30, 0(x2) # load 0x000083ff from memory into f30
fsgnj.h f9, f14, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f2, 0(x2) # load 0x0000fc00 from memory into f2
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f26, 0(x2) # load 0x00000200 from memory into f26
fsgnj.h f5, f2, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f26, 0(x2) # load 0x0000fc00 from memory into f26
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f8, 0(x2) # load 0x00008200 from memory into f8
fsgnj.h f10, f26, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f31, 0(x2) # load 0x0000fc00 from memory into f31
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f5, 0(x2) # load 0x00000001 from memory into f5
fsgnj.h f21, f31, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f7, 0(x2) # load 0x0000fc00 from memory into f7
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f31, 0(x2) # load 0x00008001 from memory into f31
fsgnj.h f11, f7, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f12, 0(x2) # load 0x0000fc00 from memory into f12
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f6, 0(x2) # load 0x00007c00 from memory into f6
fsgnj.h f7, f12, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f1, 0(x2) # load 0x0000fc00 from memory into f1
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f22, 0(x2) # load 0x0000fc00 from memory into f22
fsgnj.h f12, f1, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f6, 0(x2) # load 0x0000fc00 from memory into f6
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f24, 0(x2) # load 0x00007e00 from memory into f24
fsgnj.h f27, f6, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f5, 0(x2) # load 0x0000fc00 from memory into f5
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f12, 0(x2) # load 0x00007fff from memory into f12
fsgnj.h f3, f5, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f12, 0(x2) # load 0x0000fc00 from memory into f12
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f23, 0(x2) # load 0x0000fe00 from memory into f23
fsgnj.h f21, f12, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f6, 0(x2) # load 0x0000fc00 from memory into f6
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f31, 0(x2) # load 0x00007c01 from memory into f31
fsgnj.h f24, f6, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f26, 0(x2) # load 0x0000fc00 from memory into f26
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f7, 0(x2) # load 0x00007dff from memory into f7
fsgnj.h f25, f26, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f28, 0(x2) # load 0x0000fc00 from memory into f28
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f7, 0(x2) # load 0x0000fc01 from memory into f7
fsgnj.h f31, f28, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f31, 0(x2) # load 0x0000fc00 from memory into f31
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f13, 0(x2) # load 0x000058b4 from memory into f13
fsgnj.h f19, f31, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f26, 0(x2) # load 0x0000fc00 from memory into f26
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f7, 0(x2) # load 0x0000c93a from memory into f7
fsgnj.h f5, f26, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f25, 0(x2) # load 0x00007e00 from memory into f25
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f20, 0(x2) # load 0x00000000 from memory into f20
fsgnj.h f7, f25, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f26, 0(x2) # load 0x00007e00 from memory into f26
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f20, 0(x2) # load 0x00008000 from memory into f20
fsgnj.h f7, f26, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f5, 0(x2) # load 0x00007e00 from memory into f5
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f17, 0(x2) # load 0x00003c00 from memory into f17
fsgnj.h f7, f5, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f10, 0(x2) # load 0x00007e00 from memory into f10
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f11, 0(x2) # load 0x0000bc00 from memory into f11
fsgnj.h f18, f10, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f8, 0(x2) # load 0x00007e00 from memory into f8
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f3, 0(x2) # load 0x00003e00 from memory into f3
fsgnj.h f15, f8, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f2, 0(x2) # load 0x00007e00 from memory into f2
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f30, 0(x2) # load 0x0000be00 from memory into f30
fsgnj.h f1, f2, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f31, 0(x2) # load 0x00007e00 from memory into f31
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f3, 0(x2) # load 0x00004000 from memory into f3
fsgnj.h f1, f31, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f14, 0(x2) # load 0x00007e00 from memory into f14
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f7, 0(x2) # load 0x0000c000 from memory into f7
fsgnj.h f2, f14, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f25, 0(x2) # load 0x00007e00 from memory into f25
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f18, 0(x2) # load 0x00000400 from memory into f18
fsgnj.h f14, f25, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f24, 0(x2) # load 0x00007e00 from memory into f24
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f10, 0(x2) # load 0x00008400 from memory into f10
fsgnj.h f23, f24, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f14, 0(x2) # load 0x00007e00 from memory into f14
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f31, 0(x2) # load 0x00007bff from memory into f31
fsgnj.h f18, f14, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f29, 0(x2) # load 0x00007e00 from memory into f29
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f13, 0(x2) # load 0x0000fbff from memory into f13
fsgnj.h f5, f29, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f22, 0(x2) # load 0x00007e00 from memory into f22
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f29, 0(x2) # load 0x000003ff from memory into f29
fsgnj.h f18, f22, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f2, 0(x2) # load 0x00007e00 from memory into f2
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f29, 0(x2) # load 0x000083ff from memory into f29
fsgnj.h f30, f2, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f16, 0(x2) # load 0x00007e00 from memory into f16
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f10, 0(x2) # load 0x00000200 from memory into f10
fsgnj.h f8, f16, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f29, 0(x2) # load 0x00007e00 from memory into f29
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f2, 0(x2) # load 0x00008200 from memory into f2
fsgnj.h f22, f29, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f24, 0(x2) # load 0x00007e00 from memory into f24
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f8, 0(x2) # load 0x00000001 from memory into f8
fsgnj.h f5, f24, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f13, 0(x2) # load 0x00007e00 from memory into f13
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f9, 0(x2) # load 0x00008001 from memory into f9
fsgnj.h f28, f13, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f1, 0(x2) # load 0x00007e00 from memory into f1
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f12, 0(x2) # load 0x00007c00 from memory into f12
fsgnj.h f25, f1, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f14, 0(x2) # load 0x00007e00 from memory into f14
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f20, 0(x2) # load 0x0000fc00 from memory into f20
fsgnj.h f1, f14, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f15, 0(x2) # load 0x00007e00 from memory into f15
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f12, 0(x2) # load 0x00007e00 from memory into f12
fsgnj.h f30, f15, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f5, 0(x2) # load 0x00007e00 from memory into f5
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f2, 0(x2) # load 0x00007fff from memory into f2
fsgnj.h f3, f5, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f17, 0(x2) # load 0x00007e00 from memory into f17
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f29, 0(x2) # load 0x0000fe00 from memory into f29
fsgnj.h f20, f17, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f21, 0(x2) # load 0x00007e00 from memory into f21
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f5, 0(x2) # load 0x00007c01 from memory into f5
fsgnj.h f11, f21, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f9, 0(x2) # load 0x00007e00 from memory into f9
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f6, 0(x2) # load 0x00007dff from memory into f6
fsgnj.h f24, f9, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f20, 0(x2) # load 0x00007e00 from memory into f20
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f5, 0(x2) # load 0x0000fc01 from memory into f5
fsgnj.h f23, f20, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f10, 0(x2) # load 0x00007e00 from memory into f10
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f1, 0(x2) # load 0x000058b4 from memory into f1
fsgnj.h f18, f10, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f28, 0(x2) # load 0x00007e00 from memory into f28
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f16, 0(x2) # load 0x0000c93a from memory into f16
fsgnj.h f1, f28, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f15, 0(x2) # load 0x00007fff from memory into f15
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f14, 0(x2) # load 0x00000000 from memory into f14
fsgnj.h f23, f15, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f12, 0(x2) # load 0x00007fff from memory into f12
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f27, 0(x2) # load 0x00008000 from memory into f27
fsgnj.h f10, f12, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f1, 0(x2) # load 0x00007fff from memory into f1
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f5, 0(x2) # load 0x00003c00 from memory into f5
fsgnj.h f15, f1, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f14, 0(x2) # load 0x00007fff from memory into f14
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f30, 0(x2) # load 0x0000bc00 from memory into f30
fsgnj.h f7, f14, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f31, 0(x2) # load 0x00007fff from memory into f31
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f17, 0(x2) # load 0x00003e00 from memory into f17
fsgnj.h f18, f31, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f12, 0(x2) # load 0x00007fff from memory into f12
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f19, 0(x2) # load 0x0000be00 from memory into f19
fsgnj.h f17, f12, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f21, 0(x2) # load 0x00007fff from memory into f21
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f30, 0(x2) # load 0x00004000 from memory into f30
fsgnj.h f28, f21, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f7, 0(x2) # load 0x00007fff from memory into f7
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f18, 0(x2) # load 0x0000c000 from memory into f18
fsgnj.h f9, f7, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f18, 0(x2) # load 0x00007fff from memory into f18
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f11, 0(x2) # load 0x00000400 from memory into f11
fsgnj.h f25, f18, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f18, 0(x2) # load 0x00007fff from memory into f18
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f19, 0(x2) # load 0x00008400 from memory into f19
fsgnj.h f29, f18, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f24, 0(x2) # load 0x00007fff from memory into f24
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f6, 0(x2) # load 0x00007bff from memory into f6
fsgnj.h f3, f24, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f15, 0(x2) # load 0x00007fff from memory into f15
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f8, 0(x2) # load 0x0000fbff from memory into f8
fsgnj.h f7, f15, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f26, 0(x2) # load 0x00007fff from memory into f26
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f6, 0(x2) # load 0x000003ff from memory into f6
fsgnj.h f19, f26, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f7, 0(x2) # load 0x00007fff from memory into f7
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f29, 0(x2) # load 0x000083ff from memory into f29
fsgnj.h f14, f7, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f28, 0(x2) # load 0x00007fff from memory into f28
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f19, 0(x2) # load 0x00000200 from memory into f19
fsgnj.h f20, f28, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f24, 0(x2) # load 0x00007fff from memory into f24
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f3, 0(x2) # load 0x00008200 from memory into f3
fsgnj.h f2, f24, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f11, 0(x2) # load 0x00007fff from memory into f11
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f17, 0(x2) # load 0x00000001 from memory into f17
fsgnj.h f16, f11, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f6, 0(x2) # load 0x00007fff from memory into f6
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f1, 0(x2) # load 0x00008001 from memory into f1
fsgnj.h f16, f6, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f3, 0(x2) # load 0x00007fff from memory into f3
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f1, 0(x2) # load 0x00007c00 from memory into f1
fsgnj.h f7, f3, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f22, 0(x2) # load 0x00007fff from memory into f22
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f13, 0(x2) # load 0x0000fc00 from memory into f13
fsgnj.h f16, f22, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f29, 0(x2) # load 0x00007fff from memory into f29
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f9, 0(x2) # load 0x00007e00 from memory into f9
fsgnj.h f21, f29, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f8, 0(x2) # load 0x00007fff from memory into f8
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f3, 0(x2) # load 0x00007fff from memory into f3
fsgnj.h f11, f8, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f28, 0(x2) # load 0x00007fff from memory into f28
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f26, 0(x2) # load 0x0000fe00 from memory into f26
fsgnj.h f5, f28, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f6, 0(x2) # load 0x00007fff from memory into f6
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f1, 0(x2) # load 0x00007c01 from memory into f1
fsgnj.h f13, f6, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f21, 0(x2) # load 0x00007fff from memory into f21
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f22, 0(x2) # load 0x00007dff from memory into f22
fsgnj.h f18, f21, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f7, 0(x2) # load 0x00007fff from memory into f7
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f14, 0(x2) # load 0x0000fc01 from memory into f14
fsgnj.h f10, f7, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f11, 0(x2) # load 0x00007fff from memory into f11
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f18, 0(x2) # load 0x000058b4 from memory into f18
fsgnj.h f1, f11, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f29, 0(x2) # load 0x00007fff from memory into f29
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f22, 0(x2) # load 0x0000c93a from memory into f22
fsgnj.h f12, f29, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f17, 0(x2) # load 0x0000fe00 from memory into f17
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f9, 0(x2) # load 0x00000000 from memory into f9
fsgnj.h f1, f17, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f30, 0(x2) # load 0x0000fe00 from memory into f30
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f5, 0(x2) # load 0x00008000 from memory into f5
fsgnj.h f3, f30, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f3, 0(x2) # load 0x0000fe00 from memory into f3
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f7, 0(x2) # load 0x00003c00 from memory into f7
fsgnj.h f12, f3, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f12, 0(x2) # load 0x0000fe00 from memory into f12
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f17, 0(x2) # load 0x0000bc00 from memory into f17
fsgnj.h f6, f12, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f20, 0(x2) # load 0x0000fe00 from memory into f20
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f16, 0(x2) # load 0x00003e00 from memory into f16
fsgnj.h f30, f20, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f12, 0(x2) # load 0x0000fe00 from memory into f12
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f2, 0(x2) # load 0x0000be00 from memory into f2
fsgnj.h f31, f12, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f9, 0(x2) # load 0x0000fe00 from memory into f9
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f27, 0(x2) # load 0x00004000 from memory into f27
fsgnj.h f17, f9, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f22, 0(x2) # load 0x0000fe00 from memory into f22
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f1, 0(x2) # load 0x0000c000 from memory into f1
fsgnj.h f29, f22, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f25, 0(x2) # load 0x0000fe00 from memory into f25
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f22, 0(x2) # load 0x00000400 from memory into f22
fsgnj.h f16, f25, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f1, 0(x2) # load 0x0000fe00 from memory into f1
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f15, 0(x2) # load 0x00008400 from memory into f15
fsgnj.h f18, f1, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f21, 0(x2) # load 0x0000fe00 from memory into f21
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f25, 0(x2) # load 0x00007bff from memory into f25
fsgnj.h f7, f21, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f7, 0(x2) # load 0x0000fe00 from memory into f7
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f3, 0(x2) # load 0x0000fbff from memory into f3
fsgnj.h f1, f7, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f20, 0(x2) # load 0x0000fe00 from memory into f20
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f15, 0(x2) # load 0x000003ff from memory into f15
fsgnj.h f23, f20, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f20, 0(x2) # load 0x0000fe00 from memory into f20
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f13, 0(x2) # load 0x000083ff from memory into f13
fsgnj.h f16, f20, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f18, 0(x2) # load 0x0000fe00 from memory into f18
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f26, 0(x2) # load 0x00000200 from memory into f26
fsgnj.h f28, f18, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f23, 0(x2) # load 0x0000fe00 from memory into f23
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f10, 0(x2) # load 0x00008200 from memory into f10
fsgnj.h f30, f23, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f8, 0(x2) # load 0x0000fe00 from memory into f8
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f24, 0(x2) # load 0x00000001 from memory into f24
fsgnj.h f23, f8, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f18, 0(x2) # load 0x0000fe00 from memory into f18
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f25, 0(x2) # load 0x00008001 from memory into f25
fsgnj.h f3, f18, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f22, 0(x2) # load 0x0000fe00 from memory into f22
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f16, 0(x2) # load 0x00007c00 from memory into f16
fsgnj.h f29, f22, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f17, 0(x2) # load 0x0000fe00 from memory into f17
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f19, 0(x2) # load 0x0000fc00 from memory into f19
fsgnj.h f21, f17, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f10, 0(x2) # load 0x0000fe00 from memory into f10
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f3, 0(x2) # load 0x00007e00 from memory into f3
fsgnj.h f19, f10, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f10, 0(x2) # load 0x0000fe00 from memory into f10
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f9, 0(x2) # load 0x00007fff from memory into f9
fsgnj.h f23, f10, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f22, 0(x2) # load 0x0000fe00 from memory into f22
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f26, 0(x2) # load 0x0000fe00 from memory into f26
fsgnj.h f2, f22, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f13, 0(x2) # load 0x0000fe00 from memory into f13
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f14, 0(x2) # load 0x00007c01 from memory into f14
fsgnj.h f27, f13, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f30, 0(x2) # load 0x0000fe00 from memory into f30
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f2, 0(x2) # load 0x00007dff from memory into f2
fsgnj.h f29, f30, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f2, 0(x2) # load 0x0000fe00 from memory into f2
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f11, 0(x2) # load 0x0000fc01 from memory into f11
fsgnj.h f8, f2, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f6, 0(x2) # load 0x0000fe00 from memory into f6
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f5, 0(x2) # load 0x000058b4 from memory into f5
fsgnj.h f24, f6, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f16, 0(x2) # load 0x0000fe00 from memory into f16
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f26, 0(x2) # load 0x0000c93a from memory into f26
fsgnj.h f2, f16, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f3, 0(x2) # load 0x00007c01 from memory into f3
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f28, 0(x2) # load 0x00000000 from memory into f28
fsgnj.h f19, f3, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f1, 0(x2) # load 0x00007c01 from memory into f1
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f26, 0(x2) # load 0x00008000 from memory into f26
fsgnj.h f9, f1, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f3, 0(x2) # load 0x00007c01 from memory into f3
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f21, 0(x2) # load 0x00003c00 from memory into f21
fsgnj.h f28, f3, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f24, 0(x2) # load 0x00007c01 from memory into f24
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f14, 0(x2) # load 0x0000bc00 from memory into f14
fsgnj.h f29, f24, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f3, 0(x2) # load 0x00007c01 from memory into f3
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f15, 0(x2) # load 0x00003e00 from memory into f15
fsgnj.h f30, f3, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f1, 0(x2) # load 0x00007c01 from memory into f1
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f26, 0(x2) # load 0x0000be00 from memory into f26
fsgnj.h f30, f1, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f27, 0(x2) # load 0x00007c01 from memory into f27
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
fsgnj.h f22, f27, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f3, 0(x2) # load 0x00007c01 from memory into f3
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f22, 0(x2) # load 0x0000c000 from memory into f22
fsgnj.h f29, f3, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f1, 0(x2) # load 0x00007c01 from memory into f1
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f16, 0(x2) # load 0x00000400 from memory into f16
fsgnj.h f15, f1, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f20, 0(x2) # load 0x00007c01 from memory into f20
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f19, 0(x2) # load 0x00008400 from memory into f19
fsgnj.h f18, f20, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f5, 0(x2) # load 0x00007c01 from memory into f5
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f21, 0(x2) # load 0x00007bff from memory into f21
fsgnj.h f31, f5, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f22, 0(x2) # load 0x00007c01 from memory into f22
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f14, 0(x2) # load 0x0000fbff from memory into f14
fsgnj.h f2, f22, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f9, 0(x2) # load 0x00007c01 from memory into f9
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f27, 0(x2) # load 0x000003ff from memory into f27
fsgnj.h f14, f9, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f13, 0(x2) # load 0x00007c01 from memory into f13
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f20, 0(x2) # load 0x000083ff from memory into f20
fsgnj.h f22, f13, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f13, 0(x2) # load 0x00007c01 from memory into f13
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f19, 0(x2) # load 0x00000200 from memory into f19
fsgnj.h f14, f13, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f20, 0(x2) # load 0x00007c01 from memory into f20
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f17, 0(x2) # load 0x00008200 from memory into f17
fsgnj.h f25, f20, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f3, 0(x2) # load 0x00007c01 from memory into f3
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f29, 0(x2) # load 0x00000001 from memory into f29
fsgnj.h f2, f3, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f1, 0(x2) # load 0x00007c01 from memory into f1
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f29, 0(x2) # load 0x00008001 from memory into f29
fsgnj.h f21, f1, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f31, 0(x2) # load 0x00007c01 from memory into f31
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f25, 0(x2) # load 0x00007c00 from memory into f25
fsgnj.h f26, f31, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f10, 0(x2) # load 0x00007c01 from memory into f10
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f28, 0(x2) # load 0x0000fc00 from memory into f28
fsgnj.h f14, f10, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f24, 0(x2) # load 0x00007c01 from memory into f24
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f27, 0(x2) # load 0x00007e00 from memory into f27
fsgnj.h f3, f24, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f28, 0(x2) # load 0x00007c01 from memory into f28
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f21, 0(x2) # load 0x00007fff from memory into f21
fsgnj.h f16, f28, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f23, 0(x2) # load 0x00007c01 from memory into f23
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f10, 0(x2) # load 0x0000fe00 from memory into f10
fsgnj.h f19, f23, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f29, 0(x2) # load 0x00007c01 from memory into f29
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f9, 0(x2) # load 0x00007c01 from memory into f9
fsgnj.h f24, f29, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f21, 0(x2) # load 0x00007c01 from memory into f21
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f5, 0(x2) # load 0x00007dff from memory into f5
fsgnj.h f12, f21, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f30, 0(x2) # load 0x00007c01 from memory into f30
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f14, 0(x2) # load 0x0000fc01 from memory into f14
fsgnj.h f29, f30, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f25, 0(x2) # load 0x00007c01 from memory into f25
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f21, 0(x2) # load 0x000058b4 from memory into f21
fsgnj.h f5, f25, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f17, 0(x2) # load 0x00007c01 from memory into f17
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f3, 0(x2) # load 0x0000c93a from memory into f3
fsgnj.h f20, f17, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f14, 0(x2) # load 0x00007dff from memory into f14
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f6, 0(x2) # load 0x00000000 from memory into f6
fsgnj.h f10, f14, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f25, 0(x2) # load 0x00007dff from memory into f25
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f24, 0(x2) # load 0x00008000 from memory into f24
fsgnj.h f18, f25, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f31, 0(x2) # load 0x00007dff from memory into f31
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f24, 0(x2) # load 0x00003c00 from memory into f24
fsgnj.h f19, f31, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f23, 0(x2) # load 0x00007dff from memory into f23
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f6, 0(x2) # load 0x0000bc00 from memory into f6
fsgnj.h f26, f23, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f17, 0(x2) # load 0x00007dff from memory into f17
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f10, 0(x2) # load 0x00003e00 from memory into f10
fsgnj.h f24, f17, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f17, 0(x2) # load 0x00007dff from memory into f17
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f3, 0(x2) # load 0x0000be00 from memory into f3
fsgnj.h f1, f17, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f22, 0(x2) # load 0x00007dff from memory into f22
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f1, 0(x2) # load 0x00004000 from memory into f1
fsgnj.h f18, f22, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f12, 0(x2) # load 0x00007dff from memory into f12
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f3, 0(x2) # load 0x0000c000 from memory into f3
fsgnj.h f1, f12, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f2, 0(x2) # load 0x00007dff from memory into f2
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f20, 0(x2) # load 0x00000400 from memory into f20
fsgnj.h f30, f2, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f10, 0(x2) # load 0x00007dff from memory into f10
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f30, 0(x2) # load 0x00008400 from memory into f30
fsgnj.h f2, f10, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f5, 0(x2) # load 0x00007dff from memory into f5
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f22, 0(x2) # load 0x00007bff from memory into f22
fsgnj.h f9, f5, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f29, 0(x2) # load 0x00007dff from memory into f29
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f31, 0(x2) # load 0x0000fbff from memory into f31
fsgnj.h f13, f29, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f5, 0(x2) # load 0x00007dff from memory into f5
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f22, 0(x2) # load 0x000003ff from memory into f22
fsgnj.h f18, f5, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f30, 0(x2) # load 0x00007dff from memory into f30
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f27, 0(x2) # load 0x000083ff from memory into f27
fsgnj.h f9, f30, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f19, 0(x2) # load 0x00007dff from memory into f19
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f27, 0(x2) # load 0x00000200 from memory into f27
fsgnj.h f8, f19, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f16, 0(x2) # load 0x00007dff from memory into f16
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f29, 0(x2) # load 0x00008200 from memory into f29
fsgnj.h f8, f16, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f12, 0(x2) # load 0x00007dff from memory into f12
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f11, 0(x2) # load 0x00000001 from memory into f11
fsgnj.h f5, f12, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f1, 0(x2) # load 0x00007dff from memory into f1
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f31, 0(x2) # load 0x00008001 from memory into f31
fsgnj.h f16, f1, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f17, 0(x2) # load 0x00007dff from memory into f17
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f1, 0(x2) # load 0x00007c00 from memory into f1
fsgnj.h f18, f17, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f30, 0(x2) # load 0x00007dff from memory into f30
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f20, 0(x2) # load 0x0000fc00 from memory into f20
fsgnj.h f23, f30, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f22, 0(x2) # load 0x00007dff from memory into f22
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f6, 0(x2) # load 0x00007e00 from memory into f6
fsgnj.h f19, f22, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f24, 0(x2) # load 0x00007dff from memory into f24
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f2, 0(x2) # load 0x00007fff from memory into f2
fsgnj.h f16, f24, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f11, 0(x2) # load 0x00007dff from memory into f11
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f13, 0(x2) # load 0x0000fe00 from memory into f13
fsgnj.h f16, f11, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f1, 0(x2) # load 0x00007dff from memory into f1
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f26, 0(x2) # load 0x00007c01 from memory into f26
fsgnj.h f6, f1, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f5, 0(x2) # load 0x00007dff from memory into f5
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f6, 0(x2) # load 0x00007dff from memory into f6
fsgnj.h f25, f5, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f3, 0(x2) # load 0x00007dff from memory into f3
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f17, 0(x2) # load 0x0000fc01 from memory into f17
fsgnj.h f25, f3, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f15, 0(x2) # load 0x00007dff from memory into f15
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f1, 0(x2) # load 0x000058b4 from memory into f1
fsgnj.h f28, f15, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f16, 0(x2) # load 0x00007dff from memory into f16
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f10, 0(x2) # load 0x0000c93a from memory into f10
fsgnj.h f7, f16, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f5, 0(x2) # load 0x0000fc01 from memory into f5
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f12, 0(x2) # load 0x00000000 from memory into f12
fsgnj.h f19, f5, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f14, 0(x2) # load 0x0000fc01 from memory into f14
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f9, 0(x2) # load 0x00008000 from memory into f9
fsgnj.h f28, f14, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f21, 0(x2) # load 0x0000fc01 from memory into f21
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f28, 0(x2) # load 0x00003c00 from memory into f28
fsgnj.h f24, f21, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f7, 0(x2) # load 0x0000fc01 from memory into f7
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f13, 0(x2) # load 0x0000bc00 from memory into f13
fsgnj.h f25, f7, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f15, 0(x2) # load 0x0000fc01 from memory into f15
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f20, 0(x2) # load 0x00003e00 from memory into f20
fsgnj.h f24, f15, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f5, 0(x2) # load 0x0000fc01 from memory into f5
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f30, 0(x2) # load 0x0000be00 from memory into f30
fsgnj.h f8, f5, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f31, 0(x2) # load 0x0000fc01 from memory into f31
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
fsgnj.h f6, f31, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f21, 0(x2) # load 0x0000fc01 from memory into f21
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f19, 0(x2) # load 0x0000c000 from memory into f19
fsgnj.h f29, f21, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f2, 0(x2) # load 0x0000fc01 from memory into f2
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f10, 0(x2) # load 0x00000400 from memory into f10
fsgnj.h f25, f2, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f6, 0(x2) # load 0x0000fc01 from memory into f6
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f22, 0(x2) # load 0x00008400 from memory into f22
fsgnj.h f10, f6, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f1, 0(x2) # load 0x0000fc01 from memory into f1
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f3, 0(x2) # load 0x00007bff from memory into f3
fsgnj.h f11, f1, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f27, 0(x2) # load 0x0000fc01 from memory into f27
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f19, 0(x2) # load 0x0000fbff from memory into f19
fsgnj.h f30, f27, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f25, 0(x2) # load 0x0000fc01 from memory into f25
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f19, 0(x2) # load 0x000003ff from memory into f19
fsgnj.h f7, f25, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f27, 0(x2) # load 0x000083ff from memory into f27
fsgnj.h f15, f23, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f12, 0(x2) # load 0x0000fc01 from memory into f12
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f15, 0(x2) # load 0x00000200 from memory into f15
fsgnj.h f19, f12, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f2, 0(x2) # load 0x0000fc01 from memory into f2
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f17, 0(x2) # load 0x00008200 from memory into f17
fsgnj.h f5, f2, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f27, 0(x2) # load 0x0000fc01 from memory into f27
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f11, 0(x2) # load 0x00000001 from memory into f11
fsgnj.h f28, f27, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f29, 0(x2) # load 0x0000fc01 from memory into f29
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f5, 0(x2) # load 0x00008001 from memory into f5
fsgnj.h f11, f29, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f11, 0(x2) # load 0x0000fc01 from memory into f11
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f31, 0(x2) # load 0x00007c00 from memory into f31
fsgnj.h f18, f11, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f9, 0(x2) # load 0x0000fc01 from memory into f9
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f12, 0(x2) # load 0x0000fc00 from memory into f12
fsgnj.h f25, f9, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f15, 0(x2) # load 0x0000fc01 from memory into f15
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f18, 0(x2) # load 0x00007e00 from memory into f18
fsgnj.h f1, f15, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f8, 0(x2) # load 0x0000fc01 from memory into f8
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f23, 0(x2) # load 0x00007fff from memory into f23
fsgnj.h f21, f8, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f6, 0(x2) # load 0x0000fe00 from memory into f6
fsgnj.h f5, f23, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f2, 0(x2) # load 0x0000fc01 from memory into f2
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f21, 0(x2) # load 0x00007c01 from memory into f21
fsgnj.h f6, f2, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f12, 0(x2) # load 0x0000fc01 from memory into f12
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f31, 0(x2) # load 0x00007dff from memory into f31
fsgnj.h f19, f12, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f28, 0(x2) # load 0x0000fc01 from memory into f28
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f5, 0(x2) # load 0x0000fc01 from memory into f5
fsgnj.h f24, f28, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f14, 0(x2) # load 0x0000fc01 from memory into f14
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f18, 0(x2) # load 0x000058b4 from memory into f18
fsgnj.h f25, f14, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f11, 0(x2) # load 0x0000fc01 from memory into f11
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f15, 0(x2) # load 0x0000c93a from memory into f15
fsgnj.h f27, f11, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f17, 0(x2) # load 0x000058b4 from memory into f17
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f22, 0(x2) # load 0x00000000 from memory into f22
fsgnj.h f27, f17, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f3, 0(x2) # load 0x000058b4 from memory into f3
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f12, 0(x2) # load 0x00008000 from memory into f12
fsgnj.h f23, f3, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f28, 0(x2) # load 0x000058b4 from memory into f28
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f18, 0(x2) # load 0x00003c00 from memory into f18
fsgnj.h f7, f28, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f10, 0(x2) # load 0x000058b4 from memory into f10
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f2, 0(x2) # load 0x0000bc00 from memory into f2
fsgnj.h f15, f10, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f21, 0(x2) # load 0x000058b4 from memory into f21
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f20, 0(x2) # load 0x00003e00 from memory into f20
fsgnj.h f11, f21, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f20, 0(x2) # load 0x000058b4 from memory into f20
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f24, 0(x2) # load 0x0000be00 from memory into f24
fsgnj.h f27, f20, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f15, 0(x2) # load 0x000058b4 from memory into f15
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f25, 0(x2) # load 0x00004000 from memory into f25
fsgnj.h f14, f15, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f22, 0(x2) # load 0x000058b4 from memory into f22
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f25, 0(x2) # load 0x0000c000 from memory into f25
fsgnj.h f16, f22, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f24, 0(x2) # load 0x000058b4 from memory into f24
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f2, 0(x2) # load 0x00000400 from memory into f2
fsgnj.h f14, f24, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f7, 0(x2) # load 0x000058b4 from memory into f7
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f2, 0(x2) # load 0x00008400 from memory into f2
fsgnj.h f20, f7, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f16, 0(x2) # load 0x000058b4 from memory into f16
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f22, 0(x2) # load 0x00007bff from memory into f22
fsgnj.h f29, f16, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f1, 0(x2) # load 0x000058b4 from memory into f1
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f18, 0(x2) # load 0x0000fbff from memory into f18
fsgnj.h f2, f1, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f1, 0(x2) # load 0x000058b4 from memory into f1
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f20, 0(x2) # load 0x000003ff from memory into f20
fsgnj.h f17, f1, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f3, 0(x2) # load 0x000058b4 from memory into f3
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f29, 0(x2) # load 0x000083ff from memory into f29
fsgnj.h f12, f3, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f24, 0(x2) # load 0x000058b4 from memory into f24
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f16, 0(x2) # load 0x00000200 from memory into f16
fsgnj.h f3, f24, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f5, 0(x2) # load 0x000058b4 from memory into f5
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f14, 0(x2) # load 0x00008200 from memory into f14
fsgnj.h f9, f5, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f13, 0(x2) # load 0x000058b4 from memory into f13
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f3, 0(x2) # load 0x00000001 from memory into f3
fsgnj.h f20, f13, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f9, 0(x2) # load 0x000058b4 from memory into f9
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f15, 0(x2) # load 0x00008001 from memory into f15
fsgnj.h f7, f9, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f22, 0(x2) # load 0x000058b4 from memory into f22
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f2, 0(x2) # load 0x00007c00 from memory into f2
fsgnj.h f31, f22, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f17, 0(x2) # load 0x000058b4 from memory into f17
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f9, 0(x2) # load 0x0000fc00 from memory into f9
fsgnj.h f28, f17, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f25, 0(x2) # load 0x000058b4 from memory into f25
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f10, 0(x2) # load 0x00007e00 from memory into f10
fsgnj.h f16, f25, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f23, 0(x2) # load 0x000058b4 from memory into f23
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f25, 0(x2) # load 0x00007fff from memory into f25
fsgnj.h f31, f23, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f23, 0(x2) # load 0x000058b4 from memory into f23
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f20, 0(x2) # load 0x0000fe00 from memory into f20
fsgnj.h f16, f23, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f14, 0(x2) # load 0x000058b4 from memory into f14
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f6, 0(x2) # load 0x00007c01 from memory into f6
fsgnj.h f19, f14, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f30, 0(x2) # load 0x000058b4 from memory into f30
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f14, 0(x2) # load 0x00007dff from memory into f14
fsgnj.h f2, f30, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f1, 0(x2) # load 0x000058b4 from memory into f1
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f19, 0(x2) # load 0x0000fc01 from memory into f19
fsgnj.h f28, f1, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f16, 0(x2) # load 0x000058b4 from memory into f16
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f20, 0(x2) # load 0x000058b4 from memory into f20
fsgnj.h f21, f16, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f21, 0(x2) # load 0x000058b4 from memory into f21
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f12, 0(x2) # load 0x0000c93a from memory into f12
fsgnj.h f5, f21, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f8, 0(x2) # load 0x0000c93a from memory into f8
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f3, 0(x2) # load 0x00000000 from memory into f3
fsgnj.h f31, f8, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f7, 0(x2) # load 0x0000c93a from memory into f7
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f22, 0(x2) # load 0x00008000 from memory into f22
fsgnj.h f14, f7, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f9, 0(x2) # load 0x0000c93a from memory into f9
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f26, 0(x2) # load 0x00003c00 from memory into f26
fsgnj.h f31, f9, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f14, 0(x2) # load 0x0000c93a from memory into f14
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f10, 0(x2) # load 0x0000bc00 from memory into f10
fsgnj.h f15, f14, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f12, 0(x2) # load 0x0000c93a from memory into f12
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f18, 0(x2) # load 0x00003e00 from memory into f18
fsgnj.h f21, f12, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f9, 0(x2) # load 0x0000c93a from memory into f9
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f2, 0(x2) # load 0x0000be00 from memory into f2
fsgnj.h f15, f9, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f21, 0(x2) # load 0x0000c93a from memory into f21
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f11, 0(x2) # load 0x00004000 from memory into f11
fsgnj.h f1, f21, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f30, 0(x2) # load 0x0000c93a from memory into f30
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f29, 0(x2) # load 0x0000c000 from memory into f29
fsgnj.h f10, f30, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f26, 0(x2) # load 0x0000c93a from memory into f26
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f11, 0(x2) # load 0x00000400 from memory into f11
fsgnj.h f6, f26, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f31, 0(x2) # load 0x0000c93a from memory into f31
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f19, 0(x2) # load 0x00008400 from memory into f19
fsgnj.h f21, f31, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f8, 0(x2) # load 0x0000c93a from memory into f8
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f23, 0(x2) # load 0x00007bff from memory into f23
fsgnj.h f12, f8, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f19, 0(x2) # load 0x0000c93a from memory into f19
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f17, 0(x2) # load 0x0000fbff from memory into f17
fsgnj.h f28, f19, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f9, 0(x2) # load 0x0000c93a from memory into f9
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f15, 0(x2) # load 0x000003ff from memory into f15
fsgnj.h f2, f9, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f11, 0(x2) # load 0x0000c93a from memory into f11
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f6, 0(x2) # load 0x000083ff from memory into f6
fsgnj.h f18, f11, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f6, 0(x2) # load 0x0000c93a from memory into f6
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f18, 0(x2) # load 0x00000200 from memory into f18
fsgnj.h f21, f6, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f9, 0(x2) # load 0x0000c93a from memory into f9
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f28, 0(x2) # load 0x00008200 from memory into f28
fsgnj.h f30, f9, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f29, 0(x2) # load 0x0000c93a from memory into f29
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f8, 0(x2) # load 0x00000001 from memory into f8
fsgnj.h f21, f29, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f12, 0(x2) # load 0x0000c93a from memory into f12
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f2, 0(x2) # load 0x00008001 from memory into f2
fsgnj.h f26, f12, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f13, 0(x2) # load 0x0000c93a from memory into f13
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f15, 0(x2) # load 0x00007c00 from memory into f15
fsgnj.h f18, f13, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f7, 0(x2) # load 0x0000c93a from memory into f7
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f11, 0(x2) # load 0x0000fc00 from memory into f11
fsgnj.h f18, f7, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f11, 0(x2) # load 0x0000c93a from memory into f11
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f20, 0(x2) # load 0x00007e00 from memory into f20
fsgnj.h f13, f11, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f17, 0(x2) # load 0x0000c93a from memory into f17
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f24, 0(x2) # load 0x00007fff from memory into f24
fsgnj.h f9, f17, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f18, 0(x2) # load 0x0000c93a from memory into f18
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f21, 0(x2) # load 0x0000fe00 from memory into f21
fsgnj.h f14, f18, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f22, 0(x2) # load 0x0000c93a from memory into f22
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f11, 0(x2) # load 0x00007c01 from memory into f11
fsgnj.h f3, f22, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f25, 0(x2) # load 0x0000c93a from memory into f25
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f5, 0(x2) # load 0x00007dff from memory into f5
fsgnj.h f15, f25, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f29, 0(x2) # load 0x0000c93a from memory into f29
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f11, 0(x2) # load 0x0000fc01 from memory into f11
fsgnj.h f6, f29, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f16, 0(x2) # load 0x0000c93a from memory into f16
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f14, 0(x2) # load 0x000058b4 from memory into f14
fsgnj.h f21, f16, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f23, 0(x2) # load 0x0000c93a from memory into f23
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f18, 0(x2) # load 0x0000c93a from memory into f18
fsgnj.h f20, f23, f18 # perform operation

# Testcase Random test for cp_NaNBox 
la x2, scratch
li x3, 0x4be72ce2 # load x3 with value 0x4be72ce2
sw x3, 0(x2) # store 0x4be72ce2 in memory
flh f8, 0(x2) # load 0x4be72ce2 from memory into f8
la x2, scratch
li x3, 0xd292d36a # load x3 with value 0xd292d36a
sw x3, 0(x2) # store 0xd292d36a in memory
flh f12, 0(x2) # load 0xd292d36a from memory into f12
fsgnj.h f23, f8, f12 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0x0 in f17)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f17, 0(x2) # load 0x00000000 from memory into f17
la x2, scratch
li x3, 0x7836ebe9 # load x3 with value 0x7836ebe9
sw x3, 0(x2) # store 0x7836ebe9 in memory
flw f3, 0(x2) # load 0x7836ebe9 from memory into f3
fsgnj.h f7, f17, f3 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xfffe8000 in f13)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfffe8000 # load x3 with value 0xfffe8000
sw x3, 0(x2) # store 0xfffe8000 in memory
flw f13, 0(x2) # load 0xfffe8000 from memory into f13
la x2, scratch
li x3, 0x31438b9f # load x3 with value 0x31438b9f
sw x3, 0(x2) # store 0x31438b9f in memory
flw f29, 0(x2) # load 0x31438b9f from memory into f29
fsgnj.h f17, f13, f29 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0x7fff3c00 in f5)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fff3c00 # load x3 with value 0x7fff3c00
sw x3, 0(x2) # store 0x7fff3c00 in memory
flw f5, 0(x2) # load 0x7fff3c00 from memory into f5
la x2, scratch
li x3, 0x9b3705c3 # load x3 with value 0x9b3705c3
sw x3, 0(x2) # store 0x9b3705c3 in memory
flw f14, 0(x2) # load 0x9b3705c3 from memory into f14
fsgnj.h f20, f5, f14 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xbeefbc00 in f9)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbeefbc00 # load x3 with value 0xbeefbc00
sw x3, 0(x2) # store 0xbeefbc00 in memory
flw f9, 0(x2) # load 0xbeefbc00 from memory into f9
la x2, scratch
li x3, 0xcbac4247 # load x3 with value 0xcbac4247
sw x3, 0(x2) # store 0xcbac4247 in memory
flw f28, 0(x2) # load 0xcbac4247 from memory into f28
fsgnj.h f3, f9, f28 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xfeff0400 in f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeff0400 # load x3 with value 0xfeff0400
sw x3, 0(x2) # store 0xfeff0400 in memory
flw f8, 0(x2) # load 0xfeff0400 from memory into f8
la x2, scratch
li x3, 0x6278cbb9 # load x3 with value 0x6278cbb9
sw x3, 0(x2) # store 0x6278cbb9 in memory
flw f3, 0(x2) # load 0x6278cbb9 from memory into f3
fsgnj.h f14, f8, f3 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xfff8400 in f2)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0fff8400 # load x3 with value 0x0fff8400
sw x3, 0(x2) # store 0x0fff8400 in memory
flw f2, 0(x2) # load 0x0fff8400 from memory into f2
la x2, scratch
li x3, 0xcdafe2be # load x3 with value 0xcdafe2be
sw x3, 0(x2) # store 0xcdafe2be in memory
flw f25, 0(x2) # load 0xcdafe2be from memory into f25
fsgnj.h f14, f2, f25 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xefff7bff in f12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xefff7bff # load x3 with value 0xefff7bff
sw x3, 0(x2) # store 0xefff7bff in memory
flw f12, 0(x2) # load 0xefff7bff from memory into f12
la x2, scratch
li x3, 0xa8f92ba6 # load x3 with value 0xa8f92ba6
sw x3, 0(x2) # store 0xa8f92ba6 in memory
flw f1, 0(x2) # load 0xa8f92ba6 from memory into f1
fsgnj.h f3, f12, f1 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xc0defbff in f27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc0defbff # load x3 with value 0xc0defbff
sw x3, 0(x2) # store 0xc0defbff in memory
flw f27, 0(x2) # load 0xc0defbff from memory into f27
la x2, scratch
li x3, 0x64614f29 # load x3 with value 0x64614f29
sw x3, 0(x2) # store 0x64614f29 in memory
flw f21, 0(x2) # load 0x64614f29 from memory into f21
fsgnj.h f12, f27, f21 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0x4f1a7c00 in f23)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4f1a7c00 # load x3 with value 0x4f1a7c00
sw x3, 0(x2) # store 0x4f1a7c00 in memory
flw f23, 0(x2) # load 0x4f1a7c00 from memory into f23
la x2, scratch
li x3, 0x7a8707f0 # load x3 with value 0x7a8707f0
sw x3, 0(x2) # store 0x7a8707f0 in memory
flw f15, 0(x2) # load 0x7a8707f0 from memory into f15
fsgnj.h f21, f23, f15 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xffffc00 in f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0ffffc00 # load x3 with value 0x0ffffc00
sw x3, 0(x2) # store 0x0ffffc00 in memory
flw f31, 0(x2) # load 0x0ffffc00 from memory into f31
la x2, scratch
li x3, 0x1f3a435e # load x3 with value 0x1f3a435e
sw x3, 0(x2) # store 0x1f3a435e in memory
flw f10, 0(x2) # load 0x1f3a435e from memory into f10
fsgnj.h f22, f31, f10 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xffef7e00 in f29)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffef7e00 # load x3 with value 0xffef7e00
sw x3, 0(x2) # store 0xffef7e00 in memory
flw f29, 0(x2) # load 0xffef7e00 from memory into f29
la x2, scratch
li x3, 0x83433ddd # load x3 with value 0x83433ddd
sw x3, 0(x2) # store 0x83433ddd in memory
flw f8, 0(x2) # load 0x83433ddd from memory into f8
fsgnj.h f21, f29, f8 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xfeef7fff in f3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeef7fff # load x3 with value 0xfeef7fff
sw x3, 0(x2) # store 0xfeef7fff in memory
flw f3, 0(x2) # load 0xfeef7fff from memory into f3
la x2, scratch
li x3, 0x4b12d4dc # load x3 with value 0x4b12d4dc
sw x3, 0(x2) # store 0x4b12d4dc in memory
flw f27, 0(x2) # load 0x4b12d4dc from memory into f27
fsgnj.h f26, f3, f27 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xa1b27c01 in f11)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa1b27c01 # load x3 with value 0xa1b27c01
sw x3, 0(x2) # store 0xa1b27c01 in memory
flw f11, 0(x2) # load 0xa1b27c01 from memory into f11
la x2, scratch
li x3, 0x4f2c4d11 # load x3 with value 0x4f2c4d11
sw x3, 0(x2) # store 0x4f2c4d11 in memory
flw f24, 0(x2) # load 0x4f2c4d11 from memory into f24
fsgnj.h f16, f11, f24 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0x4fd77dff in f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4fd77dff # load x3 with value 0x4fd77dff
sw x3, 0(x2) # store 0x4fd77dff in memory
flw f31, 0(x2) # load 0x4fd77dff from memory into f31
la x2, scratch
li x3, 0x14cb7c7c # load x3 with value 0x14cb7c7c
sw x3, 0(x2) # store 0x14cb7c7c in memory
flw f28, 0(x2) # load 0x14cb7c7c from memory into f28
fsgnj.h f11, f31, f28 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x0)
la x2, scratch
li x3, 0xced1c004 # load x3 with value 0xced1c004
sw x3, 0(x2) # store 0xced1c004 in memory
flw f31, 0(x2) # load 0xced1c004 from memory into f31
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f20, 0(x2) # load 0x00000000 from memory into f20
fsgnj.h f12, f31, f20 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfffe8000)
la x2, scratch
li x3, 0x1e267169 # load x3 with value 0x1e267169
sw x3, 0(x2) # store 0x1e267169 in memory
flw f15, 0(x2) # load 0x1e267169 from memory into f15
la x2, scratch
li x3, 0xfffe8000 # load x3 with value 0xfffe8000
sw x3, 0(x2) # store 0xfffe8000 in memory
flw f5, 0(x2) # load 0xfffe8000 from memory into f5
fsgnj.h f28, f15, f5 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7fff3c00)
la x2, scratch
li x3, 0x2f3b05f9 # load x3 with value 0x2f3b05f9
sw x3, 0(x2) # store 0x2f3b05f9 in memory
flw f20, 0(x2) # load 0x2f3b05f9 from memory into f20
la x2, scratch
li x3, 0x7fff3c00 # load x3 with value 0x7fff3c00
sw x3, 0(x2) # store 0x7fff3c00 in memory
flw f22, 0(x2) # load 0x7fff3c00 from memory into f22
fsgnj.h f12, f20, f22 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xbeefbc00)
la x2, scratch
li x3, 0x6dc2f94d # load x3 with value 0x6dc2f94d
sw x3, 0(x2) # store 0x6dc2f94d in memory
flw f20, 0(x2) # load 0x6dc2f94d from memory into f20
la x2, scratch
li x3, 0xbeefbc00 # load x3 with value 0xbeefbc00
sw x3, 0(x2) # store 0xbeefbc00 in memory
flw f6, 0(x2) # load 0xbeefbc00 from memory into f6
fsgnj.h f14, f20, f6 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfeff0400)
la x2, scratch
li x3, 0x3b620f08 # load x3 with value 0x3b620f08
sw x3, 0(x2) # store 0x3b620f08 in memory
flw f16, 0(x2) # load 0x3b620f08 from memory into f16
la x2, scratch
li x3, 0xfeff0400 # load x3 with value 0xfeff0400
sw x3, 0(x2) # store 0xfeff0400 in memory
flw f6, 0(x2) # load 0xfeff0400 from memory into f6
fsgnj.h f1, f16, f6 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfff8400)
la x2, scratch
li x3, 0x13c9984f # load x3 with value 0x13c9984f
sw x3, 0(x2) # store 0x13c9984f in memory
flw f15, 0(x2) # load 0x13c9984f from memory into f15
la x2, scratch
li x3, 0x0fff8400 # load x3 with value 0x0fff8400
sw x3, 0(x2) # store 0x0fff8400 in memory
flw f3, 0(x2) # load 0x0fff8400 from memory into f3
fsgnj.h f21, f15, f3 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xefff7bff)
la x2, scratch
li x3, 0x1950e7f1 # load x3 with value 0x1950e7f1
sw x3, 0(x2) # store 0x1950e7f1 in memory
flw f1, 0(x2) # load 0x1950e7f1 from memory into f1
la x2, scratch
li x3, 0xefff7bff # load x3 with value 0xefff7bff
sw x3, 0(x2) # store 0xefff7bff in memory
flw f29, 0(x2) # load 0xefff7bff from memory into f29
fsgnj.h f20, f1, f29 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xc0defbff)
la x2, scratch
li x3, 0xbc41076a # load x3 with value 0xbc41076a
sw x3, 0(x2) # store 0xbc41076a in memory
flw f28, 0(x2) # load 0xbc41076a from memory into f28
la x2, scratch
li x3, 0xc0defbff # load x3 with value 0xc0defbff
sw x3, 0(x2) # store 0xc0defbff in memory
flw f5, 0(x2) # load 0xc0defbff from memory into f5
fsgnj.h f1, f28, f5 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x4f1a7c00)
la x2, scratch
li x3, 0xd3ae86c7 # load x3 with value 0xd3ae86c7
sw x3, 0(x2) # store 0xd3ae86c7 in memory
flw f17, 0(x2) # load 0xd3ae86c7 from memory into f17
la x2, scratch
li x3, 0x4f1a7c00 # load x3 with value 0x4f1a7c00
sw x3, 0(x2) # store 0x4f1a7c00 in memory
flw f23, 0(x2) # load 0x4f1a7c00 from memory into f23
fsgnj.h f29, f17, f23 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xffffc00)
la x2, scratch
li x3, 0x973306af # load x3 with value 0x973306af
sw x3, 0(x2) # store 0x973306af in memory
flw f21, 0(x2) # load 0x973306af from memory into f21
la x2, scratch
li x3, 0x0ffffc00 # load x3 with value 0x0ffffc00
sw x3, 0(x2) # store 0x0ffffc00 in memory
flw f10, 0(x2) # load 0x0ffffc00 from memory into f10
fsgnj.h f15, f21, f10 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xffef7e00)
la x2, scratch
li x3, 0x266aea7e # load x3 with value 0x266aea7e
sw x3, 0(x2) # store 0x266aea7e in memory
flw f15, 0(x2) # load 0x266aea7e from memory into f15
la x2, scratch
li x3, 0xffef7e00 # load x3 with value 0xffef7e00
sw x3, 0(x2) # store 0xffef7e00 in memory
flw f7, 0(x2) # load 0xffef7e00 from memory into f7
fsgnj.h f25, f15, f7 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfeef7fff)
la x2, scratch
li x3, 0xbec9d234 # load x3 with value 0xbec9d234
sw x3, 0(x2) # store 0xbec9d234 in memory
flw f10, 0(x2) # load 0xbec9d234 from memory into f10
la x2, scratch
li x3, 0xfeef7fff # load x3 with value 0xfeef7fff
sw x3, 0(x2) # store 0xfeef7fff in memory
flw f28, 0(x2) # load 0xfeef7fff from memory into f28
fsgnj.h f12, f10, f28 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xa1b27c01)
la x2, scratch
li x3, 0x0fee28c6 # load x3 with value 0x0fee28c6
sw x3, 0(x2) # store 0x0fee28c6 in memory
flw f21, 0(x2) # load 0x0fee28c6 from memory into f21
la x2, scratch
li x3, 0xa1b27c01 # load x3 with value 0xa1b27c01
sw x3, 0(x2) # store 0xa1b27c01 in memory
flw f12, 0(x2) # load 0xa1b27c01 from memory into f12
fsgnj.h f27, f21, f12 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x4fd77dff)
la x2, scratch
li x3, 0x721be5f9 # load x3 with value 0x721be5f9
sw x3, 0(x2) # store 0x721be5f9 in memory
flw f6, 0(x2) # load 0x721be5f9 from memory into f6
la x2, scratch
li x3, 0x4fd77dff # load x3 with value 0x4fd77dff
sw x3, 0(x2) # store 0x4fd77dff in memory
flw f22, 0(x2) # load 0x4fd77dff from memory into f22
fsgnj.h f1, f6, f22 # perform operation

#.EQU SIGSIZE,0


// ******************
// Tests from: WALLY-COV-fcvt.wu.h.S
// ******************


# initialize signature pointer
la x4, begin_signature

    
# set mstatus.FS to 01 to enable fp
li t0,0x4000
csrs mstatus, t0


# Testcase cp_rd (Test destination rd = x0)
la x2, scratch
li x3, 0x070adc26 # load x3 with value 0x070adc26
sw x3, 0(x2) # store 0x070adc26 in memory
flh f31, 0(x2) # load 0x070adc26 from memory into f31
fcvt.wu.h x0, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x0, 0)

# Testcase cp_rd (Test destination rd = x1)
la x2, scratch
li x3, 0xa6b6200c # load x3 with value 0xa6b6200c
sw x3, 0(x2) # store 0xa6b6200c in memory
flh f3, 0(x2) # load 0xa6b6200c from memory into f3
fcvt.wu.h x1, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 4)

# Testcase cp_rd (Test destination rd = x2)
la x2, scratch
li x3, 0x8c535149 # load x3 with value 0x8c535149
sw x3, 0(x2) # store 0x8c535149 in memory
flh f5, 0(x2) # load 0x8c535149 from memory into f5
fcvt.wu.h x2, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 8)

# Testcase cp_rd (Test destination rd = x3)
la x2, scratch
li x3, 0x5f84560f # load x3 with value 0x5f84560f
sw x3, 0(x2) # store 0x5f84560f in memory
flh f24, 0(x2) # load 0x5f84560f from memory into f24
fcvt.wu.h x3, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 12)

# Testcase cp_rd (Test destination rd = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x207912f7 # load x3 with value 0x207912f7
sw x3, 0(x2) # store 0x207912f7 in memory
flh f13, 0(x2) # load 0x207912f7 from memory into f13
fcvt.wu.h x4, f13 # perform operation
RVTEST_SIGUPD(x5, x0, x4, 16)

# Testcase cp_rd (Test destination rd = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xa4a6a098 # load x3 with value 0xa4a6a098
sw x3, 0(x2) # store 0xa4a6a098 in memory
flh f28, 0(x2) # load 0xa4a6a098 from memory into f28
fcvt.wu.h x5, f28 # perform operation
RVTEST_SIGUPD(x6, x0, x5, 20)

# Testcase cp_rd (Test destination rd = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x90f271e1 # load x3 with value 0x90f271e1
sw x3, 0(x2) # store 0x90f271e1 in memory
flh f30, 0(x2) # load 0x90f271e1 from memory into f30
fcvt.wu.h x6, f30 # perform operation
RVTEST_SIGUPD(x7, x0, x6, 24)

# Testcase cp_rd (Test destination rd = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x6469d148 # load x3 with value 0x6469d148
sw x3, 0(x2) # store 0x6469d148 in memory
flh f16, 0(x2) # load 0x6469d148 from memory into f16
fcvt.wu.h x7, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 28)

# Testcase cp_rd (Test destination rd = x8)
la x2, scratch
li x3, 0x75ef24d0 # load x3 with value 0x75ef24d0
sw x3, 0(x2) # store 0x75ef24d0 in memory
flh f15, 0(x2) # load 0x75ef24d0 from memory into f15
fcvt.wu.h x8, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 32)

# Testcase cp_rd (Test destination rd = x9)
la x2, scratch
li x3, 0x955a4a72 # load x3 with value 0x955a4a72
sw x3, 0(x2) # store 0x955a4a72 in memory
flh f15, 0(x2) # load 0x955a4a72 from memory into f15
fcvt.wu.h x9, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 36)

# Testcase cp_rd (Test destination rd = x10)
la x2, scratch
li x3, 0xd326a6c5 # load x3 with value 0xd326a6c5
sw x3, 0(x2) # store 0xd326a6c5 in memory
flh f11, 0(x2) # load 0xd326a6c5 from memory into f11
fcvt.wu.h x10, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 40)

# Testcase cp_rd (Test destination rd = x11)
la x2, scratch
li x3, 0x91908eaa # load x3 with value 0x91908eaa
sw x3, 0(x2) # store 0x91908eaa in memory
flh f2, 0(x2) # load 0x91908eaa from memory into f2
fcvt.wu.h x11, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 44)

# Testcase cp_rd (Test destination rd = x12)
la x2, scratch
li x3, 0x2c15d52e # load x3 with value 0x2c15d52e
sw x3, 0(x2) # store 0x2c15d52e in memory
flh f25, 0(x2) # load 0x2c15d52e from memory into f25
fcvt.wu.h x12, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 48)

# Testcase cp_rd (Test destination rd = x13)
la x2, scratch
li x3, 0x8f66cb61 # load x3 with value 0x8f66cb61
sw x3, 0(x2) # store 0x8f66cb61 in memory
flh f10, 0(x2) # load 0x8f66cb61 from memory into f10
fcvt.wu.h x13, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 52)

# Testcase cp_rd (Test destination rd = x14)
la x2, scratch
li x3, 0x1f4759e1 # load x3 with value 0x1f4759e1
sw x3, 0(x2) # store 0x1f4759e1 in memory
flh f15, 0(x2) # load 0x1f4759e1 from memory into f15
fcvt.wu.h x14, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 56)

# Testcase cp_rd (Test destination rd = x15)
la x2, scratch
li x3, 0xb1afebb1 # load x3 with value 0xb1afebb1
sw x3, 0(x2) # store 0xb1afebb1 in memory
flh f9, 0(x2) # load 0xb1afebb1 from memory into f9
fcvt.wu.h x15, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 60)

# Testcase cp_rd (Test destination rd = x16)
la x2, scratch
li x3, 0xc95f7f95 # load x3 with value 0xc95f7f95
sw x3, 0(x2) # store 0xc95f7f95 in memory
flh f12, 0(x2) # load 0xc95f7f95 from memory into f12
fcvt.wu.h x16, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 64)

# Testcase cp_rd (Test destination rd = x17)
la x2, scratch
li x3, 0xca0bb91e # load x3 with value 0xca0bb91e
sw x3, 0(x2) # store 0xca0bb91e in memory
flh f31, 0(x2) # load 0xca0bb91e from memory into f31
fcvt.wu.h x17, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 68)

# Testcase cp_rd (Test destination rd = x18)
la x2, scratch
li x3, 0x405fde4f # load x3 with value 0x405fde4f
sw x3, 0(x2) # store 0x405fde4f in memory
flh f28, 0(x2) # load 0x405fde4f from memory into f28
fcvt.wu.h x18, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 72)

# Testcase cp_rd (Test destination rd = x19)
la x2, scratch
li x3, 0x31167abf # load x3 with value 0x31167abf
sw x3, 0(x2) # store 0x31167abf in memory
flh f1, 0(x2) # load 0x31167abf from memory into f1
fcvt.wu.h x19, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 76)

# Testcase cp_rd (Test destination rd = x20)
la x2, scratch
li x3, 0xaaa94207 # load x3 with value 0xaaa94207
sw x3, 0(x2) # store 0xaaa94207 in memory
flh f22, 0(x2) # load 0xaaa94207 from memory into f22
fcvt.wu.h x20, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 80)

# Testcase cp_rd (Test destination rd = x21)
la x2, scratch
li x3, 0xaadf9b69 # load x3 with value 0xaadf9b69
sw x3, 0(x2) # store 0xaadf9b69 in memory
flh f6, 0(x2) # load 0xaadf9b69 from memory into f6
fcvt.wu.h x21, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 84)

# Testcase cp_rd (Test destination rd = x22)
la x2, scratch
li x3, 0x10c21cc1 # load x3 with value 0x10c21cc1
sw x3, 0(x2) # store 0x10c21cc1 in memory
flh f2, 0(x2) # load 0x10c21cc1 from memory into f2
fcvt.wu.h x22, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 88)

# Testcase cp_rd (Test destination rd = x23)
la x2, scratch
li x3, 0x70c83133 # load x3 with value 0x70c83133
sw x3, 0(x2) # store 0x70c83133 in memory
flh f21, 0(x2) # load 0x70c83133 from memory into f21
fcvt.wu.h x23, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 92)

# Testcase cp_rd (Test destination rd = x24)
la x2, scratch
li x3, 0x586ffcd1 # load x3 with value 0x586ffcd1
sw x3, 0(x2) # store 0x586ffcd1 in memory
flh f14, 0(x2) # load 0x586ffcd1 from memory into f14
fcvt.wu.h x24, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 96)

# Testcase cp_rd (Test destination rd = x25)
la x2, scratch
li x3, 0x3748b37d # load x3 with value 0x3748b37d
sw x3, 0(x2) # store 0x3748b37d in memory
flh f15, 0(x2) # load 0x3748b37d from memory into f15
fcvt.wu.h x25, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 100)

# Testcase cp_rd (Test destination rd = x26)
la x2, scratch
li x3, 0x9228b717 # load x3 with value 0x9228b717
sw x3, 0(x2) # store 0x9228b717 in memory
flh f20, 0(x2) # load 0x9228b717 from memory into f20
fcvt.wu.h x26, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 104)

# Testcase cp_rd (Test destination rd = x27)
la x2, scratch
li x3, 0x1c26fb8c # load x3 with value 0x1c26fb8c
sw x3, 0(x2) # store 0x1c26fb8c in memory
flh f2, 0(x2) # load 0x1c26fb8c from memory into f2
fcvt.wu.h x27, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 108)

# Testcase cp_rd (Test destination rd = x28)
la x2, scratch
li x3, 0x1b638f79 # load x3 with value 0x1b638f79
sw x3, 0(x2) # store 0x1b638f79 in memory
flh f15, 0(x2) # load 0x1b638f79 from memory into f15
fcvt.wu.h x28, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 112)

# Testcase cp_rd (Test destination rd = x29)
la x2, scratch
li x3, 0x03147d04 # load x3 with value 0x03147d04
sw x3, 0(x2) # store 0x03147d04 in memory
flh f26, 0(x2) # load 0x03147d04 from memory into f26
fcvt.wu.h x29, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 116)

# Testcase cp_rd (Test destination rd = x30)
la x2, scratch
li x3, 0x71549493 # load x3 with value 0x71549493
sw x3, 0(x2) # store 0x71549493 in memory
flh f24, 0(x2) # load 0x71549493 from memory into f24
fcvt.wu.h x30, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 120)

# Testcase cp_rd (Test destination rd = x31)
la x2, scratch
li x3, 0x37148dfb # load x3 with value 0x37148dfb
sw x3, 0(x2) # store 0x37148dfb in memory
flh f23, 0(x2) # load 0x37148dfb from memory into f23
fcvt.wu.h x31, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 124)

# Testcase cp_gpr/fpr_hazard nohaz test
add x7, x28, x12 # perform first operation
fcvt.wu.h x14, f6 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x25, x19, x23 # perform first operation
fcvt.wu.h x1, f21 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x16, x19, x20 # perform first operation
fcvt.wu.h x8, f31 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
fmul.s f21, f27, f12 # perform first operation
fcvt.wu.h x14, f21 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x30, x17, x23 # perform first operation
fcvt.wu.h x19, f27 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x30, x7, x13 # perform first operation
fcvt.wu.h x30, f9 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x2, x8, x18 # perform first operation
fcvt.wu.h x7, f20 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x30, x7, x18 # perform first operation
fcvt.wu.h x16, f22 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x23, x30, x17 # perform first operation
fcvt.wu.h x31, f19 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x10, x22, x21 # perform first operation
fcvt.wu.h x10, f8 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x3, x8, x20 # perform first operation
fcvt.wu.h x3, f21 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x8, x29, x10 # perform first operation
fcvt.wu.h x8, f17 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x9, x25, x15 # perform first operation
fcvt.wu.h x25, f1 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x21, x3, x20 # perform first operation
fcvt.wu.h x20, f19 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x12, x7, x8 # perform first operation
fcvt.wu.h x28, f10 # perform second (triggering) operation

# Testcase cp_fs1 (Test source fs1 = f0)
la x2, scratch
li x3, 0x88edf02e # load x3 with value 0x88edf02e
sw x3, 0(x2) # store 0x88edf02e in memory
flh f0, 0(x2) # load 0x88edf02e from memory into f0
fcvt.wu.h x7, f0 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 128)

# Testcase cp_fs1 (Test source fs1 = f1)
la x2, scratch
li x3, 0x8ce99415 # load x3 with value 0x8ce99415
sw x3, 0(x2) # store 0x8ce99415 in memory
flh f1, 0(x2) # load 0x8ce99415 from memory into f1
fcvt.wu.h x24, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 132)

# Testcase cp_fs1 (Test source fs1 = f2)
la x2, scratch
li x3, 0x19e8b647 # load x3 with value 0x19e8b647
sw x3, 0(x2) # store 0x19e8b647 in memory
flh f2, 0(x2) # load 0x19e8b647 from memory into f2
fcvt.wu.h x16, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 136)

# Testcase cp_fs1 (Test source fs1 = f3)
la x2, scratch
li x3, 0x61d69aea # load x3 with value 0x61d69aea
sw x3, 0(x2) # store 0x61d69aea in memory
flh f3, 0(x2) # load 0x61d69aea from memory into f3
fcvt.wu.h x14, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 140)

# Testcase cp_fs1 (Test source fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x063f3828 # load x3 with value 0x063f3828
sw x3, 0(x2) # store 0x063f3828 in memory
flh f4, 0(x2) # load 0x063f3828 from memory into f4
fcvt.wu.h x24, f4 # perform operation
RVTEST_SIGUPD(x5, x0, x24, 144)

# Testcase cp_fs1 (Test source fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x322dbc19 # load x3 with value 0x322dbc19
sw x3, 0(x2) # store 0x322dbc19 in memory
flh f5, 0(x2) # load 0x322dbc19 from memory into f5
fcvt.wu.h x28, f5 # perform operation
RVTEST_SIGUPD(x6, x0, x28, 148)

# Testcase cp_fs1 (Test source fs1 = f6)
mv x4, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x5100757d # load x3 with value 0x5100757d
sw x3, 0(x2) # store 0x5100757d in memory
flh f6, 0(x2) # load 0x5100757d from memory into f6
fcvt.wu.h x7, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 152)

# Testcase cp_fs1 (Test source fs1 = f7)
la x2, scratch
li x3, 0x698ac44b # load x3 with value 0x698ac44b
sw x3, 0(x2) # store 0x698ac44b in memory
flh f7, 0(x2) # load 0x698ac44b from memory into f7
fcvt.wu.h x18, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 156)

# Testcase cp_fs1 (Test source fs1 = f8)
la x2, scratch
li x3, 0xb140c643 # load x3 with value 0xb140c643
sw x3, 0(x2) # store 0xb140c643 in memory
flh f8, 0(x2) # load 0xb140c643 from memory into f8
fcvt.wu.h x27, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 160)

# Testcase cp_fs1 (Test source fs1 = f9)
la x2, scratch
li x3, 0x1a51b1fc # load x3 with value 0x1a51b1fc
sw x3, 0(x2) # store 0x1a51b1fc in memory
flh f9, 0(x2) # load 0x1a51b1fc from memory into f9
fcvt.wu.h x14, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 164)

# Testcase cp_fs1 (Test source fs1 = f10)
la x2, scratch
li x3, 0xafeb6bbe # load x3 with value 0xafeb6bbe
sw x3, 0(x2) # store 0xafeb6bbe in memory
flh f10, 0(x2) # load 0xafeb6bbe from memory into f10
fcvt.wu.h x13, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 168)

# Testcase cp_fs1 (Test source fs1 = f11)
la x2, scratch
li x3, 0x9cb3a4d8 # load x3 with value 0x9cb3a4d8
sw x3, 0(x2) # store 0x9cb3a4d8 in memory
flh f11, 0(x2) # load 0x9cb3a4d8 from memory into f11
fcvt.wu.h x25, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 172)

# Testcase cp_fs1 (Test source fs1 = f12)
la x2, scratch
li x3, 0x103467cb # load x3 with value 0x103467cb
sw x3, 0(x2) # store 0x103467cb in memory
flh f12, 0(x2) # load 0x103467cb from memory into f12
fcvt.wu.h x30, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 176)

# Testcase cp_fs1 (Test source fs1 = f13)
la x2, scratch
li x3, 0xe8d1cdd7 # load x3 with value 0xe8d1cdd7
sw x3, 0(x2) # store 0xe8d1cdd7 in memory
flh f13, 0(x2) # load 0xe8d1cdd7 from memory into f13
fcvt.wu.h x16, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 180)

# Testcase cp_fs1 (Test source fs1 = f14)
la x2, scratch
li x3, 0xf88edf21 # load x3 with value 0xf88edf21
sw x3, 0(x2) # store 0xf88edf21 in memory
flh f14, 0(x2) # load 0xf88edf21 from memory into f14
fcvt.wu.h x21, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 184)

# Testcase cp_fs1 (Test source fs1 = f15)
la x2, scratch
li x3, 0x1fc4bf4f # load x3 with value 0x1fc4bf4f
sw x3, 0(x2) # store 0x1fc4bf4f in memory
flh f15, 0(x2) # load 0x1fc4bf4f from memory into f15
fcvt.wu.h x27, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 188)

# Testcase cp_fs1 (Test source fs1 = f16)
la x2, scratch
li x3, 0xed52c1d5 # load x3 with value 0xed52c1d5
sw x3, 0(x2) # store 0xed52c1d5 in memory
flh f16, 0(x2) # load 0xed52c1d5 from memory into f16
fcvt.wu.h x26, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 192)

# Testcase cp_fs1 (Test source fs1 = f17)
la x2, scratch
li x3, 0x18c7f631 # load x3 with value 0x18c7f631
sw x3, 0(x2) # store 0x18c7f631 in memory
flh f17, 0(x2) # load 0x18c7f631 from memory into f17
fcvt.wu.h x2, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 196)

# Testcase cp_fs1 (Test source fs1 = f18)
la x2, scratch
li x3, 0xfa207b2e # load x3 with value 0xfa207b2e
sw x3, 0(x2) # store 0xfa207b2e in memory
flh f18, 0(x2) # load 0xfa207b2e from memory into f18
fcvt.wu.h x18, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 200)

# Testcase cp_fs1 (Test source fs1 = f19)
la x2, scratch
li x3, 0xc148b1ba # load x3 with value 0xc148b1ba
sw x3, 0(x2) # store 0xc148b1ba in memory
flh f19, 0(x2) # load 0xc148b1ba from memory into f19
fcvt.wu.h x22, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 204)

# Testcase cp_fs1 (Test source fs1 = f20)
la x2, scratch
li x3, 0x05244ffb # load x3 with value 0x05244ffb
sw x3, 0(x2) # store 0x05244ffb in memory
flh f20, 0(x2) # load 0x05244ffb from memory into f20
fcvt.wu.h x11, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 208)

# Testcase cp_fs1 (Test source fs1 = f21)
la x2, scratch
li x3, 0xa9ae4e05 # load x3 with value 0xa9ae4e05
sw x3, 0(x2) # store 0xa9ae4e05 in memory
flh f21, 0(x2) # load 0xa9ae4e05 from memory into f21
fcvt.wu.h x26, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 212)

# Testcase cp_fs1 (Test source fs1 = f22)
la x2, scratch
li x3, 0xb3371b3a # load x3 with value 0xb3371b3a
sw x3, 0(x2) # store 0xb3371b3a in memory
flh f22, 0(x2) # load 0xb3371b3a from memory into f22
fcvt.wu.h x13, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 216)

# Testcase cp_fs1 (Test source fs1 = f23)
la x2, scratch
li x3, 0x5f2629d1 # load x3 with value 0x5f2629d1
sw x3, 0(x2) # store 0x5f2629d1 in memory
flh f23, 0(x2) # load 0x5f2629d1 from memory into f23
fcvt.wu.h x8, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 220)

# Testcase cp_fs1 (Test source fs1 = f24)
la x2, scratch
li x3, 0xb13e4a0d # load x3 with value 0xb13e4a0d
sw x3, 0(x2) # store 0xb13e4a0d in memory
flh f24, 0(x2) # load 0xb13e4a0d from memory into f24
fcvt.wu.h x11, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 224)

# Testcase cp_fs1 (Test source fs1 = f25)
la x2, scratch
li x3, 0x266f6665 # load x3 with value 0x266f6665
sw x3, 0(x2) # store 0x266f6665 in memory
flh f25, 0(x2) # load 0x266f6665 from memory into f25
fcvt.wu.h x3, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 228)

# Testcase cp_fs1 (Test source fs1 = f26)
la x2, scratch
li x3, 0x2a2fd30d # load x3 with value 0x2a2fd30d
sw x3, 0(x2) # store 0x2a2fd30d in memory
flh f26, 0(x2) # load 0x2a2fd30d from memory into f26
fcvt.wu.h x29, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 232)

# Testcase cp_fs1 (Test source fs1 = f27)
la x2, scratch
li x3, 0xf77460fe # load x3 with value 0xf77460fe
sw x3, 0(x2) # store 0xf77460fe in memory
flh f27, 0(x2) # load 0xf77460fe from memory into f27
fcvt.wu.h x26, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 236)

# Testcase cp_fs1 (Test source fs1 = f28)
la x2, scratch
li x3, 0x69deb5d6 # load x3 with value 0x69deb5d6
sw x3, 0(x2) # store 0x69deb5d6 in memory
flh f28, 0(x2) # load 0x69deb5d6 from memory into f28
fcvt.wu.h x11, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 240)

# Testcase cp_fs1 (Test source fs1 = f29)
la x2, scratch
li x3, 0x8bf0ebda # load x3 with value 0x8bf0ebda
sw x3, 0(x2) # store 0x8bf0ebda in memory
flh f29, 0(x2) # load 0x8bf0ebda from memory into f29
fcvt.wu.h x3, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 244)

# Testcase cp_fs1 (Test source fs1 = f30)
la x2, scratch
li x3, 0x2c04456f # load x3 with value 0x2c04456f
sw x3, 0(x2) # store 0x2c04456f in memory
flh f30, 0(x2) # load 0x2c04456f from memory into f30
fcvt.wu.h x8, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 248)

# Testcase cp_fs1 (Test source fs1 = f31)
la x2, scratch
li x3, 0x501f0ce0 # load x3 with value 0x501f0ce0
sw x3, 0(x2) # store 0x501f0ce0 in memory
flh f31, 0(x2) # load 0x501f0ce0 from memory into f31
fcvt.wu.h x31, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 252)

# Testcase cp_fs1_corners (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f3, 0(x2) # load 0x00000000 from memory into f3
fcvt.wu.h x15, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 256)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f6, 0(x2) # load 0x00008000 from memory into f6
fcvt.wu.h x12, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 260)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f1, 0(x2) # load 0x00003c00 from memory into f1
fcvt.wu.h x29, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 264)

# Testcase cp_fs1_corners (Test source fs1 value = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f10, 0(x2) # load 0x0000bc00 from memory into f10
fcvt.wu.h x23, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 268)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f29, 0(x2) # load 0x00003e00 from memory into f29
fcvt.wu.h x1, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 272)

# Testcase cp_fs1_corners (Test source fs1 value = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f8, 0(x2) # load 0x0000be00 from memory into f8
fcvt.wu.h x31, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 276)

# Testcase cp_fs1_corners (Test source fs1 value = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f18, 0(x2) # load 0x00004000 from memory into f18
fcvt.wu.h x10, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 280)

# Testcase cp_fs1_corners (Test source fs1 value = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f1, 0(x2) # load 0x0000c000 from memory into f1
fcvt.wu.h x13, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 284)

# Testcase cp_fs1_corners (Test source fs1 value = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f23, 0(x2) # load 0x00000400 from memory into f23
fcvt.wu.h x28, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 288)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f5, 0(x2) # load 0x00008400 from memory into f5
fcvt.wu.h x24, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 292)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f20, 0(x2) # load 0x00007bff from memory into f20
fcvt.wu.h x10, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 296)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f19, 0(x2) # load 0x0000fbff from memory into f19
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 300)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f31, 0(x2) # load 0x000003ff from memory into f31
fcvt.wu.h x1, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 304)

# Testcase cp_fs1_corners (Test source fs1 value = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f26, 0(x2) # load 0x000083ff from memory into f26
fcvt.wu.h x13, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 308)

# Testcase cp_fs1_corners (Test source fs1 value = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f16, 0(x2) # load 0x00000200 from memory into f16
fcvt.wu.h x7, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 312)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f17, 0(x2) # load 0x00008200 from memory into f17
fcvt.wu.h x5, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 316)

# Testcase cp_fs1_corners (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f22, 0(x2) # load 0x00000001 from memory into f22
fcvt.wu.h x3, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 320)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f31, 0(x2) # load 0x00008001 from memory into f31
fcvt.wu.h x8, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 324)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f23, 0(x2) # load 0x00007c00 from memory into f23
fcvt.wu.h x31, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 328)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f16, 0(x2) # load 0x0000fc00 from memory into f16
fcvt.wu.h x23, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 332)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f22, 0(x2) # load 0x00007e00 from memory into f22
fcvt.wu.h x30, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 336)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f5, 0(x2) # load 0x00007fff from memory into f5
fcvt.wu.h x12, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 340)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f22, 0(x2) # load 0x0000fe00 from memory into f22
fcvt.wu.h x19, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 344)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f12, 0(x2) # load 0x00007c01 from memory into f12
fcvt.wu.h x2, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 348)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f27, 0(x2) # load 0x00007dff from memory into f27
fcvt.wu.h x31, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 352)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f31, 0(x2) # load 0x0000fc01 from memory into f31
fcvt.wu.h x6, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 356)

# Testcase cp_fs1_corners (Test source fs1 value = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f2, 0(x2) # load 0x000058b4 from memory into f2
fcvt.wu.h x6, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 360)

# Testcase cp_fs1_corners (Test source fs1 value = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f18, 0(x2) # load 0x0000c93a from memory into f18
fcvt.wu.h x25, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 364)

# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f23, 0(x2) # load 0x00000000 from memory into f23
fcvt.wu.h x17, f23, dyn # perform operation
fcvt.wu.h x17, f23, rdn # perform operation
fcvt.wu.h x17, f23, rmm # perform operation
fcvt.wu.h x17, f23, rne # perform operation
fcvt.wu.h x17, f23, rtz # perform operation
fcvt.wu.h x17, f23, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x17, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 368)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x17, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 372)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x17, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 376)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x17, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 380)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x17, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 384)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f16, 0(x2) # load 0x00008000 from memory into f16
fcvt.wu.h x3, f16, dyn # perform operation
fcvt.wu.h x3, f16, rdn # perform operation
fcvt.wu.h x3, f16, rmm # perform operation
fcvt.wu.h x3, f16, rne # perform operation
fcvt.wu.h x3, f16, rtz # perform operation
fcvt.wu.h x3, f16, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x3, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 388)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x3, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 392)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x3, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 396)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x3, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 400)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x3, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 404)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f16, 0(x2) # load 0x00003c00 from memory into f16
fcvt.wu.h x29, f16, dyn # perform operation
fcvt.wu.h x29, f16, rdn # perform operation
fcvt.wu.h x29, f16, rmm # perform operation
fcvt.wu.h x29, f16, rne # perform operation
fcvt.wu.h x29, f16, rtz # perform operation
fcvt.wu.h x29, f16, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x29, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 408)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x29, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 412)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x29, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 416)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x29, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 420)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x29, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 424)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f7, 0(x2) # load 0x0000bc00 from memory into f7
fcvt.wu.h x9, f7, dyn # perform operation
fcvt.wu.h x9, f7, rdn # perform operation
fcvt.wu.h x9, f7, rmm # perform operation
fcvt.wu.h x9, f7, rne # perform operation
fcvt.wu.h x9, f7, rtz # perform operation
fcvt.wu.h x9, f7, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x9, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 428)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x9, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 432)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x9, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 436)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x9, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 440)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x9, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 444)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f23, 0(x2) # load 0x00003e00 from memory into f23
fcvt.wu.h x22, f23, dyn # perform operation
fcvt.wu.h x22, f23, rdn # perform operation
fcvt.wu.h x22, f23, rmm # perform operation
fcvt.wu.h x22, f23, rne # perform operation
fcvt.wu.h x22, f23, rtz # perform operation
fcvt.wu.h x22, f23, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x22, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 448)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x22, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 452)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x22, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 456)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x22, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 460)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x22, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 464)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f31, 0(x2) # load 0x0000be00 from memory into f31
fcvt.wu.h x27, f31, dyn # perform operation
fcvt.wu.h x27, f31, rdn # perform operation
fcvt.wu.h x27, f31, rmm # perform operation
fcvt.wu.h x27, f31, rne # perform operation
fcvt.wu.h x27, f31, rtz # perform operation
fcvt.wu.h x27, f31, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x27, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 468)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x27, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 472)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x27, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 476)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x27, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 480)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x27, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 484)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
fcvt.wu.h x14, f21, dyn # perform operation
fcvt.wu.h x14, f21, rdn # perform operation
fcvt.wu.h x14, f21, rmm # perform operation
fcvt.wu.h x14, f21, rne # perform operation
fcvt.wu.h x14, f21, rtz # perform operation
fcvt.wu.h x14, f21, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x14, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 488)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x14, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 492)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x14, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 496)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x14, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 500)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x14, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 504)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f8, 0(x2) # load 0x0000c000 from memory into f8
fcvt.wu.h x5, f8, dyn # perform operation
fcvt.wu.h x5, f8, rdn # perform operation
fcvt.wu.h x5, f8, rmm # perform operation
fcvt.wu.h x5, f8, rne # perform operation
fcvt.wu.h x5, f8, rtz # perform operation
fcvt.wu.h x5, f8, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x5, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 508)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x5, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 512)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x5, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 516)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x5, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 520)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x5, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 524)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f6, 0(x2) # load 0x00000400 from memory into f6
fcvt.wu.h x11, f6, dyn # perform operation
fcvt.wu.h x11, f6, rdn # perform operation
fcvt.wu.h x11, f6, rmm # perform operation
fcvt.wu.h x11, f6, rne # perform operation
fcvt.wu.h x11, f6, rtz # perform operation
fcvt.wu.h x11, f6, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x11, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 528)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x11, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 532)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x11, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 536)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x11, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 540)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x11, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 544)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f25, 0(x2) # load 0x00008400 from memory into f25
fcvt.wu.h x1, f25, dyn # perform operation
fcvt.wu.h x1, f25, rdn # perform operation
fcvt.wu.h x1, f25, rmm # perform operation
fcvt.wu.h x1, f25, rne # perform operation
fcvt.wu.h x1, f25, rtz # perform operation
fcvt.wu.h x1, f25, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x1, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 548)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x1, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 552)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x1, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 556)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x1, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 560)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x1, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 564)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f1, 0(x2) # load 0x00007bff from memory into f1
fcvt.wu.h x17, f1, dyn # perform operation
fcvt.wu.h x17, f1, rdn # perform operation
fcvt.wu.h x17, f1, rmm # perform operation
fcvt.wu.h x17, f1, rne # perform operation
fcvt.wu.h x17, f1, rtz # perform operation
fcvt.wu.h x17, f1, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x17, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 568)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x17, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 572)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x17, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 576)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x17, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 580)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x17, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 584)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f2, 0(x2) # load 0x0000fbff from memory into f2
fcvt.wu.h x31, f2, dyn # perform operation
fcvt.wu.h x31, f2, rdn # perform operation
fcvt.wu.h x31, f2, rmm # perform operation
fcvt.wu.h x31, f2, rne # perform operation
fcvt.wu.h x31, f2, rtz # perform operation
fcvt.wu.h x31, f2, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x31, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 588)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x31, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 592)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x31, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 596)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x31, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 600)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x31, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 604)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f23, 0(x2) # load 0x000003ff from memory into f23
fcvt.wu.h x9, f23, dyn # perform operation
fcvt.wu.h x9, f23, rdn # perform operation
fcvt.wu.h x9, f23, rmm # perform operation
fcvt.wu.h x9, f23, rne # perform operation
fcvt.wu.h x9, f23, rtz # perform operation
fcvt.wu.h x9, f23, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x9, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 608)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x9, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 612)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x9, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 616)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x9, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 620)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x9, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 624)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f8, 0(x2) # load 0x000083ff from memory into f8
fcvt.wu.h x18, f8, dyn # perform operation
fcvt.wu.h x18, f8, rdn # perform operation
fcvt.wu.h x18, f8, rmm # perform operation
fcvt.wu.h x18, f8, rne # perform operation
fcvt.wu.h x18, f8, rtz # perform operation
fcvt.wu.h x18, f8, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x18, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 628)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x18, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 632)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x18, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 636)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x18, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 640)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x18, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 644)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f22, 0(x2) # load 0x00000200 from memory into f22
fcvt.wu.h x27, f22, dyn # perform operation
fcvt.wu.h x27, f22, rdn # perform operation
fcvt.wu.h x27, f22, rmm # perform operation
fcvt.wu.h x27, f22, rne # perform operation
fcvt.wu.h x27, f22, rtz # perform operation
fcvt.wu.h x27, f22, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x27, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 648)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x27, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 652)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x27, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 656)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x27, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 660)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x27, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 664)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f14, 0(x2) # load 0x00008200 from memory into f14
fcvt.wu.h x28, f14, dyn # perform operation
fcvt.wu.h x28, f14, rdn # perform operation
fcvt.wu.h x28, f14, rmm # perform operation
fcvt.wu.h x28, f14, rne # perform operation
fcvt.wu.h x28, f14, rtz # perform operation
fcvt.wu.h x28, f14, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x28, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 668)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x28, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 672)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x28, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 676)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x28, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 680)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x28, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 684)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f27, 0(x2) # load 0x00000001 from memory into f27
fcvt.wu.h x16, f27, dyn # perform operation
fcvt.wu.h x16, f27, rdn # perform operation
fcvt.wu.h x16, f27, rmm # perform operation
fcvt.wu.h x16, f27, rne # perform operation
fcvt.wu.h x16, f27, rtz # perform operation
fcvt.wu.h x16, f27, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x16, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 688)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x16, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 692)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x16, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 696)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x16, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 700)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x16, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 704)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f19, 0(x2) # load 0x00008001 from memory into f19
fcvt.wu.h x2, f19, dyn # perform operation
fcvt.wu.h x2, f19, rdn # perform operation
fcvt.wu.h x2, f19, rmm # perform operation
fcvt.wu.h x2, f19, rne # perform operation
fcvt.wu.h x2, f19, rtz # perform operation
fcvt.wu.h x2, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x2, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 708)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x2, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 712)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x2, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 716)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x2, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 720)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x2, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 724)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f20, 0(x2) # load 0x00007c00 from memory into f20
fcvt.wu.h x18, f20, dyn # perform operation
fcvt.wu.h x18, f20, rdn # perform operation
fcvt.wu.h x18, f20, rmm # perform operation
fcvt.wu.h x18, f20, rne # perform operation
fcvt.wu.h x18, f20, rtz # perform operation
fcvt.wu.h x18, f20, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x18, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 728)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x18, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 732)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x18, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 736)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x18, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 740)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x18, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 744)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f22, 0(x2) # load 0x0000fc00 from memory into f22
fcvt.wu.h x8, f22, dyn # perform operation
fcvt.wu.h x8, f22, rdn # perform operation
fcvt.wu.h x8, f22, rmm # perform operation
fcvt.wu.h x8, f22, rne # perform operation
fcvt.wu.h x8, f22, rtz # perform operation
fcvt.wu.h x8, f22, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x8, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 748)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x8, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 752)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x8, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 756)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x8, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 760)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x8, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 764)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f19, 0(x2) # load 0x00007e00 from memory into f19
fcvt.wu.h x5, f19, dyn # perform operation
fcvt.wu.h x5, f19, rdn # perform operation
fcvt.wu.h x5, f19, rmm # perform operation
fcvt.wu.h x5, f19, rne # perform operation
fcvt.wu.h x5, f19, rtz # perform operation
fcvt.wu.h x5, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x5, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 768)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x5, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 772)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x5, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 776)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x5, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 780)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x5, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 784)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f19, 0(x2) # load 0x00007fff from memory into f19
fcvt.wu.h x27, f19, dyn # perform operation
fcvt.wu.h x27, f19, rdn # perform operation
fcvt.wu.h x27, f19, rmm # perform operation
fcvt.wu.h x27, f19, rne # perform operation
fcvt.wu.h x27, f19, rtz # perform operation
fcvt.wu.h x27, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x27, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 788)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x27, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 792)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x27, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 796)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x27, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 800)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x27, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 804)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f9, 0(x2) # load 0x0000fe00 from memory into f9
fcvt.wu.h x24, f9, dyn # perform operation
fcvt.wu.h x24, f9, rdn # perform operation
fcvt.wu.h x24, f9, rmm # perform operation
fcvt.wu.h x24, f9, rne # perform operation
fcvt.wu.h x24, f9, rtz # perform operation
fcvt.wu.h x24, f9, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x24, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 808)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x24, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 812)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x24, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 816)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x24, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 820)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x24, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 824)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f19, 0(x2) # load 0x00007c01 from memory into f19
fcvt.wu.h x18, f19, dyn # perform operation
fcvt.wu.h x18, f19, rdn # perform operation
fcvt.wu.h x18, f19, rmm # perform operation
fcvt.wu.h x18, f19, rne # perform operation
fcvt.wu.h x18, f19, rtz # perform operation
fcvt.wu.h x18, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 828)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 832)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 836)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 840)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 844)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f9, 0(x2) # load 0x00007dff from memory into f9
fcvt.wu.h x6, f9, dyn # perform operation
fcvt.wu.h x6, f9, rdn # perform operation
fcvt.wu.h x6, f9, rmm # perform operation
fcvt.wu.h x6, f9, rne # perform operation
fcvt.wu.h x6, f9, rtz # perform operation
fcvt.wu.h x6, f9, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x6, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 848)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x6, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 852)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x6, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 856)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x6, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 860)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x6, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 864)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f31, 0(x2) # load 0x0000fc01 from memory into f31
fcvt.wu.h x16, f31, dyn # perform operation
fcvt.wu.h x16, f31, rdn # perform operation
fcvt.wu.h x16, f31, rmm # perform operation
fcvt.wu.h x16, f31, rne # perform operation
fcvt.wu.h x16, f31, rtz # perform operation
fcvt.wu.h x16, f31, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x16, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 868)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x16, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 872)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x16, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 876)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x16, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 880)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x16, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 884)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f19, 0(x2) # load 0x000058b4 from memory into f19
fcvt.wu.h x1, f19, dyn # perform operation
fcvt.wu.h x1, f19, rdn # perform operation
fcvt.wu.h x1, f19, rmm # perform operation
fcvt.wu.h x1, f19, rne # perform operation
fcvt.wu.h x1, f19, rtz # perform operation
fcvt.wu.h x1, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x1, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 888)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x1, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 892)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x1, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 896)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x1, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 900)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x1, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 904)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f2, 0(x2) # load 0x0000c93a from memory into f2
fcvt.wu.h x20, f2, dyn # perform operation
fcvt.wu.h x20, f2, rdn # perform operation
fcvt.wu.h x20, f2, rmm # perform operation
fcvt.wu.h x20, f2, rne # perform operation
fcvt.wu.h x20, f2, rtz # perform operation
fcvt.wu.h x20, f2, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x20, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 908)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x20, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 912)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x20, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 916)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x20, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 920)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x20, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 924)


# Testcase cp_frm
la x2, scratch
li x3, 0x492e72c9 # load x3 with value 0x492e72c9
sw x3, 0(x2) # store 0x492e72c9 in memory
flh f19, 0(x2) # load 0x492e72c9 from memory into f19
fcvt.wu.h x25, f19, dyn # perform operation
fcvt.wu.h x25, f19, rdn # perform operation
fcvt.wu.h x25, f19, rmm # perform operation
fcvt.wu.h x25, f19, rne # perform operation
fcvt.wu.h x25, f19, rtz # perform operation
fcvt.wu.h x25, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x25, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 928)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x25, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 932)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x25, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 936)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x25, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 940)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x25, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 944)


# Testcase Improper NaNBoxed argument test (Value 0x0 in f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f31, 0(x2) # load 0x00000000 from memory into f31
fcvt.wu.h x26, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 948)

# Testcase Improper NaNBoxed argument test (Value 0xfffe8000 in f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfffe8000 # load x3 with value 0xfffe8000
sw x3, 0(x2) # store 0xfffe8000 in memory
flw f31, 0(x2) # load 0xfffe8000 from memory into f31
fcvt.wu.h x20, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 952)

# Testcase Improper NaNBoxed argument test (Value 0x7fff3c00 in f13)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fff3c00 # load x3 with value 0x7fff3c00
sw x3, 0(x2) # store 0x7fff3c00 in memory
flw f13, 0(x2) # load 0x7fff3c00 from memory into f13
fcvt.wu.h x10, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 956)

# Testcase Improper NaNBoxed argument test (Value 0xbeefbc00 in f17)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbeefbc00 # load x3 with value 0xbeefbc00
sw x3, 0(x2) # store 0xbeefbc00 in memory
flw f17, 0(x2) # load 0xbeefbc00 from memory into f17
fcvt.wu.h x1, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 960)

# Testcase Improper NaNBoxed argument test (Value 0xfeff0400 in f28)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeff0400 # load x3 with value 0xfeff0400
sw x3, 0(x2) # store 0xfeff0400 in memory
flw f28, 0(x2) # load 0xfeff0400 from memory into f28
fcvt.wu.h x20, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 964)

# Testcase Improper NaNBoxed argument test (Value 0xfff8400 in f9)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0fff8400 # load x3 with value 0x0fff8400
sw x3, 0(x2) # store 0x0fff8400 in memory
flw f9, 0(x2) # load 0x0fff8400 from memory into f9
fcvt.wu.h x2, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 968)

# Testcase Improper NaNBoxed argument test (Value 0xefff7bff in f26)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xefff7bff # load x3 with value 0xefff7bff
sw x3, 0(x2) # store 0xefff7bff in memory
flw f26, 0(x2) # load 0xefff7bff from memory into f26
fcvt.wu.h x30, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 972)

# Testcase Improper NaNBoxed argument test (Value 0xc0defbff in f21)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc0defbff # load x3 with value 0xc0defbff
sw x3, 0(x2) # store 0xc0defbff in memory
flw f21, 0(x2) # load 0xc0defbff from memory into f21
fcvt.wu.h x26, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 976)

# Testcase Improper NaNBoxed argument test (Value 0x4f1a7c00 in f3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4f1a7c00 # load x3 with value 0x4f1a7c00
sw x3, 0(x2) # store 0x4f1a7c00 in memory
flw f3, 0(x2) # load 0x4f1a7c00 from memory into f3
fcvt.wu.h x16, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 980)

# Testcase Improper NaNBoxed argument test (Value 0xffffc00 in f30)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0ffffc00 # load x3 with value 0x0ffffc00
sw x3, 0(x2) # store 0x0ffffc00 in memory
flw f30, 0(x2) # load 0x0ffffc00 from memory into f30
fcvt.wu.h x28, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 984)

# Testcase Improper NaNBoxed argument test (Value 0xffef7e00 in f12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffef7e00 # load x3 with value 0xffef7e00
sw x3, 0(x2) # store 0xffef7e00 in memory
flw f12, 0(x2) # load 0xffef7e00 from memory into f12
fcvt.wu.h x10, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 988)

# Testcase Improper NaNBoxed argument test (Value 0xfeef7fff in f24)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeef7fff # load x3 with value 0xfeef7fff
sw x3, 0(x2) # store 0xfeef7fff in memory
flw f24, 0(x2) # load 0xfeef7fff from memory into f24
fcvt.wu.h x28, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 992)

# Testcase Improper NaNBoxed argument test (Value 0xa1b27c01 in f22)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa1b27c01 # load x3 with value 0xa1b27c01
sw x3, 0(x2) # store 0xa1b27c01 in memory
flw f22, 0(x2) # load 0xa1b27c01 from memory into f22
fcvt.wu.h x18, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 996)

# Testcase Improper NaNBoxed argument test (Value 0x4fd77dff in f22)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4fd77dff # load x3 with value 0x4fd77dff
sw x3, 0(x2) # store 0x4fd77dff in memory
flw f22, 0(x2) # load 0x4fd77dff from memory into f22
fcvt.wu.h x13, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 1000)

#.EQU SIGSIZE,1004


// ******************
// Tests from: WALLY-COV-fmv.h.x.S
// ******************


# initialize signature pointer
la x4, begin_signature

    
# set mstatus.FS to 01 to enable fp
li t0,0x4000
csrs mstatus, t0


# Testcase cp_rs1 (Test source rs1 = x0)
fsflagsi 0b00000 # clear all fflags
li x0, 0xe7277035 # load immediate value into integer register
fmv.h.x f1, x0 # perform operation

# Testcase cp_rs1 (Test source rs1 = x1)
fsflagsi 0b00000 # clear all fflags
li x1, 0x07998c3c # load immediate value into integer register
fmv.h.x f5, x1 # perform operation

# Testcase cp_rs1 (Test source rs1 = x2)
fsflagsi 0b00000 # clear all fflags
li x2, 0x3e5f9ffb # load immediate value into integer register
fmv.h.x f20, x2 # perform operation

# Testcase cp_rs1 (Test source rs1 = x3)
fsflagsi 0b00000 # clear all fflags
li x3, 0x6ae04e3a # load immediate value into integer register
fmv.h.x f29, x3 # perform operation

# Testcase cp_rs1 (Test source rs1 = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x4, 0x3eb12db8 # load immediate value into integer register
fmv.h.x f29, x4 # perform operation

# Testcase cp_rs1 (Test source rs1 = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x5, 0x20314453 # load immediate value into integer register
fmv.h.x f7, x5 # perform operation

# Testcase cp_rs1 (Test source rs1 = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x6, 0xe472d485 # load immediate value into integer register
fmv.h.x f23, x6 # perform operation

# Testcase cp_rs1 (Test source rs1 = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x7, 0xeba865e2 # load immediate value into integer register
fmv.h.x f20, x7 # perform operation

# Testcase cp_rs1 (Test source rs1 = x8)
fsflagsi 0b00000 # clear all fflags
li x8, 0xfeae54c4 # load immediate value into integer register
fmv.h.x f2, x8 # perform operation

# Testcase cp_rs1 (Test source rs1 = x9)
fsflagsi 0b00000 # clear all fflags
li x9, 0x122085b4 # load immediate value into integer register
fmv.h.x f13, x9 # perform operation

# Testcase cp_rs1 (Test source rs1 = x10)
fsflagsi 0b00000 # clear all fflags
li x10, 0x239d4806 # load immediate value into integer register
fmv.h.x f16, x10 # perform operation

# Testcase cp_rs1 (Test source rs1 = x11)
fsflagsi 0b00000 # clear all fflags
li x11, 0xa233bcda # load immediate value into integer register
fmv.h.x f30, x11 # perform operation

# Testcase cp_rs1 (Test source rs1 = x12)
fsflagsi 0b00000 # clear all fflags
li x12, 0x90fab891 # load immediate value into integer register
fmv.h.x f20, x12 # perform operation

# Testcase cp_rs1 (Test source rs1 = x13)
fsflagsi 0b00000 # clear all fflags
li x13, 0xe2655675 # load immediate value into integer register
fmv.h.x f23, x13 # perform operation

# Testcase cp_rs1 (Test source rs1 = x14)
fsflagsi 0b00000 # clear all fflags
li x14, 0xb84667a8 # load immediate value into integer register
fmv.h.x f20, x14 # perform operation

# Testcase cp_rs1 (Test source rs1 = x15)
fsflagsi 0b00000 # clear all fflags
li x15, 0x1f37ca47 # load immediate value into integer register
fmv.h.x f30, x15 # perform operation

# Testcase cp_rs1 (Test source rs1 = x16)
fsflagsi 0b00000 # clear all fflags
li x16, 0x207a6858 # load immediate value into integer register
fmv.h.x f10, x16 # perform operation

# Testcase cp_rs1 (Test source rs1 = x17)
fsflagsi 0b00000 # clear all fflags
li x17, 0x4f126800 # load immediate value into integer register
fmv.h.x f31, x17 # perform operation

# Testcase cp_rs1 (Test source rs1 = x18)
fsflagsi 0b00000 # clear all fflags
li x18, 0x55d34602 # load immediate value into integer register
fmv.h.x f27, x18 # perform operation

# Testcase cp_rs1 (Test source rs1 = x19)
fsflagsi 0b00000 # clear all fflags
li x19, 0x51eb7907 # load immediate value into integer register
fmv.h.x f28, x19 # perform operation

# Testcase cp_rs1 (Test source rs1 = x20)
fsflagsi 0b00000 # clear all fflags
li x20, 0x310b2650 # load immediate value into integer register
fmv.h.x f3, x20 # perform operation

# Testcase cp_rs1 (Test source rs1 = x21)
fsflagsi 0b00000 # clear all fflags
li x21, 0x75c6b402 # load immediate value into integer register
fmv.h.x f2, x21 # perform operation

# Testcase cp_rs1 (Test source rs1 = x22)
fsflagsi 0b00000 # clear all fflags
li x22, 0xf92ea4bc # load immediate value into integer register
fmv.h.x f13, x22 # perform operation

# Testcase cp_rs1 (Test source rs1 = x23)
fsflagsi 0b00000 # clear all fflags
li x23, 0x64569278 # load immediate value into integer register
fmv.h.x f21, x23 # perform operation

# Testcase cp_rs1 (Test source rs1 = x24)
fsflagsi 0b00000 # clear all fflags
li x24, 0xad40e4f7 # load immediate value into integer register
fmv.h.x f15, x24 # perform operation

# Testcase cp_rs1 (Test source rs1 = x25)
fsflagsi 0b00000 # clear all fflags
li x25, 0xa9a9e6fe # load immediate value into integer register
fmv.h.x f14, x25 # perform operation

# Testcase cp_rs1 (Test source rs1 = x26)
fsflagsi 0b00000 # clear all fflags
li x26, 0x6dd5e5cd # load immediate value into integer register
fmv.h.x f28, x26 # perform operation

# Testcase cp_rs1 (Test source rs1 = x27)
fsflagsi 0b00000 # clear all fflags
li x27, 0xe91a757d # load immediate value into integer register
fmv.h.x f10, x27 # perform operation

# Testcase cp_rs1 (Test source rs1 = x28)
fsflagsi 0b00000 # clear all fflags
li x28, 0xefad6a9c # load immediate value into integer register
fmv.h.x f20, x28 # perform operation

# Testcase cp_rs1 (Test source rs1 = x29)
fsflagsi 0b00000 # clear all fflags
li x29, 0x1f2332a4 # load immediate value into integer register
fmv.h.x f5, x29 # perform operation

# Testcase cp_rs1 (Test source rs1 = x30)
fsflagsi 0b00000 # clear all fflags
li x30, 0xf758be43 # load immediate value into integer register
fmv.h.x f7, x30 # perform operation

# Testcase cp_rs1 (Test source rs1 = x31)
fsflagsi 0b00000 # clear all fflags
li x31, 0x5e218e9b # load immediate value into integer register
fmv.h.x f25, x31 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
li x23, 0x00000000 # load immediate value into integer register
fmv.h.x f11, x23 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
li x15, 0x00000001 # load immediate value into integer register
fmv.h.x f9, x15 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x2)
fsflagsi 0b00000 # clear all fflags
li x2, 0x00000002 # load immediate value into integer register
fmv.h.x f29, x2 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x80000000)
fsflagsi 0b00000 # clear all fflags
li x31, 0x80000000 # load immediate value into integer register
fmv.h.x f12, x31 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x80000001)
fsflagsi 0b00000 # clear all fflags
li x2, 0x80000001 # load immediate value into integer register
fmv.h.x f23, x2 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x7fffffff)
fsflagsi 0b00000 # clear all fflags
li x28, 0x7fffffff # load immediate value into integer register
fmv.h.x f12, x28 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x7ffffffe)
fsflagsi 0b00000 # clear all fflags
li x30, 0x7ffffffe # load immediate value into integer register
fmv.h.x f1, x30 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0xffffffff)
fsflagsi 0b00000 # clear all fflags
li x11, 0xffffffff # load immediate value into integer register
fmv.h.x f21, x11 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0xfffffffe)
fsflagsi 0b00000 # clear all fflags
li x11, 0xfffffffe # load immediate value into integer register
fmv.h.x f13, x11 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x5bbc8872)
fsflagsi 0b00000 # clear all fflags
li x25, 0x5bbc8872 # load immediate value into integer register
fmv.h.x f14, x25 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0xaaaaaaaa)
fsflagsi 0b00000 # clear all fflags
li x25, 0xaaaaaaaa # load immediate value into integer register
fmv.h.x f18, x25 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x55555555)
fsflagsi 0b00000 # clear all fflags
li x23, 0x55555555 # load immediate value into integer register
fmv.h.x f6, x23 # perform operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x12, x24, x16 # perform first operation
fmv.h.x f17, x23 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x22, x15, x30 # perform first operation
fmv.h.x f6, x14 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x21, x14, x27 # perform first operation
fmv.h.x f17, x3 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f28, f23, f31 # perform first operation
fmv.h.x f28, x17 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f21, f24, f10 # perform first operation
fmv.h.x f21, x14 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f16, f26, f15 # perform first operation
fmv.h.x f16, x13 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f26, f29, f28 # perform first operation
fmv.h.x f29, x15 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f22, f16, f23 # perform first operation
fmv.h.x f23, x24 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f19, f31, f21 # perform first operation
fmv.h.x f30, x13 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x20, x27, x21 # perform first operation
fmv.h.x f22, x13 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x23, x22, x18 # perform first operation
fmv.h.x f12, x25 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x19, x26, x12 # perform first operation
fmv.h.x f30, x31 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x8, x24, x18 # perform first operation
fmv.h.x f26, x8 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x30, x9, x10 # perform first operation
fmv.h.x f9, x15 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x25, x15, x14 # perform first operation
fmv.h.x f15, x31 # perform second (triggering) operation

# Testcase cp_fd (Test destination fd = x0)
fsflagsi 0b00000 # clear all fflags
li x18, 0xa66ee81e # load immediate value into integer register
fmv.h.x f0, x18 # perform operation

# Testcase cp_fd (Test destination fd = x1)
fsflagsi 0b00000 # clear all fflags
li x7, 0x445c6c64 # load immediate value into integer register
fmv.h.x f1, x7 # perform operation

# Testcase cp_fd (Test destination fd = x2)
fsflagsi 0b00000 # clear all fflags
li x16, 0x61ee5731 # load immediate value into integer register
fmv.h.x f2, x16 # perform operation

# Testcase cp_fd (Test destination fd = x3)
fsflagsi 0b00000 # clear all fflags
li x25, 0x72f38350 # load immediate value into integer register
fmv.h.x f3, x25 # perform operation

# Testcase cp_fd (Test destination fd = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x24, 0xd00f70af # load immediate value into integer register
fmv.h.x f4, x24 # perform operation

# Testcase cp_fd (Test destination fd = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x16, 0xad105a80 # load immediate value into integer register
fmv.h.x f5, x16 # perform operation

# Testcase cp_fd (Test destination fd = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x16, 0x70a5ca3a # load immediate value into integer register
fmv.h.x f6, x16 # perform operation

# Testcase cp_fd (Test destination fd = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x28, 0x70c40e89 # load immediate value into integer register
fmv.h.x f7, x28 # perform operation

# Testcase cp_fd (Test destination fd = x8)
fsflagsi 0b00000 # clear all fflags
li x16, 0x79fee92b # load immediate value into integer register
fmv.h.x f8, x16 # perform operation

# Testcase cp_fd (Test destination fd = x9)
fsflagsi 0b00000 # clear all fflags
li x26, 0x8fe5d417 # load immediate value into integer register
fmv.h.x f9, x26 # perform operation

# Testcase cp_fd (Test destination fd = x10)
fsflagsi 0b00000 # clear all fflags
li x11, 0x733d5067 # load immediate value into integer register
fmv.h.x f10, x11 # perform operation

# Testcase cp_fd (Test destination fd = x11)
fsflagsi 0b00000 # clear all fflags
li x13, 0x9750b650 # load immediate value into integer register
fmv.h.x f11, x13 # perform operation

# Testcase cp_fd (Test destination fd = x12)
fsflagsi 0b00000 # clear all fflags
li x6, 0xd71cf46b # load immediate value into integer register
fmv.h.x f12, x6 # perform operation

# Testcase cp_fd (Test destination fd = x13)
fsflagsi 0b00000 # clear all fflags
li x31, 0x54affc98 # load immediate value into integer register
fmv.h.x f13, x31 # perform operation

# Testcase cp_fd (Test destination fd = x14)
fsflagsi 0b00000 # clear all fflags
li x18, 0x1f5ddbcf # load immediate value into integer register
fmv.h.x f14, x18 # perform operation

# Testcase cp_fd (Test destination fd = x15)
fsflagsi 0b00000 # clear all fflags
li x26, 0xca7c66fb # load immediate value into integer register
fmv.h.x f15, x26 # perform operation

# Testcase cp_fd (Test destination fd = x16)
fsflagsi 0b00000 # clear all fflags
li x23, 0x6144a64c # load immediate value into integer register
fmv.h.x f16, x23 # perform operation

# Testcase cp_fd (Test destination fd = x17)
fsflagsi 0b00000 # clear all fflags
li x10, 0x8c6e235c # load immediate value into integer register
fmv.h.x f17, x10 # perform operation

# Testcase cp_fd (Test destination fd = x18)
fsflagsi 0b00000 # clear all fflags
li x23, 0x9dc671c7 # load immediate value into integer register
fmv.h.x f18, x23 # perform operation

# Testcase cp_fd (Test destination fd = x19)
fsflagsi 0b00000 # clear all fflags
li x20, 0x81f47c30 # load immediate value into integer register
fmv.h.x f19, x20 # perform operation

# Testcase cp_fd (Test destination fd = x20)
fsflagsi 0b00000 # clear all fflags
li x14, 0x4c72bc59 # load immediate value into integer register
fmv.h.x f20, x14 # perform operation

# Testcase cp_fd (Test destination fd = x21)
fsflagsi 0b00000 # clear all fflags
li x30, 0x8d5de388 # load immediate value into integer register
fmv.h.x f21, x30 # perform operation

# Testcase cp_fd (Test destination fd = x22)
fsflagsi 0b00000 # clear all fflags
li x24, 0x321ea368 # load immediate value into integer register
fmv.h.x f22, x24 # perform operation

# Testcase cp_fd (Test destination fd = x23)
fsflagsi 0b00000 # clear all fflags
li x18, 0x390bdeb9 # load immediate value into integer register
fmv.h.x f23, x18 # perform operation

# Testcase cp_fd (Test destination fd = x24)
fsflagsi 0b00000 # clear all fflags
li x27, 0x58b4b87c # load immediate value into integer register
fmv.h.x f24, x27 # perform operation

# Testcase cp_fd (Test destination fd = x25)
fsflagsi 0b00000 # clear all fflags
li x19, 0x4e60076e # load immediate value into integer register
fmv.h.x f25, x19 # perform operation

# Testcase cp_fd (Test destination fd = x26)
fsflagsi 0b00000 # clear all fflags
li x12, 0x73b69705 # load immediate value into integer register
fmv.h.x f26, x12 # perform operation

# Testcase cp_fd (Test destination fd = x27)
fsflagsi 0b00000 # clear all fflags
li x25, 0xf6ea9464 # load immediate value into integer register
fmv.h.x f27, x25 # perform operation

# Testcase cp_fd (Test destination fd = x28)
fsflagsi 0b00000 # clear all fflags
li x26, 0xd6805cc0 # load immediate value into integer register
fmv.h.x f28, x26 # perform operation

# Testcase cp_fd (Test destination fd = x29)
fsflagsi 0b00000 # clear all fflags
li x18, 0x66286eab # load immediate value into integer register
fmv.h.x f29, x18 # perform operation

# Testcase cp_fd (Test destination fd = x30)
fsflagsi 0b00000 # clear all fflags
li x3, 0x949a785e # load immediate value into integer register
fmv.h.x f30, x3 # perform operation

# Testcase cp_fd (Test destination fd = x31)
fsflagsi 0b00000 # clear all fflags
li x15, 0xa6240794 # load immediate value into integer register
fmv.h.x f31, x15 # perform operation

# Testcase Random test for cp_NaNBox 
fsflagsi 0b00000 # clear all fflags
li x11, 0x6895d780 # load immediate value into integer register
fmv.h.x f8, x11 # perform operation

#.EQU SIGSIZE,0


// ******************
// Tests from: WALLY-COV-fclass.h.S
// ******************


# initialize signature pointer
la x4, begin_signature

    
# set mstatus.FS to 01 to enable fp
li t0,0x4000
csrs mstatus, t0


# Testcase cp_rd (Test destination rd = x0)
la x2, scratch
li x3, 0x25c0b2f4 # load x3 with value 0x25c0b2f4
sw x3, 0(x2) # store 0x25c0b2f4 in memory
flh f25, 0(x2) # load 0x25c0b2f4 from memory into f25
fclass.h x0, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x0, 0)

# Testcase cp_rd (Test destination rd = x1)
la x2, scratch
li x3, 0xfe9c031b # load x3 with value 0xfe9c031b
sw x3, 0(x2) # store 0xfe9c031b in memory
flh f15, 0(x2) # load 0xfe9c031b from memory into f15
fclass.h x1, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 4)

# Testcase cp_rd (Test destination rd = x2)
la x2, scratch
li x3, 0xfb641efe # load x3 with value 0xfb641efe
sw x3, 0(x2) # store 0xfb641efe in memory
flh f22, 0(x2) # load 0xfb641efe from memory into f22
fclass.h x2, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 8)

# Testcase cp_rd (Test destination rd = x3)
la x2, scratch
li x3, 0xefa98f20 # load x3 with value 0xefa98f20
sw x3, 0(x2) # store 0xefa98f20 in memory
flh f11, 0(x2) # load 0xefa98f20 from memory into f11
fclass.h x3, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 12)

# Testcase cp_rd (Test destination rd = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xb3cd56f3 # load x3 with value 0xb3cd56f3
sw x3, 0(x2) # store 0xb3cd56f3 in memory
flh f15, 0(x2) # load 0xb3cd56f3 from memory into f15
fclass.h x4, f15 # perform operation
RVTEST_SIGUPD(x5, x0, x4, 16)

# Testcase cp_rd (Test destination rd = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x54234057 # load x3 with value 0x54234057
sw x3, 0(x2) # store 0x54234057 in memory
flh f19, 0(x2) # load 0x54234057 from memory into f19
fclass.h x5, f19 # perform operation
RVTEST_SIGUPD(x6, x0, x5, 20)

# Testcase cp_rd (Test destination rd = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x21e8e60f # load x3 with value 0x21e8e60f
sw x3, 0(x2) # store 0x21e8e60f in memory
flh f17, 0(x2) # load 0x21e8e60f from memory into f17
fclass.h x6, f17 # perform operation
RVTEST_SIGUPD(x7, x0, x6, 24)

# Testcase cp_rd (Test destination rd = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x0f3a17f0 # load x3 with value 0x0f3a17f0
sw x3, 0(x2) # store 0x0f3a17f0 in memory
flh f14, 0(x2) # load 0x0f3a17f0 from memory into f14
fclass.h x7, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 28)

# Testcase cp_rd (Test destination rd = x8)
la x2, scratch
li x3, 0x2fe906c2 # load x3 with value 0x2fe906c2
sw x3, 0(x2) # store 0x2fe906c2 in memory
flh f24, 0(x2) # load 0x2fe906c2 from memory into f24
fclass.h x8, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 32)

# Testcase cp_rd (Test destination rd = x9)
la x2, scratch
li x3, 0x45c3158d # load x3 with value 0x45c3158d
sw x3, 0(x2) # store 0x45c3158d in memory
flh f29, 0(x2) # load 0x45c3158d from memory into f29
fclass.h x9, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 36)

# Testcase cp_rd (Test destination rd = x10)
la x2, scratch
li x3, 0xdcdeb15b # load x3 with value 0xdcdeb15b
sw x3, 0(x2) # store 0xdcdeb15b in memory
flh f20, 0(x2) # load 0xdcdeb15b from memory into f20
fclass.h x10, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 40)

# Testcase cp_rd (Test destination rd = x11)
la x2, scratch
li x3, 0x52aa321c # load x3 with value 0x52aa321c
sw x3, 0(x2) # store 0x52aa321c in memory
flh f16, 0(x2) # load 0x52aa321c from memory into f16
fclass.h x11, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 44)

# Testcase cp_rd (Test destination rd = x12)
la x2, scratch
li x3, 0xb22316d4 # load x3 with value 0xb22316d4
sw x3, 0(x2) # store 0xb22316d4 in memory
flh f10, 0(x2) # load 0xb22316d4 from memory into f10
fclass.h x12, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 48)

# Testcase cp_rd (Test destination rd = x13)
la x2, scratch
li x3, 0x538ce65f # load x3 with value 0x538ce65f
sw x3, 0(x2) # store 0x538ce65f in memory
flh f20, 0(x2) # load 0x538ce65f from memory into f20
fclass.h x13, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 52)

# Testcase cp_rd (Test destination rd = x14)
la x2, scratch
li x3, 0x4d119be9 # load x3 with value 0x4d119be9
sw x3, 0(x2) # store 0x4d119be9 in memory
flh f1, 0(x2) # load 0x4d119be9 from memory into f1
fclass.h x14, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 56)

# Testcase cp_rd (Test destination rd = x15)
la x2, scratch
li x3, 0x51904fd5 # load x3 with value 0x51904fd5
sw x3, 0(x2) # store 0x51904fd5 in memory
flh f29, 0(x2) # load 0x51904fd5 from memory into f29
fclass.h x15, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 60)

# Testcase cp_rd (Test destination rd = x16)
la x2, scratch
li x3, 0xb26c5454 # load x3 with value 0xb26c5454
sw x3, 0(x2) # store 0xb26c5454 in memory
flh f13, 0(x2) # load 0xb26c5454 from memory into f13
fclass.h x16, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 64)

# Testcase cp_rd (Test destination rd = x17)
la x2, scratch
li x3, 0x12634c34 # load x3 with value 0x12634c34
sw x3, 0(x2) # store 0x12634c34 in memory
flh f11, 0(x2) # load 0x12634c34 from memory into f11
fclass.h x17, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 68)

# Testcase cp_rd (Test destination rd = x18)
la x2, scratch
li x3, 0xd4c7ad07 # load x3 with value 0xd4c7ad07
sw x3, 0(x2) # store 0xd4c7ad07 in memory
flh f13, 0(x2) # load 0xd4c7ad07 from memory into f13
fclass.h x18, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 72)

# Testcase cp_rd (Test destination rd = x19)
la x2, scratch
li x3, 0x9a5217f1 # load x3 with value 0x9a5217f1
sw x3, 0(x2) # store 0x9a5217f1 in memory
flh f7, 0(x2) # load 0x9a5217f1 from memory into f7
fclass.h x19, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 76)

# Testcase cp_rd (Test destination rd = x20)
la x2, scratch
li x3, 0xde01e7e9 # load x3 with value 0xde01e7e9
sw x3, 0(x2) # store 0xde01e7e9 in memory
flh f18, 0(x2) # load 0xde01e7e9 from memory into f18
fclass.h x20, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 80)

# Testcase cp_rd (Test destination rd = x21)
la x2, scratch
li x3, 0x22469d9f # load x3 with value 0x22469d9f
sw x3, 0(x2) # store 0x22469d9f in memory
flh f11, 0(x2) # load 0x22469d9f from memory into f11
fclass.h x21, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 84)

# Testcase cp_rd (Test destination rd = x22)
la x2, scratch
li x3, 0x7a559c70 # load x3 with value 0x7a559c70
sw x3, 0(x2) # store 0x7a559c70 in memory
flh f26, 0(x2) # load 0x7a559c70 from memory into f26
fclass.h x22, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 88)

# Testcase cp_rd (Test destination rd = x23)
la x2, scratch
li x3, 0xbe0e574e # load x3 with value 0xbe0e574e
sw x3, 0(x2) # store 0xbe0e574e in memory
flh f5, 0(x2) # load 0xbe0e574e from memory into f5
fclass.h x23, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 92)

# Testcase cp_rd (Test destination rd = x24)
la x2, scratch
li x3, 0x6a6c8be4 # load x3 with value 0x6a6c8be4
sw x3, 0(x2) # store 0x6a6c8be4 in memory
flh f13, 0(x2) # load 0x6a6c8be4 from memory into f13
fclass.h x24, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 96)

# Testcase cp_rd (Test destination rd = x25)
la x2, scratch
li x3, 0x697b18db # load x3 with value 0x697b18db
sw x3, 0(x2) # store 0x697b18db in memory
flh f19, 0(x2) # load 0x697b18db from memory into f19
fclass.h x25, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 100)

# Testcase cp_rd (Test destination rd = x26)
la x2, scratch
li x3, 0x643bd47b # load x3 with value 0x643bd47b
sw x3, 0(x2) # store 0x643bd47b in memory
flh f7, 0(x2) # load 0x643bd47b from memory into f7
fclass.h x26, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 104)

# Testcase cp_rd (Test destination rd = x27)
la x2, scratch
li x3, 0x6e07eba8 # load x3 with value 0x6e07eba8
sw x3, 0(x2) # store 0x6e07eba8 in memory
flh f17, 0(x2) # load 0x6e07eba8 from memory into f17
fclass.h x27, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 108)

# Testcase cp_rd (Test destination rd = x28)
la x2, scratch
li x3, 0x8d52335e # load x3 with value 0x8d52335e
sw x3, 0(x2) # store 0x8d52335e in memory
flh f16, 0(x2) # load 0x8d52335e from memory into f16
fclass.h x28, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 112)

# Testcase cp_rd (Test destination rd = x29)
la x2, scratch
li x3, 0x84e8eaab # load x3 with value 0x84e8eaab
sw x3, 0(x2) # store 0x84e8eaab in memory
flh f23, 0(x2) # load 0x84e8eaab from memory into f23
fclass.h x29, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 116)

# Testcase cp_rd (Test destination rd = x30)
la x2, scratch
li x3, 0x0a870f60 # load x3 with value 0x0a870f60
sw x3, 0(x2) # store 0x0a870f60 in memory
flh f9, 0(x2) # load 0x0a870f60 from memory into f9
fclass.h x30, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 120)

# Testcase cp_rd (Test destination rd = x31)
la x2, scratch
li x3, 0xc09ed873 # load x3 with value 0xc09ed873
sw x3, 0(x2) # store 0xc09ed873 in memory
flh f12, 0(x2) # load 0xc09ed873 from memory into f12
fclass.h x31, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 124)

# Testcase cp_gpr/fpr_hazard nohaz test
add x6, x9, x11 # perform first operation
fclass.h x26, f2 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x15, x24, x22 # perform first operation
fclass.h x20, f13 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x21, x14, x20 # perform first operation
fclass.h x1, f19 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
fmul.s f11, f9, f3 # perform first operation
fclass.h x3, f11 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x3, x19, x9 # perform first operation
fclass.h x3, f2 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x11, x27, x14 # perform first operation
fclass.h x11, f3 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x21, x29, x8 # perform first operation
fclass.h x22, f1 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x1, x18, x11 # perform first operation
fclass.h x22, f8 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x7, x1, x6 # perform first operation
fclass.h x15, f23 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x30, x11, x9 # perform first operation
fclass.h x30, f6 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x3, x15, x22 # perform first operation
fclass.h x3, f2 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x23, x20, x3 # perform first operation
fclass.h x23, f27 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x5, x22, x12 # perform first operation
fclass.h x22, f16 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x16, x3, x25 # perform first operation
fclass.h x25, f1 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x11, x18, x30 # perform first operation
fclass.h x23, f17 # perform second (triggering) operation

# Testcase cp_fs1 (Test source fs1 = f0)
la x2, scratch
li x3, 0x66a33183 # load x3 with value 0x66a33183
sw x3, 0(x2) # store 0x66a33183 in memory
flh f0, 0(x2) # load 0x66a33183 from memory into f0
fclass.h x12, f0 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 128)

# Testcase cp_fs1 (Test source fs1 = f1)
la x2, scratch
li x3, 0x0c1d2bcc # load x3 with value 0x0c1d2bcc
sw x3, 0(x2) # store 0x0c1d2bcc in memory
flh f1, 0(x2) # load 0x0c1d2bcc from memory into f1
fclass.h x21, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 132)

# Testcase cp_fs1 (Test source fs1 = f2)
la x2, scratch
li x3, 0x35fc018a # load x3 with value 0x35fc018a
sw x3, 0(x2) # store 0x35fc018a in memory
flh f2, 0(x2) # load 0x35fc018a from memory into f2
fclass.h x1, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 136)

# Testcase cp_fs1 (Test source fs1 = f3)
la x2, scratch
li x3, 0x6d8bf582 # load x3 with value 0x6d8bf582
sw x3, 0(x2) # store 0x6d8bf582 in memory
flh f3, 0(x2) # load 0x6d8bf582 from memory into f3
fclass.h x26, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 140)

# Testcase cp_fs1 (Test source fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xe63f6004 # load x3 with value 0xe63f6004
sw x3, 0(x2) # store 0xe63f6004 in memory
flh f4, 0(x2) # load 0xe63f6004 from memory into f4
fclass.h x18, f4 # perform operation
RVTEST_SIGUPD(x5, x0, x18, 144)

# Testcase cp_fs1 (Test source fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x5120de91 # load x3 with value 0x5120de91
sw x3, 0(x2) # store 0x5120de91 in memory
flh f5, 0(x2) # load 0x5120de91 from memory into f5
fclass.h x21, f5 # perform operation
RVTEST_SIGUPD(x6, x0, x21, 148)

# Testcase cp_fs1 (Test source fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x27f3b93f # load x3 with value 0x27f3b93f
sw x3, 0(x2) # store 0x27f3b93f in memory
flh f6, 0(x2) # load 0x27f3b93f from memory into f6
fclass.h x22, f6 # perform operation
RVTEST_SIGUPD(x7, x0, x22, 152)

# Testcase cp_fs1 (Test source fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x53bab0af # load x3 with value 0x53bab0af
sw x3, 0(x2) # store 0x53bab0af in memory
flh f7, 0(x2) # load 0x53bab0af from memory into f7
fclass.h x24, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 156)

# Testcase cp_fs1 (Test source fs1 = f8)
la x2, scratch
li x3, 0x1fbf60ec # load x3 with value 0x1fbf60ec
sw x3, 0(x2) # store 0x1fbf60ec in memory
flh f8, 0(x2) # load 0x1fbf60ec from memory into f8
fclass.h x9, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 160)

# Testcase cp_fs1 (Test source fs1 = f9)
la x2, scratch
li x3, 0x39d6d4a9 # load x3 with value 0x39d6d4a9
sw x3, 0(x2) # store 0x39d6d4a9 in memory
flh f9, 0(x2) # load 0x39d6d4a9 from memory into f9
fclass.h x11, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 164)

# Testcase cp_fs1 (Test source fs1 = f10)
la x2, scratch
li x3, 0xcd099a96 # load x3 with value 0xcd099a96
sw x3, 0(x2) # store 0xcd099a96 in memory
flh f10, 0(x2) # load 0xcd099a96 from memory into f10
fclass.h x23, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 168)

# Testcase cp_fs1 (Test source fs1 = f11)
la x2, scratch
li x3, 0x64e60b48 # load x3 with value 0x64e60b48
sw x3, 0(x2) # store 0x64e60b48 in memory
flh f11, 0(x2) # load 0x64e60b48 from memory into f11
fclass.h x1, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 172)

# Testcase cp_fs1 (Test source fs1 = f12)
la x2, scratch
li x3, 0x01464b4e # load x3 with value 0x01464b4e
sw x3, 0(x2) # store 0x01464b4e in memory
flh f12, 0(x2) # load 0x01464b4e from memory into f12
fclass.h x20, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 176)

# Testcase cp_fs1 (Test source fs1 = f13)
la x2, scratch
li x3, 0x2c82c782 # load x3 with value 0x2c82c782
sw x3, 0(x2) # store 0x2c82c782 in memory
flh f13, 0(x2) # load 0x2c82c782 from memory into f13
fclass.h x5, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 180)

# Testcase cp_fs1 (Test source fs1 = f14)
la x2, scratch
li x3, 0x51176a4d # load x3 with value 0x51176a4d
sw x3, 0(x2) # store 0x51176a4d in memory
flh f14, 0(x2) # load 0x51176a4d from memory into f14
fclass.h x3, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 184)

# Testcase cp_fs1 (Test source fs1 = f15)
la x2, scratch
li x3, 0x9115d984 # load x3 with value 0x9115d984
sw x3, 0(x2) # store 0x9115d984 in memory
flh f15, 0(x2) # load 0x9115d984 from memory into f15
fclass.h x7, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 188)

# Testcase cp_fs1 (Test source fs1 = f16)
la x2, scratch
li x3, 0x4ee0d690 # load x3 with value 0x4ee0d690
sw x3, 0(x2) # store 0x4ee0d690 in memory
flh f16, 0(x2) # load 0x4ee0d690 from memory into f16
fclass.h x5, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 192)

# Testcase cp_fs1 (Test source fs1 = f17)
la x2, scratch
li x3, 0xc636abc7 # load x3 with value 0xc636abc7
sw x3, 0(x2) # store 0xc636abc7 in memory
flh f17, 0(x2) # load 0xc636abc7 from memory into f17
fclass.h x7, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 196)

# Testcase cp_fs1 (Test source fs1 = f18)
la x2, scratch
li x3, 0x96a10c8e # load x3 with value 0x96a10c8e
sw x3, 0(x2) # store 0x96a10c8e in memory
flh f18, 0(x2) # load 0x96a10c8e from memory into f18
fclass.h x10, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 200)

# Testcase cp_fs1 (Test source fs1 = f19)
la x2, scratch
li x3, 0xb3ab4a6c # load x3 with value 0xb3ab4a6c
sw x3, 0(x2) # store 0xb3ab4a6c in memory
flh f19, 0(x2) # load 0xb3ab4a6c from memory into f19
fclass.h x30, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 204)

# Testcase cp_fs1 (Test source fs1 = f20)
la x2, scratch
li x3, 0xa6a4f3db # load x3 with value 0xa6a4f3db
sw x3, 0(x2) # store 0xa6a4f3db in memory
flh f20, 0(x2) # load 0xa6a4f3db from memory into f20
fclass.h x16, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 208)

# Testcase cp_fs1 (Test source fs1 = f21)
la x2, scratch
li x3, 0x613be397 # load x3 with value 0x613be397
sw x3, 0(x2) # store 0x613be397 in memory
flh f21, 0(x2) # load 0x613be397 from memory into f21
fclass.h x26, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 212)

# Testcase cp_fs1 (Test source fs1 = f22)
la x2, scratch
li x3, 0x9b583e38 # load x3 with value 0x9b583e38
sw x3, 0(x2) # store 0x9b583e38 in memory
flh f22, 0(x2) # load 0x9b583e38 from memory into f22
fclass.h x16, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 216)

# Testcase cp_fs1 (Test source fs1 = f23)
la x2, scratch
li x3, 0xf6a40a79 # load x3 with value 0xf6a40a79
sw x3, 0(x2) # store 0xf6a40a79 in memory
flh f23, 0(x2) # load 0xf6a40a79 from memory into f23
fclass.h x23, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 220)

# Testcase cp_fs1 (Test source fs1 = f24)
la x2, scratch
li x3, 0xb819e73f # load x3 with value 0xb819e73f
sw x3, 0(x2) # store 0xb819e73f in memory
flh f24, 0(x2) # load 0xb819e73f from memory into f24
fclass.h x14, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 224)

# Testcase cp_fs1 (Test source fs1 = f25)
la x2, scratch
li x3, 0x1dea9c53 # load x3 with value 0x1dea9c53
sw x3, 0(x2) # store 0x1dea9c53 in memory
flh f25, 0(x2) # load 0x1dea9c53 from memory into f25
fclass.h x10, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 228)

# Testcase cp_fs1 (Test source fs1 = f26)
la x2, scratch
li x3, 0x26760dac # load x3 with value 0x26760dac
sw x3, 0(x2) # store 0x26760dac in memory
flh f26, 0(x2) # load 0x26760dac from memory into f26
fclass.h x27, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 232)

# Testcase cp_fs1 (Test source fs1 = f27)
la x2, scratch
li x3, 0x5f367921 # load x3 with value 0x5f367921
sw x3, 0(x2) # store 0x5f367921 in memory
flh f27, 0(x2) # load 0x5f367921 from memory into f27
fclass.h x13, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 236)

# Testcase cp_fs1 (Test source fs1 = f28)
la x2, scratch
li x3, 0x09363f9e # load x3 with value 0x09363f9e
sw x3, 0(x2) # store 0x09363f9e in memory
flh f28, 0(x2) # load 0x09363f9e from memory into f28
fclass.h x20, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 240)

# Testcase cp_fs1 (Test source fs1 = f29)
la x2, scratch
li x3, 0x47f3cffa # load x3 with value 0x47f3cffa
sw x3, 0(x2) # store 0x47f3cffa in memory
flh f29, 0(x2) # load 0x47f3cffa from memory into f29
fclass.h x7, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 244)

# Testcase cp_fs1 (Test source fs1 = f30)
la x2, scratch
li x3, 0x6f2100b0 # load x3 with value 0x6f2100b0
sw x3, 0(x2) # store 0x6f2100b0 in memory
flh f30, 0(x2) # load 0x6f2100b0 from memory into f30
fclass.h x13, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 248)

# Testcase cp_fs1 (Test source fs1 = f31)
la x2, scratch
li x3, 0x673353d9 # load x3 with value 0x673353d9
sw x3, 0(x2) # store 0x673353d9 in memory
flh f31, 0(x2) # load 0x673353d9 from memory into f31
fclass.h x1, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 252)

# Testcase cp_fs1_corners (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f24, 0(x2) # load 0x00000000 from memory into f24
fclass.h x23, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 256)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f1, 0(x2) # load 0x00008000 from memory into f1
fclass.h x22, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 260)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f24, 0(x2) # load 0x00003c00 from memory into f24
fclass.h x13, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 264)

# Testcase cp_fs1_corners (Test source fs1 value = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f6, 0(x2) # load 0x0000bc00 from memory into f6
fclass.h x9, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 268)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f24, 0(x2) # load 0x00003e00 from memory into f24
fclass.h x2, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 272)

# Testcase cp_fs1_corners (Test source fs1 value = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f26, 0(x2) # load 0x0000be00 from memory into f26
fclass.h x1, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 276)

# Testcase cp_fs1_corners (Test source fs1 value = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f24, 0(x2) # load 0x00004000 from memory into f24
fclass.h x31, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 280)

# Testcase cp_fs1_corners (Test source fs1 value = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f12, 0(x2) # load 0x0000c000 from memory into f12
fclass.h x11, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 284)

# Testcase cp_fs1_corners (Test source fs1 value = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f19, 0(x2) # load 0x00000400 from memory into f19
fclass.h x2, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 288)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f20, 0(x2) # load 0x00008400 from memory into f20
fclass.h x9, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 292)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f12, 0(x2) # load 0x00007bff from memory into f12
fclass.h x6, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 296)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f6, 0(x2) # load 0x0000fbff from memory into f6
fclass.h x21, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 300)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f19, 0(x2) # load 0x000003ff from memory into f19
fclass.h x26, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 304)

# Testcase cp_fs1_corners (Test source fs1 value = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f23, 0(x2) # load 0x000083ff from memory into f23
fclass.h x2, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 308)

# Testcase cp_fs1_corners (Test source fs1 value = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f13, 0(x2) # load 0x00000200 from memory into f13
fclass.h x20, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 312)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f9, 0(x2) # load 0x00008200 from memory into f9
fclass.h x31, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 316)

# Testcase cp_fs1_corners (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f12, 0(x2) # load 0x00000001 from memory into f12
fclass.h x24, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 320)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f10, 0(x2) # load 0x00008001 from memory into f10
fclass.h x29, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 324)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f5, 0(x2) # load 0x00007c00 from memory into f5
fclass.h x7, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 328)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f8, 0(x2) # load 0x0000fc00 from memory into f8
fclass.h x22, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 332)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f11, 0(x2) # load 0x00007e00 from memory into f11
fclass.h x6, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 336)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f14, 0(x2) # load 0x00007fff from memory into f14
fclass.h x17, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 340)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f12, 0(x2) # load 0x0000fe00 from memory into f12
fclass.h x16, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 344)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f20, 0(x2) # load 0x00007c01 from memory into f20
fclass.h x1, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 348)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f13, 0(x2) # load 0x00007dff from memory into f13
fclass.h x20, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 352)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f17, 0(x2) # load 0x0000fc01 from memory into f17
fclass.h x26, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 356)

# Testcase cp_fs1_corners (Test source fs1 value = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f22, 0(x2) # load 0x000058b4 from memory into f22
fclass.h x25, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 360)

# Testcase cp_fs1_corners (Test source fs1 value = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f12, 0(x2) # load 0x0000c93a from memory into f12
fclass.h x14, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 364)

# Testcase Improper NaNBoxed argument test (Value 0x0 in f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f31, 0(x2) # load 0x00000000 from memory into f31
fclass.h x25, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 368)

# Testcase Improper NaNBoxed argument test (Value 0xfffe8000 in f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfffe8000 # load x3 with value 0xfffe8000
sw x3, 0(x2) # store 0xfffe8000 in memory
flw f8, 0(x2) # load 0xfffe8000 from memory into f8
fclass.h x13, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 372)

# Testcase Improper NaNBoxed argument test (Value 0x7fff3c00 in f27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fff3c00 # load x3 with value 0x7fff3c00
sw x3, 0(x2) # store 0x7fff3c00 in memory
flw f27, 0(x2) # load 0x7fff3c00 from memory into f27
fclass.h x20, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 376)

# Testcase Improper NaNBoxed argument test (Value 0xbeefbc00 in f23)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbeefbc00 # load x3 with value 0xbeefbc00
sw x3, 0(x2) # store 0xbeefbc00 in memory
flw f23, 0(x2) # load 0xbeefbc00 from memory into f23
fclass.h x24, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 380)

# Testcase Improper NaNBoxed argument test (Value 0xfeff0400 in f2)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeff0400 # load x3 with value 0xfeff0400
sw x3, 0(x2) # store 0xfeff0400 in memory
flw f2, 0(x2) # load 0xfeff0400 from memory into f2
fclass.h x29, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 384)

# Testcase Improper NaNBoxed argument test (Value 0xfff8400 in f25)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0fff8400 # load x3 with value 0x0fff8400
sw x3, 0(x2) # store 0x0fff8400 in memory
flw f25, 0(x2) # load 0x0fff8400 from memory into f25
fclass.h x10, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 388)

# Testcase Improper NaNBoxed argument test (Value 0xefff7bff in f23)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xefff7bff # load x3 with value 0xefff7bff
sw x3, 0(x2) # store 0xefff7bff in memory
flw f23, 0(x2) # load 0xefff7bff from memory into f23
fclass.h x11, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 392)

# Testcase Improper NaNBoxed argument test (Value 0xc0defbff in f10)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc0defbff # load x3 with value 0xc0defbff
sw x3, 0(x2) # store 0xc0defbff in memory
flw f10, 0(x2) # load 0xc0defbff from memory into f10
fclass.h x23, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 396)

# Testcase Improper NaNBoxed argument test (Value 0x4f1a7c00 in f30)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4f1a7c00 # load x3 with value 0x4f1a7c00
sw x3, 0(x2) # store 0x4f1a7c00 in memory
flw f30, 0(x2) # load 0x4f1a7c00 from memory into f30
fclass.h x31, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 400)

# Testcase Improper NaNBoxed argument test (Value 0xffffc00 in f3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0ffffc00 # load x3 with value 0x0ffffc00
sw x3, 0(x2) # store 0x0ffffc00 in memory
flw f3, 0(x2) # load 0x0ffffc00 from memory into f3
fclass.h x8, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 404)

# Testcase Improper NaNBoxed argument test (Value 0xffef7e00 in f29)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffef7e00 # load x3 with value 0xffef7e00
sw x3, 0(x2) # store 0xffef7e00 in memory
flw f29, 0(x2) # load 0xffef7e00 from memory into f29
fclass.h x19, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 408)

# Testcase Improper NaNBoxed argument test (Value 0xfeef7fff in f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeef7fff # load x3 with value 0xfeef7fff
sw x3, 0(x2) # store 0xfeef7fff in memory
flw f8, 0(x2) # load 0xfeef7fff from memory into f8
fclass.h x1, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 412)

# Testcase Improper NaNBoxed argument test (Value 0xa1b27c01 in f27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa1b27c01 # load x3 with value 0xa1b27c01
sw x3, 0(x2) # store 0xa1b27c01 in memory
flw f27, 0(x2) # load 0xa1b27c01 from memory into f27
fclass.h x22, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 416)

# Testcase Improper NaNBoxed argument test (Value 0x4fd77dff in f25)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4fd77dff # load x3 with value 0x4fd77dff
sw x3, 0(x2) # store 0x4fd77dff in memory
flw f25, 0(x2) # load 0x4fd77dff from memory into f25
fclass.h x7, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 420)

#.EQU SIGSIZE,424
.EQU SIGSIZE,1428 #combined


write_tohost:
    la t1, tohost
    li t0, 1
    sw t0, 0(t1)
    sw zero, 4(t1)

self_loop:
    j self_loop

.data

.align 4
scratch:
    .bss 136

.data 

.section .tohost 
tohost: # write to HTIF
    .dword 0
fromhost:
    .dword 0

.align 4
begin_signature:
    .fill SIGSIZE*8/__riscv_xlen,__riscv_xlen/8,0xdeadbeef
end_signature:

.end
