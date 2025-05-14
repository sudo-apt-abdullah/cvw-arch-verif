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
add x28, x20, x3 # perform first operation
fcvt.h.s f9, f19 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x9, x3, x31 # perform first operation
fcvt.h.s f23, f10 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x11, x2, x8 # perform first operation
fcvt.h.s f25, f14 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
fmul.s f29, f20, f7 # perform first operation
fcvt.h.s f7, f29 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x5, x23, x22 # perform first operation
fcvt.h.s f23, f9 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x13, x22, x12 # perform first operation
fcvt.h.s f13, f15 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f22, f26, f24 # perform first operation
fcvt.h.s f22, f25 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f20, f6, f14 # perform first operation
fcvt.h.s f20, f24 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f18, f1, f20 # perform first operation
fcvt.h.s f18, f22 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f14, f16, f30 # perform first operation
fcvt.h.s f16, f9 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f28, f30, f11 # perform first operation
fcvt.h.s f11, f8 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f26, f23, f18 # perform first operation
fcvt.h.s f1, f30 # perform second (triggering) operation

# Testcase cp_fs1 (Test source fs1 = f0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x463a18a541aeb2f5 # load x3 with value 0x463a18a541aeb2f5
sw x3, 0(x2) # store 0x463a18a541aeb2f5 in memory
flw f0, 0(x2) # load 0x463a18a541aeb2f5 from memory into f0
fcvt.h.s f26, f0 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x42850b4b1f4a01a7 # load x3 with value 0x42850b4b1f4a01a7
sw x3, 0(x2) # store 0x42850b4b1f4a01a7 in memory
flw f1, 0(x2) # load 0x42850b4b1f4a01a7 from memory into f1
fcvt.h.s f30, f1 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f2)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x32b665fdf677edb5 # load x3 with value 0x32b665fdf677edb5
sw x3, 0(x2) # store 0x32b665fdf677edb5 in memory
flw f2, 0(x2) # load 0x32b665fdf677edb5 from memory into f2
fcvt.h.s f30, f2 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x46240beb89aa8a93 # load x3 with value 0x46240beb89aa8a93
sw x3, 0(x2) # store 0x46240beb89aa8a93 in memory
flw f3, 0(x2) # load 0x46240beb89aa8a93 from memory into f3
fcvt.h.s f18, f3 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xd67c7dd9a91e44fa # load x3 with value 0xd67c7dd9a91e44fa
sw x3, 0(x2) # store 0xd67c7dd9a91e44fa in memory
flw f4, 0(x2) # load 0xd67c7dd9a91e44fa from memory into f4
fcvt.h.s f17, f4 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc1996bc4bc2cba9e # load x3 with value 0xc1996bc4bc2cba9e
sw x3, 0(x2) # store 0xc1996bc4bc2cba9e in memory
flw f5, 0(x2) # load 0xc1996bc4bc2cba9e from memory into f5
fcvt.h.s f25, f5 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3072a57088a01951 # load x3 with value 0x3072a57088a01951
sw x3, 0(x2) # store 0x3072a57088a01951 in memory
flw f6, 0(x2) # load 0x3072a57088a01951 from memory into f6
fcvt.h.s f28, f6 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc6e3665928a3ac47 # load x3 with value 0xc6e3665928a3ac47
sw x3, 0(x2) # store 0xc6e3665928a3ac47 in memory
flw f7, 0(x2) # load 0xc6e3665928a3ac47 from memory into f7
fcvt.h.s f13, f7 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x564f9b7cfbdcf15a # load x3 with value 0x564f9b7cfbdcf15a
sw x3, 0(x2) # store 0x564f9b7cfbdcf15a in memory
flw f8, 0(x2) # load 0x564f9b7cfbdcf15a from memory into f8
fcvt.h.s f2, f8 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f9)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe9b0469654d1ed07 # load x3 with value 0xe9b0469654d1ed07
sw x3, 0(x2) # store 0xe9b0469654d1ed07 in memory
flw f9, 0(x2) # load 0xe9b0469654d1ed07 from memory into f9
fcvt.h.s f29, f9 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f10)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3e73cfd3ae9ab5b8 # load x3 with value 0x3e73cfd3ae9ab5b8
sw x3, 0(x2) # store 0x3e73cfd3ae9ab5b8 in memory
flw f10, 0(x2) # load 0x3e73cfd3ae9ab5b8 from memory into f10
fcvt.h.s f28, f10 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f11)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc487865a25448fa7 # load x3 with value 0xc487865a25448fa7
sw x3, 0(x2) # store 0xc487865a25448fa7 in memory
flw f11, 0(x2) # load 0xc487865a25448fa7 from memory into f11
fcvt.h.s f17, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe4e705c42ab52263 # load x3 with value 0xe4e705c42ab52263
sw x3, 0(x2) # store 0xe4e705c42ab52263 in memory
flw f12, 0(x2) # load 0xe4e705c42ab52263 from memory into f12
fcvt.h.s f16, f12 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f13)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7948a4a2d4394383 # load x3 with value 0x7948a4a2d4394383
sw x3, 0(x2) # store 0x7948a4a2d4394383 in memory
flw f13, 0(x2) # load 0x7948a4a2d4394383 from memory into f13
fcvt.h.s f8, f13 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f14)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe990f49cf64b022e # load x3 with value 0xe990f49cf64b022e
sw x3, 0(x2) # store 0xe990f49cf64b022e in memory
flw f14, 0(x2) # load 0xe990f49cf64b022e from memory into f14
fcvt.h.s f2, f14 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f15)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xb47241eddd5f06c6 # load x3 with value 0xb47241eddd5f06c6
sw x3, 0(x2) # store 0xb47241eddd5f06c6 in memory
flw f15, 0(x2) # load 0xb47241eddd5f06c6 from memory into f15
fcvt.h.s f13, f15 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f16)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa2e0f10da553b172 # load x3 with value 0xa2e0f10da553b172
sw x3, 0(x2) # store 0xa2e0f10da553b172 in memory
flw f16, 0(x2) # load 0xa2e0f10da553b172 from memory into f16
fcvt.h.s f6, f16 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f17)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe80c4a5791e24635 # load x3 with value 0xe80c4a5791e24635
sw x3, 0(x2) # store 0xe80c4a5791e24635 in memory
flw f17, 0(x2) # load 0xe80c4a5791e24635 from memory into f17
fcvt.h.s f18, f17 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f18)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xeb1abf0a66ebbf0c # load x3 with value 0xeb1abf0a66ebbf0c
sw x3, 0(x2) # store 0xeb1abf0a66ebbf0c in memory
flw f18, 0(x2) # load 0xeb1abf0a66ebbf0c from memory into f18
fcvt.h.s f17, f18 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f19)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x986c479b614fce0d # load x3 with value 0x986c479b614fce0d
sw x3, 0(x2) # store 0x986c479b614fce0d in memory
flw f19, 0(x2) # load 0x986c479b614fce0d from memory into f19
fcvt.h.s f8, f19 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f20)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x29e423b58927bb3 # load x3 with value 0x29e423b58927bb3
sw x3, 0(x2) # store 0x29e423b58927bb3 in memory
flw f20, 0(x2) # load 0x29e423b58927bb3 from memory into f20
fcvt.h.s f20, f20 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f21)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xed1afb8b7f033aee # load x3 with value 0xed1afb8b7f033aee
sw x3, 0(x2) # store 0xed1afb8b7f033aee in memory
flw f21, 0(x2) # load 0xed1afb8b7f033aee from memory into f21
fcvt.h.s f19, f21 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f22)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x8061e183277f8316 # load x3 with value 0x8061e183277f8316
sw x3, 0(x2) # store 0x8061e183277f8316 in memory
flw f22, 0(x2) # load 0x8061e183277f8316 from memory into f22
fcvt.h.s f29, f22 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f23)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xb2574cdd52ea78a6 # load x3 with value 0xb2574cdd52ea78a6
sw x3, 0(x2) # store 0xb2574cdd52ea78a6 in memory
flw f23, 0(x2) # load 0xb2574cdd52ea78a6 from memory into f23
fcvt.h.s f28, f23 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f24)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4beda638dec5a893 # load x3 with value 0x4beda638dec5a893
sw x3, 0(x2) # store 0x4beda638dec5a893 in memory
flw f24, 0(x2) # load 0x4beda638dec5a893 from memory into f24
fcvt.h.s f8, f24 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f25)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe0b9999af8876ee # load x3 with value 0xe0b9999af8876ee
sw x3, 0(x2) # store 0xe0b9999af8876ee in memory
flw f25, 0(x2) # load 0xe0b9999af8876ee from memory into f25
fcvt.h.s f19, f25 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f26)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xd5ef19f589be706 # load x3 with value 0xd5ef19f589be706
sw x3, 0(x2) # store 0xd5ef19f589be706 in memory
flw f26, 0(x2) # load 0xd5ef19f589be706 from memory into f26
fcvt.h.s f13, f26 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x63bd436c0330227b # load x3 with value 0x63bd436c0330227b
sw x3, 0(x2) # store 0x63bd436c0330227b in memory
flw f27, 0(x2) # load 0x63bd436c0330227b from memory into f27
fcvt.h.s f27, f27 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f28)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x5751d91ae66ba77 # load x3 with value 0x5751d91ae66ba77
sw x3, 0(x2) # store 0x5751d91ae66ba77 in memory
flw f28, 0(x2) # load 0x5751d91ae66ba77 from memory into f28
fcvt.h.s f11, f28 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f29)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xd26fa2e67f51e1d7 # load x3 with value 0xd26fa2e67f51e1d7
sw x3, 0(x2) # store 0xd26fa2e67f51e1d7 in memory
flw f29, 0(x2) # load 0xd26fa2e67f51e1d7 from memory into f29
fcvt.h.s f19, f29 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f30)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x5d071c3032614483 # load x3 with value 0x5d071c3032614483
sw x3, 0(x2) # store 0x5d071c3032614483 in memory
flw f30, 0(x2) # load 0x5d071c3032614483 from memory into f30
fcvt.h.s f9, f30 # perform operation second time to make sure flags don't change

# Testcase cp_fs1 (Test source fs1 = f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x66d0086728fd6606 # load x3 with value 0x66d0086728fd6606
sw x3, 0(x2) # store 0x66d0086728fd6606 in memory
flw f31, 0(x2) # load 0x66d0086728fd6606 from memory into f31
fcvt.h.s f6, f31 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x2771c2e26357abee # load x3 with value 0x2771c2e26357abee
sw x3, 0(x2) # store 0x2771c2e26357abee in memory
flw f23, 0(x2) # load 0x2771c2e26357abee from memory into f23
fcvt.h.s f0, f23 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc2a5ade61d99f595 # load x3 with value 0xc2a5ade61d99f595
sw x3, 0(x2) # store 0xc2a5ade61d99f595 in memory
flw f19, 0(x2) # load 0xc2a5ade61d99f595 from memory into f19
fcvt.h.s f1, f19 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x2)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xf1675ed2082db616 # load x3 with value 0xf1675ed2082db616
sw x3, 0(x2) # store 0xf1675ed2082db616 in memory
flw f24, 0(x2) # load 0xf1675ed2082db616 from memory into f24
fcvt.h.s f2, f24 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc49874a497ffce9d # load x3 with value 0xc49874a497ffce9d
sw x3, 0(x2) # store 0xc49874a497ffce9d in memory
flw f9, 0(x2) # load 0xc49874a497ffce9d from memory into f9
fcvt.h.s f3, f9 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7be5d454ed8c5db # load x3 with value 0x7be5d454ed8c5db
sw x3, 0(x2) # store 0x7be5d454ed8c5db in memory
flw f21, 0(x2) # load 0x7be5d454ed8c5db from memory into f21
fcvt.h.s f4, f21 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x9c169de7421b9c9d # load x3 with value 0x9c169de7421b9c9d
sw x3, 0(x2) # store 0x9c169de7421b9c9d in memory
flw f19, 0(x2) # load 0x9c169de7421b9c9d from memory into f19
fcvt.h.s f5, f19 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7a7d827adcbfcddf # load x3 with value 0x7a7d827adcbfcddf
sw x3, 0(x2) # store 0x7a7d827adcbfcddf in memory
flw f25, 0(x2) # load 0x7a7d827adcbfcddf from memory into f25
fcvt.h.s f6, f25 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe645dfc1c402f704 # load x3 with value 0xe645dfc1c402f704
sw x3, 0(x2) # store 0xe645dfc1c402f704 in memory
flw f31, 0(x2) # load 0xe645dfc1c402f704 from memory into f31
fcvt.h.s f7, f31 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x296f400d4e1aa2e6 # load x3 with value 0x296f400d4e1aa2e6
sw x3, 0(x2) # store 0x296f400d4e1aa2e6 in memory
flw f15, 0(x2) # load 0x296f400d4e1aa2e6 from memory into f15
fcvt.h.s f8, f15 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x9)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xdae301f83bafa834 # load x3 with value 0xdae301f83bafa834
sw x3, 0(x2) # store 0xdae301f83bafa834 in memory
flw f22, 0(x2) # load 0xdae301f83bafa834 from memory into f22
fcvt.h.s f9, f22 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x10)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x84e1605caeaa0cbf # load x3 with value 0x84e1605caeaa0cbf
sw x3, 0(x2) # store 0x84e1605caeaa0cbf in memory
flw f18, 0(x2) # load 0x84e1605caeaa0cbf from memory into f18
fcvt.h.s f10, f18 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x11)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xf8c694284ae25b93 # load x3 with value 0xf8c694284ae25b93
sw x3, 0(x2) # store 0xf8c694284ae25b93 in memory
flw f26, 0(x2) # load 0xf8c694284ae25b93 from memory into f26
fcvt.h.s f11, f26 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x1dd1c45a0ed373aa # load x3 with value 0x1dd1c45a0ed373aa
sw x3, 0(x2) # store 0x1dd1c45a0ed373aa in memory
flw f18, 0(x2) # load 0x1dd1c45a0ed373aa from memory into f18
fcvt.h.s f12, f18 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x13)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x219735ac1ad0b1a0 # load x3 with value 0x219735ac1ad0b1a0
sw x3, 0(x2) # store 0x219735ac1ad0b1a0 in memory
flw f21, 0(x2) # load 0x219735ac1ad0b1a0 from memory into f21
fcvt.h.s f13, f21 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x14)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xb5fc281bb8592b88 # load x3 with value 0xb5fc281bb8592b88
sw x3, 0(x2) # store 0xb5fc281bb8592b88 in memory
flw f12, 0(x2) # load 0xb5fc281bb8592b88 from memory into f12
fcvt.h.s f14, f12 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x15)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x395562b6af406e04 # load x3 with value 0x395562b6af406e04
sw x3, 0(x2) # store 0x395562b6af406e04 in memory
flw f22, 0(x2) # load 0x395562b6af406e04 from memory into f22
fcvt.h.s f15, f22 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x16)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x650de151fd9a434e # load x3 with value 0x650de151fd9a434e
sw x3, 0(x2) # store 0x650de151fd9a434e in memory
flw f11, 0(x2) # load 0x650de151fd9a434e from memory into f11
fcvt.h.s f16, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x17)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x85982d3da7407fda # load x3 with value 0x85982d3da7407fda
sw x3, 0(x2) # store 0x85982d3da7407fda in memory
flw f6, 0(x2) # load 0x85982d3da7407fda from memory into f6
fcvt.h.s f17, f6 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x18)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x9579c39732230d2e # load x3 with value 0x9579c39732230d2e
sw x3, 0(x2) # store 0x9579c39732230d2e in memory
flw f5, 0(x2) # load 0x9579c39732230d2e from memory into f5
fcvt.h.s f18, f5 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x19)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbdc374b08324733 # load x3 with value 0xbdc374b08324733
sw x3, 0(x2) # store 0xbdc374b08324733 in memory
flw f28, 0(x2) # load 0xbdc374b08324733 from memory into f28
fcvt.h.s f19, f28 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x20)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x250b2b27252a5c19 # load x3 with value 0x250b2b27252a5c19
sw x3, 0(x2) # store 0x250b2b27252a5c19 in memory
flw f30, 0(x2) # load 0x250b2b27252a5c19 from memory into f30
fcvt.h.s f20, f30 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x21)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x43f9405aff9330df # load x3 with value 0x43f9405aff9330df
sw x3, 0(x2) # store 0x43f9405aff9330df in memory
flw f11, 0(x2) # load 0x43f9405aff9330df from memory into f11
fcvt.h.s f21, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x22)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xaf656b6d5bbbd1a1 # load x3 with value 0xaf656b6d5bbbd1a1
sw x3, 0(x2) # store 0xaf656b6d5bbbd1a1 in memory
flw f26, 0(x2) # load 0xaf656b6d5bbbd1a1 from memory into f26
fcvt.h.s f22, f26 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x23)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfc0f66496424e720 # load x3 with value 0xfc0f66496424e720
sw x3, 0(x2) # store 0xfc0f66496424e720 in memory
flw f20, 0(x2) # load 0xfc0f66496424e720 from memory into f20
fcvt.h.s f23, f20 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x24)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa37edcdb6eb15eea # load x3 with value 0xa37edcdb6eb15eea
sw x3, 0(x2) # store 0xa37edcdb6eb15eea in memory
flw f27, 0(x2) # load 0xa37edcdb6eb15eea from memory into f27
fcvt.h.s f24, f27 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x25)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x411c1a6375fb4697 # load x3 with value 0x411c1a6375fb4697
sw x3, 0(x2) # store 0x411c1a6375fb4697 in memory
flw f1, 0(x2) # load 0x411c1a6375fb4697 from memory into f1
fcvt.h.s f25, f1 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x26)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x8ffce70af22a14e0 # load x3 with value 0x8ffce70af22a14e0
sw x3, 0(x2) # store 0x8ffce70af22a14e0 in memory
flw f15, 0(x2) # load 0x8ffce70af22a14e0 from memory into f15
fcvt.h.s f26, f15 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe790ddc8cb9cc422 # load x3 with value 0xe790ddc8cb9cc422
sw x3, 0(x2) # store 0xe790ddc8cb9cc422 in memory
flw f14, 0(x2) # load 0xe790ddc8cb9cc422 from memory into f14
fcvt.h.s f27, f14 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x28)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xf40f4ef3ecf87674 # load x3 with value 0xf40f4ef3ecf87674
sw x3, 0(x2) # store 0xf40f4ef3ecf87674 in memory
flw f20, 0(x2) # load 0xf40f4ef3ecf87674 from memory into f20
fcvt.h.s f28, f20 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x29)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xdc83443fff70b995 # load x3 with value 0xdc83443fff70b995
sw x3, 0(x2) # store 0xdc83443fff70b995 in memory
flw f23, 0(x2) # load 0xdc83443fff70b995 from memory into f23
fcvt.h.s f29, f23 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x30)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x67236b321002e9a9 # load x3 with value 0x67236b321002e9a9
sw x3, 0(x2) # store 0x67236b321002e9a9 in memory
flw f27, 0(x2) # load 0x67236b321002e9a9 from memory into f27
fcvt.h.s f30, f27 # perform operation second time to make sure flags don't change

# Testcase cp_fd (Test destination fd = x31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x14fd4db92a66b91e # load x3 with value 0x14fd4db92a66b91e
sw x3, 0(x2) # store 0x14fd4db92a66b91e in memory
flw f10, 0(x2) # load 0x14fd4db92a66b91e from memory into f10
fcvt.h.s f31, f10 # perform operation second time to make sure flags don't change

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
flw f23, 0(x2) # load 0x80000000 from memory into f23
fcvt.h.s f21, f23 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x3f800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3f800000 # load x3 with value 0x3f800000
sw x3, 0(x2) # store 0x3f800000 in memory
flw f12, 0(x2) # load 0x3f800000 from memory into f12
fcvt.h.s f3, f12 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xbf800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbf800000 # load x3 with value 0xbf800000
sw x3, 0(x2) # store 0xbf800000 in memory
flw f5, 0(x2) # load 0xbf800000 from memory into f5
fcvt.h.s f29, f5 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x3fc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3fc00000 # load x3 with value 0x3fc00000
sw x3, 0(x2) # store 0x3fc00000 in memory
flw f31, 0(x2) # load 0x3fc00000 from memory into f31
fcvt.h.s f8, f31 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xbfc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbfc00000 # load x3 with value 0xbfc00000
sw x3, 0(x2) # store 0xbfc00000 in memory
flw f7, 0(x2) # load 0xbfc00000 from memory into f7
fcvt.h.s f17, f7 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x40000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x40000000 # load x3 with value 0x40000000
sw x3, 0(x2) # store 0x40000000 in memory
flw f10, 0(x2) # load 0x40000000 from memory into f10
fcvt.h.s f26, f10 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xc0000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc0000000 # load x3 with value 0xc0000000
sw x3, 0(x2) # store 0xc0000000 in memory
flw f28, 0(x2) # load 0xc0000000 from memory into f28
fcvt.h.s f17, f28 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00800000 # load x3 with value 0x00800000
sw x3, 0(x2) # store 0x00800000 in memory
flw f25, 0(x2) # load 0x00800000 from memory into f25
fcvt.h.s f14, f25 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x80800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80800000 # load x3 with value 0x80800000
sw x3, 0(x2) # store 0x80800000 in memory
flw f15, 0(x2) # load 0x80800000 from memory into f15
fcvt.h.s f5, f15 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7f7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f7fffff # load x3 with value 0x7f7fffff
sw x3, 0(x2) # store 0x7f7fffff in memory
flw f8, 0(x2) # load 0x7f7fffff from memory into f8
fcvt.h.s f11, f8 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xff7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xff7fffff # load x3 with value 0xff7fffff
sw x3, 0(x2) # store 0xff7fffff in memory
flw f25, 0(x2) # load 0xff7fffff from memory into f25
fcvt.h.s f27, f25 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x007fffff # load x3 with value 0x007fffff
sw x3, 0(x2) # store 0x007fffff in memory
flw f11, 0(x2) # load 0x007fffff from memory into f11
fcvt.h.s f24, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x807fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x807fffff # load x3 with value 0x807fffff
sw x3, 0(x2) # store 0x807fffff in memory
flw f25, 0(x2) # load 0x807fffff from memory into f25
fcvt.h.s f23, f25 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x400000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00400000 # load x3 with value 0x00400000
sw x3, 0(x2) # store 0x00400000 in memory
flw f24, 0(x2) # load 0x00400000 from memory into f24
fcvt.h.s f13, f24 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x80400000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80400000 # load x3 with value 0x80400000
sw x3, 0(x2) # store 0x80400000 in memory
flw f19, 0(x2) # load 0x80400000 from memory into f19
fcvt.h.s f13, f19 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flw f11, 0(x2) # load 0x00000001 from memory into f11
fcvt.h.s f6, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x80000001)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80000001 # load x3 with value 0x80000001
sw x3, 0(x2) # store 0x80000001 in memory
flw f15, 0(x2) # load 0x80000001 from memory into f15
fcvt.h.s f11, f15 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7f800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f800000 # load x3 with value 0x7f800000
sw x3, 0(x2) # store 0x7f800000 in memory
flw f25, 0(x2) # load 0x7f800000 from memory into f25
fcvt.h.s f23, f25 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xff800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xff800000 # load x3 with value 0xff800000
sw x3, 0(x2) # store 0xff800000 in memory
flw f3, 0(x2) # load 0xff800000 from memory into f3
fcvt.h.s f6, f3 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fc00000 # load x3 with value 0x7fc00000
sw x3, 0(x2) # store 0x7fc00000 in memory
flw f19, 0(x2) # load 0x7fc00000 from memory into f19
fcvt.h.s f31, f19 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fffffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fffffff # load x3 with value 0x7fffffff
sw x3, 0(x2) # store 0x7fffffff in memory
flw f8, 0(x2) # load 0x7fffffff from memory into f8
fcvt.h.s f6, f8 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xffffffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffffffff # load x3 with value 0xffffffff
sw x3, 0(x2) # store 0xffffffff in memory
flw f10, 0(x2) # load 0xffffffff from memory into f10
fcvt.h.s f27, f10 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7f800001)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f800001 # load x3 with value 0x7f800001
sw x3, 0(x2) # store 0x7f800001 in memory
flw f27, 0(x2) # load 0x7f800001 from memory into f27
fcvt.h.s f24, f27 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fbfffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fbfffff # load x3 with value 0x7fbfffff
sw x3, 0(x2) # store 0x7fbfffff in memory
flw f11, 0(x2) # load 0x7fbfffff from memory into f11
fcvt.h.s f28, f11 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0xffbfffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffbfffff # load x3 with value 0xffbfffff
sw x3, 0(x2) # store 0xffbfffff in memory
flw f7, 0(x2) # load 0xffbfffff from memory into f7
fcvt.h.s f20, f7 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x7ef8654f)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7ef8654f # load x3 with value 0x7ef8654f
sw x3, 0(x2) # store 0x7ef8654f in memory
flw f16, 0(x2) # load 0x7ef8654f from memory into f16
fcvt.h.s f26, f16 # perform operation second time to make sure flags don't change

# Testcase cp_fs1_corners (Test source fs1 value = 0x813d9ab0)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x813d9ab0 # load x3 with value 0x813d9ab0
sw x3, 0(x2) # store 0x813d9ab0 in memory
flw f10, 0(x2) # load 0x813d9ab0 from memory into f10
fcvt.h.s f27, f10 # perform operation second time to make sure flags don't change

# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f10, 0(x2) # load 0x00000000 from memory into f10
fcvt.h.s f9, f10, dyn # perform operation
fcvt.h.s f9, f10, rdn # perform operation
fcvt.h.s f9, f10, rmm # perform operation
fcvt.h.s f9, f10, rne # perform operation
fcvt.h.s f9, f10, rtz # perform operation
fcvt.h.s f9, f10, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f9, f10 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f9, f10 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f9, f10 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f9, f10 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f9, f10 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x80000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80000000 # load x3 with value 0x80000000
sw x3, 0(x2) # store 0x80000000 in memory
flw f6, 0(x2) # load 0x80000000 from memory into f6
fcvt.h.s f31, f6, dyn # perform operation
fcvt.h.s f31, f6, rdn # perform operation
fcvt.h.s f31, f6, rmm # perform operation
fcvt.h.s f31, f6, rne # perform operation
fcvt.h.s f31, f6, rtz # perform operation
fcvt.h.s f31, f6, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f31, f6 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f31, f6 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f31, f6 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f31, f6 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f31, f6 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x3f800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3f800000 # load x3 with value 0x3f800000
sw x3, 0(x2) # store 0x3f800000 in memory
flw f26, 0(x2) # load 0x3f800000 from memory into f26
fcvt.h.s f23, f26, dyn # perform operation
fcvt.h.s f23, f26, rdn # perform operation
fcvt.h.s f23, f26, rmm # perform operation
fcvt.h.s f23, f26, rne # perform operation
fcvt.h.s f23, f26, rtz # perform operation
fcvt.h.s f23, f26, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f23, f26 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f23, f26 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f23, f26 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f23, f26 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f23, f26 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xbf800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbf800000 # load x3 with value 0xbf800000
sw x3, 0(x2) # store 0xbf800000 in memory
flw f17, 0(x2) # load 0xbf800000 from memory into f17
fcvt.h.s f2, f17, dyn # perform operation
fcvt.h.s f2, f17, rdn # perform operation
fcvt.h.s f2, f17, rmm # perform operation
fcvt.h.s f2, f17, rne # perform operation
fcvt.h.s f2, f17, rtz # perform operation
fcvt.h.s f2, f17, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f2, f17 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f2, f17 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f2, f17 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f2, f17 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f2, f17 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x3fc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3fc00000 # load x3 with value 0x3fc00000
sw x3, 0(x2) # store 0x3fc00000 in memory
flw f19, 0(x2) # load 0x3fc00000 from memory into f19
fcvt.h.s f31, f19, dyn # perform operation
fcvt.h.s f31, f19, rdn # perform operation
fcvt.h.s f31, f19, rmm # perform operation
fcvt.h.s f31, f19, rne # perform operation
fcvt.h.s f31, f19, rtz # perform operation
fcvt.h.s f31, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f31, f19 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f31, f19 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f31, f19 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f31, f19 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f31, f19 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xbfc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbfc00000 # load x3 with value 0xbfc00000
sw x3, 0(x2) # store 0xbfc00000 in memory
flw f7, 0(x2) # load 0xbfc00000 from memory into f7
fcvt.h.s f11, f7, dyn # perform operation
fcvt.h.s f11, f7, rdn # perform operation
fcvt.h.s f11, f7, rmm # perform operation
fcvt.h.s f11, f7, rne # perform operation
fcvt.h.s f11, f7, rtz # perform operation
fcvt.h.s f11, f7, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f11, f7 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f11, f7 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f11, f7 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f11, f7 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f11, f7 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x40000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x40000000 # load x3 with value 0x40000000
sw x3, 0(x2) # store 0x40000000 in memory
flw f13, 0(x2) # load 0x40000000 from memory into f13
fcvt.h.s f8, f13, dyn # perform operation
fcvt.h.s f8, f13, rdn # perform operation
fcvt.h.s f8, f13, rmm # perform operation
fcvt.h.s f8, f13, rne # perform operation
fcvt.h.s f8, f13, rtz # perform operation
fcvt.h.s f8, f13, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f8, f13 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f8, f13 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f8, f13 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f8, f13 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f8, f13 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xc0000000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc0000000 # load x3 with value 0xc0000000
sw x3, 0(x2) # store 0xc0000000 in memory
flw f31, 0(x2) # load 0xc0000000 from memory into f31
fcvt.h.s f21, f31, dyn # perform operation
fcvt.h.s f21, f31, rdn # perform operation
fcvt.h.s f21, f31, rmm # perform operation
fcvt.h.s f21, f31, rne # perform operation
fcvt.h.s f21, f31, rtz # perform operation
fcvt.h.s f21, f31, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f21, f31 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f21, f31 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f21, f31 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f21, f31 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f21, f31 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00800000 # load x3 with value 0x00800000
sw x3, 0(x2) # store 0x00800000 in memory
flw f23, 0(x2) # load 0x00800000 from memory into f23
fcvt.h.s f5, f23, dyn # perform operation
fcvt.h.s f5, f23, rdn # perform operation
fcvt.h.s f5, f23, rmm # perform operation
fcvt.h.s f5, f23, rne # perform operation
fcvt.h.s f5, f23, rtz # perform operation
fcvt.h.s f5, f23, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f5, f23 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f5, f23 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f5, f23 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f5, f23 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f5, f23 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x80800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80800000 # load x3 with value 0x80800000
sw x3, 0(x2) # store 0x80800000 in memory
flw f2, 0(x2) # load 0x80800000 from memory into f2
fcvt.h.s f11, f2, dyn # perform operation
fcvt.h.s f11, f2, rdn # perform operation
fcvt.h.s f11, f2, rmm # perform operation
fcvt.h.s f11, f2, rne # perform operation
fcvt.h.s f11, f2, rtz # perform operation
fcvt.h.s f11, f2, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f11, f2 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f11, f2 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f11, f2 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f11, f2 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f11, f2 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7f7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f7fffff # load x3 with value 0x7f7fffff
sw x3, 0(x2) # store 0x7f7fffff in memory
flw f30, 0(x2) # load 0x7f7fffff from memory into f30
fcvt.h.s f17, f30, dyn # perform operation
fcvt.h.s f17, f30, rdn # perform operation
fcvt.h.s f17, f30, rmm # perform operation
fcvt.h.s f17, f30, rne # perform operation
fcvt.h.s f17, f30, rtz # perform operation
fcvt.h.s f17, f30, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f17, f30 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f17, f30 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f17, f30 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f17, f30 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f17, f30 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xff7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xff7fffff # load x3 with value 0xff7fffff
sw x3, 0(x2) # store 0xff7fffff in memory
flw f19, 0(x2) # load 0xff7fffff from memory into f19
fcvt.h.s f24, f19, dyn # perform operation
fcvt.h.s f24, f19, rdn # perform operation
fcvt.h.s f24, f19, rmm # perform operation
fcvt.h.s f24, f19, rne # perform operation
fcvt.h.s f24, f19, rtz # perform operation
fcvt.h.s f24, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f24, f19 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f24, f19 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f24, f19 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f24, f19 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f24, f19 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x007fffff # load x3 with value 0x007fffff
sw x3, 0(x2) # store 0x007fffff in memory
flw f7, 0(x2) # load 0x007fffff from memory into f7
fcvt.h.s f28, f7, dyn # perform operation
fcvt.h.s f28, f7, rdn # perform operation
fcvt.h.s f28, f7, rmm # perform operation
fcvt.h.s f28, f7, rne # perform operation
fcvt.h.s f28, f7, rtz # perform operation
fcvt.h.s f28, f7, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f28, f7 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f28, f7 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f28, f7 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f28, f7 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f28, f7 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x807fffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x807fffff # load x3 with value 0x807fffff
sw x3, 0(x2) # store 0x807fffff in memory
flw f23, 0(x2) # load 0x807fffff from memory into f23
fcvt.h.s f29, f23, dyn # perform operation
fcvt.h.s f29, f23, rdn # perform operation
fcvt.h.s f29, f23, rmm # perform operation
fcvt.h.s f29, f23, rne # perform operation
fcvt.h.s f29, f23, rtz # perform operation
fcvt.h.s f29, f23, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f29, f23 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f29, f23 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f29, f23 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f29, f23 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f29, f23 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x400000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00400000 # load x3 with value 0x00400000
sw x3, 0(x2) # store 0x00400000 in memory
flw f7, 0(x2) # load 0x00400000 from memory into f7
fcvt.h.s f5, f7, dyn # perform operation
fcvt.h.s f5, f7, rdn # perform operation
fcvt.h.s f5, f7, rmm # perform operation
fcvt.h.s f5, f7, rne # perform operation
fcvt.h.s f5, f7, rtz # perform operation
fcvt.h.s f5, f7, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f5, f7 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f5, f7 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f5, f7 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f5, f7 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f5, f7 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x80400000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80400000 # load x3 with value 0x80400000
sw x3, 0(x2) # store 0x80400000 in memory
flw f6, 0(x2) # load 0x80400000 from memory into f6
fcvt.h.s f14, f6, dyn # perform operation
fcvt.h.s f14, f6, rdn # perform operation
fcvt.h.s f14, f6, rmm # perform operation
fcvt.h.s f14, f6, rne # perform operation
fcvt.h.s f14, f6, rtz # perform operation
fcvt.h.s f14, f6, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f14, f6 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f14, f6 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f14, f6 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f14, f6 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f14, f6 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flw f14, 0(x2) # load 0x00000001 from memory into f14
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


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x80000001)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x80000001 # load x3 with value 0x80000001
sw x3, 0(x2) # store 0x80000001 in memory
flw f14, 0(x2) # load 0x80000001 from memory into f14
fcvt.h.s f8, f14, dyn # perform operation
fcvt.h.s f8, f14, rdn # perform operation
fcvt.h.s f8, f14, rmm # perform operation
fcvt.h.s f8, f14, rne # perform operation
fcvt.h.s f8, f14, rtz # perform operation
fcvt.h.s f8, f14, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f8, f14 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f8, f14 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f8, f14 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f8, f14 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f8, f14 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7f800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f800000 # load x3 with value 0x7f800000
sw x3, 0(x2) # store 0x7f800000 in memory
flw f6, 0(x2) # load 0x7f800000 from memory into f6
fcvt.h.s f21, f6, dyn # perform operation
fcvt.h.s f21, f6, rdn # perform operation
fcvt.h.s f21, f6, rmm # perform operation
fcvt.h.s f21, f6, rne # perform operation
fcvt.h.s f21, f6, rtz # perform operation
fcvt.h.s f21, f6, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f21, f6 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f21, f6 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f21, f6 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f21, f6 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f21, f6 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xff800000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xff800000 # load x3 with value 0xff800000
sw x3, 0(x2) # store 0xff800000 in memory
flw f21, 0(x2) # load 0xff800000 from memory into f21
fcvt.h.s f1, f21, dyn # perform operation
fcvt.h.s f1, f21, rdn # perform operation
fcvt.h.s f1, f21, rmm # perform operation
fcvt.h.s f1, f21, rne # perform operation
fcvt.h.s f1, f21, rtz # perform operation
fcvt.h.s f1, f21, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f1, f21 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f1, f21 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f1, f21 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f1, f21 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f1, f21 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7fc00000)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fc00000 # load x3 with value 0x7fc00000
sw x3, 0(x2) # store 0x7fc00000 in memory
flw f28, 0(x2) # load 0x7fc00000 from memory into f28
fcvt.h.s f30, f28, dyn # perform operation
fcvt.h.s f30, f28, rdn # perform operation
fcvt.h.s f30, f28, rmm # perform operation
fcvt.h.s f30, f28, rne # perform operation
fcvt.h.s f30, f28, rtz # perform operation
fcvt.h.s f30, f28, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f30, f28 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f30, f28 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f30, f28 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f30, f28 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f30, f28 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7fffffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fffffff # load x3 with value 0x7fffffff
sw x3, 0(x2) # store 0x7fffffff in memory
flw f5, 0(x2) # load 0x7fffffff from memory into f5
fcvt.h.s f17, f5, dyn # perform operation
fcvt.h.s f17, f5, rdn # perform operation
fcvt.h.s f17, f5, rmm # perform operation
fcvt.h.s f17, f5, rne # perform operation
fcvt.h.s f17, f5, rtz # perform operation
fcvt.h.s f17, f5, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f17, f5 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f17, f5 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f17, f5 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f17, f5 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f17, f5 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xffffffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffffffff # load x3 with value 0xffffffff
sw x3, 0(x2) # store 0xffffffff in memory
flw f2, 0(x2) # load 0xffffffff from memory into f2
fcvt.h.s f28, f2, dyn # perform operation
fcvt.h.s f28, f2, rdn # perform operation
fcvt.h.s f28, f2, rmm # perform operation
fcvt.h.s f28, f2, rne # perform operation
fcvt.h.s f28, f2, rtz # perform operation
fcvt.h.s f28, f2, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f28, f2 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f28, f2 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f28, f2 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f28, f2 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f28, f2 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7f800001)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f800001 # load x3 with value 0x7f800001
sw x3, 0(x2) # store 0x7f800001 in memory
flw f15, 0(x2) # load 0x7f800001 from memory into f15
fcvt.h.s f17, f15, dyn # perform operation
fcvt.h.s f17, f15, rdn # perform operation
fcvt.h.s f17, f15, rmm # perform operation
fcvt.h.s f17, f15, rne # perform operation
fcvt.h.s f17, f15, rtz # perform operation
fcvt.h.s f17, f15, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f17, f15 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f17, f15 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f17, f15 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f17, f15 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f17, f15 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7fbfffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fbfffff # load x3 with value 0x7fbfffff
sw x3, 0(x2) # store 0x7fbfffff in memory
flw f22, 0(x2) # load 0x7fbfffff from memory into f22
fcvt.h.s f21, f22, dyn # perform operation
fcvt.h.s f21, f22, rdn # perform operation
fcvt.h.s f21, f22, rmm # perform operation
fcvt.h.s f21, f22, rne # perform operation
fcvt.h.s f21, f22, rtz # perform operation
fcvt.h.s f21, f22, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f21, f22 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f21, f22 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f21, f22 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f21, f22 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f21, f22 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xffbfffff)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffbfffff # load x3 with value 0xffbfffff
sw x3, 0(x2) # store 0xffbfffff in memory
flw f1, 0(x2) # load 0xffbfffff from memory into f1
fcvt.h.s f21, f1, dyn # perform operation
fcvt.h.s f21, f1, rdn # perform operation
fcvt.h.s f21, f1, rmm # perform operation
fcvt.h.s f21, f1, rne # perform operation
fcvt.h.s f21, f1, rtz # perform operation
fcvt.h.s f21, f1, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f21, f1 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f21, f1 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f21, f1 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f21, f1 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f21, f1 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7ef8654f)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7ef8654f # load x3 with value 0x7ef8654f
sw x3, 0(x2) # store 0x7ef8654f in memory
flw f11, 0(x2) # load 0x7ef8654f from memory into f11
fcvt.h.s f22, f11, dyn # perform operation
fcvt.h.s f22, f11, rdn # perform operation
fcvt.h.s f22, f11, rmm # perform operation
fcvt.h.s f22, f11, rne # perform operation
fcvt.h.s f22, f11, rtz # perform operation
fcvt.h.s f22, f11, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f22, f11 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f22, f11 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f22, f11 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f22, f11 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f22, f11 # perform operation


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x813d9ab0)
fsflagsi 0b00000 # clear all fflags
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x813d9ab0 # load x3 with value 0x813d9ab0
sw x3, 0(x2) # store 0x813d9ab0 in memory
flw f16, 0(x2) # load 0x813d9ab0 from memory into f16
fcvt.h.s f11, f16, dyn # perform operation
fcvt.h.s f11, f16, rdn # perform operation
fcvt.h.s f11, f16, rmm # perform operation
fcvt.h.s f11, f16, rne # perform operation
fcvt.h.s f11, f16, rtz # perform operation
fcvt.h.s f11, f16, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f11, f16 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f11, f16 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f11, f16 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f11, f16 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f11, f16 # perform operation


# Testcase cmp_fd_fs1 (Test fd = fs1 = f0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xd3ce2a807927ff4d # load x3 with value 0xd3ce2a807927ff4d
sw x3, 0(x2) # store 0xd3ce2a807927ff4d in memory
flw f0, 0(x2) # load 0xd3ce2a807927ff4d from memory into f0
fcvt.h.s f0, f0 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x9372ec87b41a4a61 # load x3 with value 0x9372ec87b41a4a61
sw x3, 0(x2) # store 0x9372ec87b41a4a61 in memory
flw f1, 0(x2) # load 0x9372ec87b41a4a61 from memory into f1
fcvt.h.s f1, f1 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f2)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc9b424be0d54f2b2 # load x3 with value 0xc9b424be0d54f2b2
sw x3, 0(x2) # store 0xc9b424be0d54f2b2 in memory
flw f2, 0(x2) # load 0xc9b424be0d54f2b2 from memory into f2
fcvt.h.s f2, f2 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xdeb8adf0c08dd565 # load x3 with value 0xdeb8adf0c08dd565
sw x3, 0(x2) # store 0xdeb8adf0c08dd565 in memory
flw f3, 0(x2) # load 0xdeb8adf0c08dd565 from memory into f3
fcvt.h.s f3, f3 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x9f6903479aaec039 # load x3 with value 0x9f6903479aaec039
sw x3, 0(x2) # store 0x9f6903479aaec039 in memory
flw f4, 0(x2) # load 0x9f6903479aaec039 from memory into f4
fcvt.h.s f4, f4 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x88dbf970b760082f # load x3 with value 0x88dbf970b760082f
sw x3, 0(x2) # store 0x88dbf970b760082f in memory
flw f5, 0(x2) # load 0x88dbf970b760082f from memory into f5
fcvt.h.s f5, f5 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7b40de217e68fc4b # load x3 with value 0x7b40de217e68fc4b
sw x3, 0(x2) # store 0x7b40de217e68fc4b in memory
flw f6, 0(x2) # load 0x7b40de217e68fc4b from memory into f6
fcvt.h.s f6, f6 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa4cb27235785c1b2 # load x3 with value 0xa4cb27235785c1b2
sw x3, 0(x2) # store 0xa4cb27235785c1b2 in memory
flw f7, 0(x2) # load 0xa4cb27235785c1b2 from memory into f7
fcvt.h.s f7, f7 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbd31e85dc079620c # load x3 with value 0xbd31e85dc079620c
sw x3, 0(x2) # store 0xbd31e85dc079620c in memory
flw f8, 0(x2) # load 0xbd31e85dc079620c from memory into f8
fcvt.h.s f8, f8 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f9)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7bc514cc0dbce1db # load x3 with value 0x7bc514cc0dbce1db
sw x3, 0(x2) # store 0x7bc514cc0dbce1db in memory
flw f9, 0(x2) # load 0x7bc514cc0dbce1db from memory into f9
fcvt.h.s f9, f9 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f10)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4e39604aa7e4d26f # load x3 with value 0x4e39604aa7e4d26f
sw x3, 0(x2) # store 0x4e39604aa7e4d26f in memory
flw f10, 0(x2) # load 0x4e39604aa7e4d26f from memory into f10
fcvt.h.s f10, f10 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f11)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe3905663e3e6b547 # load x3 with value 0xe3905663e3e6b547
sw x3, 0(x2) # store 0xe3905663e3e6b547 in memory
flw f11, 0(x2) # load 0xe3905663e3e6b547 from memory into f11
fcvt.h.s f11, f11 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x29d67f33600f4ae4 # load x3 with value 0x29d67f33600f4ae4
sw x3, 0(x2) # store 0x29d67f33600f4ae4 in memory
flw f12, 0(x2) # load 0x29d67f33600f4ae4 from memory into f12
fcvt.h.s f12, f12 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f13)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xadbb4f3e1121e7ba # load x3 with value 0xadbb4f3e1121e7ba
sw x3, 0(x2) # store 0xadbb4f3e1121e7ba in memory
flw f13, 0(x2) # load 0xadbb4f3e1121e7ba from memory into f13
fcvt.h.s f13, f13 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f14)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x23b521890a1c15f9 # load x3 with value 0x23b521890a1c15f9
sw x3, 0(x2) # store 0x23b521890a1c15f9 in memory
flw f14, 0(x2) # load 0x23b521890a1c15f9 from memory into f14
fcvt.h.s f14, f14 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f15)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfdb5a21b2b0d08de # load x3 with value 0xfdb5a21b2b0d08de
sw x3, 0(x2) # store 0xfdb5a21b2b0d08de in memory
flw f15, 0(x2) # load 0xfdb5a21b2b0d08de from memory into f15
fcvt.h.s f15, f15 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f16)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xd0992111823b6dd1 # load x3 with value 0xd0992111823b6dd1
sw x3, 0(x2) # store 0xd0992111823b6dd1 in memory
flw f16, 0(x2) # load 0xd0992111823b6dd1 from memory into f16
fcvt.h.s f16, f16 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f17)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe15f6fa26b911da5 # load x3 with value 0xe15f6fa26b911da5
sw x3, 0(x2) # store 0xe15f6fa26b911da5 in memory
flw f17, 0(x2) # load 0xe15f6fa26b911da5 from memory into f17
fcvt.h.s f17, f17 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f18)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xd5bc0dd1fee41b33 # load x3 with value 0xd5bc0dd1fee41b33
sw x3, 0(x2) # store 0xd5bc0dd1fee41b33 in memory
flw f18, 0(x2) # load 0xd5bc0dd1fee41b33 from memory into f18
fcvt.h.s f18, f18 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f19)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x1c52a4131815159c # load x3 with value 0x1c52a4131815159c
sw x3, 0(x2) # store 0x1c52a4131815159c in memory
flw f19, 0(x2) # load 0x1c52a4131815159c from memory into f19
fcvt.h.s f19, f19 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f20)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x13e466c1cf3a0ac2 # load x3 with value 0x13e466c1cf3a0ac2
sw x3, 0(x2) # store 0x13e466c1cf3a0ac2 in memory
flw f20, 0(x2) # load 0x13e466c1cf3a0ac2 from memory into f20
fcvt.h.s f20, f20 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f21)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x75148b53e463618e # load x3 with value 0x75148b53e463618e
sw x3, 0(x2) # store 0x75148b53e463618e in memory
flw f21, 0(x2) # load 0x75148b53e463618e from memory into f21
fcvt.h.s f21, f21 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f22)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe73cd1816f833486 # load x3 with value 0xe73cd1816f833486
sw x3, 0(x2) # store 0xe73cd1816f833486 in memory
flw f22, 0(x2) # load 0xe73cd1816f833486 from memory into f22
fcvt.h.s f22, f22 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f23)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x6e4edec4b531cbe # load x3 with value 0x6e4edec4b531cbe
sw x3, 0(x2) # store 0x6e4edec4b531cbe in memory
flw f23, 0(x2) # load 0x6e4edec4b531cbe from memory into f23
fcvt.h.s f23, f23 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f24)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x23e74be202fd9c69 # load x3 with value 0x23e74be202fd9c69
sw x3, 0(x2) # store 0x23e74be202fd9c69 in memory
flw f24, 0(x2) # load 0x23e74be202fd9c69 from memory into f24
fcvt.h.s f24, f24 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f25)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x2fc2ceff3aa7d118 # load x3 with value 0x2fc2ceff3aa7d118
sw x3, 0(x2) # store 0x2fc2ceff3aa7d118 in memory
flw f25, 0(x2) # load 0x2fc2ceff3aa7d118 from memory into f25
fcvt.h.s f25, f25 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f26)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x20a322f8fc85b52a # load x3 with value 0x20a322f8fc85b52a
sw x3, 0(x2) # store 0x20a322f8fc85b52a in memory
flw f26, 0(x2) # load 0x20a322f8fc85b52a from memory into f26
fcvt.h.s f26, f26 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xe5d665a616dd8136 # load x3 with value 0xe5d665a616dd8136
sw x3, 0(x2) # store 0xe5d665a616dd8136 in memory
flw f27, 0(x2) # load 0xe5d665a616dd8136 from memory into f27
fcvt.h.s f27, f27 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f28)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x9e15b2abd20aed6f # load x3 with value 0x9e15b2abd20aed6f
sw x3, 0(x2) # store 0x9e15b2abd20aed6f in memory
flw f28, 0(x2) # load 0x9e15b2abd20aed6f from memory into f28
fcvt.h.s f28, f28 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f29)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x130b214fab24e8c # load x3 with value 0x130b214fab24e8c
sw x3, 0(x2) # store 0x130b214fab24e8c in memory
flw f29, 0(x2) # load 0x130b214fab24e8c from memory into f29
fcvt.h.s f29, f29 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f30)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x9dc167c5c5bc1b4d # load x3 with value 0x9dc167c5c5bc1b4d
sw x3, 0(x2) # store 0x9dc167c5c5bc1b4d in memory
flw f30, 0(x2) # load 0x9dc167c5c5bc1b4d from memory into f30
fcvt.h.s f30, f30 # perform operation second time to make sure flags don't change

# Testcase cmp_fd_fs1 (Test fd = fs1 = f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x26d9dc447949cb5 # load x3 with value 0x26d9dc447949cb5
sw x3, 0(x2) # store 0x26d9dc447949cb5 in memory
flw f31, 0(x2) # load 0x26d9dc447949cb5 from memory into f31
fcvt.h.s f31, f31 # perform operation second time to make sure flags don't change

# Testcase cp_frm
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7f283235d893a1c3 # load x3 with value 0x7f283235d893a1c3
sw x3, 0(x2) # store 0x7f283235d893a1c3 in memory
flw f1, 0(x2) # load 0x7f283235d893a1c3 from memory into f1
fcvt.h.s f29, f1, dyn # perform operation
fcvt.h.s f29, f1, rdn # perform operation
fcvt.h.s f29, f1, rmm # perform operation
fcvt.h.s f29, f1, rne # perform operation
fcvt.h.s f29, f1, rtz # perform operation
fcvt.h.s f29, f1, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.h.s f29, f1 # perform operation

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.h.s f29, f1 # perform operation

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.h.s f29, f1 # perform operation

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.h.s f29, f1 # perform operation

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.h.s f29, f1 # perform operation


# Testcase Random test for cp_NaNBox 
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x3b3d6ea1317e0ca2 # load x3 with value 0x3b3d6ea1317e0ca2
sw x3, 0(x2) # store 0x3b3d6ea1317e0ca2 in memory
flw f15, 0(x2) # load 0x3b3d6ea1317e0ca2 from memory into f15
fcvt.h.s f1, f15 # perform operation second time to make sure flags don't change

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
add x9, x8, x25 # perform first operation
fsgnj.h f15, f20, f12 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x17, x19, x16 # perform first operation
fsgnj.h f11, f8, f1 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x22, x8, x16 # perform first operation
fsgnj.h f25, f6, f3 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
fmul.s f28, f27, f13 # perform first operation
fsgnj.h f28, f28, f19 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
fmul.s f30, f2, f7 # perform first operation
fsgnj.h f2, f17, f30 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x3, x12, x21 # perform first operation
fsgnj.h f12, f2, f3 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f31, f21, f5 # perform first operation
fsgnj.h f31, f13, f29 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f1, f29, f5 # perform first operation
fsgnj.h f1, f26, f11 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f2, f16, f10 # perform first operation
fsgnj.h f2, f17, f13 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f21, f7, f5 # perform first operation
fsgnj.h f7, f11, f29 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f29, f31, f15 # perform first operation
fsgnj.h f15, f14, f24 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f23, f13, f14 # perform first operation
fsgnj.h f11, f30, f25 # perform second (triggering) operation

# Testcase cp_fs1 (Test source fs1 = f0)
la x2, scratch
li x3, 0xaabcfd2a88d4dc9f # load x3 with value 0xaabcfd2a88d4dc9f
sw x3, 0(x2) # store 0xaabcfd2a88d4dc9f in memory
flh f0, 0(x2) # load 0xaabcfd2a88d4dc9f from memory into f0
la x2, scratch
li x3, 0x683085fd4c0da98f # load x3 with value 0x683085fd4c0da98f
sw x3, 0(x2) # store 0x683085fd4c0da98f in memory
flh f29, 0(x2) # load 0x683085fd4c0da98f from memory into f29
fsgnj.h f5, f0, f29 # perform operation

# Testcase cp_fs1 (Test source fs1 = f1)
la x2, scratch
li x3, 0xe6ac9420510c96a9 # load x3 with value 0xe6ac9420510c96a9
sw x3, 0(x2) # store 0xe6ac9420510c96a9 in memory
flh f1, 0(x2) # load 0xe6ac9420510c96a9 from memory into f1
la x2, scratch
li x3, 0x96656752775dc7d0 # load x3 with value 0x96656752775dc7d0
sw x3, 0(x2) # store 0x96656752775dc7d0 in memory
flh f31, 0(x2) # load 0x96656752775dc7d0 from memory into f31
fsgnj.h f15, f1, f31 # perform operation

# Testcase cp_fs1 (Test source fs1 = f2)
la x2, scratch
li x3, 0xe65be9cf83ba3e12 # load x3 with value 0xe65be9cf83ba3e12
sw x3, 0(x2) # store 0xe65be9cf83ba3e12 in memory
flh f2, 0(x2) # load 0xe65be9cf83ba3e12 from memory into f2
la x2, scratch
li x3, 0xca47b6e42cbd0e4a # load x3 with value 0xca47b6e42cbd0e4a
sw x3, 0(x2) # store 0xca47b6e42cbd0e4a in memory
flh f1, 0(x2) # load 0xca47b6e42cbd0e4a from memory into f1
fsgnj.h f31, f2, f1 # perform operation

# Testcase cp_fs1 (Test source fs1 = f3)
la x2, scratch
li x3, 0x96edaaa76cb2ee8d # load x3 with value 0x96edaaa76cb2ee8d
sw x3, 0(x2) # store 0x96edaaa76cb2ee8d in memory
flh f3, 0(x2) # load 0x96edaaa76cb2ee8d from memory into f3
la x2, scratch
li x3, 0x41886c717f8c55ec # load x3 with value 0x41886c717f8c55ec
sw x3, 0(x2) # store 0x41886c717f8c55ec in memory
flh f22, 0(x2) # load 0x41886c717f8c55ec from memory into f22
fsgnj.h f3, f3, f22 # perform operation

# Testcase cp_fs1 (Test source fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xdd42468084fffa3a # load x3 with value 0xdd42468084fffa3a
sw x3, 0(x2) # store 0xdd42468084fffa3a in memory
flh f4, 0(x2) # load 0xdd42468084fffa3a from memory into f4
la x2, scratch
li x3, 0xf913172c1a8c2a31 # load x3 with value 0xf913172c1a8c2a31
sw x3, 0(x2) # store 0xf913172c1a8c2a31 in memory
flh f14, 0(x2) # load 0xf913172c1a8c2a31 from memory into f14
fsgnj.h f11, f4, f14 # perform operation

# Testcase cp_fs1 (Test source fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xcd2ae1626f59af33 # load x3 with value 0xcd2ae1626f59af33
sw x3, 0(x2) # store 0xcd2ae1626f59af33 in memory
flh f5, 0(x2) # load 0xcd2ae1626f59af33 from memory into f5
la x2, scratch
li x3, 0x36d310c97ef6a6b5 # load x3 with value 0x36d310c97ef6a6b5
sw x3, 0(x2) # store 0x36d310c97ef6a6b5 in memory
flh f30, 0(x2) # load 0x36d310c97ef6a6b5 from memory into f30
fsgnj.h f7, f5, f30 # perform operation

# Testcase cp_fs1 (Test source fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x46e99c1d31514b00 # load x3 with value 0x46e99c1d31514b00
sw x3, 0(x2) # store 0x46e99c1d31514b00 in memory
flh f6, 0(x2) # load 0x46e99c1d31514b00 from memory into f6
la x2, scratch
li x3, 0xa636f273e936198d # load x3 with value 0xa636f273e936198d
sw x3, 0(x2) # store 0xa636f273e936198d in memory
flh f12, 0(x2) # load 0xa636f273e936198d from memory into f12
fsgnj.h f13, f6, f12 # perform operation

# Testcase cp_fs1 (Test source fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xd0264e49df9d1b00 # load x3 with value 0xd0264e49df9d1b00
sw x3, 0(x2) # store 0xd0264e49df9d1b00 in memory
flh f7, 0(x2) # load 0xd0264e49df9d1b00 from memory into f7
la x2, scratch
li x3, 0x256c63fb370686c0 # load x3 with value 0x256c63fb370686c0
sw x3, 0(x2) # store 0x256c63fb370686c0 in memory
flh f13, 0(x2) # load 0x256c63fb370686c0 from memory into f13
fsgnj.h f30, f7, f13 # perform operation

# Testcase cp_fs1 (Test source fs1 = f8)
la x2, scratch
li x3, 0xe31cbb031af261a0 # load x3 with value 0xe31cbb031af261a0
sw x3, 0(x2) # store 0xe31cbb031af261a0 in memory
flh f8, 0(x2) # load 0xe31cbb031af261a0 from memory into f8
la x2, scratch
li x3, 0x55c7c46fac9e9cb2 # load x3 with value 0x55c7c46fac9e9cb2
sw x3, 0(x2) # store 0x55c7c46fac9e9cb2 in memory
flh f27, 0(x2) # load 0x55c7c46fac9e9cb2 from memory into f27
fsgnj.h f20, f8, f27 # perform operation

# Testcase cp_fs1 (Test source fs1 = f9)
la x2, scratch
li x3, 0xc9b105321cf3a9e3 # load x3 with value 0xc9b105321cf3a9e3
sw x3, 0(x2) # store 0xc9b105321cf3a9e3 in memory
flh f9, 0(x2) # load 0xc9b105321cf3a9e3 from memory into f9
la x2, scratch
li x3, 0xc9cb4d23a849a8fc # load x3 with value 0xc9cb4d23a849a8fc
sw x3, 0(x2) # store 0xc9cb4d23a849a8fc in memory
flh f30, 0(x2) # load 0xc9cb4d23a849a8fc from memory into f30
fsgnj.h f31, f9, f30 # perform operation

# Testcase cp_fs1 (Test source fs1 = f10)
la x2, scratch
li x3, 0xec400f652287457f # load x3 with value 0xec400f652287457f
sw x3, 0(x2) # store 0xec400f652287457f in memory
flh f10, 0(x2) # load 0xec400f652287457f from memory into f10
la x2, scratch
li x3, 0x697cce383ee7a6b2 # load x3 with value 0x697cce383ee7a6b2
sw x3, 0(x2) # store 0x697cce383ee7a6b2 in memory
flh f25, 0(x2) # load 0x697cce383ee7a6b2 from memory into f25
fsgnj.h f23, f10, f25 # perform operation

# Testcase cp_fs1 (Test source fs1 = f11)
la x2, scratch
li x3, 0x21db303d68160548 # load x3 with value 0x21db303d68160548
sw x3, 0(x2) # store 0x21db303d68160548 in memory
flh f11, 0(x2) # load 0x21db303d68160548 from memory into f11
la x2, scratch
li x3, 0x6d4eac2425b66914 # load x3 with value 0x6d4eac2425b66914
sw x3, 0(x2) # store 0x6d4eac2425b66914 in memory
flh f27, 0(x2) # load 0x6d4eac2425b66914 from memory into f27
fsgnj.h f21, f11, f27 # perform operation

# Testcase cp_fs1 (Test source fs1 = f12)
la x2, scratch
li x3, 0x8782ca2a0d729628 # load x3 with value 0x8782ca2a0d729628
sw x3, 0(x2) # store 0x8782ca2a0d729628 in memory
flh f12, 0(x2) # load 0x8782ca2a0d729628 from memory into f12
la x2, scratch
li x3, 0xa93ed50f4bd23a34 # load x3 with value 0xa93ed50f4bd23a34
sw x3, 0(x2) # store 0xa93ed50f4bd23a34 in memory
flh f6, 0(x2) # load 0xa93ed50f4bd23a34 from memory into f6
fsgnj.h f5, f12, f6 # perform operation

# Testcase cp_fs1 (Test source fs1 = f13)
la x2, scratch
li x3, 0x3545d66081f89e1a # load x3 with value 0x3545d66081f89e1a
sw x3, 0(x2) # store 0x3545d66081f89e1a in memory
flh f13, 0(x2) # load 0x3545d66081f89e1a from memory into f13
la x2, scratch
li x3, 0x3691e701937179b7 # load x3 with value 0x3691e701937179b7
sw x3, 0(x2) # store 0x3691e701937179b7 in memory
flh f8, 0(x2) # load 0x3691e701937179b7 from memory into f8
fsgnj.h f1, f13, f8 # perform operation

# Testcase cp_fs1 (Test source fs1 = f14)
la x2, scratch
li x3, 0x3aaf2feee3a69ab5 # load x3 with value 0x3aaf2feee3a69ab5
sw x3, 0(x2) # store 0x3aaf2feee3a69ab5 in memory
flh f14, 0(x2) # load 0x3aaf2feee3a69ab5 from memory into f14
la x2, scratch
li x3, 0xefc401f2fe2658ee # load x3 with value 0xefc401f2fe2658ee
sw x3, 0(x2) # store 0xefc401f2fe2658ee in memory
flh f24, 0(x2) # load 0xefc401f2fe2658ee from memory into f24
fsgnj.h f11, f14, f24 # perform operation

# Testcase cp_fs1 (Test source fs1 = f15)
la x2, scratch
li x3, 0x44e31eacf43dfeab # load x3 with value 0x44e31eacf43dfeab
sw x3, 0(x2) # store 0x44e31eacf43dfeab in memory
flh f15, 0(x2) # load 0x44e31eacf43dfeab from memory into f15
la x2, scratch
li x3, 0x3d65d0d6473acbe4 # load x3 with value 0x3d65d0d6473acbe4
sw x3, 0(x2) # store 0x3d65d0d6473acbe4 in memory
flh f7, 0(x2) # load 0x3d65d0d6473acbe4 from memory into f7
fsgnj.h f18, f15, f7 # perform operation

# Testcase cp_fs1 (Test source fs1 = f16)
la x2, scratch
li x3, 0xbcec647d2b6eefdf # load x3 with value 0xbcec647d2b6eefdf
sw x3, 0(x2) # store 0xbcec647d2b6eefdf in memory
flh f16, 0(x2) # load 0xbcec647d2b6eefdf from memory into f16
la x2, scratch
li x3, 0xd93220da5af8518d # load x3 with value 0xd93220da5af8518d
sw x3, 0(x2) # store 0xd93220da5af8518d in memory
flh f10, 0(x2) # load 0xd93220da5af8518d from memory into f10
fsgnj.h f23, f16, f10 # perform operation

# Testcase cp_fs1 (Test source fs1 = f17)
la x2, scratch
li x3, 0x5cda883b99f77162 # load x3 with value 0x5cda883b99f77162
sw x3, 0(x2) # store 0x5cda883b99f77162 in memory
flh f17, 0(x2) # load 0x5cda883b99f77162 from memory into f17
la x2, scratch
li x3, 0x48ee2148f7eebfc7 # load x3 with value 0x48ee2148f7eebfc7
sw x3, 0(x2) # store 0x48ee2148f7eebfc7 in memory
flh f24, 0(x2) # load 0x48ee2148f7eebfc7 from memory into f24
fsgnj.h f31, f17, f24 # perform operation

# Testcase cp_fs1 (Test source fs1 = f18)
la x2, scratch
li x3, 0x3235be745fcb2bb0 # load x3 with value 0x3235be745fcb2bb0
sw x3, 0(x2) # store 0x3235be745fcb2bb0 in memory
flh f18, 0(x2) # load 0x3235be745fcb2bb0 from memory into f18
la x2, scratch
li x3, 0x7f1720ae1a549514 # load x3 with value 0x7f1720ae1a549514
sw x3, 0(x2) # store 0x7f1720ae1a549514 in memory
flh f1, 0(x2) # load 0x7f1720ae1a549514 from memory into f1
fsgnj.h f20, f18, f1 # perform operation

# Testcase cp_fs1 (Test source fs1 = f19)
la x2, scratch
li x3, 0xede2b8e413b97528 # load x3 with value 0xede2b8e413b97528
sw x3, 0(x2) # store 0xede2b8e413b97528 in memory
flh f19, 0(x2) # load 0xede2b8e413b97528 from memory into f19
la x2, scratch
li x3, 0xec595cb08e34a02 # load x3 with value 0xec595cb08e34a02
sw x3, 0(x2) # store 0xec595cb08e34a02 in memory
flh f30, 0(x2) # load 0xec595cb08e34a02 from memory into f30
fsgnj.h f19, f19, f30 # perform operation

# Testcase cp_fs1 (Test source fs1 = f20)
la x2, scratch
li x3, 0x886bae81a83b1f65 # load x3 with value 0x886bae81a83b1f65
sw x3, 0(x2) # store 0x886bae81a83b1f65 in memory
flh f20, 0(x2) # load 0x886bae81a83b1f65 from memory into f20
la x2, scratch
li x3, 0x91b76c82fd55618d # load x3 with value 0x91b76c82fd55618d
sw x3, 0(x2) # store 0x91b76c82fd55618d in memory
flh f2, 0(x2) # load 0x91b76c82fd55618d from memory into f2
fsgnj.h f1, f20, f2 # perform operation

# Testcase cp_fs1 (Test source fs1 = f21)
la x2, scratch
li x3, 0x54c9bf999ada33b4 # load x3 with value 0x54c9bf999ada33b4
sw x3, 0(x2) # store 0x54c9bf999ada33b4 in memory
flh f21, 0(x2) # load 0x54c9bf999ada33b4 from memory into f21
la x2, scratch
li x3, 0x79b29f77c1534a5f # load x3 with value 0x79b29f77c1534a5f
sw x3, 0(x2) # store 0x79b29f77c1534a5f in memory
flh f22, 0(x2) # load 0x79b29f77c1534a5f from memory into f22
fsgnj.h f8, f21, f22 # perform operation

# Testcase cp_fs1 (Test source fs1 = f22)
la x2, scratch
li x3, 0xd2efd7a62335e88c # load x3 with value 0xd2efd7a62335e88c
sw x3, 0(x2) # store 0xd2efd7a62335e88c in memory
flh f22, 0(x2) # load 0xd2efd7a62335e88c from memory into f22
la x2, scratch
li x3, 0x51ca40389ac93d5e # load x3 with value 0x51ca40389ac93d5e
sw x3, 0(x2) # store 0x51ca40389ac93d5e in memory
flh f1, 0(x2) # load 0x51ca40389ac93d5e from memory into f1
fsgnj.h f3, f22, f1 # perform operation

# Testcase cp_fs1 (Test source fs1 = f23)
la x2, scratch
li x3, 0xbfeacad5630b7662 # load x3 with value 0xbfeacad5630b7662
sw x3, 0(x2) # store 0xbfeacad5630b7662 in memory
flh f23, 0(x2) # load 0xbfeacad5630b7662 from memory into f23
la x2, scratch
li x3, 0x9fba1fea82567dfe # load x3 with value 0x9fba1fea82567dfe
sw x3, 0(x2) # store 0x9fba1fea82567dfe in memory
flh f19, 0(x2) # load 0x9fba1fea82567dfe from memory into f19
fsgnj.h f26, f23, f19 # perform operation

# Testcase cp_fs1 (Test source fs1 = f24)
la x2, scratch
li x3, 0x5f3616a51d85ee1a # load x3 with value 0x5f3616a51d85ee1a
sw x3, 0(x2) # store 0x5f3616a51d85ee1a in memory
flh f24, 0(x2) # load 0x5f3616a51d85ee1a from memory into f24
la x2, scratch
li x3, 0xb504e4b83acd9fc7 # load x3 with value 0xb504e4b83acd9fc7
sw x3, 0(x2) # store 0xb504e4b83acd9fc7 in memory
flh f2, 0(x2) # load 0xb504e4b83acd9fc7 from memory into f2
fsgnj.h f26, f24, f2 # perform operation

# Testcase cp_fs1 (Test source fs1 = f25)
la x2, scratch
li x3, 0x317f76c1bcfb94c4 # load x3 with value 0x317f76c1bcfb94c4
sw x3, 0(x2) # store 0x317f76c1bcfb94c4 in memory
flh f25, 0(x2) # load 0x317f76c1bcfb94c4 from memory into f25
la x2, scratch
li x3, 0xafd53fab8a17edfa # load x3 with value 0xafd53fab8a17edfa
sw x3, 0(x2) # store 0xafd53fab8a17edfa in memory
flh f1, 0(x2) # load 0xafd53fab8a17edfa from memory into f1
fsgnj.h f26, f25, f1 # perform operation

# Testcase cp_fs1 (Test source fs1 = f26)
la x2, scratch
li x3, 0x4a0cd66bbf0fbfaa # load x3 with value 0x4a0cd66bbf0fbfaa
sw x3, 0(x2) # store 0x4a0cd66bbf0fbfaa in memory
flh f26, 0(x2) # load 0x4a0cd66bbf0fbfaa from memory into f26
la x2, scratch
li x3, 0xf1d57af80114eb25 # load x3 with value 0xf1d57af80114eb25
sw x3, 0(x2) # store 0xf1d57af80114eb25 in memory
flh f30, 0(x2) # load 0xf1d57af80114eb25 from memory into f30
fsgnj.h f25, f26, f30 # perform operation

# Testcase cp_fs1 (Test source fs1 = f27)
la x2, scratch
li x3, 0xc88704788ca09b18 # load x3 with value 0xc88704788ca09b18
sw x3, 0(x2) # store 0xc88704788ca09b18 in memory
flh f27, 0(x2) # load 0xc88704788ca09b18 from memory into f27
la x2, scratch
li x3, 0xcaba3f93fe534735 # load x3 with value 0xcaba3f93fe534735
sw x3, 0(x2) # store 0xcaba3f93fe534735 in memory
flh f5, 0(x2) # load 0xcaba3f93fe534735 from memory into f5
fsgnj.h f13, f27, f5 # perform operation

# Testcase cp_fs1 (Test source fs1 = f28)
la x2, scratch
li x3, 0xe2b534ba489ff630 # load x3 with value 0xe2b534ba489ff630
sw x3, 0(x2) # store 0xe2b534ba489ff630 in memory
flh f28, 0(x2) # load 0xe2b534ba489ff630 from memory into f28
la x2, scratch
li x3, 0x13877c901aaa12b3 # load x3 with value 0x13877c901aaa12b3
sw x3, 0(x2) # store 0x13877c901aaa12b3 in memory
flh f15, 0(x2) # load 0x13877c901aaa12b3 from memory into f15
fsgnj.h f12, f28, f15 # perform operation

# Testcase cp_fs1 (Test source fs1 = f29)
la x2, scratch
li x3, 0x144b9ae0dea3b192 # load x3 with value 0x144b9ae0dea3b192
sw x3, 0(x2) # store 0x144b9ae0dea3b192 in memory
flh f29, 0(x2) # load 0x144b9ae0dea3b192 from memory into f29
la x2, scratch
li x3, 0x45dee5b2d291aa10 # load x3 with value 0x45dee5b2d291aa10
sw x3, 0(x2) # store 0x45dee5b2d291aa10 in memory
flh f5, 0(x2) # load 0x45dee5b2d291aa10 from memory into f5
fsgnj.h f23, f29, f5 # perform operation

# Testcase cp_fs1 (Test source fs1 = f30)
la x2, scratch
li x3, 0xa208a78d1e73ad81 # load x3 with value 0xa208a78d1e73ad81
sw x3, 0(x2) # store 0xa208a78d1e73ad81 in memory
flh f30, 0(x2) # load 0xa208a78d1e73ad81 from memory into f30
la x2, scratch
li x3, 0x126edcc20537bab3 # load x3 with value 0x126edcc20537bab3
sw x3, 0(x2) # store 0x126edcc20537bab3 in memory
flh f12, 0(x2) # load 0x126edcc20537bab3 from memory into f12
fsgnj.h f20, f30, f12 # perform operation

# Testcase cp_fs1 (Test source fs1 = f31)
la x2, scratch
li x3, 0xd4bf2546b774cca6 # load x3 with value 0xd4bf2546b774cca6
sw x3, 0(x2) # store 0xd4bf2546b774cca6 in memory
flh f31, 0(x2) # load 0xd4bf2546b774cca6 from memory into f31
la x2, scratch
li x3, 0xc1efee3a82283b56 # load x3 with value 0xc1efee3a82283b56
sw x3, 0(x2) # store 0xc1efee3a82283b56 in memory
flh f19, 0(x2) # load 0xc1efee3a82283b56 from memory into f19
fsgnj.h f18, f31, f19 # perform operation

# Testcase cp_fs2 (Test source fs2 = f0)
la x2, scratch
li x3, 0x7fa0dc5e2e11506a # load x3 with value 0x7fa0dc5e2e11506a
sw x3, 0(x2) # store 0x7fa0dc5e2e11506a in memory
flh f14, 0(x2) # load 0x7fa0dc5e2e11506a from memory into f14
la x2, scratch
li x3, 0x1b9555f3bf088873 # load x3 with value 0x1b9555f3bf088873
sw x3, 0(x2) # store 0x1b9555f3bf088873 in memory
flh f0, 0(x2) # load 0x1b9555f3bf088873 from memory into f0
fsgnj.h f5, f14, f0 # perform operation

# Testcase cp_fs2 (Test source fs2 = f1)
la x2, scratch
li x3, 0xd2891ba0d1bedb55 # load x3 with value 0xd2891ba0d1bedb55
sw x3, 0(x2) # store 0xd2891ba0d1bedb55 in memory
flh f20, 0(x2) # load 0xd2891ba0d1bedb55 from memory into f20
la x2, scratch
li x3, 0x81337a598707a833 # load x3 with value 0x81337a598707a833
sw x3, 0(x2) # store 0x81337a598707a833 in memory
flh f1, 0(x2) # load 0x81337a598707a833 from memory into f1
fsgnj.h f25, f20, f1 # perform operation

# Testcase cp_fs2 (Test source fs2 = f2)
la x2, scratch
li x3, 0xa7e13003a617e53b # load x3 with value 0xa7e13003a617e53b
sw x3, 0(x2) # store 0xa7e13003a617e53b in memory
flh f12, 0(x2) # load 0xa7e13003a617e53b from memory into f12
la x2, scratch
li x3, 0xaa186d878364e795 # load x3 with value 0xaa186d878364e795
sw x3, 0(x2) # store 0xaa186d878364e795 in memory
flh f2, 0(x2) # load 0xaa186d878364e795 from memory into f2
fsgnj.h f16, f12, f2 # perform operation

# Testcase cp_fs2 (Test source fs2 = f3)
la x2, scratch
li x3, 0x635971fcc199c7ca # load x3 with value 0x635971fcc199c7ca
sw x3, 0(x2) # store 0x635971fcc199c7ca in memory
flh f21, 0(x2) # load 0x635971fcc199c7ca from memory into f21
la x2, scratch
li x3, 0x9aefd61028e36503 # load x3 with value 0x9aefd61028e36503
sw x3, 0(x2) # store 0x9aefd61028e36503 in memory
flh f3, 0(x2) # load 0x9aefd61028e36503 from memory into f3
fsgnj.h f29, f21, f3 # perform operation

# Testcase cp_fs2 (Test source fs2 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xf2980344dbb8d7ce # load x3 with value 0xf2980344dbb8d7ce
sw x3, 0(x2) # store 0xf2980344dbb8d7ce in memory
flh f1, 0(x2) # load 0xf2980344dbb8d7ce from memory into f1
la x2, scratch
li x3, 0xc783e563e06b6ecc # load x3 with value 0xc783e563e06b6ecc
sw x3, 0(x2) # store 0xc783e563e06b6ecc in memory
flh f4, 0(x2) # load 0xc783e563e06b6ecc from memory into f4
fsgnj.h f14, f1, f4 # perform operation

# Testcase cp_fs2 (Test source fs2 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x4803042fb97ce090 # load x3 with value 0x4803042fb97ce090
sw x3, 0(x2) # store 0x4803042fb97ce090 in memory
flh f20, 0(x2) # load 0x4803042fb97ce090 from memory into f20
la x2, scratch
li x3, 0xb28cb3aa54175baf # load x3 with value 0xb28cb3aa54175baf
sw x3, 0(x2) # store 0xb28cb3aa54175baf in memory
flh f5, 0(x2) # load 0xb28cb3aa54175baf from memory into f5
fsgnj.h f26, f20, f5 # perform operation

# Testcase cp_fs2 (Test source fs2 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x1944a6f3b9ed61a # load x3 with value 0x1944a6f3b9ed61a
sw x3, 0(x2) # store 0x1944a6f3b9ed61a in memory
flh f28, 0(x2) # load 0x1944a6f3b9ed61a from memory into f28
la x2, scratch
li x3, 0xd3019a5efa07843 # load x3 with value 0xd3019a5efa07843
sw x3, 0(x2) # store 0xd3019a5efa07843 in memory
flh f6, 0(x2) # load 0xd3019a5efa07843 from memory into f6
fsgnj.h f1, f28, f6 # perform operation

# Testcase cp_fs2 (Test source fs2 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xef93c51b39a040d2 # load x3 with value 0xef93c51b39a040d2
sw x3, 0(x2) # store 0xef93c51b39a040d2 in memory
flh f26, 0(x2) # load 0xef93c51b39a040d2 from memory into f26
la x2, scratch
li x3, 0x4502378bec9ffa92 # load x3 with value 0x4502378bec9ffa92
sw x3, 0(x2) # store 0x4502378bec9ffa92 in memory
flh f7, 0(x2) # load 0x4502378bec9ffa92 from memory into f7
fsgnj.h f10, f26, f7 # perform operation

# Testcase cp_fs2 (Test source fs2 = f8)
la x2, scratch
li x3, 0xe0039eb7edec72fb # load x3 with value 0xe0039eb7edec72fb
sw x3, 0(x2) # store 0xe0039eb7edec72fb in memory
flh f18, 0(x2) # load 0xe0039eb7edec72fb from memory into f18
la x2, scratch
li x3, 0xe55c85e40c5a3536 # load x3 with value 0xe55c85e40c5a3536
sw x3, 0(x2) # store 0xe55c85e40c5a3536 in memory
flh f8, 0(x2) # load 0xe55c85e40c5a3536 from memory into f8
fsgnj.h f22, f18, f8 # perform operation

# Testcase cp_fs2 (Test source fs2 = f9)
la x2, scratch
li x3, 0xd8db72d09e85c173 # load x3 with value 0xd8db72d09e85c173
sw x3, 0(x2) # store 0xd8db72d09e85c173 in memory
flh f27, 0(x2) # load 0xd8db72d09e85c173 from memory into f27
la x2, scratch
li x3, 0xc5a70e3812a4f43b # load x3 with value 0xc5a70e3812a4f43b
sw x3, 0(x2) # store 0xc5a70e3812a4f43b in memory
flh f9, 0(x2) # load 0xc5a70e3812a4f43b from memory into f9
fsgnj.h f21, f27, f9 # perform operation

# Testcase cp_fs2 (Test source fs2 = f10)
la x2, scratch
li x3, 0x2bcb6e90905cd2c9 # load x3 with value 0x2bcb6e90905cd2c9
sw x3, 0(x2) # store 0x2bcb6e90905cd2c9 in memory
flh f16, 0(x2) # load 0x2bcb6e90905cd2c9 from memory into f16
la x2, scratch
li x3, 0x32943deafdcce0a6 # load x3 with value 0x32943deafdcce0a6
sw x3, 0(x2) # store 0x32943deafdcce0a6 in memory
flh f10, 0(x2) # load 0x32943deafdcce0a6 from memory into f10
fsgnj.h f28, f16, f10 # perform operation

# Testcase cp_fs2 (Test source fs2 = f11)
la x2, scratch
li x3, 0xc987dbcc63516407 # load x3 with value 0xc987dbcc63516407
sw x3, 0(x2) # store 0xc987dbcc63516407 in memory
flh f22, 0(x2) # load 0xc987dbcc63516407 from memory into f22
la x2, scratch
li x3, 0x16df4ccd50bc7c7f # load x3 with value 0x16df4ccd50bc7c7f
sw x3, 0(x2) # store 0x16df4ccd50bc7c7f in memory
flh f11, 0(x2) # load 0x16df4ccd50bc7c7f from memory into f11
fsgnj.h f30, f22, f11 # perform operation

# Testcase cp_fs2 (Test source fs2 = f12)
la x2, scratch
li x3, 0x2fe61269c4623385 # load x3 with value 0x2fe61269c4623385
sw x3, 0(x2) # store 0x2fe61269c4623385 in memory
flh f9, 0(x2) # load 0x2fe61269c4623385 from memory into f9
la x2, scratch
li x3, 0x33710655a2a31825 # load x3 with value 0x33710655a2a31825
sw x3, 0(x2) # store 0x33710655a2a31825 in memory
flh f12, 0(x2) # load 0x33710655a2a31825 from memory into f12
fsgnj.h f28, f9, f12 # perform operation

# Testcase cp_fs2 (Test source fs2 = f13)
la x2, scratch
li x3, 0x5c2ef3c1918f91ab # load x3 with value 0x5c2ef3c1918f91ab
sw x3, 0(x2) # store 0x5c2ef3c1918f91ab in memory
flh f15, 0(x2) # load 0x5c2ef3c1918f91ab from memory into f15
la x2, scratch
li x3, 0x39bbe06e80c53555 # load x3 with value 0x39bbe06e80c53555
sw x3, 0(x2) # store 0x39bbe06e80c53555 in memory
flh f13, 0(x2) # load 0x39bbe06e80c53555 from memory into f13
fsgnj.h f30, f15, f13 # perform operation

# Testcase cp_fs2 (Test source fs2 = f14)
la x2, scratch
li x3, 0xf4e60b4456c7cf8d # load x3 with value 0xf4e60b4456c7cf8d
sw x3, 0(x2) # store 0xf4e60b4456c7cf8d in memory
flh f30, 0(x2) # load 0xf4e60b4456c7cf8d from memory into f30
la x2, scratch
li x3, 0x41a9dd7ecc1a2b46 # load x3 with value 0x41a9dd7ecc1a2b46
sw x3, 0(x2) # store 0x41a9dd7ecc1a2b46 in memory
flh f14, 0(x2) # load 0x41a9dd7ecc1a2b46 from memory into f14
fsgnj.h f24, f30, f14 # perform operation

# Testcase cp_fs2 (Test source fs2 = f15)
la x2, scratch
li x3, 0x7759b8d4a00764cf # load x3 with value 0x7759b8d4a00764cf
sw x3, 0(x2) # store 0x7759b8d4a00764cf in memory
flh f30, 0(x2) # load 0x7759b8d4a00764cf from memory into f30
la x2, scratch
li x3, 0x300a2a1425e77d14 # load x3 with value 0x300a2a1425e77d14
sw x3, 0(x2) # store 0x300a2a1425e77d14 in memory
flh f15, 0(x2) # load 0x300a2a1425e77d14 from memory into f15
fsgnj.h f6, f30, f15 # perform operation

# Testcase cp_fs2 (Test source fs2 = f16)
la x2, scratch
li x3, 0xf73414a523cf106e # load x3 with value 0xf73414a523cf106e
sw x3, 0(x2) # store 0xf73414a523cf106e in memory
flh f21, 0(x2) # load 0xf73414a523cf106e from memory into f21
la x2, scratch
li x3, 0x5a9d624f8668984a # load x3 with value 0x5a9d624f8668984a
sw x3, 0(x2) # store 0x5a9d624f8668984a in memory
flh f16, 0(x2) # load 0x5a9d624f8668984a from memory into f16
fsgnj.h f20, f21, f16 # perform operation

# Testcase cp_fs2 (Test source fs2 = f17)
la x2, scratch
li x3, 0x98965eb4229de6bb # load x3 with value 0x98965eb4229de6bb
sw x3, 0(x2) # store 0x98965eb4229de6bb in memory
flh f24, 0(x2) # load 0x98965eb4229de6bb from memory into f24
la x2, scratch
li x3, 0x9ce87d58dae0debc # load x3 with value 0x9ce87d58dae0debc
sw x3, 0(x2) # store 0x9ce87d58dae0debc in memory
flh f17, 0(x2) # load 0x9ce87d58dae0debc from memory into f17
fsgnj.h f31, f24, f17 # perform operation

# Testcase cp_fs2 (Test source fs2 = f18)
la x2, scratch
li x3, 0x8f4c8af23f95ab69 # load x3 with value 0x8f4c8af23f95ab69
sw x3, 0(x2) # store 0x8f4c8af23f95ab69 in memory
flh f20, 0(x2) # load 0x8f4c8af23f95ab69 from memory into f20
la x2, scratch
li x3, 0xbfd1bb7bad42d878 # load x3 with value 0xbfd1bb7bad42d878
sw x3, 0(x2) # store 0xbfd1bb7bad42d878 in memory
flh f18, 0(x2) # load 0xbfd1bb7bad42d878 from memory into f18
fsgnj.h f22, f20, f18 # perform operation

# Testcase cp_fs2 (Test source fs2 = f19)
la x2, scratch
li x3, 0xd612c050f76aec59 # load x3 with value 0xd612c050f76aec59
sw x3, 0(x2) # store 0xd612c050f76aec59 in memory
flh f15, 0(x2) # load 0xd612c050f76aec59 from memory into f15
la x2, scratch
li x3, 0xc3a3151bc6d4f6b1 # load x3 with value 0xc3a3151bc6d4f6b1
sw x3, 0(x2) # store 0xc3a3151bc6d4f6b1 in memory
flh f19, 0(x2) # load 0xc3a3151bc6d4f6b1 from memory into f19
fsgnj.h f14, f15, f19 # perform operation

# Testcase cp_fs2 (Test source fs2 = f20)
la x2, scratch
li x3, 0xe8c7f5b2ec4f4f94 # load x3 with value 0xe8c7f5b2ec4f4f94
sw x3, 0(x2) # store 0xe8c7f5b2ec4f4f94 in memory
flh f28, 0(x2) # load 0xe8c7f5b2ec4f4f94 from memory into f28
la x2, scratch
li x3, 0x9712b3992179b7a5 # load x3 with value 0x9712b3992179b7a5
sw x3, 0(x2) # store 0x9712b3992179b7a5 in memory
flh f20, 0(x2) # load 0x9712b3992179b7a5 from memory into f20
fsgnj.h f6, f28, f20 # perform operation

# Testcase cp_fs2 (Test source fs2 = f21)
la x2, scratch
li x3, 0x36486a11551664eb # load x3 with value 0x36486a11551664eb
sw x3, 0(x2) # store 0x36486a11551664eb in memory
flh f3, 0(x2) # load 0x36486a11551664eb from memory into f3
la x2, scratch
li x3, 0x7c7d775d3742995f # load x3 with value 0x7c7d775d3742995f
sw x3, 0(x2) # store 0x7c7d775d3742995f in memory
flh f21, 0(x2) # load 0x7c7d775d3742995f from memory into f21
fsgnj.h f27, f3, f21 # perform operation

# Testcase cp_fs2 (Test source fs2 = f22)
la x2, scratch
li x3, 0x9e2c539dacfe85a9 # load x3 with value 0x9e2c539dacfe85a9
sw x3, 0(x2) # store 0x9e2c539dacfe85a9 in memory
flh f28, 0(x2) # load 0x9e2c539dacfe85a9 from memory into f28
la x2, scratch
li x3, 0x471eabede41b2ae9 # load x3 with value 0x471eabede41b2ae9
sw x3, 0(x2) # store 0x471eabede41b2ae9 in memory
flh f22, 0(x2) # load 0x471eabede41b2ae9 from memory into f22
fsgnj.h f8, f28, f22 # perform operation

# Testcase cp_fs2 (Test source fs2 = f23)
la x2, scratch
li x3, 0xcaad787bc0376871 # load x3 with value 0xcaad787bc0376871
sw x3, 0(x2) # store 0xcaad787bc0376871 in memory
flh f29, 0(x2) # load 0xcaad787bc0376871 from memory into f29
la x2, scratch
li x3, 0x2f2040d739228966 # load x3 with value 0x2f2040d739228966
sw x3, 0(x2) # store 0x2f2040d739228966 in memory
flh f23, 0(x2) # load 0x2f2040d739228966 from memory into f23
fsgnj.h f20, f29, f23 # perform operation

# Testcase cp_fs2 (Test source fs2 = f24)
la x2, scratch
li x3, 0x19996ea73a7ed79f # load x3 with value 0x19996ea73a7ed79f
sw x3, 0(x2) # store 0x19996ea73a7ed79f in memory
flh f18, 0(x2) # load 0x19996ea73a7ed79f from memory into f18
la x2, scratch
li x3, 0x35d6cb5ddd2d26df # load x3 with value 0x35d6cb5ddd2d26df
sw x3, 0(x2) # store 0x35d6cb5ddd2d26df in memory
flh f24, 0(x2) # load 0x35d6cb5ddd2d26df from memory into f24
fsgnj.h f8, f18, f24 # perform operation

# Testcase cp_fs2 (Test source fs2 = f25)
la x2, scratch
li x3, 0x2b8a7c1fae1bc8c3 # load x3 with value 0x2b8a7c1fae1bc8c3
sw x3, 0(x2) # store 0x2b8a7c1fae1bc8c3 in memory
flh f2, 0(x2) # load 0x2b8a7c1fae1bc8c3 from memory into f2
la x2, scratch
li x3, 0x944a3c1e52ed89b3 # load x3 with value 0x944a3c1e52ed89b3
sw x3, 0(x2) # store 0x944a3c1e52ed89b3 in memory
flh f25, 0(x2) # load 0x944a3c1e52ed89b3 from memory into f25
fsgnj.h f27, f2, f25 # perform operation

# Testcase cp_fs2 (Test source fs2 = f26)
la x2, scratch
li x3, 0x5f322df556278893 # load x3 with value 0x5f322df556278893
sw x3, 0(x2) # store 0x5f322df556278893 in memory
flh f11, 0(x2) # load 0x5f322df556278893 from memory into f11
la x2, scratch
li x3, 0x39c435a3e64c8bc1 # load x3 with value 0x39c435a3e64c8bc1
sw x3, 0(x2) # store 0x39c435a3e64c8bc1 in memory
flh f26, 0(x2) # load 0x39c435a3e64c8bc1 from memory into f26
fsgnj.h f10, f11, f26 # perform operation

# Testcase cp_fs2 (Test source fs2 = f27)
la x2, scratch
li x3, 0x53f7984ea193f398 # load x3 with value 0x53f7984ea193f398
sw x3, 0(x2) # store 0x53f7984ea193f398 in memory
flh f28, 0(x2) # load 0x53f7984ea193f398 from memory into f28
la x2, scratch
li x3, 0x22e0c72905815560 # load x3 with value 0x22e0c72905815560
sw x3, 0(x2) # store 0x22e0c72905815560 in memory
flh f27, 0(x2) # load 0x22e0c72905815560 from memory into f27
fsgnj.h f22, f28, f27 # perform operation

# Testcase cp_fs2 (Test source fs2 = f28)
la x2, scratch
li x3, 0x9ced9c14eaa891b0 # load x3 with value 0x9ced9c14eaa891b0
sw x3, 0(x2) # store 0x9ced9c14eaa891b0 in memory
flh f3, 0(x2) # load 0x9ced9c14eaa891b0 from memory into f3
la x2, scratch
li x3, 0x7679e0edf38134cc # load x3 with value 0x7679e0edf38134cc
sw x3, 0(x2) # store 0x7679e0edf38134cc in memory
flh f28, 0(x2) # load 0x7679e0edf38134cc from memory into f28
fsgnj.h f28, f3, f28 # perform operation

# Testcase cp_fs2 (Test source fs2 = f29)
la x2, scratch
li x3, 0xeb8544568301cf6d # load x3 with value 0xeb8544568301cf6d
sw x3, 0(x2) # store 0xeb8544568301cf6d in memory
flh f18, 0(x2) # load 0xeb8544568301cf6d from memory into f18
la x2, scratch
li x3, 0x28e89106557f0 # load x3 with value 0x28e89106557f0
sw x3, 0(x2) # store 0x28e89106557f0 in memory
flh f29, 0(x2) # load 0x28e89106557f0 from memory into f29
fsgnj.h f6, f18, f29 # perform operation

# Testcase cp_fs2 (Test source fs2 = f30)
la x2, scratch
li x3, 0xb3e367226490d3b2 # load x3 with value 0xb3e367226490d3b2
sw x3, 0(x2) # store 0xb3e367226490d3b2 in memory
flh f26, 0(x2) # load 0xb3e367226490d3b2 from memory into f26
la x2, scratch
li x3, 0xecc706bf28a307e7 # load x3 with value 0xecc706bf28a307e7
sw x3, 0(x2) # store 0xecc706bf28a307e7 in memory
flh f30, 0(x2) # load 0xecc706bf28a307e7 from memory into f30
fsgnj.h f7, f26, f30 # perform operation

# Testcase cp_fs2 (Test source fs2 = f31)
la x2, scratch
li x3, 0x4166197ae9b9b8da # load x3 with value 0x4166197ae9b9b8da
sw x3, 0(x2) # store 0x4166197ae9b9b8da in memory
flh f7, 0(x2) # load 0x4166197ae9b9b8da from memory into f7
la x2, scratch
li x3, 0x8a67069ddf468e33 # load x3 with value 0x8a67069ddf468e33
sw x3, 0(x2) # store 0x8a67069ddf468e33 in memory
flh f31, 0(x2) # load 0x8a67069ddf468e33 from memory into f31
fsgnj.h f3, f7, f31 # perform operation

# Testcase cp_fd (Test destination fd = x0)
la x2, scratch
li x3, 0x8d0de08d3f51a160 # load x3 with value 0x8d0de08d3f51a160
sw x3, 0(x2) # store 0x8d0de08d3f51a160 in memory
flh f8, 0(x2) # load 0x8d0de08d3f51a160 from memory into f8
la x2, scratch
li x3, 0x7508edb1a0a7ef1b # load x3 with value 0x7508edb1a0a7ef1b
sw x3, 0(x2) # store 0x7508edb1a0a7ef1b in memory
flh f10, 0(x2) # load 0x7508edb1a0a7ef1b from memory into f10
fsgnj.h f0, f8, f10 # perform operation

# Testcase cp_fd (Test destination fd = x1)
la x2, scratch
li x3, 0xa3d4ea038b7b7434 # load x3 with value 0xa3d4ea038b7b7434
sw x3, 0(x2) # store 0xa3d4ea038b7b7434 in memory
flh f27, 0(x2) # load 0xa3d4ea038b7b7434 from memory into f27
la x2, scratch
li x3, 0x447d4e3f133b0c19 # load x3 with value 0x447d4e3f133b0c19
sw x3, 0(x2) # store 0x447d4e3f133b0c19 in memory
flh f6, 0(x2) # load 0x447d4e3f133b0c19 from memory into f6
fsgnj.h f1, f27, f6 # perform operation

# Testcase cp_fd (Test destination fd = x2)
la x2, scratch
li x3, 0x3842d30c26985e22 # load x3 with value 0x3842d30c26985e22
sw x3, 0(x2) # store 0x3842d30c26985e22 in memory
flh f13, 0(x2) # load 0x3842d30c26985e22 from memory into f13
la x2, scratch
li x3, 0x6b5dffeebe24c2a4 # load x3 with value 0x6b5dffeebe24c2a4
sw x3, 0(x2) # store 0x6b5dffeebe24c2a4 in memory
flh f15, 0(x2) # load 0x6b5dffeebe24c2a4 from memory into f15
fsgnj.h f2, f13, f15 # perform operation

# Testcase cp_fd (Test destination fd = x3)
la x2, scratch
li x3, 0x99d744a567195acb # load x3 with value 0x99d744a567195acb
sw x3, 0(x2) # store 0x99d744a567195acb in memory
flh f14, 0(x2) # load 0x99d744a567195acb from memory into f14
la x2, scratch
li x3, 0xa3116677ec52fb10 # load x3 with value 0xa3116677ec52fb10
sw x3, 0(x2) # store 0xa3116677ec52fb10 in memory
flh f2, 0(x2) # load 0xa3116677ec52fb10 from memory into f2
fsgnj.h f3, f14, f2 # perform operation

# Testcase cp_fd (Test destination fd = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x2f2e6f4bade483e5 # load x3 with value 0x2f2e6f4bade483e5
sw x3, 0(x2) # store 0x2f2e6f4bade483e5 in memory
flh f18, 0(x2) # load 0x2f2e6f4bade483e5 from memory into f18
la x2, scratch
li x3, 0xcf66d9b35e99f462 # load x3 with value 0xcf66d9b35e99f462
sw x3, 0(x2) # store 0xcf66d9b35e99f462 in memory
flh f22, 0(x2) # load 0xcf66d9b35e99f462 from memory into f22
fsgnj.h f4, f18, f22 # perform operation

# Testcase cp_fd (Test destination fd = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x39029cb04ffe5526 # load x3 with value 0x39029cb04ffe5526
sw x3, 0(x2) # store 0x39029cb04ffe5526 in memory
flh f11, 0(x2) # load 0x39029cb04ffe5526 from memory into f11
la x2, scratch
li x3, 0x7684751aa2dcd116 # load x3 with value 0x7684751aa2dcd116
sw x3, 0(x2) # store 0x7684751aa2dcd116 in memory
flh f31, 0(x2) # load 0x7684751aa2dcd116 from memory into f31
fsgnj.h f5, f11, f31 # perform operation

# Testcase cp_fd (Test destination fd = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xc43ea8f83b5707e6 # load x3 with value 0xc43ea8f83b5707e6
sw x3, 0(x2) # store 0xc43ea8f83b5707e6 in memory
flh f5, 0(x2) # load 0xc43ea8f83b5707e6 from memory into f5
la x2, scratch
li x3, 0x221cf612ef63ad0b # load x3 with value 0x221cf612ef63ad0b
sw x3, 0(x2) # store 0x221cf612ef63ad0b in memory
flh f29, 0(x2) # load 0x221cf612ef63ad0b from memory into f29
fsgnj.h f6, f5, f29 # perform operation

# Testcase cp_fd (Test destination fd = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xfedfbd41ec647989 # load x3 with value 0xfedfbd41ec647989
sw x3, 0(x2) # store 0xfedfbd41ec647989 in memory
flh f9, 0(x2) # load 0xfedfbd41ec647989 from memory into f9
la x2, scratch
li x3, 0xd8cbba5500a3bfb9 # load x3 with value 0xd8cbba5500a3bfb9
sw x3, 0(x2) # store 0xd8cbba5500a3bfb9 in memory
flh f23, 0(x2) # load 0xd8cbba5500a3bfb9 from memory into f23
fsgnj.h f7, f9, f23 # perform operation

# Testcase cp_fd (Test destination fd = x8)
la x2, scratch
li x3, 0x2644eadbb8b0dc00 # load x3 with value 0x2644eadbb8b0dc00
sw x3, 0(x2) # store 0x2644eadbb8b0dc00 in memory
flh f6, 0(x2) # load 0x2644eadbb8b0dc00 from memory into f6
la x2, scratch
li x3, 0xf7b80d39c4f36423 # load x3 with value 0xf7b80d39c4f36423
sw x3, 0(x2) # store 0xf7b80d39c4f36423 in memory
flh f16, 0(x2) # load 0xf7b80d39c4f36423 from memory into f16
fsgnj.h f8, f6, f16 # perform operation

# Testcase cp_fd (Test destination fd = x9)
la x2, scratch
li x3, 0xbdca745edcac3f7a # load x3 with value 0xbdca745edcac3f7a
sw x3, 0(x2) # store 0xbdca745edcac3f7a in memory
flh f3, 0(x2) # load 0xbdca745edcac3f7a from memory into f3
la x2, scratch
li x3, 0x6d618781785d8f1c # load x3 with value 0x6d618781785d8f1c
sw x3, 0(x2) # store 0x6d618781785d8f1c in memory
flh f8, 0(x2) # load 0x6d618781785d8f1c from memory into f8
fsgnj.h f9, f3, f8 # perform operation

# Testcase cp_fd (Test destination fd = x10)
la x2, scratch
li x3, 0x77517a6b17fe9a34 # load x3 with value 0x77517a6b17fe9a34
sw x3, 0(x2) # store 0x77517a6b17fe9a34 in memory
flh f28, 0(x2) # load 0x77517a6b17fe9a34 from memory into f28
la x2, scratch
li x3, 0xd9dc9e68fe956199 # load x3 with value 0xd9dc9e68fe956199
sw x3, 0(x2) # store 0xd9dc9e68fe956199 in memory
flh f14, 0(x2) # load 0xd9dc9e68fe956199 from memory into f14
fsgnj.h f10, f28, f14 # perform operation

# Testcase cp_fd (Test destination fd = x11)
la x2, scratch
li x3, 0x8f2cc5ade6668bb0 # load x3 with value 0x8f2cc5ade6668bb0
sw x3, 0(x2) # store 0x8f2cc5ade6668bb0 in memory
flh f15, 0(x2) # load 0x8f2cc5ade6668bb0 from memory into f15
la x2, scratch
li x3, 0x18204eca38a70682 # load x3 with value 0x18204eca38a70682
sw x3, 0(x2) # store 0x18204eca38a70682 in memory
flh f2, 0(x2) # load 0x18204eca38a70682 from memory into f2
fsgnj.h f11, f15, f2 # perform operation

# Testcase cp_fd (Test destination fd = x12)
la x2, scratch
li x3, 0x2d4ab37b2ff8f3c2 # load x3 with value 0x2d4ab37b2ff8f3c2
sw x3, 0(x2) # store 0x2d4ab37b2ff8f3c2 in memory
flh f15, 0(x2) # load 0x2d4ab37b2ff8f3c2 from memory into f15
la x2, scratch
li x3, 0x9282d13839540dbf # load x3 with value 0x9282d13839540dbf
sw x3, 0(x2) # store 0x9282d13839540dbf in memory
flh f20, 0(x2) # load 0x9282d13839540dbf from memory into f20
fsgnj.h f12, f15, f20 # perform operation

# Testcase cp_fd (Test destination fd = x13)
la x2, scratch
li x3, 0x544cbfb232fab1af # load x3 with value 0x544cbfb232fab1af
sw x3, 0(x2) # store 0x544cbfb232fab1af in memory
flh f24, 0(x2) # load 0x544cbfb232fab1af from memory into f24
la x2, scratch
li x3, 0x31b69a226d55250f # load x3 with value 0x31b69a226d55250f
sw x3, 0(x2) # store 0x31b69a226d55250f in memory
flh f19, 0(x2) # load 0x31b69a226d55250f from memory into f19
fsgnj.h f13, f24, f19 # perform operation

# Testcase cp_fd (Test destination fd = x14)
la x2, scratch
li x3, 0xe06018bf95894fbf # load x3 with value 0xe06018bf95894fbf
sw x3, 0(x2) # store 0xe06018bf95894fbf in memory
flh f25, 0(x2) # load 0xe06018bf95894fbf from memory into f25
la x2, scratch
li x3, 0xb820632e7d05780f # load x3 with value 0xb820632e7d05780f
sw x3, 0(x2) # store 0xb820632e7d05780f in memory
flh f27, 0(x2) # load 0xb820632e7d05780f from memory into f27
fsgnj.h f14, f25, f27 # perform operation

# Testcase cp_fd (Test destination fd = x15)
la x2, scratch
li x3, 0x462fbbb72fba6a31 # load x3 with value 0x462fbbb72fba6a31
sw x3, 0(x2) # store 0x462fbbb72fba6a31 in memory
flh f5, 0(x2) # load 0x462fbbb72fba6a31 from memory into f5
la x2, scratch
li x3, 0xf9434da2ca1a03de # load x3 with value 0xf9434da2ca1a03de
sw x3, 0(x2) # store 0xf9434da2ca1a03de in memory
flh f8, 0(x2) # load 0xf9434da2ca1a03de from memory into f8
fsgnj.h f15, f5, f8 # perform operation

# Testcase cp_fd (Test destination fd = x16)
la x2, scratch
li x3, 0xdb9b9ad3d6683651 # load x3 with value 0xdb9b9ad3d6683651
sw x3, 0(x2) # store 0xdb9b9ad3d6683651 in memory
flh f15, 0(x2) # load 0xdb9b9ad3d6683651 from memory into f15
la x2, scratch
li x3, 0xe87f30ddb2dc4c20 # load x3 with value 0xe87f30ddb2dc4c20
sw x3, 0(x2) # store 0xe87f30ddb2dc4c20 in memory
flh f29, 0(x2) # load 0xe87f30ddb2dc4c20 from memory into f29
fsgnj.h f16, f15, f29 # perform operation

# Testcase cp_fd (Test destination fd = x17)
la x2, scratch
li x3, 0x21ac065f35dc1648 # load x3 with value 0x21ac065f35dc1648
sw x3, 0(x2) # store 0x21ac065f35dc1648 in memory
flh f21, 0(x2) # load 0x21ac065f35dc1648 from memory into f21
la x2, scratch
li x3, 0x75ba256a4ef823a4 # load x3 with value 0x75ba256a4ef823a4
sw x3, 0(x2) # store 0x75ba256a4ef823a4 in memory
flh f14, 0(x2) # load 0x75ba256a4ef823a4 from memory into f14
fsgnj.h f17, f21, f14 # perform operation

# Testcase cp_fd (Test destination fd = x18)
la x2, scratch
li x3, 0xe59b05065b45a04b # load x3 with value 0xe59b05065b45a04b
sw x3, 0(x2) # store 0xe59b05065b45a04b in memory
flh f20, 0(x2) # load 0xe59b05065b45a04b from memory into f20
la x2, scratch
li x3, 0xcb006209606030aa # load x3 with value 0xcb006209606030aa
sw x3, 0(x2) # store 0xcb006209606030aa in memory
flh f25, 0(x2) # load 0xcb006209606030aa from memory into f25
fsgnj.h f18, f20, f25 # perform operation

# Testcase cp_fd (Test destination fd = x19)
la x2, scratch
li x3, 0x2ad79ed63998eb6a # load x3 with value 0x2ad79ed63998eb6a
sw x3, 0(x2) # store 0x2ad79ed63998eb6a in memory
flh f13, 0(x2) # load 0x2ad79ed63998eb6a from memory into f13
la x2, scratch
li x3, 0x1fd853ad94a9d637 # load x3 with value 0x1fd853ad94a9d637
sw x3, 0(x2) # store 0x1fd853ad94a9d637 in memory
flh f3, 0(x2) # load 0x1fd853ad94a9d637 from memory into f3
fsgnj.h f19, f13, f3 # perform operation

# Testcase cp_fd (Test destination fd = x20)
la x2, scratch
li x3, 0x1978518d957b78d4 # load x3 with value 0x1978518d957b78d4
sw x3, 0(x2) # store 0x1978518d957b78d4 in memory
flh f12, 0(x2) # load 0x1978518d957b78d4 from memory into f12
la x2, scratch
li x3, 0xf0af3584dd12ebb6 # load x3 with value 0xf0af3584dd12ebb6
sw x3, 0(x2) # store 0xf0af3584dd12ebb6 in memory
flh f30, 0(x2) # load 0xf0af3584dd12ebb6 from memory into f30
fsgnj.h f20, f12, f30 # perform operation

# Testcase cp_fd (Test destination fd = x21)
la x2, scratch
li x3, 0x43065c7fab328f39 # load x3 with value 0x43065c7fab328f39
sw x3, 0(x2) # store 0x43065c7fab328f39 in memory
flh f27, 0(x2) # load 0x43065c7fab328f39 from memory into f27
la x2, scratch
li x3, 0x77a2a572c15ca351 # load x3 with value 0x77a2a572c15ca351
sw x3, 0(x2) # store 0x77a2a572c15ca351 in memory
flh f11, 0(x2) # load 0x77a2a572c15ca351 from memory into f11
fsgnj.h f21, f27, f11 # perform operation

# Testcase cp_fd (Test destination fd = x22)
la x2, scratch
li x3, 0xbe399f18f38613ab # load x3 with value 0xbe399f18f38613ab
sw x3, 0(x2) # store 0xbe399f18f38613ab in memory
flh f21, 0(x2) # load 0xbe399f18f38613ab from memory into f21
la x2, scratch
li x3, 0x4b623572463cac86 # load x3 with value 0x4b623572463cac86
sw x3, 0(x2) # store 0x4b623572463cac86 in memory
flh f28, 0(x2) # load 0x4b623572463cac86 from memory into f28
fsgnj.h f22, f21, f28 # perform operation

# Testcase cp_fd (Test destination fd = x23)
la x2, scratch
li x3, 0x13b8e70af14ed024 # load x3 with value 0x13b8e70af14ed024
sw x3, 0(x2) # store 0x13b8e70af14ed024 in memory
flh f3, 0(x2) # load 0x13b8e70af14ed024 from memory into f3
la x2, scratch
li x3, 0x84e1cd49fed1157c # load x3 with value 0x84e1cd49fed1157c
sw x3, 0(x2) # store 0x84e1cd49fed1157c in memory
flh f22, 0(x2) # load 0x84e1cd49fed1157c from memory into f22
fsgnj.h f23, f3, f22 # perform operation

# Testcase cp_fd (Test destination fd = x24)
la x2, scratch
li x3, 0x3e28150e196b8333 # load x3 with value 0x3e28150e196b8333
sw x3, 0(x2) # store 0x3e28150e196b8333 in memory
flh f27, 0(x2) # load 0x3e28150e196b8333 from memory into f27
la x2, scratch
li x3, 0xbdb7901cc07d1efa # load x3 with value 0xbdb7901cc07d1efa
sw x3, 0(x2) # store 0xbdb7901cc07d1efa in memory
flh f5, 0(x2) # load 0xbdb7901cc07d1efa from memory into f5
fsgnj.h f24, f27, f5 # perform operation

# Testcase cp_fd (Test destination fd = x25)
la x2, scratch
li x3, 0x1958f25e29ecf85e # load x3 with value 0x1958f25e29ecf85e
sw x3, 0(x2) # store 0x1958f25e29ecf85e in memory
flh f20, 0(x2) # load 0x1958f25e29ecf85e from memory into f20
la x2, scratch
li x3, 0x1a3229a41238e4b8 # load x3 with value 0x1a3229a41238e4b8
sw x3, 0(x2) # store 0x1a3229a41238e4b8 in memory
flh f6, 0(x2) # load 0x1a3229a41238e4b8 from memory into f6
fsgnj.h f25, f20, f6 # perform operation

# Testcase cp_fd (Test destination fd = x26)
la x2, scratch
li x3, 0x1eea4e4a9516c073 # load x3 with value 0x1eea4e4a9516c073
sw x3, 0(x2) # store 0x1eea4e4a9516c073 in memory
flh f8, 0(x2) # load 0x1eea4e4a9516c073 from memory into f8
la x2, scratch
li x3, 0xf5c89828949daaa1 # load x3 with value 0xf5c89828949daaa1
sw x3, 0(x2) # store 0xf5c89828949daaa1 in memory
flh f18, 0(x2) # load 0xf5c89828949daaa1 from memory into f18
fsgnj.h f26, f8, f18 # perform operation

# Testcase cp_fd (Test destination fd = x27)
la x2, scratch
li x3, 0x9473a188d1705017 # load x3 with value 0x9473a188d1705017
sw x3, 0(x2) # store 0x9473a188d1705017 in memory
flh f28, 0(x2) # load 0x9473a188d1705017 from memory into f28
la x2, scratch
li x3, 0xda29475911783184 # load x3 with value 0xda29475911783184
sw x3, 0(x2) # store 0xda29475911783184 in memory
flh f6, 0(x2) # load 0xda29475911783184 from memory into f6
fsgnj.h f27, f28, f6 # perform operation

# Testcase cp_fd (Test destination fd = x28)
la x2, scratch
li x3, 0x1a21fea56eec1a3d # load x3 with value 0x1a21fea56eec1a3d
sw x3, 0(x2) # store 0x1a21fea56eec1a3d in memory
flh f2, 0(x2) # load 0x1a21fea56eec1a3d from memory into f2
la x2, scratch
li x3, 0xa7fba001e801bd28 # load x3 with value 0xa7fba001e801bd28
sw x3, 0(x2) # store 0xa7fba001e801bd28 in memory
flh f7, 0(x2) # load 0xa7fba001e801bd28 from memory into f7
fsgnj.h f28, f2, f7 # perform operation

# Testcase cp_fd (Test destination fd = x29)
la x2, scratch
li x3, 0x5d8ddc75a9087bc1 # load x3 with value 0x5d8ddc75a9087bc1
sw x3, 0(x2) # store 0x5d8ddc75a9087bc1 in memory
flh f23, 0(x2) # load 0x5d8ddc75a9087bc1 from memory into f23
la x2, scratch
li x3, 0x131910c3a4a7a35d # load x3 with value 0x131910c3a4a7a35d
sw x3, 0(x2) # store 0x131910c3a4a7a35d in memory
flh f11, 0(x2) # load 0x131910c3a4a7a35d from memory into f11
fsgnj.h f29, f23, f11 # perform operation

# Testcase cp_fd (Test destination fd = x30)
la x2, scratch
li x3, 0x93a14e579b384b86 # load x3 with value 0x93a14e579b384b86
sw x3, 0(x2) # store 0x93a14e579b384b86 in memory
flh f9, 0(x2) # load 0x93a14e579b384b86 from memory into f9
la x2, scratch
li x3, 0x9e1fb93a2913afdd # load x3 with value 0x9e1fb93a2913afdd
sw x3, 0(x2) # store 0x9e1fb93a2913afdd in memory
flh f8, 0(x2) # load 0x9e1fb93a2913afdd from memory into f8
fsgnj.h f30, f9, f8 # perform operation

# Testcase cp_fd (Test destination fd = x31)
la x2, scratch
li x3, 0xab2277348c6a6f40 # load x3 with value 0xab2277348c6a6f40
sw x3, 0(x2) # store 0xab2277348c6a6f40 in memory
flh f23, 0(x2) # load 0xab2277348c6a6f40 from memory into f23
la x2, scratch
li x3, 0x5262f1e61a533248 # load x3 with value 0x5262f1e61a533248
sw x3, 0(x2) # store 0x5262f1e61a533248 in memory
flh f15, 0(x2) # load 0x5262f1e61a533248 from memory into f15
fsgnj.h f31, f23, f15 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f13, 0(x2) # load 0x00000000 from memory into f13
la x2, scratch
li x3, 0xa7dbeb60709a9d95 # load x3 with value 0xa7dbeb60709a9d95
sw x3, 0(x2) # store 0xa7dbeb60709a9d95 in memory
flh f23, 0(x2) # load 0xa7dbeb60709a9d95 from memory into f23
fsgnj.h f1, f13, f23 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f14, 0(x2) # load 0x00008000 from memory into f14
la x2, scratch
li x3, 0x504eb531819774a2 # load x3 with value 0x504eb531819774a2
sw x3, 0(x2) # store 0x504eb531819774a2 in memory
flh f7, 0(x2) # load 0x504eb531819774a2 from memory into f7
fsgnj.h f1, f14, f7 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f13, 0(x2) # load 0x00003c00 from memory into f13
la x2, scratch
li x3, 0xfe89bfd6a34d161a # load x3 with value 0xfe89bfd6a34d161a
sw x3, 0(x2) # store 0xfe89bfd6a34d161a in memory
flh f16, 0(x2) # load 0xfe89bfd6a34d161a from memory into f16
fsgnj.h f3, f13, f16 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f2, 0(x2) # load 0x0000bc00 from memory into f2
la x2, scratch
li x3, 0x8fb954fea267032d # load x3 with value 0x8fb954fea267032d
sw x3, 0(x2) # store 0x8fb954fea267032d in memory
flh f17, 0(x2) # load 0x8fb954fea267032d from memory into f17
fsgnj.h f24, f2, f17 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f18, 0(x2) # load 0x00003e00 from memory into f18
la x2, scratch
li x3, 0x80eabc544665aa71 # load x3 with value 0x80eabc544665aa71
sw x3, 0(x2) # store 0x80eabc544665aa71 in memory
flh f15, 0(x2) # load 0x80eabc544665aa71 from memory into f15
fsgnj.h f7, f18, f15 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f10, 0(x2) # load 0x0000be00 from memory into f10
la x2, scratch
li x3, 0xf28983663d68fe2d # load x3 with value 0xf28983663d68fe2d
sw x3, 0(x2) # store 0xf28983663d68fe2d in memory
flh f7, 0(x2) # load 0xf28983663d68fe2d from memory into f7
fsgnj.h f5, f10, f7 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
la x2, scratch
li x3, 0x5119a29c9c6e9493 # load x3 with value 0x5119a29c9c6e9493
sw x3, 0(x2) # store 0x5119a29c9c6e9493 in memory
flh f11, 0(x2) # load 0x5119a29c9c6e9493 from memory into f11
fsgnj.h f10, f21, f11 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f15, 0(x2) # load 0x0000c000 from memory into f15
la x2, scratch
li x3, 0xcf1d7c57de459eca # load x3 with value 0xcf1d7c57de459eca
sw x3, 0(x2) # store 0xcf1d7c57de459eca in memory
flh f26, 0(x2) # load 0xcf1d7c57de459eca from memory into f26
fsgnj.h f3, f15, f26 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f6, 0(x2) # load 0x00000400 from memory into f6
la x2, scratch
li x3, 0x22a54c36f861f5c2 # load x3 with value 0x22a54c36f861f5c2
sw x3, 0(x2) # store 0x22a54c36f861f5c2 in memory
flh f1, 0(x2) # load 0x22a54c36f861f5c2 from memory into f1
fsgnj.h f24, f6, f1 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
la x2, scratch
li x3, 0xafac14b8a8a1a120 # load x3 with value 0xafac14b8a8a1a120
sw x3, 0(x2) # store 0xafac14b8a8a1a120 in memory
flh f15, 0(x2) # load 0xafac14b8a8a1a120 from memory into f15
fsgnj.h f6, f18, f15 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f1, 0(x2) # load 0x00007bff from memory into f1
la x2, scratch
li x3, 0xa9caac78532f5ba7 # load x3 with value 0xa9caac78532f5ba7
sw x3, 0(x2) # store 0xa9caac78532f5ba7 in memory
flh f2, 0(x2) # load 0xa9caac78532f5ba7 from memory into f2
fsgnj.h f9, f1, f2 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f23, 0(x2) # load 0x0000fbff from memory into f23
la x2, scratch
li x3, 0xf28191000fdbbc0 # load x3 with value 0xf28191000fdbbc0
sw x3, 0(x2) # store 0xf28191000fdbbc0 in memory
flh f1, 0(x2) # load 0xf28191000fdbbc0 from memory into f1
fsgnj.h f15, f23, f1 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f24, 0(x2) # load 0x000003ff from memory into f24
la x2, scratch
li x3, 0x980f8175fce43ad3 # load x3 with value 0x980f8175fce43ad3
sw x3, 0(x2) # store 0x980f8175fce43ad3 in memory
flh f12, 0(x2) # load 0x980f8175fce43ad3 from memory into f12
fsgnj.h f7, f24, f12 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f17, 0(x2) # load 0x000083ff from memory into f17
la x2, scratch
li x3, 0xbbc73dd23693c846 # load x3 with value 0xbbc73dd23693c846
sw x3, 0(x2) # store 0xbbc73dd23693c846 in memory
flh f15, 0(x2) # load 0xbbc73dd23693c846 from memory into f15
fsgnj.h f10, f17, f15 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f2, 0(x2) # load 0x00000200 from memory into f2
la x2, scratch
li x3, 0x9d7f9c2971bbd721 # load x3 with value 0x9d7f9c2971bbd721
sw x3, 0(x2) # store 0x9d7f9c2971bbd721 in memory
flh f19, 0(x2) # load 0x9d7f9c2971bbd721 from memory into f19
fsgnj.h f24, f2, f19 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f26, 0(x2) # load 0x00008200 from memory into f26
la x2, scratch
li x3, 0x5f98aec8dcb4904d # load x3 with value 0x5f98aec8dcb4904d
sw x3, 0(x2) # store 0x5f98aec8dcb4904d in memory
flh f29, 0(x2) # load 0x5f98aec8dcb4904d from memory into f29
fsgnj.h f7, f26, f29 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f9, 0(x2) # load 0x00000001 from memory into f9
la x2, scratch
li x3, 0xee289bcdd35c9693 # load x3 with value 0xee289bcdd35c9693
sw x3, 0(x2) # store 0xee289bcdd35c9693 in memory
flh f24, 0(x2) # load 0xee289bcdd35c9693 from memory into f24
fsgnj.h f18, f9, f24 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f23, 0(x2) # load 0x00008001 from memory into f23
la x2, scratch
li x3, 0xc6b14579f1a961e2 # load x3 with value 0xc6b14579f1a961e2
sw x3, 0(x2) # store 0xc6b14579f1a961e2 in memory
flh f24, 0(x2) # load 0xc6b14579f1a961e2 from memory into f24
fsgnj.h f21, f23, f24 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f28, 0(x2) # load 0x00007c00 from memory into f28
la x2, scratch
li x3, 0xf7b6d69dcae4b6c # load x3 with value 0xf7b6d69dcae4b6c
sw x3, 0(x2) # store 0xf7b6d69dcae4b6c in memory
flh f22, 0(x2) # load 0xf7b6d69dcae4b6c from memory into f22
fsgnj.h f8, f28, f22 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f5, 0(x2) # load 0x0000fc00 from memory into f5
la x2, scratch
li x3, 0x73b964d7000411 # load x3 with value 0x73b964d7000411
sw x3, 0(x2) # store 0x73b964d7000411 in memory
flh f7, 0(x2) # load 0x73b964d7000411 from memory into f7
fsgnj.h f20, f5, f7 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f31, 0(x2) # load 0x00007e00 from memory into f31
la x2, scratch
li x3, 0xf5fb036e13c60896 # load x3 with value 0xf5fb036e13c60896
sw x3, 0(x2) # store 0xf5fb036e13c60896 in memory
flh f17, 0(x2) # load 0xf5fb036e13c60896 from memory into f17
fsgnj.h f22, f31, f17 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f1, 0(x2) # load 0x00007fff from memory into f1
la x2, scratch
li x3, 0xff939c6d5b85dd02 # load x3 with value 0xff939c6d5b85dd02
sw x3, 0(x2) # store 0xff939c6d5b85dd02 in memory
flh f22, 0(x2) # load 0xff939c6d5b85dd02 from memory into f22
fsgnj.h f31, f1, f22 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f7, 0(x2) # load 0x0000fe00 from memory into f7
la x2, scratch
li x3, 0x65b4d0113a147eca # load x3 with value 0x65b4d0113a147eca
sw x3, 0(x2) # store 0x65b4d0113a147eca in memory
flh f25, 0(x2) # load 0x65b4d0113a147eca from memory into f25
fsgnj.h f18, f7, f25 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f26, 0(x2) # load 0x00007c01 from memory into f26
la x2, scratch
li x3, 0xb26c19d3994c7cab # load x3 with value 0xb26c19d3994c7cab
sw x3, 0(x2) # store 0xb26c19d3994c7cab in memory
flh f28, 0(x2) # load 0xb26c19d3994c7cab from memory into f28
fsgnj.h f8, f26, f28 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f5, 0(x2) # load 0x00007dff from memory into f5
la x2, scratch
li x3, 0x75fb8e89cdb87941 # load x3 with value 0x75fb8e89cdb87941
sw x3, 0(x2) # store 0x75fb8e89cdb87941 in memory
flh f3, 0(x2) # load 0x75fb8e89cdb87941 from memory into f3
fsgnj.h f10, f5, f3 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f27, 0(x2) # load 0x0000fc01 from memory into f27
la x2, scratch
li x3, 0x635c48f2cadb39bb # load x3 with value 0x635c48f2cadb39bb
sw x3, 0(x2) # store 0x635c48f2cadb39bb in memory
flh f14, 0(x2) # load 0x635c48f2cadb39bb from memory into f14
fsgnj.h f26, f27, f14 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f2, 0(x2) # load 0x000058b4 from memory into f2
la x2, scratch
li x3, 0x10c4bb759235bdb6 # load x3 with value 0x10c4bb759235bdb6
sw x3, 0(x2) # store 0x10c4bb759235bdb6 in memory
flh f12, 0(x2) # load 0x10c4bb759235bdb6 from memory into f12
fsgnj.h f28, f2, f12 # perform operation

# Testcase cp_fs1_corners (Test source fs1 value = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f17, 0(x2) # load 0x0000c93a from memory into f17
la x2, scratch
li x3, 0xe08290d1b880a28e # load x3 with value 0xe08290d1b880a28e
sw x3, 0(x2) # store 0xe08290d1b880a28e in memory
flh f23, 0(x2) # load 0xe08290d1b880a28e from memory into f23
fsgnj.h f12, f17, f23 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x0)
la x2, scratch
li x3, 0xe349fd3cd589a8a5 # load x3 with value 0xe349fd3cd589a8a5
sw x3, 0(x2) # store 0xe349fd3cd589a8a5 in memory
flh f20, 0(x2) # load 0xe349fd3cd589a8a5 from memory into f20
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f26, 0(x2) # load 0x00000000 from memory into f26
fsgnj.h f31, f20, f26 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x8000)
la x2, scratch
li x3, 0x1608f9f90e2f4e98 # load x3 with value 0x1608f9f90e2f4e98
sw x3, 0(x2) # store 0x1608f9f90e2f4e98 in memory
flh f15, 0(x2) # load 0x1608f9f90e2f4e98 from memory into f15
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f24, 0(x2) # load 0x00008000 from memory into f24
fsgnj.h f20, f15, f24 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x3c00)
la x2, scratch
li x3, 0xa877544e14960d5e # load x3 with value 0xa877544e14960d5e
sw x3, 0(x2) # store 0xa877544e14960d5e in memory
flh f19, 0(x2) # load 0xa877544e14960d5e from memory into f19
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f22, 0(x2) # load 0x00003c00 from memory into f22
fsgnj.h f24, f19, f22 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xbc00)
la x2, scratch
li x3, 0x4459fd2aeb48ba8c # load x3 with value 0x4459fd2aeb48ba8c
sw x3, 0(x2) # store 0x4459fd2aeb48ba8c in memory
flh f27, 0(x2) # load 0x4459fd2aeb48ba8c from memory into f27
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f28, 0(x2) # load 0x0000bc00 from memory into f28
fsgnj.h f7, f27, f28 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x3e00)
la x2, scratch
li x3, 0x4f44071853208e49 # load x3 with value 0x4f44071853208e49
sw x3, 0(x2) # store 0x4f44071853208e49 in memory
flh f1, 0(x2) # load 0x4f44071853208e49 from memory into f1
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f5, 0(x2) # load 0x00003e00 from memory into f5
fsgnj.h f19, f1, f5 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xbe00)
la x2, scratch
li x3, 0x7a7a92c8842c969c # load x3 with value 0x7a7a92c8842c969c
sw x3, 0(x2) # store 0x7a7a92c8842c969c in memory
flh f17, 0(x2) # load 0x7a7a92c8842c969c from memory into f17
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f21, 0(x2) # load 0x0000be00 from memory into f21
fsgnj.h f28, f17, f21 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x4000)
la x2, scratch
li x3, 0x6566ecfca2ec28fd # load x3 with value 0x6566ecfca2ec28fd
sw x3, 0(x2) # store 0x6566ecfca2ec28fd in memory
flh f9, 0(x2) # load 0x6566ecfca2ec28fd from memory into f9
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f14, 0(x2) # load 0x00004000 from memory into f14
fsgnj.h f16, f9, f14 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xc000)
la x2, scratch
li x3, 0x743b12b49a29fb05 # load x3 with value 0x743b12b49a29fb05
sw x3, 0(x2) # store 0x743b12b49a29fb05 in memory
flh f23, 0(x2) # load 0x743b12b49a29fb05 from memory into f23
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f12, 0(x2) # load 0x0000c000 from memory into f12
fsgnj.h f31, f23, f12 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x400)
la x2, scratch
li x3, 0x2723334898d5a827 # load x3 with value 0x2723334898d5a827
sw x3, 0(x2) # store 0x2723334898d5a827 in memory
flh f17, 0(x2) # load 0x2723334898d5a827 from memory into f17
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f24, 0(x2) # load 0x00000400 from memory into f24
fsgnj.h f22, f17, f24 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x8400)
la x2, scratch
li x3, 0x563431e6e5d4271b # load x3 with value 0x563431e6e5d4271b
sw x3, 0(x2) # store 0x563431e6e5d4271b in memory
flh f20, 0(x2) # load 0x563431e6e5d4271b from memory into f20
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f16, 0(x2) # load 0x00008400 from memory into f16
fsgnj.h f18, f20, f16 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7bff)
la x2, scratch
li x3, 0x33894449c3d82337 # load x3 with value 0x33894449c3d82337
sw x3, 0(x2) # store 0x33894449c3d82337 in memory
flh f12, 0(x2) # load 0x33894449c3d82337 from memory into f12
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f29, 0(x2) # load 0x00007bff from memory into f29
fsgnj.h f20, f12, f29 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfbff)
la x2, scratch
li x3, 0xbda5438c70aae8df # load x3 with value 0xbda5438c70aae8df
sw x3, 0(x2) # store 0xbda5438c70aae8df in memory
flh f18, 0(x2) # load 0xbda5438c70aae8df from memory into f18
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f31, 0(x2) # load 0x0000fbff from memory into f31
fsgnj.h f7, f18, f31 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x3ff)
la x2, scratch
li x3, 0xe0530e8be66edd67 # load x3 with value 0xe0530e8be66edd67
sw x3, 0(x2) # store 0xe0530e8be66edd67 in memory
flh f24, 0(x2) # load 0xe0530e8be66edd67 from memory into f24
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f13, 0(x2) # load 0x000003ff from memory into f13
fsgnj.h f6, f24, f13 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x83ff)
la x2, scratch
li x3, 0xe6f6349e964799e2 # load x3 with value 0xe6f6349e964799e2
sw x3, 0(x2) # store 0xe6f6349e964799e2 in memory
flh f2, 0(x2) # load 0xe6f6349e964799e2 from memory into f2
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f18, 0(x2) # load 0x000083ff from memory into f18
fsgnj.h f16, f2, f18 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x200)
la x2, scratch
li x3, 0x50eb3eefd54e5145 # load x3 with value 0x50eb3eefd54e5145
sw x3, 0(x2) # store 0x50eb3eefd54e5145 in memory
flh f3, 0(x2) # load 0x50eb3eefd54e5145 from memory into f3
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f14, 0(x2) # load 0x00000200 from memory into f14
fsgnj.h f12, f3, f14 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x8200)
la x2, scratch
li x3, 0x83ccb097d8c773c # load x3 with value 0x83ccb097d8c773c
sw x3, 0(x2) # store 0x83ccb097d8c773c in memory
flh f12, 0(x2) # load 0x83ccb097d8c773c from memory into f12
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f9, 0(x2) # load 0x00008200 from memory into f9
fsgnj.h f22, f12, f9 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x1)
la x2, scratch
li x3, 0xdc6539758bb8c265 # load x3 with value 0xdc6539758bb8c265
sw x3, 0(x2) # store 0xdc6539758bb8c265 in memory
flh f20, 0(x2) # load 0xdc6539758bb8c265 from memory into f20
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f25, 0(x2) # load 0x00000001 from memory into f25
fsgnj.h f31, f20, f25 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x8001)
la x2, scratch
li x3, 0xac9421c2534ba34a # load x3 with value 0xac9421c2534ba34a
sw x3, 0(x2) # store 0xac9421c2534ba34a in memory
flh f1, 0(x2) # load 0xac9421c2534ba34a from memory into f1
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f8, 0(x2) # load 0x00008001 from memory into f8
fsgnj.h f30, f1, f8 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7c00)
la x2, scratch
li x3, 0xec36c2082661eef6 # load x3 with value 0xec36c2082661eef6
sw x3, 0(x2) # store 0xec36c2082661eef6 in memory
flh f1, 0(x2) # load 0xec36c2082661eef6 from memory into f1
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f24, 0(x2) # load 0x00007c00 from memory into f24
fsgnj.h f19, f1, f24 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfc00)
la x2, scratch
li x3, 0x64cac8febc513120 # load x3 with value 0x64cac8febc513120
sw x3, 0(x2) # store 0x64cac8febc513120 in memory
flh f5, 0(x2) # load 0x64cac8febc513120 from memory into f5
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f30, 0(x2) # load 0x0000fc00 from memory into f30
fsgnj.h f23, f5, f30 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7e00)
la x2, scratch
li x3, 0x59134dbd2790333f # load x3 with value 0x59134dbd2790333f
sw x3, 0(x2) # store 0x59134dbd2790333f in memory
flh f9, 0(x2) # load 0x59134dbd2790333f from memory into f9
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f20, 0(x2) # load 0x00007e00 from memory into f20
fsgnj.h f7, f9, f20 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7fff)
la x2, scratch
li x3, 0x1e176c6c88b98383 # load x3 with value 0x1e176c6c88b98383
sw x3, 0(x2) # store 0x1e176c6c88b98383 in memory
flh f7, 0(x2) # load 0x1e176c6c88b98383 from memory into f7
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f5, 0(x2) # load 0x00007fff from memory into f5
fsgnj.h f17, f7, f5 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfe00)
la x2, scratch
li x3, 0x2d2d8b7ba4b74fdd # load x3 with value 0x2d2d8b7ba4b74fdd
sw x3, 0(x2) # store 0x2d2d8b7ba4b74fdd in memory
flh f22, 0(x2) # load 0x2d2d8b7ba4b74fdd from memory into f22
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f6, 0(x2) # load 0x0000fe00 from memory into f6
fsgnj.h f11, f22, f6 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7c01)
la x2, scratch
li x3, 0xf7120e8f5644cc1f # load x3 with value 0xf7120e8f5644cc1f
sw x3, 0(x2) # store 0xf7120e8f5644cc1f in memory
flh f12, 0(x2) # load 0xf7120e8f5644cc1f from memory into f12
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f29, 0(x2) # load 0x00007c01 from memory into f29
fsgnj.h f16, f12, f29 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7dff)
la x2, scratch
li x3, 0x908ac00205e3eadc # load x3 with value 0x908ac00205e3eadc
sw x3, 0(x2) # store 0x908ac00205e3eadc in memory
flh f8, 0(x2) # load 0x908ac00205e3eadc from memory into f8
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f15, 0(x2) # load 0x00007dff from memory into f15
fsgnj.h f21, f8, f15 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfc01)
la x2, scratch
li x3, 0x5f1f517d743e403f # load x3 with value 0x5f1f517d743e403f
sw x3, 0(x2) # store 0x5f1f517d743e403f in memory
flh f22, 0(x2) # load 0x5f1f517d743e403f from memory into f22
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f16, 0(x2) # load 0x0000fc01 from memory into f16
fsgnj.h f20, f22, f16 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x58b4)
la x2, scratch
li x3, 0xb0ef9b9dd162aa3 # load x3 with value 0xb0ef9b9dd162aa3
sw x3, 0(x2) # store 0xb0ef9b9dd162aa3 in memory
flh f12, 0(x2) # load 0xb0ef9b9dd162aa3 from memory into f12
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f10, 0(x2) # load 0x000058b4 from memory into f10
fsgnj.h f28, f12, f10 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xc93a)
la x2, scratch
li x3, 0x6e384a9d28ce922e # load x3 with value 0x6e384a9d28ce922e
sw x3, 0(x2) # store 0x6e384a9d28ce922e in memory
flh f7, 0(x2) # load 0x6e384a9d28ce922e from memory into f7
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f2, 0(x2) # load 0x0000c93a from memory into f2
fsgnj.h f13, f7, f2 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f0)
la x2, scratch
li x3, 0x240742e84b0460c9 # load x3 with value 0x240742e84b0460c9
sw x3, 0(x2) # store 0x240742e84b0460c9 in memory
flh f0, 0(x2) # load 0x240742e84b0460c9 from memory into f0
la x2, scratch
li x3, 0x4aaa1d8acb61c887 # load x3 with value 0x4aaa1d8acb61c887
sw x3, 0(x2) # store 0x4aaa1d8acb61c887 in memory
flh f18, 0(x2) # load 0x4aaa1d8acb61c887 from memory into f18
fsgnj.h f0, f0, f18 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f1)
la x2, scratch
li x3, 0x96e2084b9b001045 # load x3 with value 0x96e2084b9b001045
sw x3, 0(x2) # store 0x96e2084b9b001045 in memory
flh f1, 0(x2) # load 0x96e2084b9b001045 from memory into f1
la x2, scratch
li x3, 0x6c109b25016aeaa4 # load x3 with value 0x6c109b25016aeaa4
sw x3, 0(x2) # store 0x6c109b25016aeaa4 in memory
flh f2, 0(x2) # load 0x6c109b25016aeaa4 from memory into f2
fsgnj.h f1, f1, f2 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f2)
la x2, scratch
li x3, 0x93c9ce4dac1f5b37 # load x3 with value 0x93c9ce4dac1f5b37
sw x3, 0(x2) # store 0x93c9ce4dac1f5b37 in memory
flh f2, 0(x2) # load 0x93c9ce4dac1f5b37 from memory into f2
la x2, scratch
li x3, 0x98bb0fd06ca5f8a # load x3 with value 0x98bb0fd06ca5f8a
sw x3, 0(x2) # store 0x98bb0fd06ca5f8a in memory
flh f13, 0(x2) # load 0x98bb0fd06ca5f8a from memory into f13
fsgnj.h f2, f2, f13 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f3)
la x2, scratch
li x3, 0x9784595424970853 # load x3 with value 0x9784595424970853
sw x3, 0(x2) # store 0x9784595424970853 in memory
flh f3, 0(x2) # load 0x9784595424970853 from memory into f3
la x2, scratch
li x3, 0x16038276175f77b4 # load x3 with value 0x16038276175f77b4
sw x3, 0(x2) # store 0x16038276175f77b4 in memory
flh f30, 0(x2) # load 0x16038276175f77b4 from memory into f30
fsgnj.h f3, f3, f30 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x2a7a7452bb304e64 # load x3 with value 0x2a7a7452bb304e64
sw x3, 0(x2) # store 0x2a7a7452bb304e64 in memory
flh f4, 0(x2) # load 0x2a7a7452bb304e64 from memory into f4
la x2, scratch
li x3, 0xefb4e86d1f81c894 # load x3 with value 0xefb4e86d1f81c894
sw x3, 0(x2) # store 0xefb4e86d1f81c894 in memory
flh f25, 0(x2) # load 0xefb4e86d1f81c894 from memory into f25
fsgnj.h f4, f4, f25 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xa1b5bcbee969b7b5 # load x3 with value 0xa1b5bcbee969b7b5
sw x3, 0(x2) # store 0xa1b5bcbee969b7b5 in memory
flh f5, 0(x2) # load 0xa1b5bcbee969b7b5 from memory into f5
la x2, scratch
li x3, 0xedd4bbf0e828a003 # load x3 with value 0xedd4bbf0e828a003
sw x3, 0(x2) # store 0xedd4bbf0e828a003 in memory
flh f25, 0(x2) # load 0xedd4bbf0e828a003 from memory into f25
fsgnj.h f5, f5, f25 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x7dc2f21cff2cd0b0 # load x3 with value 0x7dc2f21cff2cd0b0
sw x3, 0(x2) # store 0x7dc2f21cff2cd0b0 in memory
flh f6, 0(x2) # load 0x7dc2f21cff2cd0b0 from memory into f6
la x2, scratch
li x3, 0xe01105df811bb430 # load x3 with value 0xe01105df811bb430
sw x3, 0(x2) # store 0xe01105df811bb430 in memory
flh f2, 0(x2) # load 0xe01105df811bb430 from memory into f2
fsgnj.h f6, f6, f2 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xdadebed4cc97ff50 # load x3 with value 0xdadebed4cc97ff50
sw x3, 0(x2) # store 0xdadebed4cc97ff50 in memory
flh f7, 0(x2) # load 0xdadebed4cc97ff50 from memory into f7
la x2, scratch
li x3, 0x19e6bc8fc1c79952 # load x3 with value 0x19e6bc8fc1c79952
sw x3, 0(x2) # store 0x19e6bc8fc1c79952 in memory
flh f6, 0(x2) # load 0x19e6bc8fc1c79952 from memory into f6
fsgnj.h f7, f7, f6 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f8)
la x2, scratch
li x3, 0x99eb3c75dd955937 # load x3 with value 0x99eb3c75dd955937
sw x3, 0(x2) # store 0x99eb3c75dd955937 in memory
flh f8, 0(x2) # load 0x99eb3c75dd955937 from memory into f8
la x2, scratch
li x3, 0xbb566930ab0b3359 # load x3 with value 0xbb566930ab0b3359
sw x3, 0(x2) # store 0xbb566930ab0b3359 in memory
flh f19, 0(x2) # load 0xbb566930ab0b3359 from memory into f19
fsgnj.h f8, f8, f19 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f9)
la x2, scratch
li x3, 0x76bf10b65e5586ae # load x3 with value 0x76bf10b65e5586ae
sw x3, 0(x2) # store 0x76bf10b65e5586ae in memory
flh f9, 0(x2) # load 0x76bf10b65e5586ae from memory into f9
la x2, scratch
li x3, 0x55fc191371404ac8 # load x3 with value 0x55fc191371404ac8
sw x3, 0(x2) # store 0x55fc191371404ac8 in memory
flh f28, 0(x2) # load 0x55fc191371404ac8 from memory into f28
fsgnj.h f9, f9, f28 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f10)
la x2, scratch
li x3, 0x716db2035095439c # load x3 with value 0x716db2035095439c
sw x3, 0(x2) # store 0x716db2035095439c in memory
flh f10, 0(x2) # load 0x716db2035095439c from memory into f10
la x2, scratch
li x3, 0x7b84c5cca789f07c # load x3 with value 0x7b84c5cca789f07c
sw x3, 0(x2) # store 0x7b84c5cca789f07c in memory
flh f28, 0(x2) # load 0x7b84c5cca789f07c from memory into f28
fsgnj.h f10, f10, f28 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f11)
la x2, scratch
li x3, 0xaa269b9a6569f781 # load x3 with value 0xaa269b9a6569f781
sw x3, 0(x2) # store 0xaa269b9a6569f781 in memory
flh f11, 0(x2) # load 0xaa269b9a6569f781 from memory into f11
la x2, scratch
li x3, 0xa65af9dfacc1fb75 # load x3 with value 0xa65af9dfacc1fb75
sw x3, 0(x2) # store 0xa65af9dfacc1fb75 in memory
flh f24, 0(x2) # load 0xa65af9dfacc1fb75 from memory into f24
fsgnj.h f11, f11, f24 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f12)
la x2, scratch
li x3, 0x2903edc23d1a71d8 # load x3 with value 0x2903edc23d1a71d8
sw x3, 0(x2) # store 0x2903edc23d1a71d8 in memory
flh f12, 0(x2) # load 0x2903edc23d1a71d8 from memory into f12
la x2, scratch
li x3, 0x2d83be5f1da8e006 # load x3 with value 0x2d83be5f1da8e006
sw x3, 0(x2) # store 0x2d83be5f1da8e006 in memory
flh f8, 0(x2) # load 0x2d83be5f1da8e006 from memory into f8
fsgnj.h f12, f12, f8 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f13)
la x2, scratch
li x3, 0xd043fc4b738e77fa # load x3 with value 0xd043fc4b738e77fa
sw x3, 0(x2) # store 0xd043fc4b738e77fa in memory
flh f13, 0(x2) # load 0xd043fc4b738e77fa from memory into f13
la x2, scratch
li x3, 0xc4e09ed566d70432 # load x3 with value 0xc4e09ed566d70432
sw x3, 0(x2) # store 0xc4e09ed566d70432 in memory
flh f1, 0(x2) # load 0xc4e09ed566d70432 from memory into f1
fsgnj.h f13, f13, f1 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f14)
la x2, scratch
li x3, 0xf2c58f3fc980ff59 # load x3 with value 0xf2c58f3fc980ff59
sw x3, 0(x2) # store 0xf2c58f3fc980ff59 in memory
flh f14, 0(x2) # load 0xf2c58f3fc980ff59 from memory into f14
la x2, scratch
li x3, 0xcf026ca8cc34c610 # load x3 with value 0xcf026ca8cc34c610
sw x3, 0(x2) # store 0xcf026ca8cc34c610 in memory
flh f26, 0(x2) # load 0xcf026ca8cc34c610 from memory into f26
fsgnj.h f14, f14, f26 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f15)
la x2, scratch
li x3, 0xfec0729ac5280fb0 # load x3 with value 0xfec0729ac5280fb0
sw x3, 0(x2) # store 0xfec0729ac5280fb0 in memory
flh f15, 0(x2) # load 0xfec0729ac5280fb0 from memory into f15
la x2, scratch
li x3, 0xaede597fed17c6dc # load x3 with value 0xaede597fed17c6dc
sw x3, 0(x2) # store 0xaede597fed17c6dc in memory
flh f14, 0(x2) # load 0xaede597fed17c6dc from memory into f14
fsgnj.h f15, f15, f14 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f16)
la x2, scratch
li x3, 0x8f5827d2d6e473d6 # load x3 with value 0x8f5827d2d6e473d6
sw x3, 0(x2) # store 0x8f5827d2d6e473d6 in memory
flh f16, 0(x2) # load 0x8f5827d2d6e473d6 from memory into f16
la x2, scratch
li x3, 0x351a48b21d4047e5 # load x3 with value 0x351a48b21d4047e5
sw x3, 0(x2) # store 0x351a48b21d4047e5 in memory
flh f25, 0(x2) # load 0x351a48b21d4047e5 from memory into f25
fsgnj.h f16, f16, f25 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f17)
la x2, scratch
li x3, 0x378e5f2e5a6711ac # load x3 with value 0x378e5f2e5a6711ac
sw x3, 0(x2) # store 0x378e5f2e5a6711ac in memory
flh f17, 0(x2) # load 0x378e5f2e5a6711ac from memory into f17
la x2, scratch
li x3, 0x4e01aba9b732b0fc # load x3 with value 0x4e01aba9b732b0fc
sw x3, 0(x2) # store 0x4e01aba9b732b0fc in memory
flh f19, 0(x2) # load 0x4e01aba9b732b0fc from memory into f19
fsgnj.h f17, f17, f19 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f18)
la x2, scratch
li x3, 0x49c97e622ec86568 # load x3 with value 0x49c97e622ec86568
sw x3, 0(x2) # store 0x49c97e622ec86568 in memory
flh f18, 0(x2) # load 0x49c97e622ec86568 from memory into f18
la x2, scratch
li x3, 0x9cc20594e3e15a87 # load x3 with value 0x9cc20594e3e15a87
sw x3, 0(x2) # store 0x9cc20594e3e15a87 in memory
flh f31, 0(x2) # load 0x9cc20594e3e15a87 from memory into f31
fsgnj.h f18, f18, f31 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f19)
la x2, scratch
li x3, 0x279d473d9571cfbc # load x3 with value 0x279d473d9571cfbc
sw x3, 0(x2) # store 0x279d473d9571cfbc in memory
flh f19, 0(x2) # load 0x279d473d9571cfbc from memory into f19
la x2, scratch
li x3, 0xa7783ff408d8ddf5 # load x3 with value 0xa7783ff408d8ddf5
sw x3, 0(x2) # store 0xa7783ff408d8ddf5 in memory
flh f5, 0(x2) # load 0xa7783ff408d8ddf5 from memory into f5
fsgnj.h f19, f19, f5 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f20)
la x2, scratch
li x3, 0x92453a8282807a31 # load x3 with value 0x92453a8282807a31
sw x3, 0(x2) # store 0x92453a8282807a31 in memory
flh f20, 0(x2) # load 0x92453a8282807a31 from memory into f20
la x2, scratch
li x3, 0x81a00897f46b1d09 # load x3 with value 0x81a00897f46b1d09
sw x3, 0(x2) # store 0x81a00897f46b1d09 in memory
flh f12, 0(x2) # load 0x81a00897f46b1d09 from memory into f12
fsgnj.h f20, f20, f12 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f21)
la x2, scratch
li x3, 0x9e99c1dd69c2369a # load x3 with value 0x9e99c1dd69c2369a
sw x3, 0(x2) # store 0x9e99c1dd69c2369a in memory
flh f21, 0(x2) # load 0x9e99c1dd69c2369a from memory into f21
la x2, scratch
li x3, 0xeabe6c08f1058761 # load x3 with value 0xeabe6c08f1058761
sw x3, 0(x2) # store 0xeabe6c08f1058761 in memory
flh f24, 0(x2) # load 0xeabe6c08f1058761 from memory into f24
fsgnj.h f21, f21, f24 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f22)
la x2, scratch
li x3, 0xf40815f0fc4012fd # load x3 with value 0xf40815f0fc4012fd
sw x3, 0(x2) # store 0xf40815f0fc4012fd in memory
flh f22, 0(x2) # load 0xf40815f0fc4012fd from memory into f22
la x2, scratch
li x3, 0xcd3162ee71febf06 # load x3 with value 0xcd3162ee71febf06
sw x3, 0(x2) # store 0xcd3162ee71febf06 in memory
flh f24, 0(x2) # load 0xcd3162ee71febf06 from memory into f24
fsgnj.h f22, f22, f24 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f23)
la x2, scratch
li x3, 0xa2b27d244077f644 # load x3 with value 0xa2b27d244077f644
sw x3, 0(x2) # store 0xa2b27d244077f644 in memory
flh f23, 0(x2) # load 0xa2b27d244077f644 from memory into f23
la x2, scratch
li x3, 0x8b7cc18ccca2559b # load x3 with value 0x8b7cc18ccca2559b
sw x3, 0(x2) # store 0x8b7cc18ccca2559b in memory
flh f8, 0(x2) # load 0x8b7cc18ccca2559b from memory into f8
fsgnj.h f23, f23, f8 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f24)
la x2, scratch
li x3, 0xdea9727c725309d9 # load x3 with value 0xdea9727c725309d9
sw x3, 0(x2) # store 0xdea9727c725309d9 in memory
flh f24, 0(x2) # load 0xdea9727c725309d9 from memory into f24
la x2, scratch
li x3, 0x94abe25bf79b9e43 # load x3 with value 0x94abe25bf79b9e43
sw x3, 0(x2) # store 0x94abe25bf79b9e43 in memory
flh f10, 0(x2) # load 0x94abe25bf79b9e43 from memory into f10
fsgnj.h f24, f24, f10 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f25)
la x2, scratch
li x3, 0x60753d03fa4637ea # load x3 with value 0x60753d03fa4637ea
sw x3, 0(x2) # store 0x60753d03fa4637ea in memory
flh f25, 0(x2) # load 0x60753d03fa4637ea from memory into f25
la x2, scratch
li x3, 0xabcddbe86d13bd85 # load x3 with value 0xabcddbe86d13bd85
sw x3, 0(x2) # store 0xabcddbe86d13bd85 in memory
flh f21, 0(x2) # load 0xabcddbe86d13bd85 from memory into f21
fsgnj.h f25, f25, f21 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f26)
la x2, scratch
li x3, 0xa33ab6bc3d1066f5 # load x3 with value 0xa33ab6bc3d1066f5
sw x3, 0(x2) # store 0xa33ab6bc3d1066f5 in memory
flh f26, 0(x2) # load 0xa33ab6bc3d1066f5 from memory into f26
la x2, scratch
li x3, 0xc7314d209ebe0600 # load x3 with value 0xc7314d209ebe0600
sw x3, 0(x2) # store 0xc7314d209ebe0600 in memory
flh f18, 0(x2) # load 0xc7314d209ebe0600 from memory into f18
fsgnj.h f26, f26, f18 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f27)
la x2, scratch
li x3, 0x63ee6fbe86cfecbd # load x3 with value 0x63ee6fbe86cfecbd
sw x3, 0(x2) # store 0x63ee6fbe86cfecbd in memory
flh f27, 0(x2) # load 0x63ee6fbe86cfecbd from memory into f27
la x2, scratch
li x3, 0x31b83447ef24bf52 # load x3 with value 0x31b83447ef24bf52
sw x3, 0(x2) # store 0x31b83447ef24bf52 in memory
flh f28, 0(x2) # load 0x31b83447ef24bf52 from memory into f28
fsgnj.h f27, f27, f28 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f28)
la x2, scratch
li x3, 0xbe5769a2320ecb66 # load x3 with value 0xbe5769a2320ecb66
sw x3, 0(x2) # store 0xbe5769a2320ecb66 in memory
flh f28, 0(x2) # load 0xbe5769a2320ecb66 from memory into f28
la x2, scratch
li x3, 0x8c081a284719bade # load x3 with value 0x8c081a284719bade
sw x3, 0(x2) # store 0x8c081a284719bade in memory
flh f9, 0(x2) # load 0x8c081a284719bade from memory into f9
fsgnj.h f28, f28, f9 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f29)
la x2, scratch
li x3, 0x9996a2413bac8d56 # load x3 with value 0x9996a2413bac8d56
sw x3, 0(x2) # store 0x9996a2413bac8d56 in memory
flh f29, 0(x2) # load 0x9996a2413bac8d56 from memory into f29
la x2, scratch
li x3, 0xa48272834fd41672 # load x3 with value 0xa48272834fd41672
sw x3, 0(x2) # store 0xa48272834fd41672 in memory
flh f6, 0(x2) # load 0xa48272834fd41672 from memory into f6
fsgnj.h f29, f29, f6 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f30)
la x2, scratch
li x3, 0x74d01d4568aeaa7f # load x3 with value 0x74d01d4568aeaa7f
sw x3, 0(x2) # store 0x74d01d4568aeaa7f in memory
flh f30, 0(x2) # load 0x74d01d4568aeaa7f from memory into f30
la x2, scratch
li x3, 0x7a69c7d82e294cdf # load x3 with value 0x7a69c7d82e294cdf
sw x3, 0(x2) # store 0x7a69c7d82e294cdf in memory
flh f31, 0(x2) # load 0x7a69c7d82e294cdf from memory into f31
fsgnj.h f30, f30, f31 # perform operation

# Testcase cmp_fd_fs1 (Test fd = fs1 = f31)
la x2, scratch
li x3, 0x64680672622276b1 # load x3 with value 0x64680672622276b1
sw x3, 0(x2) # store 0x64680672622276b1 in memory
flh f31, 0(x2) # load 0x64680672622276b1 from memory into f31
la x2, scratch
li x3, 0x8debd3c605a4f75e # load x3 with value 0x8debd3c605a4f75e
sw x3, 0(x2) # store 0x8debd3c605a4f75e in memory
flh f10, 0(x2) # load 0x8debd3c605a4f75e from memory into f10
fsgnj.h f31, f31, f10 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f0)
la x2, scratch
li x3, 0xa4ee7405cfad2617 # load x3 with value 0xa4ee7405cfad2617
sw x3, 0(x2) # store 0xa4ee7405cfad2617 in memory
flh f22, 0(x2) # load 0xa4ee7405cfad2617 from memory into f22
la x2, scratch
li x3, 0xa7e58b49b24145f9 # load x3 with value 0xa7e58b49b24145f9
sw x3, 0(x2) # store 0xa7e58b49b24145f9 in memory
flh f0, 0(x2) # load 0xa7e58b49b24145f9 from memory into f0
fsgnj.h f0, f22, f0 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f1)
la x2, scratch
li x3, 0x757313a483ce4e01 # load x3 with value 0x757313a483ce4e01
sw x3, 0(x2) # store 0x757313a483ce4e01 in memory
flh f16, 0(x2) # load 0x757313a483ce4e01 from memory into f16
la x2, scratch
li x3, 0x59c43f840c79cc4a # load x3 with value 0x59c43f840c79cc4a
sw x3, 0(x2) # store 0x59c43f840c79cc4a in memory
flh f1, 0(x2) # load 0x59c43f840c79cc4a from memory into f1
fsgnj.h f1, f16, f1 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f2)
la x2, scratch
li x3, 0x770d45836b3a09f1 # load x3 with value 0x770d45836b3a09f1
sw x3, 0(x2) # store 0x770d45836b3a09f1 in memory
flh f17, 0(x2) # load 0x770d45836b3a09f1 from memory into f17
la x2, scratch
li x3, 0x1b60fdb962e275b7 # load x3 with value 0x1b60fdb962e275b7
sw x3, 0(x2) # store 0x1b60fdb962e275b7 in memory
flh f2, 0(x2) # load 0x1b60fdb962e275b7 from memory into f2
fsgnj.h f2, f17, f2 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f3)
la x2, scratch
li x3, 0xb02c03c122bb9be4 # load x3 with value 0xb02c03c122bb9be4
sw x3, 0(x2) # store 0xb02c03c122bb9be4 in memory
flh f22, 0(x2) # load 0xb02c03c122bb9be4 from memory into f22
la x2, scratch
li x3, 0x843d40c7666501e1 # load x3 with value 0x843d40c7666501e1
sw x3, 0(x2) # store 0x843d40c7666501e1 in memory
flh f3, 0(x2) # load 0x843d40c7666501e1 from memory into f3
fsgnj.h f3, f22, f3 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x18540b327aa012a # load x3 with value 0x18540b327aa012a
sw x3, 0(x2) # store 0x18540b327aa012a in memory
flh f15, 0(x2) # load 0x18540b327aa012a from memory into f15
la x2, scratch
li x3, 0x22d00712619ed2c2 # load x3 with value 0x22d00712619ed2c2
sw x3, 0(x2) # store 0x22d00712619ed2c2 in memory
flh f4, 0(x2) # load 0x22d00712619ed2c2 from memory into f4
fsgnj.h f4, f15, f4 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xded34bcf94f1bd33 # load x3 with value 0xded34bcf94f1bd33
sw x3, 0(x2) # store 0xded34bcf94f1bd33 in memory
flh f30, 0(x2) # load 0xded34bcf94f1bd33 from memory into f30
la x2, scratch
li x3, 0x205c206010b2627f # load x3 with value 0x205c206010b2627f
sw x3, 0(x2) # store 0x205c206010b2627f in memory
flh f5, 0(x2) # load 0x205c206010b2627f from memory into f5
fsgnj.h f5, f30, f5 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xae2868e145102912 # load x3 with value 0xae2868e145102912
sw x3, 0(x2) # store 0xae2868e145102912 in memory
flh f16, 0(x2) # load 0xae2868e145102912 from memory into f16
la x2, scratch
li x3, 0xfdb53c2544509d52 # load x3 with value 0xfdb53c2544509d52
sw x3, 0(x2) # store 0xfdb53c2544509d52 in memory
flh f6, 0(x2) # load 0xfdb53c2544509d52 from memory into f6
fsgnj.h f6, f16, f6 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xfb28db28f86c1412 # load x3 with value 0xfb28db28f86c1412
sw x3, 0(x2) # store 0xfb28db28f86c1412 in memory
flh f2, 0(x2) # load 0xfb28db28f86c1412 from memory into f2
la x2, scratch
li x3, 0xee88bb535321a415 # load x3 with value 0xee88bb535321a415
sw x3, 0(x2) # store 0xee88bb535321a415 in memory
flh f7, 0(x2) # load 0xee88bb535321a415 from memory into f7
fsgnj.h f7, f2, f7 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f8)
la x2, scratch
li x3, 0x8349da7eed8043d8 # load x3 with value 0x8349da7eed8043d8
sw x3, 0(x2) # store 0x8349da7eed8043d8 in memory
flh f28, 0(x2) # load 0x8349da7eed8043d8 from memory into f28
la x2, scratch
li x3, 0x5a3eaa4c3839fcf2 # load x3 with value 0x5a3eaa4c3839fcf2
sw x3, 0(x2) # store 0x5a3eaa4c3839fcf2 in memory
flh f8, 0(x2) # load 0x5a3eaa4c3839fcf2 from memory into f8
fsgnj.h f8, f28, f8 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f9)
la x2, scratch
li x3, 0x775e34a537c579d1 # load x3 with value 0x775e34a537c579d1
sw x3, 0(x2) # store 0x775e34a537c579d1 in memory
flh f3, 0(x2) # load 0x775e34a537c579d1 from memory into f3
la x2, scratch
li x3, 0x5fbe829add323ea4 # load x3 with value 0x5fbe829add323ea4
sw x3, 0(x2) # store 0x5fbe829add323ea4 in memory
flh f9, 0(x2) # load 0x5fbe829add323ea4 from memory into f9
fsgnj.h f9, f3, f9 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f10)
la x2, scratch
li x3, 0xf1027ccaa371770a # load x3 with value 0xf1027ccaa371770a
sw x3, 0(x2) # store 0xf1027ccaa371770a in memory
flh f27, 0(x2) # load 0xf1027ccaa371770a from memory into f27
la x2, scratch
li x3, 0xe0f01529a21f858f # load x3 with value 0xe0f01529a21f858f
sw x3, 0(x2) # store 0xe0f01529a21f858f in memory
flh f10, 0(x2) # load 0xe0f01529a21f858f from memory into f10
fsgnj.h f10, f27, f10 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f11)
la x2, scratch
li x3, 0x6e2d2c1862c90af9 # load x3 with value 0x6e2d2c1862c90af9
sw x3, 0(x2) # store 0x6e2d2c1862c90af9 in memory
flh f9, 0(x2) # load 0x6e2d2c1862c90af9 from memory into f9
la x2, scratch
li x3, 0x7b9c4bf4b46e42f3 # load x3 with value 0x7b9c4bf4b46e42f3
sw x3, 0(x2) # store 0x7b9c4bf4b46e42f3 in memory
flh f11, 0(x2) # load 0x7b9c4bf4b46e42f3 from memory into f11
fsgnj.h f11, f9, f11 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f12)
la x2, scratch
li x3, 0x89934c7514c4571c # load x3 with value 0x89934c7514c4571c
sw x3, 0(x2) # store 0x89934c7514c4571c in memory
flh f28, 0(x2) # load 0x89934c7514c4571c from memory into f28
la x2, scratch
li x3, 0xdb4ff8f5dc06eae1 # load x3 with value 0xdb4ff8f5dc06eae1
sw x3, 0(x2) # store 0xdb4ff8f5dc06eae1 in memory
flh f12, 0(x2) # load 0xdb4ff8f5dc06eae1 from memory into f12
fsgnj.h f12, f28, f12 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f13)
la x2, scratch
li x3, 0x6d0ca11d2815465f # load x3 with value 0x6d0ca11d2815465f
sw x3, 0(x2) # store 0x6d0ca11d2815465f in memory
flh f5, 0(x2) # load 0x6d0ca11d2815465f from memory into f5
la x2, scratch
li x3, 0x3842a02ac52d2850 # load x3 with value 0x3842a02ac52d2850
sw x3, 0(x2) # store 0x3842a02ac52d2850 in memory
flh f13, 0(x2) # load 0x3842a02ac52d2850 from memory into f13
fsgnj.h f13, f5, f13 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f14)
la x2, scratch
li x3, 0x413112797d5dc4eb # load x3 with value 0x413112797d5dc4eb
sw x3, 0(x2) # store 0x413112797d5dc4eb in memory
flh f8, 0(x2) # load 0x413112797d5dc4eb from memory into f8
la x2, scratch
li x3, 0xfda81780b1e56c78 # load x3 with value 0xfda81780b1e56c78
sw x3, 0(x2) # store 0xfda81780b1e56c78 in memory
flh f14, 0(x2) # load 0xfda81780b1e56c78 from memory into f14
fsgnj.h f14, f8, f14 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f15)
la x2, scratch
li x3, 0x5b7d2c97d6713e06 # load x3 with value 0x5b7d2c97d6713e06
sw x3, 0(x2) # store 0x5b7d2c97d6713e06 in memory
flh f8, 0(x2) # load 0x5b7d2c97d6713e06 from memory into f8
la x2, scratch
li x3, 0xbdfe9ace8ec5033 # load x3 with value 0xbdfe9ace8ec5033
sw x3, 0(x2) # store 0xbdfe9ace8ec5033 in memory
flh f15, 0(x2) # load 0xbdfe9ace8ec5033 from memory into f15
fsgnj.h f15, f8, f15 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f16)
la x2, scratch
li x3, 0x9653c796df6f4af6 # load x3 with value 0x9653c796df6f4af6
sw x3, 0(x2) # store 0x9653c796df6f4af6 in memory
flh f15, 0(x2) # load 0x9653c796df6f4af6 from memory into f15
la x2, scratch
li x3, 0xadb2fe0928d968f3 # load x3 with value 0xadb2fe0928d968f3
sw x3, 0(x2) # store 0xadb2fe0928d968f3 in memory
flh f16, 0(x2) # load 0xadb2fe0928d968f3 from memory into f16
fsgnj.h f16, f15, f16 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f17)
la x2, scratch
li x3, 0x1a2aacda829f61ca # load x3 with value 0x1a2aacda829f61ca
sw x3, 0(x2) # store 0x1a2aacda829f61ca in memory
flh f15, 0(x2) # load 0x1a2aacda829f61ca from memory into f15
la x2, scratch
li x3, 0xa49042b8c676c411 # load x3 with value 0xa49042b8c676c411
sw x3, 0(x2) # store 0xa49042b8c676c411 in memory
flh f17, 0(x2) # load 0xa49042b8c676c411 from memory into f17
fsgnj.h f17, f15, f17 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f18)
la x2, scratch
li x3, 0x869abf90a30ec712 # load x3 with value 0x869abf90a30ec712
sw x3, 0(x2) # store 0x869abf90a30ec712 in memory
flh f5, 0(x2) # load 0x869abf90a30ec712 from memory into f5
la x2, scratch
li x3, 0xeab3f31b40cd791f # load x3 with value 0xeab3f31b40cd791f
sw x3, 0(x2) # store 0xeab3f31b40cd791f in memory
flh f18, 0(x2) # load 0xeab3f31b40cd791f from memory into f18
fsgnj.h f18, f5, f18 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f19)
la x2, scratch
li x3, 0x911d14692e395e40 # load x3 with value 0x911d14692e395e40
sw x3, 0(x2) # store 0x911d14692e395e40 in memory
flh f20, 0(x2) # load 0x911d14692e395e40 from memory into f20
la x2, scratch
li x3, 0x16c04e4971779e56 # load x3 with value 0x16c04e4971779e56
sw x3, 0(x2) # store 0x16c04e4971779e56 in memory
flh f19, 0(x2) # load 0x16c04e4971779e56 from memory into f19
fsgnj.h f19, f20, f19 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f20)
la x2, scratch
li x3, 0x705a269166717286 # load x3 with value 0x705a269166717286
sw x3, 0(x2) # store 0x705a269166717286 in memory
flh f29, 0(x2) # load 0x705a269166717286 from memory into f29
la x2, scratch
li x3, 0xabd5ebce6473c432 # load x3 with value 0xabd5ebce6473c432
sw x3, 0(x2) # store 0xabd5ebce6473c432 in memory
flh f20, 0(x2) # load 0xabd5ebce6473c432 from memory into f20
fsgnj.h f20, f29, f20 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f21)
la x2, scratch
li x3, 0x3d8d546af6a12c68 # load x3 with value 0x3d8d546af6a12c68
sw x3, 0(x2) # store 0x3d8d546af6a12c68 in memory
flh f17, 0(x2) # load 0x3d8d546af6a12c68 from memory into f17
la x2, scratch
li x3, 0xb451a7601753991 # load x3 with value 0xb451a7601753991
sw x3, 0(x2) # store 0xb451a7601753991 in memory
flh f21, 0(x2) # load 0xb451a7601753991 from memory into f21
fsgnj.h f21, f17, f21 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f22)
la x2, scratch
li x3, 0x29f5276c0c2d8cd4 # load x3 with value 0x29f5276c0c2d8cd4
sw x3, 0(x2) # store 0x29f5276c0c2d8cd4 in memory
flh f20, 0(x2) # load 0x29f5276c0c2d8cd4 from memory into f20
la x2, scratch
li x3, 0xc6a1274234bc9a7d # load x3 with value 0xc6a1274234bc9a7d
sw x3, 0(x2) # store 0xc6a1274234bc9a7d in memory
flh f22, 0(x2) # load 0xc6a1274234bc9a7d from memory into f22
fsgnj.h f22, f20, f22 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f23)
la x2, scratch
li x3, 0xa1cd04325e43a2a3 # load x3 with value 0xa1cd04325e43a2a3
sw x3, 0(x2) # store 0xa1cd04325e43a2a3 in memory
flh f5, 0(x2) # load 0xa1cd04325e43a2a3 from memory into f5
la x2, scratch
li x3, 0x23ac8b753abe5789 # load x3 with value 0x23ac8b753abe5789
sw x3, 0(x2) # store 0x23ac8b753abe5789 in memory
flh f23, 0(x2) # load 0x23ac8b753abe5789 from memory into f23
fsgnj.h f23, f5, f23 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f24)
la x2, scratch
li x3, 0x9e922e5996b1d8fd # load x3 with value 0x9e922e5996b1d8fd
sw x3, 0(x2) # store 0x9e922e5996b1d8fd in memory
flh f6, 0(x2) # load 0x9e922e5996b1d8fd from memory into f6
la x2, scratch
li x3, 0x49f7724666a857c5 # load x3 with value 0x49f7724666a857c5
sw x3, 0(x2) # store 0x49f7724666a857c5 in memory
flh f24, 0(x2) # load 0x49f7724666a857c5 from memory into f24
fsgnj.h f24, f6, f24 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f25)
la x2, scratch
li x3, 0xebd3349efef6674b # load x3 with value 0xebd3349efef6674b
sw x3, 0(x2) # store 0xebd3349efef6674b in memory
flh f9, 0(x2) # load 0xebd3349efef6674b from memory into f9
la x2, scratch
li x3, 0x6936f52d7c2112fd # load x3 with value 0x6936f52d7c2112fd
sw x3, 0(x2) # store 0x6936f52d7c2112fd in memory
flh f25, 0(x2) # load 0x6936f52d7c2112fd from memory into f25
fsgnj.h f25, f9, f25 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f26)
la x2, scratch
li x3, 0xc65bdb3394a73e4f # load x3 with value 0xc65bdb3394a73e4f
sw x3, 0(x2) # store 0xc65bdb3394a73e4f in memory
flh f21, 0(x2) # load 0xc65bdb3394a73e4f from memory into f21
la x2, scratch
li x3, 0x5b084b69cff30c85 # load x3 with value 0x5b084b69cff30c85
sw x3, 0(x2) # store 0x5b084b69cff30c85 in memory
flh f26, 0(x2) # load 0x5b084b69cff30c85 from memory into f26
fsgnj.h f26, f21, f26 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f27)
la x2, scratch
li x3, 0x4a626f6e2db4bd9 # load x3 with value 0x4a626f6e2db4bd9
sw x3, 0(x2) # store 0x4a626f6e2db4bd9 in memory
flh f10, 0(x2) # load 0x4a626f6e2db4bd9 from memory into f10
la x2, scratch
li x3, 0x41c5a977802a5cc6 # load x3 with value 0x41c5a977802a5cc6
sw x3, 0(x2) # store 0x41c5a977802a5cc6 in memory
flh f27, 0(x2) # load 0x41c5a977802a5cc6 from memory into f27
fsgnj.h f27, f10, f27 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f28)
la x2, scratch
li x3, 0x3387a6cee4ae39cb # load x3 with value 0x3387a6cee4ae39cb
sw x3, 0(x2) # store 0x3387a6cee4ae39cb in memory
flh f8, 0(x2) # load 0x3387a6cee4ae39cb from memory into f8
la x2, scratch
li x3, 0xa478d2fd65dbae9c # load x3 with value 0xa478d2fd65dbae9c
sw x3, 0(x2) # store 0xa478d2fd65dbae9c in memory
flh f28, 0(x2) # load 0xa478d2fd65dbae9c from memory into f28
fsgnj.h f28, f8, f28 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f29)
la x2, scratch
li x3, 0xab1f660d518e95f1 # load x3 with value 0xab1f660d518e95f1
sw x3, 0(x2) # store 0xab1f660d518e95f1 in memory
flh f20, 0(x2) # load 0xab1f660d518e95f1 from memory into f20
la x2, scratch
li x3, 0xe5685cf2b4cb9e89 # load x3 with value 0xe5685cf2b4cb9e89
sw x3, 0(x2) # store 0xe5685cf2b4cb9e89 in memory
flh f29, 0(x2) # load 0xe5685cf2b4cb9e89 from memory into f29
fsgnj.h f29, f20, f29 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f30)
la x2, scratch
li x3, 0x5fbd5f7df44c429f # load x3 with value 0x5fbd5f7df44c429f
sw x3, 0(x2) # store 0x5fbd5f7df44c429f in memory
flh f11, 0(x2) # load 0x5fbd5f7df44c429f from memory into f11
la x2, scratch
li x3, 0x7b0646e09019a185 # load x3 with value 0x7b0646e09019a185
sw x3, 0(x2) # store 0x7b0646e09019a185 in memory
flh f30, 0(x2) # load 0x7b0646e09019a185 from memory into f30
fsgnj.h f30, f11, f30 # perform operation

# Testcase cmp_fd_fs2 (Test fd = fs2 = f31)
la x2, scratch
li x3, 0xdf95adf206239891 # load x3 with value 0xdf95adf206239891
sw x3, 0(x2) # store 0xdf95adf206239891 in memory
flh f25, 0(x2) # load 0xdf95adf206239891 from memory into f25
la x2, scratch
li x3, 0x550eeb0b792f2154 # load x3 with value 0x550eeb0b792f2154
sw x3, 0(x2) # store 0x550eeb0b792f2154 in memory
flh f31, 0(x2) # load 0x550eeb0b792f2154 from memory into f31
fsgnj.h f31, f25, f31 # perform operation

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
fsgnj.h f30, f12, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f18, 0(x2) # load 0x00000000 from memory into f18
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f6, 0(x2) # load 0x00008000 from memory into f6
fsgnj.h f20, f18, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f23, 0(x2) # load 0x00000000 from memory into f23
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f5, 0(x2) # load 0x00003c00 from memory into f5
fsgnj.h f2, f23, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f1, 0(x2) # load 0x00000000 from memory into f1
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f27, 0(x2) # load 0x0000bc00 from memory into f27
fsgnj.h f3, f1, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f23, 0(x2) # load 0x00000000 from memory into f23
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f7, 0(x2) # load 0x00003e00 from memory into f7
fsgnj.h f8, f23, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f1, 0(x2) # load 0x00000000 from memory into f1
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f11, 0(x2) # load 0x0000be00 from memory into f11
fsgnj.h f20, f1, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f26, 0(x2) # load 0x00000000 from memory into f26
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f18, 0(x2) # load 0x00004000 from memory into f18
fsgnj.h f1, f26, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f22, 0(x2) # load 0x00000000 from memory into f22
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f19, 0(x2) # load 0x0000c000 from memory into f19
fsgnj.h f1, f22, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f13, 0(x2) # load 0x00000000 from memory into f13
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f5, 0(x2) # load 0x00000400 from memory into f5
fsgnj.h f14, f13, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f12, 0(x2) # load 0x00000000 from memory into f12
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f26, 0(x2) # load 0x00008400 from memory into f26
fsgnj.h f27, f12, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f3, 0(x2) # load 0x00000000 from memory into f3
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f19, 0(x2) # load 0x00007bff from memory into f19
fsgnj.h f12, f3, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f12, 0(x2) # load 0x00000000 from memory into f12
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f23, 0(x2) # load 0x0000fbff from memory into f23
fsgnj.h f3, f12, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f17, 0(x2) # load 0x00000000 from memory into f17
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f3, 0(x2) # load 0x000003ff from memory into f3
fsgnj.h f20, f17, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f27, 0(x2) # load 0x00000000 from memory into f27
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f23, 0(x2) # load 0x000083ff from memory into f23
fsgnj.h f18, f27, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f2, 0(x2) # load 0x00000000 from memory into f2
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f25, 0(x2) # load 0x00000200 from memory into f25
fsgnj.h f29, f2, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f18, 0(x2) # load 0x00000000 from memory into f18
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f6, 0(x2) # load 0x00008200 from memory into f6
fsgnj.h f24, f18, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f18, 0(x2) # load 0x00000000 from memory into f18
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f21, 0(x2) # load 0x00000001 from memory into f21
fsgnj.h f9, f18, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f24, 0(x2) # load 0x00000000 from memory into f24
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f14, 0(x2) # load 0x00008001 from memory into f14
fsgnj.h f17, f24, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f13, 0(x2) # load 0x00000000 from memory into f13
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f29, 0(x2) # load 0x00007c00 from memory into f29
fsgnj.h f28, f13, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f30, 0(x2) # load 0x00000000 from memory into f30
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f12, 0(x2) # load 0x0000fc00 from memory into f12
fsgnj.h f14, f30, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f16, 0(x2) # load 0x00000000 from memory into f16
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f24, 0(x2) # load 0x00007e00 from memory into f24
fsgnj.h f29, f16, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f30, 0(x2) # load 0x00000000 from memory into f30
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f12, 0(x2) # load 0x00007fff from memory into f12
fsgnj.h f16, f30, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f28, 0(x2) # load 0x00000000 from memory into f28
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f11, 0(x2) # load 0x0000fe00 from memory into f11
fsgnj.h f6, f28, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f3, 0(x2) # load 0x00000000 from memory into f3
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f23, 0(x2) # load 0x00007c01 from memory into f23
fsgnj.h f30, f3, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f6, 0(x2) # load 0x00000000 from memory into f6
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f25, 0(x2) # load 0x00007dff from memory into f25
fsgnj.h f30, f6, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f10, 0(x2) # load 0x00000000 from memory into f10
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f22, 0(x2) # load 0x0000fc01 from memory into f22
fsgnj.h f28, f10, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f11, 0(x2) # load 0x00000000 from memory into f11
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f7, 0(x2) # load 0x000058b4 from memory into f7
fsgnj.h f31, f11, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x0 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f18, 0(x2) # load 0x00000000 from memory into f18
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f7, 0(x2) # load 0x0000c93a from memory into f7
fsgnj.h f2, f18, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f2, 0(x2) # load 0x00008000 from memory into f2
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f20, 0(x2) # load 0x00000000 from memory into f20
fsgnj.h f26, f2, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f9, 0(x2) # load 0x00008000 from memory into f9
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f26, 0(x2) # load 0x00008000 from memory into f26
fsgnj.h f27, f9, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f10, 0(x2) # load 0x00008000 from memory into f10
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f15, 0(x2) # load 0x00003c00 from memory into f15
fsgnj.h f3, f10, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f26, 0(x2) # load 0x00008000 from memory into f26
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f25, 0(x2) # load 0x0000bc00 from memory into f25
fsgnj.h f24, f26, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f18, 0(x2) # load 0x00008000 from memory into f18
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f10, 0(x2) # load 0x00003e00 from memory into f10
fsgnj.h f27, f18, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f28, 0(x2) # load 0x00008000 from memory into f28
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f19, 0(x2) # load 0x0000be00 from memory into f19
fsgnj.h f13, f28, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f9, 0(x2) # load 0x00008000 from memory into f9
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f3, 0(x2) # load 0x00004000 from memory into f3
fsgnj.h f6, f9, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f11, 0(x2) # load 0x00008000 from memory into f11
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f24, 0(x2) # load 0x0000c000 from memory into f24
fsgnj.h f31, f11, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f19, 0(x2) # load 0x00008000 from memory into f19
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f29, 0(x2) # load 0x00000400 from memory into f29
fsgnj.h f22, f19, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f28, 0(x2) # load 0x00008000 from memory into f28
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f27, 0(x2) # load 0x00008400 from memory into f27
fsgnj.h f6, f28, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f15, 0(x2) # load 0x00008000 from memory into f15
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f5, 0(x2) # load 0x00007bff from memory into f5
fsgnj.h f31, f15, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f28, 0(x2) # load 0x00008000 from memory into f28
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f24, 0(x2) # load 0x0000fbff from memory into f24
fsgnj.h f5, f28, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f23, 0(x2) # load 0x00008000 from memory into f23
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f26, 0(x2) # load 0x000003ff from memory into f26
fsgnj.h f27, f23, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f22, 0(x2) # load 0x00008000 from memory into f22
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
fsgnj.h f17, f22, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f8, 0(x2) # load 0x00008000 from memory into f8
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f7, 0(x2) # load 0x00000200 from memory into f7
fsgnj.h f6, f8, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f25, 0(x2) # load 0x00008000 from memory into f25
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f1, 0(x2) # load 0x00008200 from memory into f1
fsgnj.h f21, f25, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f9, 0(x2) # load 0x00008000 from memory into f9
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f14, 0(x2) # load 0x00000001 from memory into f14
fsgnj.h f16, f9, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f16, 0(x2) # load 0x00008000 from memory into f16
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f18, 0(x2) # load 0x00008001 from memory into f18
fsgnj.h f7, f16, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f13, 0(x2) # load 0x00008000 from memory into f13
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f1, 0(x2) # load 0x00007c00 from memory into f1
fsgnj.h f20, f13, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f29, 0(x2) # load 0x00008000 from memory into f29
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f27, 0(x2) # load 0x0000fc00 from memory into f27
fsgnj.h f24, f29, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f21, 0(x2) # load 0x00008000 from memory into f21
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f24, 0(x2) # load 0x00007e00 from memory into f24
fsgnj.h f14, f21, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f22, 0(x2) # load 0x00008000 from memory into f22
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f2, 0(x2) # load 0x00007fff from memory into f2
fsgnj.h f16, f22, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f22, 0(x2) # load 0x00008000 from memory into f22
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f26, 0(x2) # load 0x0000fe00 from memory into f26
fsgnj.h f31, f22, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f25, 0(x2) # load 0x00008000 from memory into f25
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f20, 0(x2) # load 0x00007c01 from memory into f20
fsgnj.h f18, f25, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f18, 0(x2) # load 0x00008000 from memory into f18
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f10, 0(x2) # load 0x00007dff from memory into f10
fsgnj.h f23, f18, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f12, 0(x2) # load 0x00008000 from memory into f12
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f19, 0(x2) # load 0x0000fc01 from memory into f19
fsgnj.h f2, f12, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f3, 0(x2) # load 0x00008000 from memory into f3
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f6, 0(x2) # load 0x000058b4 from memory into f6
fsgnj.h f22, f3, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8000 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f12, 0(x2) # load 0x00008000 from memory into f12
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f6, 0(x2) # load 0x0000c93a from memory into f6
fsgnj.h f5, f12, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f27, 0(x2) # load 0x00003c00 from memory into f27
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f12, 0(x2) # load 0x00000000 from memory into f12
fsgnj.h f29, f27, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f14, 0(x2) # load 0x00003c00 from memory into f14
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f2, 0(x2) # load 0x00008000 from memory into f2
fsgnj.h f29, f14, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f23, 0(x2) # load 0x00003c00 from memory into f23
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f30, 0(x2) # load 0x00003c00 from memory into f30
fsgnj.h f27, f23, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f3, 0(x2) # load 0x00003c00 from memory into f3
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f23, 0(x2) # load 0x0000bc00 from memory into f23
fsgnj.h f11, f3, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f22, 0(x2) # load 0x00003c00 from memory into f22
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f5, 0(x2) # load 0x00003e00 from memory into f5
fsgnj.h f8, f22, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f1, 0(x2) # load 0x00003c00 from memory into f1
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f2, 0(x2) # load 0x0000be00 from memory into f2
fsgnj.h f30, f1, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f21, 0(x2) # load 0x00003c00 from memory into f21
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f23, 0(x2) # load 0x00004000 from memory into f23
fsgnj.h f22, f21, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f5, 0(x2) # load 0x00003c00 from memory into f5
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f13, 0(x2) # load 0x0000c000 from memory into f13
fsgnj.h f23, f5, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f22, 0(x2) # load 0x00003c00 from memory into f22
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f12, 0(x2) # load 0x00000400 from memory into f12
fsgnj.h f23, f22, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f2, 0(x2) # load 0x00003c00 from memory into f2
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f14, 0(x2) # load 0x00008400 from memory into f14
fsgnj.h f29, f2, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f27, 0(x2) # load 0x00003c00 from memory into f27
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f22, 0(x2) # load 0x00007bff from memory into f22
fsgnj.h f16, f27, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f25, 0(x2) # load 0x00003c00 from memory into f25
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f27, 0(x2) # load 0x0000fbff from memory into f27
fsgnj.h f28, f25, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f21, 0(x2) # load 0x00003c00 from memory into f21
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f23, 0(x2) # load 0x000003ff from memory into f23
fsgnj.h f13, f21, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f10, 0(x2) # load 0x00003c00 from memory into f10
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f27, 0(x2) # load 0x000083ff from memory into f27
fsgnj.h f5, f10, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f17, 0(x2) # load 0x00003c00 from memory into f17
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f1, 0(x2) # load 0x00000200 from memory into f1
fsgnj.h f23, f17, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f9, 0(x2) # load 0x00003c00 from memory into f9
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f18, 0(x2) # load 0x00008200 from memory into f18
fsgnj.h f19, f9, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f1, 0(x2) # load 0x00003c00 from memory into f1
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f14, 0(x2) # load 0x00000001 from memory into f14
fsgnj.h f23, f1, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f1, 0(x2) # load 0x00003c00 from memory into f1
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f8, 0(x2) # load 0x00008001 from memory into f8
fsgnj.h f13, f1, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f29, 0(x2) # load 0x00003c00 from memory into f29
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f27, 0(x2) # load 0x00007c00 from memory into f27
fsgnj.h f7, f29, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f26, 0(x2) # load 0x00003c00 from memory into f26
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f5, 0(x2) # load 0x0000fc00 from memory into f5
fsgnj.h f28, f26, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f25, 0(x2) # load 0x00003c00 from memory into f25
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f18, 0(x2) # load 0x00007e00 from memory into f18
fsgnj.h f22, f25, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f30, 0(x2) # load 0x00003c00 from memory into f30
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f20, 0(x2) # load 0x00007fff from memory into f20
fsgnj.h f18, f30, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f16, 0(x2) # load 0x00003c00 from memory into f16
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f26, 0(x2) # load 0x0000fe00 from memory into f26
fsgnj.h f21, f16, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f30, 0(x2) # load 0x00003c00 from memory into f30
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f5, 0(x2) # load 0x00007c01 from memory into f5
fsgnj.h f1, f30, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f14, 0(x2) # load 0x00003c00 from memory into f14
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f24, 0(x2) # load 0x00007dff from memory into f24
fsgnj.h f29, f14, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f15, 0(x2) # load 0x00003c00 from memory into f15
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f8, 0(x2) # load 0x0000fc01 from memory into f8
fsgnj.h f19, f15, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f1, 0(x2) # load 0x00003c00 from memory into f1
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f27, 0(x2) # load 0x000058b4 from memory into f27
fsgnj.h f16, f1, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3c00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f5, 0(x2) # load 0x00003c00 from memory into f5
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f27, 0(x2) # load 0x0000c93a from memory into f27
fsgnj.h f20, f5, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f12, 0(x2) # load 0x0000bc00 from memory into f12
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f1, 0(x2) # load 0x00000000 from memory into f1
fsgnj.h f28, f12, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f15, 0(x2) # load 0x0000bc00 from memory into f15
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f10, 0(x2) # load 0x00008000 from memory into f10
fsgnj.h f16, f15, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f18, 0(x2) # load 0x0000bc00 from memory into f18
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f23, 0(x2) # load 0x00003c00 from memory into f23
fsgnj.h f11, f18, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f22, 0(x2) # load 0x0000bc00 from memory into f22
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f16, 0(x2) # load 0x0000bc00 from memory into f16
fsgnj.h f11, f22, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f1, 0(x2) # load 0x0000bc00 from memory into f1
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f27, 0(x2) # load 0x00003e00 from memory into f27
fsgnj.h f6, f1, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f21, 0(x2) # load 0x0000bc00 from memory into f21
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f26, 0(x2) # load 0x0000be00 from memory into f26
fsgnj.h f11, f21, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f16, 0(x2) # load 0x0000bc00 from memory into f16
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f29, 0(x2) # load 0x00004000 from memory into f29
fsgnj.h f19, f16, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f22, 0(x2) # load 0x0000bc00 from memory into f22
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f16, 0(x2) # load 0x0000c000 from memory into f16
fsgnj.h f7, f22, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f15, 0(x2) # load 0x0000bc00 from memory into f15
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f27, 0(x2) # load 0x00000400 from memory into f27
fsgnj.h f2, f15, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f24, 0(x2) # load 0x0000bc00 from memory into f24
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f31, 0(x2) # load 0x00008400 from memory into f31
fsgnj.h f15, f24, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f27, 0(x2) # load 0x0000bc00 from memory into f27
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f8, 0(x2) # load 0x00007bff from memory into f8
fsgnj.h f23, f27, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f7, 0(x2) # load 0x0000bc00 from memory into f7
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f17, 0(x2) # load 0x0000fbff from memory into f17
fsgnj.h f3, f7, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f8, 0(x2) # load 0x0000bc00 from memory into f8
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f26, 0(x2) # load 0x000003ff from memory into f26
fsgnj.h f30, f8, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f29, 0(x2) # load 0x0000bc00 from memory into f29
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f28, 0(x2) # load 0x000083ff from memory into f28
fsgnj.h f9, f29, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f15, 0(x2) # load 0x0000bc00 from memory into f15
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f28, 0(x2) # load 0x00000200 from memory into f28
fsgnj.h f10, f15, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f9, 0(x2) # load 0x0000bc00 from memory into f9
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f24, 0(x2) # load 0x00008200 from memory into f24
fsgnj.h f13, f9, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f11, 0(x2) # load 0x0000bc00 from memory into f11
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f19, 0(x2) # load 0x00000001 from memory into f19
fsgnj.h f3, f11, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f7, 0(x2) # load 0x0000bc00 from memory into f7
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f23, 0(x2) # load 0x00008001 from memory into f23
fsgnj.h f11, f7, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f27, 0(x2) # load 0x0000bc00 from memory into f27
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f15, 0(x2) # load 0x00007c00 from memory into f15
fsgnj.h f26, f27, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f24, 0(x2) # load 0x0000bc00 from memory into f24
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f1, 0(x2) # load 0x0000fc00 from memory into f1
fsgnj.h f19, f24, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f5, 0(x2) # load 0x0000bc00 from memory into f5
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f15, 0(x2) # load 0x00007e00 from memory into f15
fsgnj.h f28, f5, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f31, 0(x2) # load 0x0000bc00 from memory into f31
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f20, 0(x2) # load 0x00007fff from memory into f20
fsgnj.h f22, f31, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f21, 0(x2) # load 0x0000bc00 from memory into f21
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f6, 0(x2) # load 0x0000fe00 from memory into f6
fsgnj.h f15, f21, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f9, 0(x2) # load 0x0000bc00 from memory into f9
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f8, 0(x2) # load 0x00007c01 from memory into f8
fsgnj.h f29, f9, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f6, 0(x2) # load 0x0000bc00 from memory into f6
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f10, 0(x2) # load 0x00007dff from memory into f10
fsgnj.h f30, f6, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f15, 0(x2) # load 0x0000bc00 from memory into f15
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f28, 0(x2) # load 0x0000fc01 from memory into f28
fsgnj.h f25, f15, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f3, 0(x2) # load 0x0000bc00 from memory into f3
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f10, 0(x2) # load 0x000058b4 from memory into f10
fsgnj.h f29, f3, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbc00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f21, 0(x2) # load 0x0000bc00 from memory into f21
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f24, 0(x2) # load 0x0000c93a from memory into f24
fsgnj.h f2, f21, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f3, 0(x2) # load 0x00003e00 from memory into f3
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f7, 0(x2) # load 0x00000000 from memory into f7
fsgnj.h f21, f3, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f13, 0(x2) # load 0x00003e00 from memory into f13
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f8, 0(x2) # load 0x00008000 from memory into f8
fsgnj.h f23, f13, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f12, 0(x2) # load 0x00003e00 from memory into f12
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f28, 0(x2) # load 0x00003c00 from memory into f28
fsgnj.h f25, f12, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f25, 0(x2) # load 0x00003e00 from memory into f25
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f5, 0(x2) # load 0x0000bc00 from memory into f5
fsgnj.h f29, f25, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f17, 0(x2) # load 0x00003e00 from memory into f17
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f7, 0(x2) # load 0x00003e00 from memory into f7
fsgnj.h f10, f17, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f24, 0(x2) # load 0x00003e00 from memory into f24
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f11, 0(x2) # load 0x0000be00 from memory into f11
fsgnj.h f22, f24, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f13, 0(x2) # load 0x00003e00 from memory into f13
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f26, 0(x2) # load 0x00004000 from memory into f26
fsgnj.h f23, f13, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f23, 0(x2) # load 0x00003e00 from memory into f23
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f6, 0(x2) # load 0x0000c000 from memory into f6
fsgnj.h f29, f23, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f21, 0(x2) # load 0x00003e00 from memory into f21
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f2, 0(x2) # load 0x00000400 from memory into f2
fsgnj.h f8, f21, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f27, 0(x2) # load 0x00003e00 from memory into f27
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f7, 0(x2) # load 0x00008400 from memory into f7
fsgnj.h f1, f27, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f13, 0(x2) # load 0x00003e00 from memory into f13
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f23, 0(x2) # load 0x00007bff from memory into f23
fsgnj.h f14, f13, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f22, 0(x2) # load 0x00003e00 from memory into f22
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f21, 0(x2) # load 0x0000fbff from memory into f21
fsgnj.h f11, f22, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f16, 0(x2) # load 0x00003e00 from memory into f16
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f15, 0(x2) # load 0x000003ff from memory into f15
fsgnj.h f31, f16, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f30, 0(x2) # load 0x00003e00 from memory into f30
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f16, 0(x2) # load 0x000083ff from memory into f16
fsgnj.h f12, f30, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f15, 0(x2) # load 0x00003e00 from memory into f15
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f28, 0(x2) # load 0x00000200 from memory into f28
fsgnj.h f13, f15, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f30, 0(x2) # load 0x00003e00 from memory into f30
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f14, 0(x2) # load 0x00008200 from memory into f14
fsgnj.h f16, f30, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f15, 0(x2) # load 0x00003e00 from memory into f15
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f1, 0(x2) # load 0x00000001 from memory into f1
fsgnj.h f11, f15, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f19, 0(x2) # load 0x00003e00 from memory into f19
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f22, 0(x2) # load 0x00008001 from memory into f22
fsgnj.h f13, f19, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f19, 0(x2) # load 0x00003e00 from memory into f19
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f15, 0(x2) # load 0x00007c00 from memory into f15
fsgnj.h f2, f19, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f2, 0(x2) # load 0x00003e00 from memory into f2
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f31, 0(x2) # load 0x0000fc00 from memory into f31
fsgnj.h f30, f2, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f9, 0(x2) # load 0x00003e00 from memory into f9
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f11, 0(x2) # load 0x00007e00 from memory into f11
fsgnj.h f28, f9, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f25, 0(x2) # load 0x00003e00 from memory into f25
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f18, 0(x2) # load 0x00007fff from memory into f18
fsgnj.h f9, f25, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f26, 0(x2) # load 0x00003e00 from memory into f26
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f15, 0(x2) # load 0x0000fe00 from memory into f15
fsgnj.h f11, f26, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f3, 0(x2) # load 0x00003e00 from memory into f3
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f31, 0(x2) # load 0x00007c01 from memory into f31
fsgnj.h f17, f3, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f20, 0(x2) # load 0x00003e00 from memory into f20
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f13, 0(x2) # load 0x00007dff from memory into f13
fsgnj.h f5, f20, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f26, 0(x2) # load 0x00003e00 from memory into f26
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f2, 0(x2) # load 0x0000fc01 from memory into f2
fsgnj.h f10, f26, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f15, 0(x2) # load 0x00003e00 from memory into f15
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f6, 0(x2) # load 0x000058b4 from memory into f6
fsgnj.h f25, f15, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3e00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f20, 0(x2) # load 0x00003e00 from memory into f20
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f28, 0(x2) # load 0x0000c93a from memory into f28
fsgnj.h f26, f20, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f21, 0(x2) # load 0x0000be00 from memory into f21
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f7, 0(x2) # load 0x00000000 from memory into f7
fsgnj.h f19, f21, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f19, 0(x2) # load 0x0000be00 from memory into f19
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f7, 0(x2) # load 0x00008000 from memory into f7
fsgnj.h f11, f19, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f12, 0(x2) # load 0x0000be00 from memory into f12
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f6, 0(x2) # load 0x00003c00 from memory into f6
fsgnj.h f26, f12, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f17, 0(x2) # load 0x0000be00 from memory into f17
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f25, 0(x2) # load 0x0000bc00 from memory into f25
fsgnj.h f31, f17, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f29, 0(x2) # load 0x0000be00 from memory into f29
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f22, 0(x2) # load 0x00003e00 from memory into f22
fsgnj.h f13, f29, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f25, 0(x2) # load 0x0000be00 from memory into f25
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f28, 0(x2) # load 0x0000be00 from memory into f28
fsgnj.h f22, f25, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f22, 0(x2) # load 0x0000be00 from memory into f22
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f24, 0(x2) # load 0x00004000 from memory into f24
fsgnj.h f11, f22, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f1, 0(x2) # load 0x0000be00 from memory into f1
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f13, 0(x2) # load 0x0000c000 from memory into f13
fsgnj.h f8, f1, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f29, 0(x2) # load 0x0000be00 from memory into f29
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f26, 0(x2) # load 0x00000400 from memory into f26
fsgnj.h f19, f29, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f18, 0(x2) # load 0x0000be00 from memory into f18
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f28, 0(x2) # load 0x00008400 from memory into f28
fsgnj.h f2, f18, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f13, 0(x2) # load 0x0000be00 from memory into f13
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f5, 0(x2) # load 0x00007bff from memory into f5
fsgnj.h f23, f13, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f13, 0(x2) # load 0x0000be00 from memory into f13
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f22, 0(x2) # load 0x0000fbff from memory into f22
fsgnj.h f28, f13, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f8, 0(x2) # load 0x0000be00 from memory into f8
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f19, 0(x2) # load 0x000003ff from memory into f19
fsgnj.h f30, f8, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f25, 0(x2) # load 0x0000be00 from memory into f25
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f5, 0(x2) # load 0x000083ff from memory into f5
fsgnj.h f12, f25, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f13, 0(x2) # load 0x0000be00 from memory into f13
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f7, 0(x2) # load 0x00000200 from memory into f7
fsgnj.h f6, f13, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f9, 0(x2) # load 0x0000be00 from memory into f9
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f27, 0(x2) # load 0x00008200 from memory into f27
fsgnj.h f6, f9, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f7, 0(x2) # load 0x0000be00 from memory into f7
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f21, 0(x2) # load 0x00000001 from memory into f21
fsgnj.h f22, f7, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f16, 0(x2) # load 0x0000be00 from memory into f16
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f21, 0(x2) # load 0x00008001 from memory into f21
fsgnj.h f26, f16, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f29, 0(x2) # load 0x0000be00 from memory into f29
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f25, 0(x2) # load 0x00007c00 from memory into f25
fsgnj.h f17, f29, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f26, 0(x2) # load 0x0000be00 from memory into f26
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f25, 0(x2) # load 0x0000fc00 from memory into f25
fsgnj.h f17, f26, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f31, 0(x2) # load 0x0000be00 from memory into f31
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f30, 0(x2) # load 0x00007e00 from memory into f30
fsgnj.h f7, f31, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f3, 0(x2) # load 0x0000be00 from memory into f3
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f2, 0(x2) # load 0x00007fff from memory into f2
fsgnj.h f16, f3, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f1, 0(x2) # load 0x0000be00 from memory into f1
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f28, 0(x2) # load 0x0000fe00 from memory into f28
fsgnj.h f2, f1, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f21, 0(x2) # load 0x0000be00 from memory into f21
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f10, 0(x2) # load 0x00007c01 from memory into f10
fsgnj.h f24, f21, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f22, 0(x2) # load 0x0000be00 from memory into f22
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f1, 0(x2) # load 0x00007dff from memory into f1
fsgnj.h f10, f22, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f14, 0(x2) # load 0x0000be00 from memory into f14
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f11, 0(x2) # load 0x0000fc01 from memory into f11
fsgnj.h f5, f14, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f13, 0(x2) # load 0x0000be00 from memory into f13
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f31, 0(x2) # load 0x000058b4 from memory into f31
fsgnj.h f16, f13, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xbe00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f27, 0(x2) # load 0x0000be00 from memory into f27
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f15, 0(x2) # load 0x0000c93a from memory into f15
fsgnj.h f9, f27, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f20, 0(x2) # load 0x00004000 from memory into f20
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f7, 0(x2) # load 0x00000000 from memory into f7
fsgnj.h f22, f20, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f8, 0(x2) # load 0x00004000 from memory into f8
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f13, 0(x2) # load 0x00008000 from memory into f13
fsgnj.h f12, f8, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f12, 0(x2) # load 0x00004000 from memory into f12
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f23, 0(x2) # load 0x00003c00 from memory into f23
fsgnj.h f20, f12, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f26, 0(x2) # load 0x00004000 from memory into f26
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f3, 0(x2) # load 0x0000bc00 from memory into f3
fsgnj.h f27, f26, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f18, 0(x2) # load 0x00004000 from memory into f18
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f19, 0(x2) # load 0x00003e00 from memory into f19
fsgnj.h f2, f18, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f26, 0(x2) # load 0x00004000 from memory into f26
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f19, 0(x2) # load 0x0000be00 from memory into f19
fsgnj.h f24, f26, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f19, 0(x2) # load 0x00004000 from memory into f19
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f8, 0(x2) # load 0x00004000 from memory into f8
fsgnj.h f28, f19, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f17, 0(x2) # load 0x00004000 from memory into f17
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f14, 0(x2) # load 0x0000c000 from memory into f14
fsgnj.h f8, f17, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f15, 0(x2) # load 0x00000400 from memory into f15
fsgnj.h f23, f21, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f26, 0(x2) # load 0x00004000 from memory into f26
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f27, 0(x2) # load 0x00008400 from memory into f27
fsgnj.h f24, f26, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f16, 0(x2) # load 0x00004000 from memory into f16
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f2, 0(x2) # load 0x00007bff from memory into f2
fsgnj.h f18, f16, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f12, 0(x2) # load 0x00004000 from memory into f12
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f23, 0(x2) # load 0x0000fbff from memory into f23
fsgnj.h f26, f12, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f8, 0(x2) # load 0x00004000 from memory into f8
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f28, 0(x2) # load 0x000003ff from memory into f28
fsgnj.h f2, f8, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f1, 0(x2) # load 0x00004000 from memory into f1
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f17, 0(x2) # load 0x000083ff from memory into f17
fsgnj.h f23, f1, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f25, 0(x2) # load 0x00004000 from memory into f25
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f23, 0(x2) # load 0x00000200 from memory into f23
fsgnj.h f17, f25, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f7, 0(x2) # load 0x00004000 from memory into f7
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f31, 0(x2) # load 0x00008200 from memory into f31
fsgnj.h f28, f7, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f26, 0(x2) # load 0x00004000 from memory into f26
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f3, 0(x2) # load 0x00000001 from memory into f3
fsgnj.h f22, f26, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f6, 0(x2) # load 0x00004000 from memory into f6
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f29, 0(x2) # load 0x00008001 from memory into f29
fsgnj.h f26, f6, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f10, 0(x2) # load 0x00004000 from memory into f10
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f20, 0(x2) # load 0x00007c00 from memory into f20
fsgnj.h f23, f10, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f18, 0(x2) # load 0x00004000 from memory into f18
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f31, 0(x2) # load 0x0000fc00 from memory into f31
fsgnj.h f15, f18, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f5, 0(x2) # load 0x00004000 from memory into f5
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f14, 0(x2) # load 0x00007e00 from memory into f14
fsgnj.h f19, f5, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f28, 0(x2) # load 0x00004000 from memory into f28
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f12, 0(x2) # load 0x00007fff from memory into f12
fsgnj.h f11, f28, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f8, 0(x2) # load 0x00004000 from memory into f8
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f12, 0(x2) # load 0x0000fe00 from memory into f12
fsgnj.h f5, f8, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f11, 0(x2) # load 0x00004000 from memory into f11
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f8, 0(x2) # load 0x00007c01 from memory into f8
fsgnj.h f13, f11, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f25, 0(x2) # load 0x00004000 from memory into f25
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f15, 0(x2) # load 0x00007dff from memory into f15
fsgnj.h f14, f25, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f27, 0(x2) # load 0x00004000 from memory into f27
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
fsgnj.h f21, f27, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f13, 0(x2) # load 0x00004000 from memory into f13
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f27, 0(x2) # load 0x000058b4 from memory into f27
fsgnj.h f18, f13, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x4000 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f12, 0(x2) # load 0x00004000 from memory into f12
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f27, 0(x2) # load 0x0000c93a from memory into f27
fsgnj.h f23, f12, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f22, 0(x2) # load 0x0000c000 from memory into f22
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f17, 0(x2) # load 0x00000000 from memory into f17
fsgnj.h f19, f22, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f22, 0(x2) # load 0x0000c000 from memory into f22
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f26, 0(x2) # load 0x00008000 from memory into f26
fsgnj.h f13, f22, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f6, 0(x2) # load 0x0000c000 from memory into f6
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f12, 0(x2) # load 0x00003c00 from memory into f12
fsgnj.h f24, f6, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f6, 0(x2) # load 0x0000c000 from memory into f6
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f3, 0(x2) # load 0x0000bc00 from memory into f3
fsgnj.h f18, f6, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f10, 0(x2) # load 0x0000c000 from memory into f10
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f31, 0(x2) # load 0x00003e00 from memory into f31
fsgnj.h f6, f10, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f15, 0(x2) # load 0x0000c000 from memory into f15
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f9, 0(x2) # load 0x0000be00 from memory into f9
fsgnj.h f3, f15, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f22, 0(x2) # load 0x0000c000 from memory into f22
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f15, 0(x2) # load 0x00004000 from memory into f15
fsgnj.h f8, f22, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f31, 0(x2) # load 0x0000c000 from memory into f31
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f9, 0(x2) # load 0x0000c000 from memory into f9
fsgnj.h f17, f31, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f27, 0(x2) # load 0x0000c000 from memory into f27
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f10, 0(x2) # load 0x00000400 from memory into f10
fsgnj.h f22, f27, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f26, 0(x2) # load 0x0000c000 from memory into f26
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f23, 0(x2) # load 0x00008400 from memory into f23
fsgnj.h f8, f26, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f15, 0(x2) # load 0x0000c000 from memory into f15
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f27, 0(x2) # load 0x00007bff from memory into f27
fsgnj.h f16, f15, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f29, 0(x2) # load 0x0000c000 from memory into f29
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f21, 0(x2) # load 0x0000fbff from memory into f21
fsgnj.h f13, f29, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f19, 0(x2) # load 0x0000c000 from memory into f19
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f31, 0(x2) # load 0x000003ff from memory into f31
fsgnj.h f18, f19, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f28, 0(x2) # load 0x0000c000 from memory into f28
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f17, 0(x2) # load 0x000083ff from memory into f17
fsgnj.h f7, f28, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f2, 0(x2) # load 0x0000c000 from memory into f2
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f23, 0(x2) # load 0x00000200 from memory into f23
fsgnj.h f31, f2, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f27, 0(x2) # load 0x0000c000 from memory into f27
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f7, 0(x2) # load 0x00008200 from memory into f7
fsgnj.h f22, f27, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f20, 0(x2) # load 0x0000c000 from memory into f20
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f26, 0(x2) # load 0x00000001 from memory into f26
fsgnj.h f16, f20, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f31, 0(x2) # load 0x0000c000 from memory into f31
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f13, 0(x2) # load 0x00008001 from memory into f13
fsgnj.h f22, f31, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f15, 0(x2) # load 0x0000c000 from memory into f15
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f27, 0(x2) # load 0x00007c00 from memory into f27
fsgnj.h f26, f15, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f12, 0(x2) # load 0x0000c000 from memory into f12
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f25, 0(x2) # load 0x0000fc00 from memory into f25
fsgnj.h f17, f12, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f19, 0(x2) # load 0x0000c000 from memory into f19
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f11, 0(x2) # load 0x00007e00 from memory into f11
fsgnj.h f27, f19, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f21, 0(x2) # load 0x0000c000 from memory into f21
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f26, 0(x2) # load 0x00007fff from memory into f26
fsgnj.h f13, f21, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f28, 0(x2) # load 0x0000c000 from memory into f28
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f17, 0(x2) # load 0x0000fe00 from memory into f17
fsgnj.h f14, f28, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f5, 0(x2) # load 0x0000c000 from memory into f5
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f31, 0(x2) # load 0x00007c01 from memory into f31
fsgnj.h f27, f5, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f26, 0(x2) # load 0x0000c000 from memory into f26
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f8, 0(x2) # load 0x00007dff from memory into f8
fsgnj.h f22, f26, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f2, 0(x2) # load 0x0000c000 from memory into f2
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
fsgnj.h f24, f2, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f12, 0(x2) # load 0x0000c000 from memory into f12
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f27, 0(x2) # load 0x000058b4 from memory into f27
fsgnj.h f17, f12, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc000 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f16, 0(x2) # load 0x0000c000 from memory into f16
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f7, 0(x2) # load 0x0000c93a from memory into f7
fsgnj.h f13, f16, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f5, 0(x2) # load 0x00000400 from memory into f5
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f30, 0(x2) # load 0x00000000 from memory into f30
fsgnj.h f31, f5, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f25, 0(x2) # load 0x00000400 from memory into f25
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f19, 0(x2) # load 0x00008000 from memory into f19
fsgnj.h f11, f25, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f21, 0(x2) # load 0x00000400 from memory into f21
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f23, 0(x2) # load 0x00003c00 from memory into f23
fsgnj.h f26, f21, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f2, 0(x2) # load 0x00000400 from memory into f2
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f1, 0(x2) # load 0x0000bc00 from memory into f1
fsgnj.h f21, f2, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f27, 0(x2) # load 0x00000400 from memory into f27
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f29, 0(x2) # load 0x00003e00 from memory into f29
fsgnj.h f22, f27, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f15, 0(x2) # load 0x00000400 from memory into f15
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f12, 0(x2) # load 0x0000be00 from memory into f12
fsgnj.h f7, f15, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f19, 0(x2) # load 0x00000400 from memory into f19
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f14, 0(x2) # load 0x00004000 from memory into f14
fsgnj.h f23, f19, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f22, 0(x2) # load 0x00000400 from memory into f22
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f26, 0(x2) # load 0x0000c000 from memory into f26
fsgnj.h f20, f22, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f6, 0(x2) # load 0x00000400 from memory into f6
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f30, 0(x2) # load 0x00000400 from memory into f30
fsgnj.h f29, f6, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f20, 0(x2) # load 0x00000400 from memory into f20
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f17, 0(x2) # load 0x00008400 from memory into f17
fsgnj.h f29, f20, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f9, 0(x2) # load 0x00000400 from memory into f9
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f22, 0(x2) # load 0x00007bff from memory into f22
fsgnj.h f13, f9, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f27, 0(x2) # load 0x00000400 from memory into f27
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f13, 0(x2) # load 0x0000fbff from memory into f13
fsgnj.h f12, f27, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f25, 0(x2) # load 0x00000400 from memory into f25
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f8, 0(x2) # load 0x000003ff from memory into f8
fsgnj.h f29, f25, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f6, 0(x2) # load 0x00000400 from memory into f6
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f8, 0(x2) # load 0x000083ff from memory into f8
fsgnj.h f30, f6, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f30, 0(x2) # load 0x00000400 from memory into f30
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f20, 0(x2) # load 0x00000200 from memory into f20
fsgnj.h f8, f30, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f8, 0(x2) # load 0x00000400 from memory into f8
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f17, 0(x2) # load 0x00008200 from memory into f17
fsgnj.h f31, f8, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f7, 0(x2) # load 0x00000400 from memory into f7
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f17, 0(x2) # load 0x00000001 from memory into f17
fsgnj.h f24, f7, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f15, 0(x2) # load 0x00000400 from memory into f15
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f9, 0(x2) # load 0x00008001 from memory into f9
fsgnj.h f2, f15, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f22, 0(x2) # load 0x00000400 from memory into f22
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f27, 0(x2) # load 0x00007c00 from memory into f27
fsgnj.h f29, f22, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f12, 0(x2) # load 0x00000400 from memory into f12
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f10, 0(x2) # load 0x0000fc00 from memory into f10
fsgnj.h f23, f12, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f13, 0(x2) # load 0x00000400 from memory into f13
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f21, 0(x2) # load 0x00007e00 from memory into f21
fsgnj.h f31, f13, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f19, 0(x2) # load 0x00000400 from memory into f19
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f6, 0(x2) # load 0x00007fff from memory into f6
fsgnj.h f12, f19, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f8, 0(x2) # load 0x00000400 from memory into f8
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f29, 0(x2) # load 0x0000fe00 from memory into f29
fsgnj.h f2, f8, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f27, 0(x2) # load 0x00000400 from memory into f27
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f8, 0(x2) # load 0x00007c01 from memory into f8
fsgnj.h f22, f27, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f19, 0(x2) # load 0x00000400 from memory into f19
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f2, 0(x2) # load 0x00007dff from memory into f2
fsgnj.h f10, f19, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f13, 0(x2) # load 0x00000400 from memory into f13
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f15, 0(x2) # load 0x0000fc01 from memory into f15
fsgnj.h f11, f13, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f17, 0(x2) # load 0x00000400 from memory into f17
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f14, 0(x2) # load 0x000058b4 from memory into f14
fsgnj.h f25, f17, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x400 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f28, 0(x2) # load 0x00000400 from memory into f28
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f24, 0(x2) # load 0x0000c93a from memory into f24
fsgnj.h f23, f28, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f20, 0(x2) # load 0x00008400 from memory into f20
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f14, 0(x2) # load 0x00000000 from memory into f14
fsgnj.h f13, f20, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f5, 0(x2) # load 0x00008400 from memory into f5
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f7, 0(x2) # load 0x00008000 from memory into f7
fsgnj.h f1, f5, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f31, 0(x2) # load 0x00008400 from memory into f31
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f23, 0(x2) # load 0x00003c00 from memory into f23
fsgnj.h f22, f31, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f24, 0(x2) # load 0x00008400 from memory into f24
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f20, 0(x2) # load 0x0000bc00 from memory into f20
fsgnj.h f13, f24, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f19, 0(x2) # load 0x00008400 from memory into f19
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f22, 0(x2) # load 0x00003e00 from memory into f22
fsgnj.h f6, f19, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f5, 0(x2) # load 0x00008400 from memory into f5
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f23, 0(x2) # load 0x0000be00 from memory into f23
fsgnj.h f16, f5, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f25, 0(x2) # load 0x00004000 from memory into f25
fsgnj.h f7, f18, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f12, 0(x2) # load 0x00008400 from memory into f12
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f29, 0(x2) # load 0x0000c000 from memory into f29
fsgnj.h f6, f12, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f9, 0(x2) # load 0x00000400 from memory into f9
fsgnj.h f24, f18, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f8, 0(x2) # load 0x00008400 from memory into f8
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
fsgnj.h f1, f8, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f17, 0(x2) # load 0x00008400 from memory into f17
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f7, 0(x2) # load 0x00007bff from memory into f7
fsgnj.h f3, f17, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f22, 0(x2) # load 0x00008400 from memory into f22
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f2, 0(x2) # load 0x0000fbff from memory into f2
fsgnj.h f29, f22, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f23, 0(x2) # load 0x00008400 from memory into f23
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f22, 0(x2) # load 0x000003ff from memory into f22
fsgnj.h f30, f23, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f31, 0(x2) # load 0x00008400 from memory into f31
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f19, 0(x2) # load 0x000083ff from memory into f19
fsgnj.h f20, f31, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f2, 0(x2) # load 0x00008400 from memory into f2
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f1, 0(x2) # load 0x00000200 from memory into f1
fsgnj.h f15, f2, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f21, 0(x2) # load 0x00008400 from memory into f21
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f29, 0(x2) # load 0x00008200 from memory into f29
fsgnj.h f11, f21, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f17, 0(x2) # load 0x00008400 from memory into f17
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f11, 0(x2) # load 0x00000001 from memory into f11
fsgnj.h f3, f17, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f12, 0(x2) # load 0x00008400 from memory into f12
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f20, 0(x2) # load 0x00008001 from memory into f20
fsgnj.h f15, f12, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f1, 0(x2) # load 0x00008400 from memory into f1
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f17, 0(x2) # load 0x00007c00 from memory into f17
fsgnj.h f3, f1, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f13, 0(x2) # load 0x00008400 from memory into f13
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f10, 0(x2) # load 0x0000fc00 from memory into f10
fsgnj.h f16, f13, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f20, 0(x2) # load 0x00008400 from memory into f20
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f25, 0(x2) # load 0x00007e00 from memory into f25
fsgnj.h f18, f20, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f12, 0(x2) # load 0x00008400 from memory into f12
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f24, 0(x2) # load 0x00007fff from memory into f24
fsgnj.h f18, f12, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f25, 0(x2) # load 0x00008400 from memory into f25
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f15, 0(x2) # load 0x0000fe00 from memory into f15
fsgnj.h f24, f25, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f9, 0(x2) # load 0x00008400 from memory into f9
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f10, 0(x2) # load 0x00007c01 from memory into f10
fsgnj.h f20, f9, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f20, 0(x2) # load 0x00008400 from memory into f20
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f30, 0(x2) # load 0x00007dff from memory into f30
fsgnj.h f8, f20, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f31, 0(x2) # load 0x0000fc01 from memory into f31
fsgnj.h f28, f18, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f20, 0(x2) # load 0x00008400 from memory into f20
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f6, 0(x2) # load 0x000058b4 from memory into f6
fsgnj.h f7, f20, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8400 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f31, 0(x2) # load 0x00008400 from memory into f31
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f20, 0(x2) # load 0x0000c93a from memory into f20
fsgnj.h f17, f31, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f29, 0(x2) # load 0x00007bff from memory into f29
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f3, 0(x2) # load 0x00000000 from memory into f3
fsgnj.h f21, f29, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f15, 0(x2) # load 0x00007bff from memory into f15
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f28, 0(x2) # load 0x00008000 from memory into f28
fsgnj.h f24, f15, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f26, 0(x2) # load 0x00007bff from memory into f26
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f21, 0(x2) # load 0x00003c00 from memory into f21
fsgnj.h f29, f26, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f25, 0(x2) # load 0x00007bff from memory into f25
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f6, 0(x2) # load 0x0000bc00 from memory into f6
fsgnj.h f8, f25, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f25, 0(x2) # load 0x00007bff from memory into f25
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f31, 0(x2) # load 0x00003e00 from memory into f31
fsgnj.h f8, f25, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f28, 0(x2) # load 0x00007bff from memory into f28
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f14, 0(x2) # load 0x0000be00 from memory into f14
fsgnj.h f20, f28, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f27, 0(x2) # load 0x00007bff from memory into f27
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f31, 0(x2) # load 0x00004000 from memory into f31
fsgnj.h f7, f27, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f8, 0(x2) # load 0x00007bff from memory into f8
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f22, 0(x2) # load 0x0000c000 from memory into f22
fsgnj.h f5, f8, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f2, 0(x2) # load 0x00007bff from memory into f2
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f27, 0(x2) # load 0x00000400 from memory into f27
fsgnj.h f20, f2, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f21, 0(x2) # load 0x00007bff from memory into f21
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f7, 0(x2) # load 0x00008400 from memory into f7
fsgnj.h f31, f21, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f1, 0(x2) # load 0x00007bff from memory into f1
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f27, 0(x2) # load 0x00007bff from memory into f27
fsgnj.h f24, f1, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f6, 0(x2) # load 0x00007bff from memory into f6
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f14, 0(x2) # load 0x0000fbff from memory into f14
fsgnj.h f24, f6, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f27, 0(x2) # load 0x00007bff from memory into f27
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f8, 0(x2) # load 0x000003ff from memory into f8
fsgnj.h f17, f27, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f19, 0(x2) # load 0x00007bff from memory into f19
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f25, 0(x2) # load 0x000083ff from memory into f25
fsgnj.h f3, f19, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f18, 0(x2) # load 0x00007bff from memory into f18
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f5, 0(x2) # load 0x00000200 from memory into f5
fsgnj.h f7, f18, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f26, 0(x2) # load 0x00007bff from memory into f26
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f24, 0(x2) # load 0x00008200 from memory into f24
fsgnj.h f5, f26, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f1, 0(x2) # load 0x00007bff from memory into f1
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f29, 0(x2) # load 0x00000001 from memory into f29
fsgnj.h f6, f1, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f14, 0(x2) # load 0x00007bff from memory into f14
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f20, 0(x2) # load 0x00008001 from memory into f20
fsgnj.h f30, f14, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f3, 0(x2) # load 0x00007bff from memory into f3
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f25, 0(x2) # load 0x00007c00 from memory into f25
fsgnj.h f11, f3, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f13, 0(x2) # load 0x00007bff from memory into f13
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f7, 0(x2) # load 0x0000fc00 from memory into f7
fsgnj.h f29, f13, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f16, 0(x2) # load 0x00007bff from memory into f16
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f26, 0(x2) # load 0x00007e00 from memory into f26
fsgnj.h f20, f16, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f1, 0(x2) # load 0x00007bff from memory into f1
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f10, 0(x2) # load 0x00007fff from memory into f10
fsgnj.h f19, f1, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f27, 0(x2) # load 0x00007bff from memory into f27
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f13, 0(x2) # load 0x0000fe00 from memory into f13
fsgnj.h f28, f27, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f31, 0(x2) # load 0x00007bff from memory into f31
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f29, 0(x2) # load 0x00007c01 from memory into f29
fsgnj.h f25, f31, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f5, 0(x2) # load 0x00007bff from memory into f5
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f3, 0(x2) # load 0x00007dff from memory into f3
fsgnj.h f26, f5, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f15, 0(x2) # load 0x00007bff from memory into f15
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
fsgnj.h f3, f15, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f27, 0(x2) # load 0x00007bff from memory into f27
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f19, 0(x2) # load 0x000058b4 from memory into f19
fsgnj.h f29, f27, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7bff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f3, 0(x2) # load 0x00007bff from memory into f3
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f20, 0(x2) # load 0x0000c93a from memory into f20
fsgnj.h f6, f3, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f12, 0(x2) # load 0x0000fbff from memory into f12
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f2, 0(x2) # load 0x00000000 from memory into f2
fsgnj.h f29, f12, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f8, 0(x2) # load 0x0000fbff from memory into f8
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f21, 0(x2) # load 0x00008000 from memory into f21
fsgnj.h f15, f8, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f18, 0(x2) # load 0x0000fbff from memory into f18
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f30, 0(x2) # load 0x00003c00 from memory into f30
fsgnj.h f25, f18, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f25, 0(x2) # load 0x0000fbff from memory into f25
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f20, 0(x2) # load 0x0000bc00 from memory into f20
fsgnj.h f26, f25, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f17, 0(x2) # load 0x0000fbff from memory into f17
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f25, 0(x2) # load 0x00003e00 from memory into f25
fsgnj.h f9, f17, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f19, 0(x2) # load 0x0000fbff from memory into f19
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f28, 0(x2) # load 0x0000be00 from memory into f28
fsgnj.h f22, f19, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f14, 0(x2) # load 0x0000fbff from memory into f14
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f28, 0(x2) # load 0x00004000 from memory into f28
fsgnj.h f19, f14, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f25, 0(x2) # load 0x0000fbff from memory into f25
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f9, 0(x2) # load 0x0000c000 from memory into f9
fsgnj.h f1, f25, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f16, 0(x2) # load 0x0000fbff from memory into f16
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f25, 0(x2) # load 0x00000400 from memory into f25
fsgnj.h f9, f16, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f3, 0(x2) # load 0x0000fbff from memory into f3
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f15, 0(x2) # load 0x00008400 from memory into f15
fsgnj.h f29, f3, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f13, 0(x2) # load 0x0000fbff from memory into f13
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f29, 0(x2) # load 0x00007bff from memory into f29
fsgnj.h f27, f13, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f18, 0(x2) # load 0x0000fbff from memory into f18
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f3, 0(x2) # load 0x0000fbff from memory into f3
fsgnj.h f29, f18, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f6, 0(x2) # load 0x0000fbff from memory into f6
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f19, 0(x2) # load 0x000003ff from memory into f19
fsgnj.h f22, f6, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f16, 0(x2) # load 0x0000fbff from memory into f16
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f3, 0(x2) # load 0x000083ff from memory into f3
fsgnj.h f8, f16, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f25, 0(x2) # load 0x0000fbff from memory into f25
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f20, 0(x2) # load 0x00000200 from memory into f20
fsgnj.h f23, f25, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f9, 0(x2) # load 0x0000fbff from memory into f9
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f12, 0(x2) # load 0x00008200 from memory into f12
fsgnj.h f30, f9, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f3, 0(x2) # load 0x0000fbff from memory into f3
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f16, 0(x2) # load 0x00000001 from memory into f16
fsgnj.h f5, f3, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f8, 0(x2) # load 0x0000fbff from memory into f8
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f27, 0(x2) # load 0x00008001 from memory into f27
fsgnj.h f1, f8, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f12, 0(x2) # load 0x0000fbff from memory into f12
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f3, 0(x2) # load 0x00007c00 from memory into f3
fsgnj.h f20, f12, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f1, 0(x2) # load 0x0000fbff from memory into f1
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f23, 0(x2) # load 0x0000fc00 from memory into f23
fsgnj.h f28, f1, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f26, 0(x2) # load 0x0000fbff from memory into f26
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f6, 0(x2) # load 0x00007e00 from memory into f6
fsgnj.h f22, f26, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f19, 0(x2) # load 0x0000fbff from memory into f19
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f23, 0(x2) # load 0x00007fff from memory into f23
fsgnj.h f17, f19, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f30, 0(x2) # load 0x0000fbff from memory into f30
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f3, 0(x2) # load 0x0000fe00 from memory into f3
fsgnj.h f2, f30, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f26, 0(x2) # load 0x0000fbff from memory into f26
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f5, 0(x2) # load 0x00007c01 from memory into f5
fsgnj.h f17, f26, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f19, 0(x2) # load 0x0000fbff from memory into f19
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f9, 0(x2) # load 0x00007dff from memory into f9
fsgnj.h f5, f19, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f11, 0(x2) # load 0x0000fbff from memory into f11
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f26, 0(x2) # load 0x0000fc01 from memory into f26
fsgnj.h f25, f11, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f20, 0(x2) # load 0x0000fbff from memory into f20
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f22, 0(x2) # load 0x000058b4 from memory into f22
fsgnj.h f24, f20, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfbff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f3, 0(x2) # load 0x0000fbff from memory into f3
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f11, 0(x2) # load 0x0000c93a from memory into f11
fsgnj.h f18, f3, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f18, 0(x2) # load 0x000003ff from memory into f18
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f30, 0(x2) # load 0x00000000 from memory into f30
fsgnj.h f23, f18, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f27, 0(x2) # load 0x000003ff from memory into f27
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f23, 0(x2) # load 0x00008000 from memory into f23
fsgnj.h f7, f27, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f7, 0(x2) # load 0x000003ff from memory into f7
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f16, 0(x2) # load 0x00003c00 from memory into f16
fsgnj.h f30, f7, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f5, 0(x2) # load 0x000003ff from memory into f5
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f21, 0(x2) # load 0x0000bc00 from memory into f21
fsgnj.h f10, f5, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f5, 0(x2) # load 0x000003ff from memory into f5
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f2, 0(x2) # load 0x00003e00 from memory into f2
fsgnj.h f22, f5, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f12, 0(x2) # load 0x000003ff from memory into f12
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f30, 0(x2) # load 0x0000be00 from memory into f30
fsgnj.h f25, f12, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f3, 0(x2) # load 0x000003ff from memory into f3
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
fsgnj.h f30, f3, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f27, 0(x2) # load 0x000003ff from memory into f27
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f23, 0(x2) # load 0x0000c000 from memory into f23
fsgnj.h f24, f27, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f5, 0(x2) # load 0x000003ff from memory into f5
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f17, 0(x2) # load 0x00000400 from memory into f17
fsgnj.h f12, f5, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f30, 0(x2) # load 0x000003ff from memory into f30
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f29, 0(x2) # load 0x00008400 from memory into f29
fsgnj.h f10, f30, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f20, 0(x2) # load 0x000003ff from memory into f20
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f12, 0(x2) # load 0x00007bff from memory into f12
fsgnj.h f6, f20, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f17, 0(x2) # load 0x000003ff from memory into f17
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f8, 0(x2) # load 0x0000fbff from memory into f8
fsgnj.h f12, f17, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f9, 0(x2) # load 0x000003ff from memory into f9
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f2, 0(x2) # load 0x000003ff from memory into f2
fsgnj.h f21, f9, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f14, 0(x2) # load 0x000003ff from memory into f14
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f15, 0(x2) # load 0x000083ff from memory into f15
fsgnj.h f17, f14, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f19, 0(x2) # load 0x000003ff from memory into f19
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f28, 0(x2) # load 0x00000200 from memory into f28
fsgnj.h f3, f19, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f6, 0(x2) # load 0x000003ff from memory into f6
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f9, 0(x2) # load 0x00008200 from memory into f9
fsgnj.h f19, f6, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f14, 0(x2) # load 0x000003ff from memory into f14
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f20, 0(x2) # load 0x00000001 from memory into f20
fsgnj.h f25, f14, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f23, 0(x2) # load 0x000003ff from memory into f23
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f25, 0(x2) # load 0x00008001 from memory into f25
fsgnj.h f3, f23, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f13, 0(x2) # load 0x000003ff from memory into f13
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f29, 0(x2) # load 0x00007c00 from memory into f29
fsgnj.h f17, f13, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f6, 0(x2) # load 0x000003ff from memory into f6
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f8, 0(x2) # load 0x0000fc00 from memory into f8
fsgnj.h f7, f6, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f15, 0(x2) # load 0x000003ff from memory into f15
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f8, 0(x2) # load 0x00007e00 from memory into f8
fsgnj.h f22, f15, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f1, 0(x2) # load 0x000003ff from memory into f1
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f6, 0(x2) # load 0x00007fff from memory into f6
fsgnj.h f30, f1, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f31, 0(x2) # load 0x000003ff from memory into f31
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f20, 0(x2) # load 0x0000fe00 from memory into f20
fsgnj.h f26, f31, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f8, 0(x2) # load 0x000003ff from memory into f8
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f18, 0(x2) # load 0x00007c01 from memory into f18
fsgnj.h f24, f8, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f12, 0(x2) # load 0x000003ff from memory into f12
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f13, 0(x2) # load 0x00007dff from memory into f13
fsgnj.h f15, f12, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f9, 0(x2) # load 0x000003ff from memory into f9
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f28, 0(x2) # load 0x0000fc01 from memory into f28
fsgnj.h f27, f9, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f2, 0(x2) # load 0x000003ff from memory into f2
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f14, 0(x2) # load 0x000058b4 from memory into f14
fsgnj.h f1, f2, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x3ff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f21, 0(x2) # load 0x000003ff from memory into f21
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f11, 0(x2) # load 0x0000c93a from memory into f11
fsgnj.h f23, f21, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f16, 0(x2) # load 0x000083ff from memory into f16
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f29, 0(x2) # load 0x00000000 from memory into f29
fsgnj.h f18, f16, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f7, 0(x2) # load 0x000083ff from memory into f7
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f10, 0(x2) # load 0x00008000 from memory into f10
fsgnj.h f26, f7, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f18, 0(x2) # load 0x00003c00 from memory into f18
fsgnj.h f3, f21, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f31, 0(x2) # load 0x000083ff from memory into f31
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f25, 0(x2) # load 0x0000bc00 from memory into f25
fsgnj.h f14, f31, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f28, 0(x2) # load 0x00003e00 from memory into f28
fsgnj.h f19, f21, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f28, 0(x2) # load 0x000083ff from memory into f28
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f24, 0(x2) # load 0x0000be00 from memory into f24
fsgnj.h f26, f28, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f31, 0(x2) # load 0x00004000 from memory into f31
fsgnj.h f11, f21, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f6, 0(x2) # load 0x000083ff from memory into f6
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f1, 0(x2) # load 0x0000c000 from memory into f1
fsgnj.h f24, f6, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f27, 0(x2) # load 0x000083ff from memory into f27
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f31, 0(x2) # load 0x00000400 from memory into f31
fsgnj.h f16, f27, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f11, 0(x2) # load 0x000083ff from memory into f11
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f26, 0(x2) # load 0x00008400 from memory into f26
fsgnj.h f5, f11, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f22, 0(x2) # load 0x000083ff from memory into f22
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f14, 0(x2) # load 0x00007bff from memory into f14
fsgnj.h f7, f22, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f17, 0(x2) # load 0x000083ff from memory into f17
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f12, 0(x2) # load 0x0000fbff from memory into f12
fsgnj.h f30, f17, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f22, 0(x2) # load 0x000083ff from memory into f22
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f9, 0(x2) # load 0x000003ff from memory into f9
fsgnj.h f29, f22, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f16, 0(x2) # load 0x000083ff from memory into f16
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
fsgnj.h f25, f16, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f15, 0(x2) # load 0x000083ff from memory into f15
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f14, 0(x2) # load 0x00000200 from memory into f14
fsgnj.h f12, f15, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f5, 0(x2) # load 0x000083ff from memory into f5
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f1, 0(x2) # load 0x00008200 from memory into f1
fsgnj.h f27, f5, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f15, 0(x2) # load 0x000083ff from memory into f15
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f25, 0(x2) # load 0x00000001 from memory into f25
fsgnj.h f23, f15, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f5, 0(x2) # load 0x000083ff from memory into f5
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f6, 0(x2) # load 0x00008001 from memory into f6
fsgnj.h f22, f5, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f8, 0(x2) # load 0x00007c00 from memory into f8
fsgnj.h f15, f21, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f18, 0(x2) # load 0x000083ff from memory into f18
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f15, 0(x2) # load 0x0000fc00 from memory into f15
fsgnj.h f13, f18, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f16, 0(x2) # load 0x000083ff from memory into f16
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f7, 0(x2) # load 0x00007e00 from memory into f7
fsgnj.h f26, f16, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f7, 0(x2) # load 0x000083ff from memory into f7
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f28, 0(x2) # load 0x00007fff from memory into f28
fsgnj.h f9, f7, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f8, 0(x2) # load 0x000083ff from memory into f8
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f9, 0(x2) # load 0x0000fe00 from memory into f9
fsgnj.h f17, f8, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f31, 0(x2) # load 0x000083ff from memory into f31
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f5, 0(x2) # load 0x00007c01 from memory into f5
fsgnj.h f2, f31, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f11, 0(x2) # load 0x000083ff from memory into f11
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f15, 0(x2) # load 0x00007dff from memory into f15
fsgnj.h f8, f11, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f28, 0(x2) # load 0x000083ff from memory into f28
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f13, 0(x2) # load 0x0000fc01 from memory into f13
fsgnj.h f10, f28, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f12, 0(x2) # load 0x000083ff from memory into f12
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f5, 0(x2) # load 0x000058b4 from memory into f5
fsgnj.h f24, f12, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x83ff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f11, 0(x2) # load 0x000083ff from memory into f11
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f6, 0(x2) # load 0x0000c93a from memory into f6
fsgnj.h f3, f11, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f26, 0(x2) # load 0x00000200 from memory into f26
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f7, 0(x2) # load 0x00000000 from memory into f7
fsgnj.h f28, f26, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f2, 0(x2) # load 0x00000200 from memory into f2
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f10, 0(x2) # load 0x00008000 from memory into f10
fsgnj.h f7, f2, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f28, 0(x2) # load 0x00000200 from memory into f28
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f17, 0(x2) # load 0x00003c00 from memory into f17
fsgnj.h f5, f28, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f16, 0(x2) # load 0x00000200 from memory into f16
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f26, 0(x2) # load 0x0000bc00 from memory into f26
fsgnj.h f8, f16, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f23, 0(x2) # load 0x00000200 from memory into f23
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f12, 0(x2) # load 0x00003e00 from memory into f12
fsgnj.h f6, f23, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f5, 0(x2) # load 0x00000200 from memory into f5
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f27, 0(x2) # load 0x0000be00 from memory into f27
fsgnj.h f24, f5, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f31, 0(x2) # load 0x00000200 from memory into f31
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f6, 0(x2) # load 0x00004000 from memory into f6
fsgnj.h f26, f31, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f16, 0(x2) # load 0x00000200 from memory into f16
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f26, 0(x2) # load 0x0000c000 from memory into f26
fsgnj.h f20, f16, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f10, 0(x2) # load 0x00000200 from memory into f10
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f2, 0(x2) # load 0x00000400 from memory into f2
fsgnj.h f14, f10, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f22, 0(x2) # load 0x00000200 from memory into f22
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
fsgnj.h f3, f22, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f13, 0(x2) # load 0x00000200 from memory into f13
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f3, 0(x2) # load 0x00007bff from memory into f3
fsgnj.h f5, f13, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f31, 0(x2) # load 0x00000200 from memory into f31
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f13, 0(x2) # load 0x0000fbff from memory into f13
fsgnj.h f25, f31, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f18, 0(x2) # load 0x00000200 from memory into f18
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f9, 0(x2) # load 0x000003ff from memory into f9
fsgnj.h f3, f18, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f12, 0(x2) # load 0x00000200 from memory into f12
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f3, 0(x2) # load 0x000083ff from memory into f3
fsgnj.h f20, f12, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f21, 0(x2) # load 0x00000200 from memory into f21
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f20, 0(x2) # load 0x00000200 from memory into f20
fsgnj.h f11, f21, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f5, 0(x2) # load 0x00000200 from memory into f5
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f12, 0(x2) # load 0x00008200 from memory into f12
fsgnj.h f1, f5, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f21, 0(x2) # load 0x00000200 from memory into f21
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f30, 0(x2) # load 0x00000001 from memory into f30
fsgnj.h f10, f21, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f29, 0(x2) # load 0x00000200 from memory into f29
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f5, 0(x2) # load 0x00008001 from memory into f5
fsgnj.h f30, f29, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f2, 0(x2) # load 0x00000200 from memory into f2
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f5, 0(x2) # load 0x00007c00 from memory into f5
fsgnj.h f13, f2, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f20, 0(x2) # load 0x00000200 from memory into f20
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f28, 0(x2) # load 0x0000fc00 from memory into f28
fsgnj.h f1, f20, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f30, 0(x2) # load 0x00000200 from memory into f30
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f19, 0(x2) # load 0x00007e00 from memory into f19
fsgnj.h f10, f30, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f3, 0(x2) # load 0x00000200 from memory into f3
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f12, 0(x2) # load 0x00007fff from memory into f12
fsgnj.h f1, f3, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f9, 0(x2) # load 0x00000200 from memory into f9
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f10, 0(x2) # load 0x0000fe00 from memory into f10
fsgnj.h f15, f9, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f16, 0(x2) # load 0x00000200 from memory into f16
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f23, 0(x2) # load 0x00007c01 from memory into f23
fsgnj.h f27, f16, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f5, 0(x2) # load 0x00000200 from memory into f5
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f6, 0(x2) # load 0x00007dff from memory into f6
fsgnj.h f17, f5, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f10, 0(x2) # load 0x00000200 from memory into f10
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f14, 0(x2) # load 0x0000fc01 from memory into f14
fsgnj.h f25, f10, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f29, 0(x2) # load 0x00000200 from memory into f29
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f5, 0(x2) # load 0x000058b4 from memory into f5
fsgnj.h f17, f29, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x200 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f21, 0(x2) # load 0x00000200 from memory into f21
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f1, 0(x2) # load 0x0000c93a from memory into f1
fsgnj.h f12, f21, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f18, 0(x2) # load 0x00008200 from memory into f18
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f25, 0(x2) # load 0x00000000 from memory into f25
fsgnj.h f1, f18, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f25, 0(x2) # load 0x00008200 from memory into f25
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f21, 0(x2) # load 0x00008000 from memory into f21
fsgnj.h f22, f25, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f21, 0(x2) # load 0x00008200 from memory into f21
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f3, 0(x2) # load 0x00003c00 from memory into f3
fsgnj.h f5, f21, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f8, 0(x2) # load 0x00008200 from memory into f8
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f28, 0(x2) # load 0x0000bc00 from memory into f28
fsgnj.h f7, f8, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f28, 0(x2) # load 0x00008200 from memory into f28
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f3, 0(x2) # load 0x00003e00 from memory into f3
fsgnj.h f2, f28, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f17, 0(x2) # load 0x00008200 from memory into f17
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f2, 0(x2) # load 0x0000be00 from memory into f2
fsgnj.h f26, f17, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f28, 0(x2) # load 0x00008200 from memory into f28
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f19, 0(x2) # load 0x00004000 from memory into f19
fsgnj.h f20, f28, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f5, 0(x2) # load 0x00008200 from memory into f5
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f28, 0(x2) # load 0x0000c000 from memory into f28
fsgnj.h f11, f5, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f6, 0(x2) # load 0x00008200 from memory into f6
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f1, 0(x2) # load 0x00000400 from memory into f1
fsgnj.h f30, f6, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f22, 0(x2) # load 0x00008200 from memory into f22
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f28, 0(x2) # load 0x00008400 from memory into f28
fsgnj.h f13, f22, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f20, 0(x2) # load 0x00008200 from memory into f20
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f24, 0(x2) # load 0x00007bff from memory into f24
fsgnj.h f2, f20, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f29, 0(x2) # load 0x00008200 from memory into f29
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f27, 0(x2) # load 0x0000fbff from memory into f27
fsgnj.h f25, f29, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f15, 0(x2) # load 0x00008200 from memory into f15
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f27, 0(x2) # load 0x000003ff from memory into f27
fsgnj.h f24, f15, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f1, 0(x2) # load 0x00008200 from memory into f1
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f16, 0(x2) # load 0x000083ff from memory into f16
fsgnj.h f21, f1, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f10, 0(x2) # load 0x00008200 from memory into f10
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f25, 0(x2) # load 0x00000200 from memory into f25
fsgnj.h f26, f10, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f17, 0(x2) # load 0x00008200 from memory into f17
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f2, 0(x2) # load 0x00008200 from memory into f2
fsgnj.h f30, f17, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f28, 0(x2) # load 0x00008200 from memory into f28
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f19, 0(x2) # load 0x00000001 from memory into f19
fsgnj.h f16, f28, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f16, 0(x2) # load 0x00008200 from memory into f16
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f29, 0(x2) # load 0x00008001 from memory into f29
fsgnj.h f10, f16, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f26, 0(x2) # load 0x00008200 from memory into f26
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f19, 0(x2) # load 0x00007c00 from memory into f19
fsgnj.h f27, f26, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f19, 0(x2) # load 0x00008200 from memory into f19
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f23, 0(x2) # load 0x0000fc00 from memory into f23
fsgnj.h f30, f19, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f1, 0(x2) # load 0x00008200 from memory into f1
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f15, 0(x2) # load 0x00007e00 from memory into f15
fsgnj.h f12, f1, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f26, 0(x2) # load 0x00008200 from memory into f26
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f13, 0(x2) # load 0x00007fff from memory into f13
fsgnj.h f1, f26, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f17, 0(x2) # load 0x00008200 from memory into f17
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f29, 0(x2) # load 0x0000fe00 from memory into f29
fsgnj.h f20, f17, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f12, 0(x2) # load 0x00008200 from memory into f12
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f8, 0(x2) # load 0x00007c01 from memory into f8
fsgnj.h f26, f12, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f10, 0(x2) # load 0x00008200 from memory into f10
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f23, 0(x2) # load 0x00007dff from memory into f23
fsgnj.h f6, f10, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f3, 0(x2) # load 0x00008200 from memory into f3
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f25, 0(x2) # load 0x0000fc01 from memory into f25
fsgnj.h f21, f3, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f16, 0(x2) # load 0x00008200 from memory into f16
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f15, 0(x2) # load 0x000058b4 from memory into f15
fsgnj.h f30, f16, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8200 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f10, 0(x2) # load 0x00008200 from memory into f10
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f9, 0(x2) # load 0x0000c93a from memory into f9
fsgnj.h f5, f10, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f22, 0(x2) # load 0x00000001 from memory into f22
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f26, 0(x2) # load 0x00000000 from memory into f26
fsgnj.h f7, f22, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f29, 0(x2) # load 0x00000001 from memory into f29
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f18, 0(x2) # load 0x00008000 from memory into f18
fsgnj.h f12, f29, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f2, 0(x2) # load 0x00000001 from memory into f2
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f11, 0(x2) # load 0x00003c00 from memory into f11
fsgnj.h f8, f2, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f13, 0(x2) # load 0x00000001 from memory into f13
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f30, 0(x2) # load 0x0000bc00 from memory into f30
fsgnj.h f5, f13, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f13, 0(x2) # load 0x00000001 from memory into f13
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f3, 0(x2) # load 0x00003e00 from memory into f3
fsgnj.h f19, f13, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f28, 0(x2) # load 0x00000001 from memory into f28
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f20, 0(x2) # load 0x0000be00 from memory into f20
fsgnj.h f8, f28, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f20, 0(x2) # load 0x00000001 from memory into f20
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f23, 0(x2) # load 0x00004000 from memory into f23
fsgnj.h f24, f20, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f3, 0(x2) # load 0x00000001 from memory into f3
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f15, 0(x2) # load 0x0000c000 from memory into f15
fsgnj.h f9, f3, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f21, 0(x2) # load 0x00000001 from memory into f21
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f17, 0(x2) # load 0x00000400 from memory into f17
fsgnj.h f8, f21, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f2, 0(x2) # load 0x00000001 from memory into f2
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
fsgnj.h f5, f2, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f27, 0(x2) # load 0x00000001 from memory into f27
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f10, 0(x2) # load 0x00007bff from memory into f10
fsgnj.h f23, f27, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f26, 0(x2) # load 0x00000001 from memory into f26
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f16, 0(x2) # load 0x0000fbff from memory into f16
fsgnj.h f9, f26, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f6, 0(x2) # load 0x00000001 from memory into f6
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f28, 0(x2) # load 0x000003ff from memory into f28
fsgnj.h f13, f6, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f13, 0(x2) # load 0x00000001 from memory into f13
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f19, 0(x2) # load 0x000083ff from memory into f19
fsgnj.h f1, f13, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f24, 0(x2) # load 0x00000001 from memory into f24
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f8, 0(x2) # load 0x00000200 from memory into f8
fsgnj.h f25, f24, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f14, 0(x2) # load 0x00000001 from memory into f14
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f29, 0(x2) # load 0x00008200 from memory into f29
fsgnj.h f1, f14, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f26, 0(x2) # load 0x00000001 from memory into f26
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f22, 0(x2) # load 0x00000001 from memory into f22
fsgnj.h f10, f26, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f3, 0(x2) # load 0x00000001 from memory into f3
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f26, 0(x2) # load 0x00008001 from memory into f26
fsgnj.h f27, f3, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f14, 0(x2) # load 0x00000001 from memory into f14
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f28, 0(x2) # load 0x00007c00 from memory into f28
fsgnj.h f16, f14, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f17, 0(x2) # load 0x00000001 from memory into f17
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f15, 0(x2) # load 0x0000fc00 from memory into f15
fsgnj.h f11, f17, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f24, 0(x2) # load 0x00000001 from memory into f24
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f15, 0(x2) # load 0x00007e00 from memory into f15
fsgnj.h f20, f24, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f10, 0(x2) # load 0x00000001 from memory into f10
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f30, 0(x2) # load 0x00007fff from memory into f30
fsgnj.h f27, f10, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f21, 0(x2) # load 0x00000001 from memory into f21
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f3, 0(x2) # load 0x0000fe00 from memory into f3
fsgnj.h f9, f21, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f27, 0(x2) # load 0x00000001 from memory into f27
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f11, 0(x2) # load 0x00007c01 from memory into f11
fsgnj.h f8, f27, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f5, 0(x2) # load 0x00000001 from memory into f5
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f31, 0(x2) # load 0x00007dff from memory into f31
fsgnj.h f20, f5, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f24, 0(x2) # load 0x00000001 from memory into f24
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f25, 0(x2) # load 0x0000fc01 from memory into f25
fsgnj.h f17, f24, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f13, 0(x2) # load 0x00000001 from memory into f13
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f24, 0(x2) # load 0x000058b4 from memory into f24
fsgnj.h f12, f13, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x1 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f27, 0(x2) # load 0x00000001 from memory into f27
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f25, 0(x2) # load 0x0000c93a from memory into f25
fsgnj.h f2, f27, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f7, 0(x2) # load 0x00008001 from memory into f7
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f13, 0(x2) # load 0x00000000 from memory into f13
fsgnj.h f22, f7, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f19, 0(x2) # load 0x00008001 from memory into f19
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f28, 0(x2) # load 0x00008000 from memory into f28
fsgnj.h f13, f19, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f9, 0(x2) # load 0x00008001 from memory into f9
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f18, 0(x2) # load 0x00003c00 from memory into f18
fsgnj.h f3, f9, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f17, 0(x2) # load 0x00008001 from memory into f17
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f3, 0(x2) # load 0x0000bc00 from memory into f3
fsgnj.h f22, f17, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f18, 0(x2) # load 0x00008001 from memory into f18
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f17, 0(x2) # load 0x00003e00 from memory into f17
fsgnj.h f23, f18, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f27, 0(x2) # load 0x00008001 from memory into f27
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f22, 0(x2) # load 0x0000be00 from memory into f22
fsgnj.h f9, f27, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f11, 0(x2) # load 0x00008001 from memory into f11
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f24, 0(x2) # load 0x00004000 from memory into f24
fsgnj.h f5, f11, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f1, 0(x2) # load 0x00008001 from memory into f1
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f12, 0(x2) # load 0x0000c000 from memory into f12
fsgnj.h f22, f1, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f18, 0(x2) # load 0x00008001 from memory into f18
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f16, 0(x2) # load 0x00000400 from memory into f16
fsgnj.h f13, f18, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f31, 0(x2) # load 0x00008001 from memory into f31
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f19, 0(x2) # load 0x00008400 from memory into f19
fsgnj.h f24, f31, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f21, 0(x2) # load 0x00008001 from memory into f21
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f29, 0(x2) # load 0x00007bff from memory into f29
fsgnj.h f5, f21, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f1, 0(x2) # load 0x00008001 from memory into f1
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f21, 0(x2) # load 0x0000fbff from memory into f21
fsgnj.h f5, f1, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f22, 0(x2) # load 0x00008001 from memory into f22
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f8, 0(x2) # load 0x000003ff from memory into f8
fsgnj.h f27, f22, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f25, 0(x2) # load 0x00008001 from memory into f25
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f26, 0(x2) # load 0x000083ff from memory into f26
fsgnj.h f29, f25, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f29, 0(x2) # load 0x00008001 from memory into f29
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f23, 0(x2) # load 0x00000200 from memory into f23
fsgnj.h f16, f29, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f29, 0(x2) # load 0x00008001 from memory into f29
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f11, 0(x2) # load 0x00008200 from memory into f11
fsgnj.h f27, f29, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f23, 0(x2) # load 0x00008001 from memory into f23
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f21, 0(x2) # load 0x00000001 from memory into f21
fsgnj.h f16, f23, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f2, 0(x2) # load 0x00008001 from memory into f2
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f20, 0(x2) # load 0x00008001 from memory into f20
fsgnj.h f3, f2, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f27, 0(x2) # load 0x00008001 from memory into f27
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f18, 0(x2) # load 0x00007c00 from memory into f18
fsgnj.h f5, f27, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f29, 0(x2) # load 0x00008001 from memory into f29
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f21, 0(x2) # load 0x0000fc00 from memory into f21
fsgnj.h f30, f29, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f2, 0(x2) # load 0x00008001 from memory into f2
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f10, 0(x2) # load 0x00007e00 from memory into f10
fsgnj.h f25, f2, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f1, 0(x2) # load 0x00008001 from memory into f1
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f10, 0(x2) # load 0x00007fff from memory into f10
fsgnj.h f24, f1, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f11, 0(x2) # load 0x00008001 from memory into f11
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f15, 0(x2) # load 0x0000fe00 from memory into f15
fsgnj.h f2, f11, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f19, 0(x2) # load 0x00008001 from memory into f19
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f16, 0(x2) # load 0x00007c01 from memory into f16
fsgnj.h f8, f19, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f7, 0(x2) # load 0x00008001 from memory into f7
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f28, 0(x2) # load 0x00007dff from memory into f28
fsgnj.h f12, f7, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f20, 0(x2) # load 0x00008001 from memory into f20
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f18, 0(x2) # load 0x0000fc01 from memory into f18
fsgnj.h f2, f20, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f23, 0(x2) # load 0x00008001 from memory into f23
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f11, 0(x2) # load 0x000058b4 from memory into f11
fsgnj.h f28, f23, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x8001 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f12, 0(x2) # load 0x00008001 from memory into f12
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f20, 0(x2) # load 0x0000c93a from memory into f20
fsgnj.h f25, f12, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f10, 0(x2) # load 0x00007c00 from memory into f10
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f24, 0(x2) # load 0x00000000 from memory into f24
fsgnj.h f29, f10, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f15, 0(x2) # load 0x00007c00 from memory into f15
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f12, 0(x2) # load 0x00008000 from memory into f12
fsgnj.h f23, f15, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f31, 0(x2) # load 0x00007c00 from memory into f31
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f3, 0(x2) # load 0x00003c00 from memory into f3
fsgnj.h f6, f31, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f3, 0(x2) # load 0x00007c00 from memory into f3
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f10, 0(x2) # load 0x0000bc00 from memory into f10
fsgnj.h f26, f3, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f29, 0(x2) # load 0x00007c00 from memory into f29
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f7, 0(x2) # load 0x00003e00 from memory into f7
fsgnj.h f19, f29, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f26, 0(x2) # load 0x00007c00 from memory into f26
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f30, 0(x2) # load 0x0000be00 from memory into f30
fsgnj.h f16, f26, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f15, 0(x2) # load 0x00007c00 from memory into f15
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f28, 0(x2) # load 0x00004000 from memory into f28
fsgnj.h f7, f15, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f18, 0(x2) # load 0x00007c00 from memory into f18
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f26, 0(x2) # load 0x0000c000 from memory into f26
fsgnj.h f11, f18, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f7, 0(x2) # load 0x00007c00 from memory into f7
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f20, 0(x2) # load 0x00000400 from memory into f20
fsgnj.h f22, f7, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f22, 0(x2) # load 0x00007c00 from memory into f22
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f14, 0(x2) # load 0x00008400 from memory into f14
fsgnj.h f10, f22, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f24, 0(x2) # load 0x00007c00 from memory into f24
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f2, 0(x2) # load 0x00007bff from memory into f2
fsgnj.h f7, f24, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f17, 0(x2) # load 0x00007c00 from memory into f17
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f16, 0(x2) # load 0x0000fbff from memory into f16
fsgnj.h f1, f17, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f2, 0(x2) # load 0x00007c00 from memory into f2
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f12, 0(x2) # load 0x000003ff from memory into f12
fsgnj.h f10, f2, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f25, 0(x2) # load 0x00007c00 from memory into f25
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f31, 0(x2) # load 0x000083ff from memory into f31
fsgnj.h f23, f25, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f15, 0(x2) # load 0x00007c00 from memory into f15
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f5, 0(x2) # load 0x00000200 from memory into f5
fsgnj.h f9, f15, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f20, 0(x2) # load 0x00007c00 from memory into f20
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f29, 0(x2) # load 0x00008200 from memory into f29
fsgnj.h f12, f20, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f14, 0(x2) # load 0x00007c00 from memory into f14
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f5, 0(x2) # load 0x00000001 from memory into f5
fsgnj.h f1, f14, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f14, 0(x2) # load 0x00007c00 from memory into f14
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f17, 0(x2) # load 0x00008001 from memory into f17
fsgnj.h f28, f14, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f25, 0(x2) # load 0x00007c00 from memory into f25
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f10, 0(x2) # load 0x00007c00 from memory into f10
fsgnj.h f2, f25, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f23, 0(x2) # load 0x00007c00 from memory into f23
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f13, 0(x2) # load 0x0000fc00 from memory into f13
fsgnj.h f16, f23, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f18, 0(x2) # load 0x00007c00 from memory into f18
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f1, 0(x2) # load 0x00007e00 from memory into f1
fsgnj.h f27, f18, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f18, 0(x2) # load 0x00007c00 from memory into f18
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f7, 0(x2) # load 0x00007fff from memory into f7
fsgnj.h f6, f18, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f29, 0(x2) # load 0x00007c00 from memory into f29
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f23, 0(x2) # load 0x0000fe00 from memory into f23
fsgnj.h f31, f29, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f15, 0(x2) # load 0x00007c00 from memory into f15
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f13, 0(x2) # load 0x00007c01 from memory into f13
fsgnj.h f5, f15, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f3, 0(x2) # load 0x00007c00 from memory into f3
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f19, 0(x2) # load 0x00007dff from memory into f19
fsgnj.h f17, f3, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f10, 0(x2) # load 0x00007c00 from memory into f10
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
fsgnj.h f26, f10, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f24, 0(x2) # load 0x00007c00 from memory into f24
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f13, 0(x2) # load 0x000058b4 from memory into f13
fsgnj.h f14, f24, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f31, 0(x2) # load 0x00007c00 from memory into f31
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f13, 0(x2) # load 0x0000c93a from memory into f13
fsgnj.h f10, f31, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f14, 0(x2) # load 0x0000fc00 from memory into f14
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f20, 0(x2) # load 0x00000000 from memory into f20
fsgnj.h f21, f14, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f16, 0(x2) # load 0x0000fc00 from memory into f16
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f25, 0(x2) # load 0x00008000 from memory into f25
fsgnj.h f6, f16, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f14, 0(x2) # load 0x0000fc00 from memory into f14
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f21, 0(x2) # load 0x00003c00 from memory into f21
fsgnj.h f16, f14, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f23, 0(x2) # load 0x0000fc00 from memory into f23
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f12, 0(x2) # load 0x0000bc00 from memory into f12
fsgnj.h f20, f23, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f26, 0(x2) # load 0x0000fc00 from memory into f26
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f12, 0(x2) # load 0x00003e00 from memory into f12
fsgnj.h f2, f26, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f31, 0(x2) # load 0x0000fc00 from memory into f31
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f9, 0(x2) # load 0x0000be00 from memory into f9
fsgnj.h f17, f31, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f3, 0(x2) # load 0x0000fc00 from memory into f3
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
fsgnj.h f7, f3, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f16, 0(x2) # load 0x0000fc00 from memory into f16
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f1, 0(x2) # load 0x0000c000 from memory into f1
fsgnj.h f13, f16, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f21, 0(x2) # load 0x0000fc00 from memory into f21
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f22, 0(x2) # load 0x00000400 from memory into f22
fsgnj.h f31, f21, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f7, 0(x2) # load 0x0000fc00 from memory into f7
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f9, 0(x2) # load 0x00008400 from memory into f9
fsgnj.h f27, f7, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f13, 0(x2) # load 0x0000fc00 from memory into f13
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f12, 0(x2) # load 0x00007bff from memory into f12
fsgnj.h f14, f13, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f16, 0(x2) # load 0x0000fc00 from memory into f16
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f17, 0(x2) # load 0x0000fbff from memory into f17
fsgnj.h f1, f16, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f31, 0(x2) # load 0x0000fc00 from memory into f31
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f9, 0(x2) # load 0x000003ff from memory into f9
fsgnj.h f14, f31, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f29, 0(x2) # load 0x0000fc00 from memory into f29
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f8, 0(x2) # load 0x000083ff from memory into f8
fsgnj.h f20, f29, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f28, 0(x2) # load 0x0000fc00 from memory into f28
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f21, 0(x2) # load 0x00000200 from memory into f21
fsgnj.h f13, f28, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f30, 0(x2) # load 0x0000fc00 from memory into f30
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f27, 0(x2) # load 0x00008200 from memory into f27
fsgnj.h f25, f30, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f30, 0(x2) # load 0x0000fc00 from memory into f30
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f12, 0(x2) # load 0x00000001 from memory into f12
fsgnj.h f26, f30, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f1, 0(x2) # load 0x0000fc00 from memory into f1
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f19, 0(x2) # load 0x00008001 from memory into f19
fsgnj.h f7, f1, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f26, 0(x2) # load 0x0000fc00 from memory into f26
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f10, 0(x2) # load 0x00007c00 from memory into f10
fsgnj.h f12, f26, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f23, 0(x2) # load 0x0000fc00 from memory into f23
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f31, 0(x2) # load 0x0000fc00 from memory into f31
fsgnj.h f25, f23, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f2, 0(x2) # load 0x0000fc00 from memory into f2
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f24, 0(x2) # load 0x00007e00 from memory into f24
fsgnj.h f13, f2, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f15, 0(x2) # load 0x0000fc00 from memory into f15
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f23, 0(x2) # load 0x00007fff from memory into f23
fsgnj.h f6, f15, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f19, 0(x2) # load 0x0000fc00 from memory into f19
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f11, 0(x2) # load 0x0000fe00 from memory into f11
fsgnj.h f17, f19, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f6, 0(x2) # load 0x0000fc00 from memory into f6
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f14, 0(x2) # load 0x00007c01 from memory into f14
fsgnj.h f28, f6, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f5, 0(x2) # load 0x0000fc00 from memory into f5
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f31, 0(x2) # load 0x00007dff from memory into f31
fsgnj.h f18, f5, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f28, 0(x2) # load 0x0000fc00 from memory into f28
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f6, 0(x2) # load 0x0000fc01 from memory into f6
fsgnj.h f21, f28, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f5, 0(x2) # load 0x0000fc00 from memory into f5
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f23, 0(x2) # load 0x000058b4 from memory into f23
fsgnj.h f17, f5, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f9, 0(x2) # load 0x0000fc00 from memory into f9
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f8, 0(x2) # load 0x0000c93a from memory into f8
fsgnj.h f15, f9, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f28, 0(x2) # load 0x00007e00 from memory into f28
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f8, 0(x2) # load 0x00000000 from memory into f8
fsgnj.h f22, f28, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f29, 0(x2) # load 0x00007e00 from memory into f29
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f17, 0(x2) # load 0x00008000 from memory into f17
fsgnj.h f12, f29, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f25, 0(x2) # load 0x00007e00 from memory into f25
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f14, 0(x2) # load 0x00003c00 from memory into f14
fsgnj.h f15, f25, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f28, 0(x2) # load 0x00007e00 from memory into f28
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f11, 0(x2) # load 0x0000bc00 from memory into f11
fsgnj.h f24, f28, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f17, 0(x2) # load 0x00007e00 from memory into f17
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f12, 0(x2) # load 0x00003e00 from memory into f12
fsgnj.h f19, f17, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f14, 0(x2) # load 0x00007e00 from memory into f14
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f28, 0(x2) # load 0x0000be00 from memory into f28
fsgnj.h f19, f14, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f23, 0(x2) # load 0x00007e00 from memory into f23
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f31, 0(x2) # load 0x00004000 from memory into f31
fsgnj.h f29, f23, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f14, 0(x2) # load 0x00007e00 from memory into f14
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f12, 0(x2) # load 0x0000c000 from memory into f12
fsgnj.h f11, f14, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f23, 0(x2) # load 0x00007e00 from memory into f23
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f6, 0(x2) # load 0x00000400 from memory into f6
fsgnj.h f30, f23, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f21, 0(x2) # load 0x00007e00 from memory into f21
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f20, 0(x2) # load 0x00008400 from memory into f20
fsgnj.h f8, f21, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f21, 0(x2) # load 0x00007e00 from memory into f21
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f8, 0(x2) # load 0x00007bff from memory into f8
fsgnj.h f12, f21, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f9, 0(x2) # load 0x00007e00 from memory into f9
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f3, 0(x2) # load 0x0000fbff from memory into f3
fsgnj.h f7, f9, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f6, 0(x2) # load 0x00007e00 from memory into f6
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f1, 0(x2) # load 0x000003ff from memory into f1
fsgnj.h f15, f6, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f26, 0(x2) # load 0x00007e00 from memory into f26
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f9, 0(x2) # load 0x000083ff from memory into f9
fsgnj.h f3, f26, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f8, 0(x2) # load 0x00007e00 from memory into f8
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f23, 0(x2) # load 0x00000200 from memory into f23
fsgnj.h f7, f8, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f10, 0(x2) # load 0x00007e00 from memory into f10
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f19, 0(x2) # load 0x00008200 from memory into f19
fsgnj.h f1, f10, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f21, 0(x2) # load 0x00007e00 from memory into f21
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f7, 0(x2) # load 0x00000001 from memory into f7
fsgnj.h f20, f21, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f25, 0(x2) # load 0x00007e00 from memory into f25
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f1, 0(x2) # load 0x00008001 from memory into f1
fsgnj.h f8, f25, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f21, 0(x2) # load 0x00007e00 from memory into f21
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f9, 0(x2) # load 0x00007c00 from memory into f9
fsgnj.h f13, f21, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f27, 0(x2) # load 0x00007e00 from memory into f27
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f26, 0(x2) # load 0x0000fc00 from memory into f26
fsgnj.h f7, f27, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f30, 0(x2) # load 0x00007e00 from memory into f30
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f20, 0(x2) # load 0x00007e00 from memory into f20
fsgnj.h f21, f30, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f6, 0(x2) # load 0x00007e00 from memory into f6
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f7, 0(x2) # load 0x00007fff from memory into f7
fsgnj.h f24, f6, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f23, 0(x2) # load 0x00007e00 from memory into f23
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f19, 0(x2) # load 0x0000fe00 from memory into f19
fsgnj.h f3, f23, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f13, 0(x2) # load 0x00007e00 from memory into f13
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f28, 0(x2) # load 0x00007c01 from memory into f28
fsgnj.h f6, f13, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f15, 0(x2) # load 0x00007e00 from memory into f15
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f14, 0(x2) # load 0x00007dff from memory into f14
fsgnj.h f13, f15, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f19, 0(x2) # load 0x00007e00 from memory into f19
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f10, 0(x2) # load 0x0000fc01 from memory into f10
fsgnj.h f22, f19, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f13, 0(x2) # load 0x00007e00 from memory into f13
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f12, 0(x2) # load 0x000058b4 from memory into f12
fsgnj.h f9, f13, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7e00 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f24, 0(x2) # load 0x00007e00 from memory into f24
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f9, 0(x2) # load 0x0000c93a from memory into f9
fsgnj.h f6, f24, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f11, 0(x2) # load 0x00007fff from memory into f11
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f23, 0(x2) # load 0x00000000 from memory into f23
fsgnj.h f3, f11, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f29, 0(x2) # load 0x00007fff from memory into f29
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f19, 0(x2) # load 0x00008000 from memory into f19
fsgnj.h f21, f29, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f15, 0(x2) # load 0x00007fff from memory into f15
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f6, 0(x2) # load 0x00003c00 from memory into f6
fsgnj.h f18, f15, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f8, 0(x2) # load 0x00007fff from memory into f8
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f1, 0(x2) # load 0x0000bc00 from memory into f1
fsgnj.h f17, f8, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f12, 0(x2) # load 0x00007fff from memory into f12
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f13, 0(x2) # load 0x00003e00 from memory into f13
fsgnj.h f29, f12, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f13, 0(x2) # load 0x00007fff from memory into f13
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f26, 0(x2) # load 0x0000be00 from memory into f26
fsgnj.h f11, f13, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f24, 0(x2) # load 0x00007fff from memory into f24
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f23, 0(x2) # load 0x00004000 from memory into f23
fsgnj.h f2, f24, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f13, 0(x2) # load 0x00007fff from memory into f13
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f16, 0(x2) # load 0x0000c000 from memory into f16
fsgnj.h f7, f13, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f30, 0(x2) # load 0x00007fff from memory into f30
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f1, 0(x2) # load 0x00000400 from memory into f1
fsgnj.h f7, f30, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f8, 0(x2) # load 0x00007fff from memory into f8
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f17, 0(x2) # load 0x00008400 from memory into f17
fsgnj.h f29, f8, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f18, 0(x2) # load 0x00007fff from memory into f18
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f12, 0(x2) # load 0x00007bff from memory into f12
fsgnj.h f2, f18, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f13, 0(x2) # load 0x00007fff from memory into f13
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f29, 0(x2) # load 0x0000fbff from memory into f29
fsgnj.h f25, f13, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f20, 0(x2) # load 0x00007fff from memory into f20
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f3, 0(x2) # load 0x000003ff from memory into f3
fsgnj.h f24, f20, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f7, 0(x2) # load 0x00007fff from memory into f7
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f20, 0(x2) # load 0x000083ff from memory into f20
fsgnj.h f15, f7, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f23, 0(x2) # load 0x00007fff from memory into f23
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f15, 0(x2) # load 0x00000200 from memory into f15
fsgnj.h f9, f23, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f6, 0(x2) # load 0x00007fff from memory into f6
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f3, 0(x2) # load 0x00008200 from memory into f3
fsgnj.h f28, f6, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f22, 0(x2) # load 0x00007fff from memory into f22
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f23, 0(x2) # load 0x00000001 from memory into f23
fsgnj.h f10, f22, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f25, 0(x2) # load 0x00007fff from memory into f25
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f30, 0(x2) # load 0x00008001 from memory into f30
fsgnj.h f1, f25, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f27, 0(x2) # load 0x00007fff from memory into f27
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f15, 0(x2) # load 0x00007c00 from memory into f15
fsgnj.h f10, f27, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f22, 0(x2) # load 0x00007fff from memory into f22
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f28, 0(x2) # load 0x0000fc00 from memory into f28
fsgnj.h f19, f22, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f26, 0(x2) # load 0x00007fff from memory into f26
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f19, 0(x2) # load 0x00007e00 from memory into f19
fsgnj.h f2, f26, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f21, 0(x2) # load 0x00007fff from memory into f21
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f22, 0(x2) # load 0x00007fff from memory into f22
fsgnj.h f1, f21, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f7, 0(x2) # load 0x00007fff from memory into f7
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f23, 0(x2) # load 0x0000fe00 from memory into f23
fsgnj.h f12, f7, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f31, 0(x2) # load 0x00007fff from memory into f31
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f23, 0(x2) # load 0x00007c01 from memory into f23
fsgnj.h f29, f31, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f6, 0(x2) # load 0x00007fff from memory into f6
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f9, 0(x2) # load 0x00007dff from memory into f9
fsgnj.h f14, f6, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f2, 0(x2) # load 0x00007fff from memory into f2
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f26, 0(x2) # load 0x0000fc01 from memory into f26
fsgnj.h f13, f2, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f28, 0(x2) # load 0x00007fff from memory into f28
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f31, 0(x2) # load 0x000058b4 from memory into f31
fsgnj.h f18, f28, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7fff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f25, 0(x2) # load 0x00007fff from memory into f25
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f15, 0(x2) # load 0x0000c93a from memory into f15
fsgnj.h f16, f25, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f6, 0(x2) # load 0x0000fe00 from memory into f6
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f27, 0(x2) # load 0x00000000 from memory into f27
fsgnj.h f13, f6, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f24, 0(x2) # load 0x0000fe00 from memory into f24
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f23, 0(x2) # load 0x00008000 from memory into f23
fsgnj.h f25, f24, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f23, 0(x2) # load 0x0000fe00 from memory into f23
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f12, 0(x2) # load 0x00003c00 from memory into f12
fsgnj.h f13, f23, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f27, 0(x2) # load 0x0000fe00 from memory into f27
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f14, 0(x2) # load 0x0000bc00 from memory into f14
fsgnj.h f3, f27, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f12, 0(x2) # load 0x0000fe00 from memory into f12
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f17, 0(x2) # load 0x00003e00 from memory into f17
fsgnj.h f3, f12, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f3, 0(x2) # load 0x0000fe00 from memory into f3
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f28, 0(x2) # load 0x0000be00 from memory into f28
fsgnj.h f9, f3, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f15, 0(x2) # load 0x0000fe00 from memory into f15
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f20, 0(x2) # load 0x00004000 from memory into f20
fsgnj.h f8, f15, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f21, 0(x2) # load 0x0000fe00 from memory into f21
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f7, 0(x2) # load 0x0000c000 from memory into f7
fsgnj.h f17, f21, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f24, 0(x2) # load 0x0000fe00 from memory into f24
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f17, 0(x2) # load 0x00000400 from memory into f17
fsgnj.h f30, f24, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f14, 0(x2) # load 0x0000fe00 from memory into f14
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f15, 0(x2) # load 0x00008400 from memory into f15
fsgnj.h f26, f14, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f14, 0(x2) # load 0x0000fe00 from memory into f14
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f16, 0(x2) # load 0x00007bff from memory into f16
fsgnj.h f9, f14, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f31, 0(x2) # load 0x0000fe00 from memory into f31
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f19, 0(x2) # load 0x0000fbff from memory into f19
fsgnj.h f13, f31, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f25, 0(x2) # load 0x0000fe00 from memory into f25
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f8, 0(x2) # load 0x000003ff from memory into f8
fsgnj.h f14, f25, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f31, 0(x2) # load 0x0000fe00 from memory into f31
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f1, 0(x2) # load 0x000083ff from memory into f1
fsgnj.h f26, f31, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f19, 0(x2) # load 0x0000fe00 from memory into f19
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f30, 0(x2) # load 0x00000200 from memory into f30
fsgnj.h f16, f19, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f22, 0(x2) # load 0x0000fe00 from memory into f22
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f15, 0(x2) # load 0x00008200 from memory into f15
fsgnj.h f6, f22, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f10, 0(x2) # load 0x0000fe00 from memory into f10
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f20, 0(x2) # load 0x00000001 from memory into f20
fsgnj.h f7, f10, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f22, 0(x2) # load 0x0000fe00 from memory into f22
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f11, 0(x2) # load 0x00008001 from memory into f11
fsgnj.h f17, f22, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f23, 0(x2) # load 0x0000fe00 from memory into f23
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f3, 0(x2) # load 0x00007c00 from memory into f3
fsgnj.h f15, f23, f3 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f10, 0(x2) # load 0x0000fe00 from memory into f10
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f11, 0(x2) # load 0x0000fc00 from memory into f11
fsgnj.h f27, f10, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f27, 0(x2) # load 0x0000fe00 from memory into f27
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f11, 0(x2) # load 0x00007e00 from memory into f11
fsgnj.h f8, f27, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f8, 0(x2) # load 0x0000fe00 from memory into f8
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f29, 0(x2) # load 0x00007fff from memory into f29
fsgnj.h f25, f8, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f11, 0(x2) # load 0x0000fe00 from memory into f11
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f19, 0(x2) # load 0x0000fe00 from memory into f19
fsgnj.h f22, f11, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f3, 0(x2) # load 0x0000fe00 from memory into f3
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f16, 0(x2) # load 0x00007c01 from memory into f16
fsgnj.h f22, f3, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f15, 0(x2) # load 0x0000fe00 from memory into f15
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f26, 0(x2) # load 0x00007dff from memory into f26
fsgnj.h f24, f15, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f30, 0(x2) # load 0x0000fe00 from memory into f30
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f9, 0(x2) # load 0x0000fc01 from memory into f9
fsgnj.h f21, f30, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfe00 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f29, 0(x2) # load 0x0000fe00 from memory into f29
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f5, 0(x2) # load 0x000058b4 from memory into f5
fsgnj.h f19, f29, f5 # perform operation

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
fsgnj.h f8, f16, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f15, 0(x2) # load 0x00007c01 from memory into f15
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f5, 0(x2) # load 0x00000000 from memory into f5
fsgnj.h f26, f15, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f2, 0(x2) # load 0x00007c01 from memory into f2
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f8, 0(x2) # load 0x00008000 from memory into f8
fsgnj.h f20, f2, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f5, 0(x2) # load 0x00007c01 from memory into f5
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f19, 0(x2) # load 0x00003c00 from memory into f19
fsgnj.h f13, f5, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f23, 0(x2) # load 0x00007c01 from memory into f23
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f7, 0(x2) # load 0x0000bc00 from memory into f7
fsgnj.h f17, f23, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f8, 0(x2) # load 0x00007c01 from memory into f8
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f19, 0(x2) # load 0x00003e00 from memory into f19
fsgnj.h f10, f8, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f13, 0(x2) # load 0x00007c01 from memory into f13
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f19, 0(x2) # load 0x0000be00 from memory into f19
fsgnj.h f14, f13, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f23, 0(x2) # load 0x00007c01 from memory into f23
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f13, 0(x2) # load 0x00004000 from memory into f13
fsgnj.h f22, f23, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f25, 0(x2) # load 0x00007c01 from memory into f25
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f6, 0(x2) # load 0x0000c000 from memory into f6
fsgnj.h f8, f25, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f20, 0(x2) # load 0x00007c01 from memory into f20
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f29, 0(x2) # load 0x00000400 from memory into f29
fsgnj.h f15, f20, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f9, 0(x2) # load 0x00007c01 from memory into f9
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f25, 0(x2) # load 0x00008400 from memory into f25
fsgnj.h f30, f9, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f28, 0(x2) # load 0x00007c01 from memory into f28
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f19, 0(x2) # load 0x00007bff from memory into f19
fsgnj.h f16, f28, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f8, 0(x2) # load 0x00007c01 from memory into f8
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f18, 0(x2) # load 0x0000fbff from memory into f18
fsgnj.h f19, f8, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f29, 0(x2) # load 0x00007c01 from memory into f29
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f27, 0(x2) # load 0x000003ff from memory into f27
fsgnj.h f18, f29, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f16, 0(x2) # load 0x00007c01 from memory into f16
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f21, 0(x2) # load 0x000083ff from memory into f21
fsgnj.h f10, f16, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f6, 0(x2) # load 0x00007c01 from memory into f6
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f7, 0(x2) # load 0x00000200 from memory into f7
fsgnj.h f8, f6, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f27, 0(x2) # load 0x00007c01 from memory into f27
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f8, 0(x2) # load 0x00008200 from memory into f8
fsgnj.h f29, f27, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f5, 0(x2) # load 0x00007c01 from memory into f5
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f28, 0(x2) # load 0x00000001 from memory into f28
fsgnj.h f8, f5, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f18, 0(x2) # load 0x00007c01 from memory into f18
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f23, 0(x2) # load 0x00008001 from memory into f23
fsgnj.h f3, f18, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f19, 0(x2) # load 0x00007c01 from memory into f19
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f8, 0(x2) # load 0x00007c00 from memory into f8
fsgnj.h f31, f19, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f19, 0(x2) # load 0x00007c01 from memory into f19
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f13, 0(x2) # load 0x0000fc00 from memory into f13
fsgnj.h f17, f19, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f5, 0(x2) # load 0x00007c01 from memory into f5
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f23, 0(x2) # load 0x00007e00 from memory into f23
fsgnj.h f8, f5, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f19, 0(x2) # load 0x00007c01 from memory into f19
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f12, 0(x2) # load 0x00007fff from memory into f12
fsgnj.h f29, f19, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f2, 0(x2) # load 0x00007c01 from memory into f2
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f9, 0(x2) # load 0x0000fe00 from memory into f9
fsgnj.h f3, f2, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f21, 0(x2) # load 0x00007c01 from memory into f21
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f7, 0(x2) # load 0x00007c01 from memory into f7
fsgnj.h f17, f21, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f24, 0(x2) # load 0x00007c01 from memory into f24
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f25, 0(x2) # load 0x00007dff from memory into f25
fsgnj.h f30, f24, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f18, 0(x2) # load 0x00007c01 from memory into f18
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f5, 0(x2) # load 0x0000fc01 from memory into f5
fsgnj.h f23, f18, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f10, 0(x2) # load 0x00007c01 from memory into f10
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f1, 0(x2) # load 0x000058b4 from memory into f1
fsgnj.h f14, f10, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7c01 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f6, 0(x2) # load 0x00007c01 from memory into f6
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f14, 0(x2) # load 0x0000c93a from memory into f14
fsgnj.h f22, f6, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f3, 0(x2) # load 0x00007dff from memory into f3
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f6, 0(x2) # load 0x00000000 from memory into f6
fsgnj.h f23, f3, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f26, 0(x2) # load 0x00007dff from memory into f26
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f19, 0(x2) # load 0x00008000 from memory into f19
fsgnj.h f31, f26, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f2, 0(x2) # load 0x00007dff from memory into f2
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f6, 0(x2) # load 0x00003c00 from memory into f6
fsgnj.h f12, f2, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f24, 0(x2) # load 0x00007dff from memory into f24
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f20, 0(x2) # load 0x0000bc00 from memory into f20
fsgnj.h f16, f24, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f15, 0(x2) # load 0x00007dff from memory into f15
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f11, 0(x2) # load 0x00003e00 from memory into f11
fsgnj.h f30, f15, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f15, 0(x2) # load 0x00007dff from memory into f15
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f22, 0(x2) # load 0x0000be00 from memory into f22
fsgnj.h f17, f15, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f11, 0(x2) # load 0x00007dff from memory into f11
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f22, 0(x2) # load 0x00004000 from memory into f22
fsgnj.h f1, f11, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f20, 0(x2) # load 0x00007dff from memory into f20
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f27, 0(x2) # load 0x0000c000 from memory into f27
fsgnj.h f16, f20, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f21, 0(x2) # load 0x00007dff from memory into f21
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f26, 0(x2) # load 0x00000400 from memory into f26
fsgnj.h f27, f21, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f17, 0(x2) # load 0x00007dff from memory into f17
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
fsgnj.h f28, f17, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f19, 0(x2) # load 0x00007dff from memory into f19
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f27, 0(x2) # load 0x00007bff from memory into f27
fsgnj.h f30, f19, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f30, 0(x2) # load 0x00007dff from memory into f30
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f18, 0(x2) # load 0x0000fbff from memory into f18
fsgnj.h f9, f30, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f28, 0(x2) # load 0x00007dff from memory into f28
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f17, 0(x2) # load 0x000003ff from memory into f17
fsgnj.h f29, f28, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f19, 0(x2) # load 0x00007dff from memory into f19
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f7, 0(x2) # load 0x000083ff from memory into f7
fsgnj.h f10, f19, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f25, 0(x2) # load 0x00007dff from memory into f25
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f12, 0(x2) # load 0x00000200 from memory into f12
fsgnj.h f16, f25, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f26, 0(x2) # load 0x00007dff from memory into f26
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f15, 0(x2) # load 0x00008200 from memory into f15
fsgnj.h f14, f26, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f11, 0(x2) # load 0x00007dff from memory into f11
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f21, 0(x2) # load 0x00000001 from memory into f21
fsgnj.h f19, f11, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f11, 0(x2) # load 0x00007dff from memory into f11
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f23, 0(x2) # load 0x00008001 from memory into f23
fsgnj.h f14, f11, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f17, 0(x2) # load 0x00007dff from memory into f17
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f19, 0(x2) # load 0x00007c00 from memory into f19
fsgnj.h f30, f17, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f18, 0(x2) # load 0x00007dff from memory into f18
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f24, 0(x2) # load 0x0000fc00 from memory into f24
fsgnj.h f30, f18, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f21, 0(x2) # load 0x00007dff from memory into f21
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f20, 0(x2) # load 0x00007e00 from memory into f20
fsgnj.h f19, f21, f20 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f3, 0(x2) # load 0x00007dff from memory into f3
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f28, 0(x2) # load 0x00007fff from memory into f28
fsgnj.h f2, f3, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f9, 0(x2) # load 0x00007dff from memory into f9
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f10, 0(x2) # load 0x0000fe00 from memory into f10
fsgnj.h f13, f9, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f31, 0(x2) # load 0x00007dff from memory into f31
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f19, 0(x2) # load 0x00007c01 from memory into f19
fsgnj.h f8, f31, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f27, 0(x2) # load 0x00007dff from memory into f27
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f5, 0(x2) # load 0x00007dff from memory into f5
fsgnj.h f13, f27, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f29, 0(x2) # load 0x00007dff from memory into f29
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f25, 0(x2) # load 0x0000fc01 from memory into f25
fsgnj.h f17, f29, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f15, 0(x2) # load 0x00007dff from memory into f15
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f16, 0(x2) # load 0x000058b4 from memory into f16
fsgnj.h f17, f15, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x7dff fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f24, 0(x2) # load 0x00007dff from memory into f24
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f26, 0(x2) # load 0x0000c93a from memory into f26
fsgnj.h f2, f24, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f21, 0(x2) # load 0x00000000 from memory into f21
fsgnj.h f3, f23, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f12, 0(x2) # load 0x0000fc01 from memory into f12
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f2, 0(x2) # load 0x00008000 from memory into f2
fsgnj.h f29, f12, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f25, 0(x2) # load 0x0000fc01 from memory into f25
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f27, 0(x2) # load 0x00003c00 from memory into f27
fsgnj.h f14, f25, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f17, 0(x2) # load 0x0000bc00 from memory into f17
fsgnj.h f31, f23, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f8, 0(x2) # load 0x0000fc01 from memory into f8
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f15, 0(x2) # load 0x00003e00 from memory into f15
fsgnj.h f2, f8, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f23, 0(x2) # load 0x0000fc01 from memory into f23
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f10, 0(x2) # load 0x0000be00 from memory into f10
fsgnj.h f26, f23, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f19, 0(x2) # load 0x0000fc01 from memory into f19
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f17, 0(x2) # load 0x00004000 from memory into f17
fsgnj.h f16, f19, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f24, 0(x2) # load 0x0000fc01 from memory into f24
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f11, 0(x2) # load 0x0000c000 from memory into f11
fsgnj.h f1, f24, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f1, 0(x2) # load 0x0000fc01 from memory into f1
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f16, 0(x2) # load 0x00000400 from memory into f16
fsgnj.h f25, f1, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f11, 0(x2) # load 0x0000fc01 from memory into f11
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f29, 0(x2) # load 0x00008400 from memory into f29
fsgnj.h f22, f11, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f1, 0(x2) # load 0x0000fc01 from memory into f1
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f7, 0(x2) # load 0x00007bff from memory into f7
fsgnj.h f15, f1, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f2, 0(x2) # load 0x0000fc01 from memory into f2
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f22, 0(x2) # load 0x0000fbff from memory into f22
fsgnj.h f14, f2, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f21, 0(x2) # load 0x0000fc01 from memory into f21
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f13, 0(x2) # load 0x000003ff from memory into f13
fsgnj.h f10, f21, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f24, 0(x2) # load 0x0000fc01 from memory into f24
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f25, 0(x2) # load 0x000083ff from memory into f25
fsgnj.h f15, f24, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f29, 0(x2) # load 0x0000fc01 from memory into f29
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f31, 0(x2) # load 0x00000200 from memory into f31
fsgnj.h f3, f29, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f27, 0(x2) # load 0x0000fc01 from memory into f27
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f31, 0(x2) # load 0x00008200 from memory into f31
fsgnj.h f5, f27, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f3, 0(x2) # load 0x0000fc01 from memory into f3
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f11, 0(x2) # load 0x00000001 from memory into f11
fsgnj.h f20, f3, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f21, 0(x2) # load 0x0000fc01 from memory into f21
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f1, 0(x2) # load 0x00008001 from memory into f1
fsgnj.h f14, f21, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f24, 0(x2) # load 0x0000fc01 from memory into f24
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f14, 0(x2) # load 0x00007c00 from memory into f14
fsgnj.h f6, f24, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f10, 0(x2) # load 0x0000fc01 from memory into f10
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f27, 0(x2) # load 0x0000fc00 from memory into f27
fsgnj.h f29, f10, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f14, 0(x2) # load 0x0000fc01 from memory into f14
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f19, 0(x2) # load 0x00007e00 from memory into f19
fsgnj.h f31, f14, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f13, 0(x2) # load 0x0000fc01 from memory into f13
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f24, 0(x2) # load 0x00007fff from memory into f24
fsgnj.h f31, f13, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f1, 0(x2) # load 0x0000fc01 from memory into f1
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f7, 0(x2) # load 0x0000fe00 from memory into f7
fsgnj.h f11, f1, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f16, 0(x2) # load 0x0000fc01 from memory into f16
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f1, 0(x2) # load 0x00007c01 from memory into f1
fsgnj.h f27, f16, f1 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f10, 0(x2) # load 0x0000fc01 from memory into f10
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f30, 0(x2) # load 0x00007dff from memory into f30
fsgnj.h f12, f10, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f27, 0(x2) # load 0x0000fc01 from memory into f27
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f12, 0(x2) # load 0x0000fc01 from memory into f12
fsgnj.h f28, f27, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f28, 0(x2) # load 0x0000fc01 from memory into f28
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f9, 0(x2) # load 0x000058b4 from memory into f9
fsgnj.h f6, f28, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xfc01 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f29, 0(x2) # load 0x0000fc01 from memory into f29
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f14, 0(x2) # load 0x0000c93a from memory into f14
fsgnj.h f20, f29, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f17, 0(x2) # load 0x000058b4 from memory into f17
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f23, 0(x2) # load 0x00000000 from memory into f23
fsgnj.h f20, f17, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f21, 0(x2) # load 0x000058b4 from memory into f21
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f5, 0(x2) # load 0x00008000 from memory into f5
fsgnj.h f25, f21, f5 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f16, 0(x2) # load 0x000058b4 from memory into f16
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f8, 0(x2) # load 0x00003c00 from memory into f8
fsgnj.h f20, f16, f8 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f11, 0(x2) # load 0x000058b4 from memory into f11
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f21, 0(x2) # load 0x0000bc00 from memory into f21
fsgnj.h f2, f11, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f30, 0(x2) # load 0x000058b4 from memory into f30
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f17, 0(x2) # load 0x00003e00 from memory into f17
fsgnj.h f10, f30, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f7, 0(x2) # load 0x000058b4 from memory into f7
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f17, 0(x2) # load 0x0000be00 from memory into f17
fsgnj.h f22, f7, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f30, 0(x2) # load 0x000058b4 from memory into f30
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f28, 0(x2) # load 0x00004000 from memory into f28
fsgnj.h f20, f30, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f13, 0(x2) # load 0x000058b4 from memory into f13
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f28, 0(x2) # load 0x0000c000 from memory into f28
fsgnj.h f5, f13, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f24, 0(x2) # load 0x000058b4 from memory into f24
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f25, 0(x2) # load 0x00000400 from memory into f25
fsgnj.h f9, f24, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f16, 0(x2) # load 0x000058b4 from memory into f16
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f30, 0(x2) # load 0x00008400 from memory into f30
fsgnj.h f24, f16, f30 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f10, 0(x2) # load 0x000058b4 from memory into f10
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f16, 0(x2) # load 0x00007bff from memory into f16
fsgnj.h f6, f10, f16 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f27, 0(x2) # load 0x000058b4 from memory into f27
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f18, 0(x2) # load 0x0000fbff from memory into f18
fsgnj.h f26, f27, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f19, 0(x2) # load 0x000058b4 from memory into f19
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f13, 0(x2) # load 0x000003ff from memory into f13
fsgnj.h f31, f19, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f10, 0(x2) # load 0x000058b4 from memory into f10
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f11, 0(x2) # load 0x000083ff from memory into f11
fsgnj.h f6, f10, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f26, 0(x2) # load 0x000058b4 from memory into f26
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f22, 0(x2) # load 0x00000200 from memory into f22
fsgnj.h f25, f26, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f14, 0(x2) # load 0x000058b4 from memory into f14
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f28, 0(x2) # load 0x00008200 from memory into f28
fsgnj.h f5, f14, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f28, 0(x2) # load 0x000058b4 from memory into f28
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f12, 0(x2) # load 0x00000001 from memory into f12
fsgnj.h f21, f28, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f6, 0(x2) # load 0x000058b4 from memory into f6
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f29, 0(x2) # load 0x00008001 from memory into f29
fsgnj.h f15, f6, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f13, 0(x2) # load 0x000058b4 from memory into f13
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f23, 0(x2) # load 0x00007c00 from memory into f23
fsgnj.h f12, f13, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f16, 0(x2) # load 0x000058b4 from memory into f16
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f17, 0(x2) # load 0x0000fc00 from memory into f17
fsgnj.h f10, f16, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f5, 0(x2) # load 0x000058b4 from memory into f5
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f19, 0(x2) # load 0x00007e00 from memory into f19
fsgnj.h f26, f5, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f5, 0(x2) # load 0x000058b4 from memory into f5
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f13, 0(x2) # load 0x00007fff from memory into f13
fsgnj.h f27, f5, f13 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f8, 0(x2) # load 0x000058b4 from memory into f8
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f25, 0(x2) # load 0x0000fe00 from memory into f25
fsgnj.h f16, f8, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f19, 0(x2) # load 0x000058b4 from memory into f19
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f14, 0(x2) # load 0x00007c01 from memory into f14
fsgnj.h f17, f19, f14 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f1, 0(x2) # load 0x000058b4 from memory into f1
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f21, 0(x2) # load 0x00007dff from memory into f21
fsgnj.h f27, f1, f21 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f14, 0(x2) # load 0x000058b4 from memory into f14
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f18, 0(x2) # load 0x0000fc01 from memory into f18
fsgnj.h f20, f14, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f5, 0(x2) # load 0x000058b4 from memory into f5
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f17, 0(x2) # load 0x000058b4 from memory into f17
fsgnj.h f13, f5, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0x58b4 fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f21, 0(x2) # load 0x000058b4 from memory into f21
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f26, 0(x2) # load 0x0000c93a from memory into f26
fsgnj.h f12, f21, f26 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f7, 0(x2) # load 0x0000c93a from memory into f7
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f25, 0(x2) # load 0x00000000 from memory into f25
fsgnj.h f13, f7, f25 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f13, 0(x2) # load 0x0000c93a from memory into f13
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f27, 0(x2) # load 0x00008000 from memory into f27
fsgnj.h f23, f13, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f6, 0(x2) # load 0x0000c93a from memory into f6
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f28, 0(x2) # load 0x00003c00 from memory into f28
fsgnj.h f8, f6, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f26, 0(x2) # load 0x0000c93a from memory into f26
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f10, 0(x2) # load 0x0000bc00 from memory into f10
fsgnj.h f27, f26, f10 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f8, 0(x2) # load 0x0000c93a from memory into f8
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f11, 0(x2) # load 0x00003e00 from memory into f11
fsgnj.h f26, f8, f11 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f30, 0(x2) # load 0x0000c93a from memory into f30
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f31, 0(x2) # load 0x0000be00 from memory into f31
fsgnj.h f8, f30, f31 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f14, 0(x2) # load 0x0000c93a from memory into f14
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f7, 0(x2) # load 0x00004000 from memory into f7
fsgnj.h f11, f14, f7 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f3, 0(x2) # load 0x0000c93a from memory into f3
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f28, 0(x2) # load 0x0000c000 from memory into f28
fsgnj.h f2, f3, f28 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f28, 0(x2) # load 0x0000c93a from memory into f28
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f27, 0(x2) # load 0x00000400 from memory into f27
fsgnj.h f20, f28, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f23, 0(x2) # load 0x0000c93a from memory into f23
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
fsgnj.h f1, f23, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f16, 0(x2) # load 0x0000c93a from memory into f16
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f27, 0(x2) # load 0x00007bff from memory into f27
fsgnj.h f14, f16, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f22, 0(x2) # load 0x0000c93a from memory into f22
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f29, 0(x2) # load 0x0000fbff from memory into f29
fsgnj.h f8, f22, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f30, 0(x2) # load 0x0000c93a from memory into f30
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f6, 0(x2) # load 0x000003ff from memory into f6
fsgnj.h f27, f30, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f26, 0(x2) # load 0x0000c93a from memory into f26
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f19, 0(x2) # load 0x000083ff from memory into f19
fsgnj.h f25, f26, f19 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f21, 0(x2) # load 0x0000c93a from memory into f21
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f9, 0(x2) # load 0x00000200 from memory into f9
fsgnj.h f5, f21, f9 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f21, 0(x2) # load 0x0000c93a from memory into f21
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f12, 0(x2) # load 0x00008200 from memory into f12
fsgnj.h f14, f21, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f1, 0(x2) # load 0x0000c93a from memory into f1
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f22, 0(x2) # load 0x00000001 from memory into f22
fsgnj.h f9, f1, f22 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f18, 0(x2) # load 0x0000c93a from memory into f18
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f15, 0(x2) # load 0x00008001 from memory into f15
fsgnj.h f7, f18, f15 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f11, 0(x2) # load 0x0000c93a from memory into f11
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f23, 0(x2) # load 0x00007c00 from memory into f23
fsgnj.h f30, f11, f23 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f18, 0(x2) # load 0x0000c93a from memory into f18
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f29, 0(x2) # load 0x0000fc00 from memory into f29
fsgnj.h f17, f18, f29 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f11, 0(x2) # load 0x0000c93a from memory into f11
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f6, 0(x2) # load 0x00007e00 from memory into f6
fsgnj.h f28, f11, f6 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f24, 0(x2) # load 0x0000c93a from memory into f24
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f12, 0(x2) # load 0x00007fff from memory into f12
fsgnj.h f1, f24, f12 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f7, 0(x2) # load 0x0000c93a from memory into f7
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f24, 0(x2) # load 0x0000fe00 from memory into f24
fsgnj.h f5, f7, f24 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f8, 0(x2) # load 0x0000c93a from memory into f8
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f17, 0(x2) # load 0x00007c01 from memory into f17
fsgnj.h f27, f8, f17 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f1, 0(x2) # load 0x0000c93a from memory into f1
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f27, 0(x2) # load 0x00007dff from memory into f27
fsgnj.h f21, f1, f27 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f3, 0(x2) # load 0x0000c93a from memory into f3
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f2, 0(x2) # load 0x0000fc01 from memory into f2
fsgnj.h f1, f3, f2 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f1, 0(x2) # load 0x0000c93a from memory into f1
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f18, 0(x2) # load 0x000058b4 from memory into f18
fsgnj.h f10, f1, f18 # perform operation

# Testcase cr_fs1_fs2_corners (Test source fs1 = 0xc93a fs2 = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f18, 0(x2) # load 0x0000c93a from memory into f18
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f22, 0(x2) # load 0x0000c93a from memory into f22
fsgnj.h f19, f18, f22 # perform operation

# Testcase Random test for cp_NaNBox 
la x2, scratch
li x3, 0x8f19def961cb88eb # load x3 with value 0x8f19def961cb88eb
sw x3, 0(x2) # store 0x8f19def961cb88eb in memory
flh f8, 0(x2) # load 0x8f19def961cb88eb from memory into f8
la x2, scratch
li x3, 0x7395190f0e0ae429 # load x3 with value 0x7395190f0e0ae429
sw x3, 0(x2) # store 0x7395190f0e0ae429 in memory
flh f12, 0(x2) # load 0x7395190f0e0ae429 from memory into f12
fsgnj.h f6, f8, f12 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0x0 in f17)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f17, 0(x2) # load 0x00000000 from memory into f17
la x2, scratch
li x3, 0xe0245adc8a4217fd # load x3 with value 0xe0245adc8a4217fd
sw x3, 0(x2) # store 0xe0245adc8a4217fd in memory
flw f3, 0(x2) # load 0xe0245adc8a4217fd from memory into f3
fsgnj.h f5, f17, f3 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xfffe8000 in f11)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfffe8000 # load x3 with value 0xfffe8000
sw x3, 0(x2) # store 0xfffe8000 in memory
flw f11, 0(x2) # load 0xfffe8000 from memory into f11
la x2, scratch
li x3, 0xf1159e67a5be9a27 # load x3 with value 0xf1159e67a5be9a27
sw x3, 0(x2) # store 0xf1159e67a5be9a27 in memory
flw f13, 0(x2) # load 0xf1159e67a5be9a27 from memory into f13
fsgnj.h f21, f11, f13 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0x7fff3c00 in f3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fff3c00 # load x3 with value 0x7fff3c00
sw x3, 0(x2) # store 0x7fff3c00 in memory
flw f3, 0(x2) # load 0x7fff3c00 from memory into f3
la x2, scratch
li x3, 0x9b3705c37d824b14 # load x3 with value 0x9b3705c37d824b14
sw x3, 0(x2) # store 0x9b3705c37d824b14 in memory
flw f2, 0(x2) # load 0x9b3705c37d824b14 from memory into f2
fsgnj.h f20, f3, f2 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xbeefbc00 in f23)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbeefbc00 # load x3 with value 0xbeefbc00
sw x3, 0(x2) # store 0xbeefbc00 in memory
flw f23, 0(x2) # load 0xbeefbc00 from memory into f23
la x2, scratch
li x3, 0x3cd827f4000f68e9 # load x3 with value 0x3cd827f4000f68e9
sw x3, 0(x2) # store 0x3cd827f4000f68e9 in memory
flw f3, 0(x2) # load 0x3cd827f4000f68e9 from memory into f3
fsgnj.h f7, f23, f3 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xfeff0400 in f12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeff0400 # load x3 with value 0xfeff0400
sw x3, 0(x2) # store 0xfeff0400 in memory
flw f12, 0(x2) # load 0xfeff0400 from memory into f12
la x2, scratch
li x3, 0x5d837b66c218c33d # load x3 with value 0x5d837b66c218c33d
sw x3, 0(x2) # store 0x5d837b66c218c33d in memory
flw f8, 0(x2) # load 0x5d837b66c218c33d from memory into f8
fsgnj.h f2, f12, f8 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xfff8400 in f1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0fff8400 # load x3 with value 0x0fff8400
sw x3, 0(x2) # store 0x0fff8400 in memory
flw f1, 0(x2) # load 0x0fff8400 from memory into f1
la x2, scratch
li x3, 0xbbc3673a25026a5c # load x3 with value 0xbbc3673a25026a5c
sw x3, 0(x2) # store 0xbbc3673a25026a5c in memory
flw f26, 0(x2) # load 0xbbc3673a25026a5c from memory into f26
fsgnj.h f3, f1, f26 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xefff7bff in f16)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xefff7bff # load x3 with value 0xefff7bff
sw x3, 0(x2) # store 0xefff7bff in memory
flw f16, 0(x2) # load 0xefff7bff from memory into f16
la x2, scratch
li x3, 0xc2329dcddc00f481 # load x3 with value 0xc2329dcddc00f481
sw x3, 0(x2) # store 0xc2329dcddc00f481 in memory
flw f29, 0(x2) # load 0xc2329dcddc00f481 from memory into f29
fsgnj.h f23, f16, f29 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xc0defbff in f14)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc0defbff # load x3 with value 0xc0defbff
sw x3, 0(x2) # store 0xc0defbff in memory
flw f14, 0(x2) # load 0xc0defbff from memory into f14
la x2, scratch
li x3, 0x4e845151ff997d9b # load x3 with value 0x4e845151ff997d9b
sw x3, 0(x2) # store 0x4e845151ff997d9b in memory
flw f26, 0(x2) # load 0x4e845151ff997d9b from memory into f26
fsgnj.h f18, f14, f26 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0x4f1a7c00 in f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4f1a7c00 # load x3 with value 0x4f1a7c00
sw x3, 0(x2) # store 0x4f1a7c00 in memory
flw f31, 0(x2) # load 0x4f1a7c00 from memory into f31
la x2, scratch
li x3, 0x2ce4625938339f26 # load x3 with value 0x2ce4625938339f26
sw x3, 0(x2) # store 0x2ce4625938339f26 in memory
flw f12, 0(x2) # load 0x2ce4625938339f26 from memory into f12
fsgnj.h f17, f31, f12 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xffffc00 in f11)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0ffffc00 # load x3 with value 0x0ffffc00
sw x3, 0(x2) # store 0x0ffffc00 in memory
flw f11, 0(x2) # load 0x0ffffc00 from memory into f11
la x2, scratch
li x3, 0x9a81ecb2a2c528ae # load x3 with value 0x9a81ecb2a2c528ae
sw x3, 0(x2) # store 0x9a81ecb2a2c528ae in memory
flw f26, 0(x2) # load 0x9a81ecb2a2c528ae from memory into f26
fsgnj.h f24, f11, f26 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xffef7e00 in f26)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffef7e00 # load x3 with value 0xffef7e00
sw x3, 0(x2) # store 0xffef7e00 in memory
flw f26, 0(x2) # load 0xffef7e00 from memory into f26
la x2, scratch
li x3, 0x707820ef42ed408 # load x3 with value 0x707820ef42ed408
sw x3, 0(x2) # store 0x707820ef42ed408 in memory
flw f31, 0(x2) # load 0x707820ef42ed408 from memory into f31
fsgnj.h f29, f26, f31 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xfeef7fff in f15)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeef7fff # load x3 with value 0xfeef7fff
sw x3, 0(x2) # store 0xfeef7fff in memory
flw f15, 0(x2) # load 0xfeef7fff from memory into f15
la x2, scratch
li x3, 0x26f8c731727417bf # load x3 with value 0x26f8c731727417bf
sw x3, 0(x2) # store 0x26f8c731727417bf in memory
flw f7, 0(x2) # load 0x26f8c731727417bf from memory into f7
fsgnj.h f1, f15, f7 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0xa1b27c01 in f28)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa1b27c01 # load x3 with value 0xa1b27c01
sw x3, 0(x2) # store 0xa1b27c01 in memory
flw f28, 0(x2) # load 0xa1b27c01 from memory into f28
la x2, scratch
li x3, 0xf86953b2ffb0f510 # load x3 with value 0xf86953b2ffb0f510
sw x3, 0(x2) # store 0xf86953b2ffb0f510 in memory
flw f27, 0(x2) # load 0xf86953b2ffb0f510 from memory into f27
fsgnj.h f24, f28, f27 # perform operation

# Testcase Improper NaNBoxed argument test (Value 0x4fd77dff in f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4fd77dff # load x3 with value 0x4fd77dff
sw x3, 0(x2) # store 0x4fd77dff in memory
flw f8, 0(x2) # load 0x4fd77dff from memory into f8
la x2, scratch
li x3, 0x1b46da6c7c969a17 # load x3 with value 0x1b46da6c7c969a17
sw x3, 0(x2) # store 0x1b46da6c7c969a17 in memory
flw f10, 0(x2) # load 0x1b46da6c7c969a17 from memory into f10
fsgnj.h f30, f8, f10 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x0)
la x2, scratch
li x3, 0xa991f9c6e9d6e420 # load x3 with value 0xa991f9c6e9d6e420
sw x3, 0(x2) # store 0xa991f9c6e9d6e420 in memory
flw f31, 0(x2) # load 0xa991f9c6e9d6e420 from memory into f31
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f20, 0(x2) # load 0x00000000 from memory into f20
fsgnj.h f7, f31, f20 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfffe8000)
la x2, scratch
li x3, 0xd65944624d3d4e38 # load x3 with value 0xd65944624d3d4e38
sw x3, 0(x2) # store 0xd65944624d3d4e38 in memory
flw f15, 0(x2) # load 0xd65944624d3d4e38 from memory into f15
la x2, scratch
li x3, 0xfffe8000 # load x3 with value 0xfffe8000
sw x3, 0(x2) # store 0xfffe8000 in memory
flw f5, 0(x2) # load 0xfffe8000 from memory into f5
fsgnj.h f31, f15, f5 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x7fff3c00)
la x2, scratch
li x3, 0xab8e2cb616a8d1fc # load x3 with value 0xab8e2cb616a8d1fc
sw x3, 0(x2) # store 0xab8e2cb616a8d1fc in memory
flw f11, 0(x2) # load 0xab8e2cb616a8d1fc from memory into f11
la x2, scratch
li x3, 0x7fff3c00 # load x3 with value 0x7fff3c00
sw x3, 0(x2) # store 0x7fff3c00 in memory
flw f12, 0(x2) # load 0x7fff3c00 from memory into f12
fsgnj.h f6, f11, f12 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xbeefbc00)
la x2, scratch
li x3, 0x6dc2f94dae5bee85 # load x3 with value 0x6dc2f94dae5bee85
sw x3, 0(x2) # store 0x6dc2f94dae5bee85 in memory
flw f12, 0(x2) # load 0x6dc2f94dae5bee85 from memory into f12
la x2, scratch
li x3, 0xbeefbc00 # load x3 with value 0xbeefbc00
sw x3, 0(x2) # store 0xbeefbc00 in memory
flw f8, 0(x2) # load 0xbeefbc00 from memory into f8
fsgnj.h f9, f12, f8 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfeff0400)
la x2, scratch
li x3, 0x1bfcc0703b620f08 # load x3 with value 0x1bfcc0703b620f08
sw x3, 0(x2) # store 0x1bfcc0703b620f08 in memory
flw f24, 0(x2) # load 0x1bfcc0703b620f08 from memory into f24
la x2, scratch
li x3, 0xfeff0400 # load x3 with value 0xfeff0400
sw x3, 0(x2) # store 0xfeff0400 in memory
flw f26, 0(x2) # load 0xfeff0400 from memory into f26
fsgnj.h f1, f24, f26 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfff8400)
la x2, scratch
li x3, 0xc8fcec6d09150f00 # load x3 with value 0xc8fcec6d09150f00
sw x3, 0(x2) # store 0xc8fcec6d09150f00 in memory
flw f27, 0(x2) # load 0xc8fcec6d09150f00 from memory into f27
la x2, scratch
li x3, 0x0fff8400 # load x3 with value 0x0fff8400
sw x3, 0(x2) # store 0x0fff8400 in memory
flw f26, 0(x2) # load 0x0fff8400 from memory into f26
fsgnj.h f2, f27, f26 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xefff7bff)
la x2, scratch
li x3, 0xcedf3b861b01fb05 # load x3 with value 0xcedf3b861b01fb05
sw x3, 0(x2) # store 0xcedf3b861b01fb05 in memory
flw f25, 0(x2) # load 0xcedf3b861b01fb05 from memory into f25
la x2, scratch
li x3, 0xefff7bff # load x3 with value 0xefff7bff
sw x3, 0(x2) # store 0xefff7bff in memory
flw f12, 0(x2) # load 0xefff7bff from memory into f12
fsgnj.h f28, f25, f12 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xc0defbff)
la x2, scratch
li x3, 0x953aaf5f4d008b0c # load x3 with value 0x953aaf5f4d008b0c
sw x3, 0(x2) # store 0x953aaf5f4d008b0c in memory
flw f17, 0(x2) # load 0x953aaf5f4d008b0c from memory into f17
la x2, scratch
li x3, 0xc0defbff # load x3 with value 0xc0defbff
sw x3, 0(x2) # store 0xc0defbff in memory
flw f23, 0(x2) # load 0xc0defbff from memory into f23
fsgnj.h f29, f17, f23 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x4f1a7c00)
la x2, scratch
li x3, 0x408f16611548713 # load x3 with value 0x408f16611548713
sw x3, 0(x2) # store 0x408f16611548713 in memory
flw f18, 0(x2) # load 0x408f16611548713 from memory into f18
la x2, scratch
li x3, 0x4f1a7c00 # load x3 with value 0x4f1a7c00
sw x3, 0(x2) # store 0x4f1a7c00 in memory
flw f6, 0(x2) # load 0x4f1a7c00 from memory into f6
fsgnj.h f16, f18, f6 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xffffc00)
la x2, scratch
li x3, 0x3a32ebf800dda03d # load x3 with value 0x3a32ebf800dda03d
sw x3, 0(x2) # store 0x3a32ebf800dda03d in memory
flw f30, 0(x2) # load 0x3a32ebf800dda03d from memory into f30
la x2, scratch
li x3, 0x0ffffc00 # load x3 with value 0x0ffffc00
sw x3, 0(x2) # store 0x0ffffc00 in memory
flw f10, 0(x2) # load 0x0ffffc00 from memory into f10
fsgnj.h f28, f30, f10 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xffef7e00)
la x2, scratch
li x3, 0xc5f59b48acac734e # load x3 with value 0xc5f59b48acac734e
sw x3, 0(x2) # store 0xc5f59b48acac734e in memory
flw f30, 0(x2) # load 0xc5f59b48acac734e from memory into f30
la x2, scratch
li x3, 0xffef7e00 # load x3 with value 0xffef7e00
sw x3, 0(x2) # store 0xffef7e00 in memory
flw f2, 0(x2) # load 0xffef7e00 from memory into f2
fsgnj.h f6, f30, f2 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xfeef7fff)
la x2, scratch
li x3, 0x801030bf72948ecc # load x3 with value 0x801030bf72948ecc
sw x3, 0(x2) # store 0x801030bf72948ecc in memory
flw f11, 0(x2) # load 0x801030bf72948ecc from memory into f11
la x2, scratch
li x3, 0xfeef7fff # load x3 with value 0xfeef7fff
sw x3, 0(x2) # store 0xfeef7fff in memory
flw f24, 0(x2) # load 0xfeef7fff from memory into f24
fsgnj.h f15, f11, f24 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0xa1b27c01)
la x2, scratch
li x3, 0x3ec410f6aec7956 # load x3 with value 0x3ec410f6aec7956
sw x3, 0(x2) # store 0x3ec410f6aec7956 in memory
flw f22, 0(x2) # load 0x3ec410f6aec7956 from memory into f22
la x2, scratch
li x3, 0xa1b27c01 # load x3 with value 0xa1b27c01
sw x3, 0(x2) # store 0xa1b27c01 in memory
flw f16, 0(x2) # load 0xa1b27c01 from memory into f16
fsgnj.h f24, f22, f16 # perform operation

# Testcase cp_fs2_corners (Test source fs2 value = 0x4fd77dff)
la x2, scratch
li x3, 0x7b0b3932cff5a146 # load x3 with value 0x7b0b3932cff5a146
sw x3, 0(x2) # store 0x7b0b3932cff5a146 in memory
flw f15, 0(x2) # load 0x7b0b3932cff5a146 from memory into f15
la x2, scratch
li x3, 0x4fd77dff # load x3 with value 0x4fd77dff
sw x3, 0(x2) # store 0x4fd77dff in memory
flw f31, 0(x2) # load 0x4fd77dff from memory into f31
fsgnj.h f25, f15, f31 # perform operation

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
li x3, 0xdbeddda4eb3347c2 # load x3 with value 0xdbeddda4eb3347c2
sw x3, 0(x2) # store 0xdbeddda4eb3347c2 in memory
flh f31, 0(x2) # load 0xdbeddda4eb3347c2 from memory into f31
fcvt.wu.h x0, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x0, 0)

# Testcase cp_rd (Test destination rd = x1)
la x2, scratch
li x3, 0x8c5351498174167b # load x3 with value 0x8c5351498174167b
sw x3, 0(x2) # store 0x8c5351498174167b in memory
flh f29, 0(x2) # load 0x8c5351498174167b from memory into f29
fcvt.wu.h x1, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 8)

# Testcase cp_rd (Test destination rd = x2)
la x2, scratch
li x3, 0xbdb1ac3907c0859d # load x3 with value 0xbdb1ac3907c0859d
sw x3, 0(x2) # store 0xbdb1ac3907c0859d in memory
flh f7, 0(x2) # load 0xbdb1ac3907c0859d from memory into f7
fcvt.wu.h x2, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 16)

# Testcase cp_rd (Test destination rd = x3)
la x2, scratch
li x3, 0xa4a6a098e456234e # load x3 with value 0xa4a6a098e456234e
sw x3, 0(x2) # store 0xa4a6a098e456234e in memory
flh f15, 0(x2) # load 0xa4a6a098e456234e from memory into f15
fcvt.wu.h x3, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 24)

# Testcase cp_rd (Test destination rd = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x407c3d9dec425f42 # load x3 with value 0x407c3d9dec425f42
sw x3, 0(x2) # store 0x407c3d9dec425f42 in memory
flh f28, 0(x2) # load 0x407c3d9dec425f42 from memory into f28
fcvt.wu.h x4, f28 # perform operation
RVTEST_SIGUPD(x5, x0, x4, 32)

# Testcase cp_rd (Test destination rd = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x1f1b0eca1e0e0965 # load x3 with value 0x1f1b0eca1e0e0965
sw x3, 0(x2) # store 0x1f1b0eca1e0e0965 in memory
flh f22, 0(x2) # load 0x1f1b0eca1e0e0965 from memory into f22
fcvt.wu.h x5, f22 # perform operation
RVTEST_SIGUPD(x6, x0, x5, 40)

# Testcase cp_rd (Test destination rd = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x29da12febcc846bc # load x3 with value 0x29da12febcc846bc
sw x3, 0(x2) # store 0x29da12febcc846bc in memory
flh f12, 0(x2) # load 0x29da12febcc846bc from memory into f12
fcvt.wu.h x6, f12 # perform operation
RVTEST_SIGUPD(x7, x0, x6, 48)

# Testcase cp_rd (Test destination rd = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x63befabcc2d96bd6 # load x3 with value 0x63befabcc2d96bd6
sw x3, 0(x2) # store 0x63befabcc2d96bd6 in memory
flh f29, 0(x2) # load 0x63befabcc2d96bd6 from memory into f29
fcvt.wu.h x7, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 56)

# Testcase cp_rd (Test destination rd = x8)
la x2, scratch
li x3, 0x6e65c15c9eaeea7b # load x3 with value 0x6e65c15c9eaeea7b
sw x3, 0(x2) # store 0x6e65c15c9eaeea7b in memory
flh f12, 0(x2) # load 0x6e65c15c9eaeea7b from memory into f12
fcvt.wu.h x8, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 64)

# Testcase cp_rd (Test destination rd = x9)
la x2, scratch
li x3, 0x2c15d52e5c0c89e8 # load x3 with value 0x2c15d52e5c0c89e8
sw x3, 0(x2) # store 0x2c15d52e5c0c89e8 in memory
flh f9, 0(x2) # load 0x2c15d52e5c0c89e8 from memory into f9
fcvt.wu.h x9, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 72)

# Testcase cp_rd (Test destination rd = x10)
la x2, scratch
li x3, 0x6ce0897425ed2f66 # load x3 with value 0x6ce0897425ed2f66
sw x3, 0(x2) # store 0x6ce0897425ed2f66 in memory
flh f18, 0(x2) # load 0x6ce0897425ed2f66 from memory into f18
fcvt.wu.h x10, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 80)

# Testcase cp_rd (Test destination rd = x11)
la x2, scratch
li x3, 0x9b3b8a63a2bbe34b # load x3 with value 0x9b3b8a63a2bbe34b
sw x3, 0(x2) # store 0x9b3b8a63a2bbe34b in memory
flh f2, 0(x2) # load 0x9b3b8a63a2bbe34b from memory into f2
fcvt.wu.h x11, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 88)

# Testcase cp_rd (Test destination rd = x12)
la x2, scratch
li x3, 0x5ed544d3c710b90c # load x3 with value 0x5ed544d3c710b90c
sw x3, 0(x2) # store 0x5ed544d3c710b90c in memory
flh f21, 0(x2) # load 0x5ed544d3c710b90c from memory into f21
fcvt.wu.h x12, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 96)

# Testcase cp_rd (Test destination rd = x13)
la x2, scratch
li x3, 0x5d3a9383dcdb5b44 # load x3 with value 0x5d3a9383dcdb5b44
sw x3, 0(x2) # store 0x5d3a9383dcdb5b44 in memory
flh f14, 0(x2) # load 0x5d3a9383dcdb5b44 from memory into f14
fcvt.wu.h x13, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 104)

# Testcase cp_rd (Test destination rd = x14)
la x2, scratch
li x3, 0x1d7188efb271fb20 # load x3 with value 0x1d7188efb271fb20
sw x3, 0(x2) # store 0x1d7188efb271fb20 in memory
flh f10, 0(x2) # load 0x1d7188efb271fb20 from memory into f10
fcvt.wu.h x14, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 112)

# Testcase cp_rd (Test destination rd = x15)
la x2, scratch
li x3, 0x100625b625fda6a3 # load x3 with value 0x100625b625fda6a3
sw x3, 0(x2) # store 0x100625b625fda6a3 in memory
flh f19, 0(x2) # load 0x100625b625fda6a3 from memory into f19
fcvt.wu.h x15, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 120)

# Testcase cp_rd (Test destination rd = x16)
la x2, scratch
li x3, 0x4a1e25ac79825ba5 # load x3 with value 0x4a1e25ac79825ba5
sw x3, 0(x2) # store 0x4a1e25ac79825ba5 in memory
flh f20, 0(x2) # load 0x4a1e25ac79825ba5 from memory into f20
fcvt.wu.h x16, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 128)

# Testcase cp_rd (Test destination rd = x17)
la x2, scratch
li x3, 0xf01b43486c0784ac # load x3 with value 0xf01b43486c0784ac
sw x3, 0(x2) # store 0xf01b43486c0784ac in memory
flh f22, 0(x2) # load 0xf01b43486c0784ac from memory into f22
fcvt.wu.h x17, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 136)

# Testcase cp_rd (Test destination rd = x18)
la x2, scratch
li x3, 0x9ed34098ae4fc5df # load x3 with value 0x9ed34098ae4fc5df
sw x3, 0(x2) # store 0x9ed34098ae4fc5df in memory
flh f31, 0(x2) # load 0x9ed34098ae4fc5df from memory into f31
fcvt.wu.h x18, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 144)

# Testcase cp_rd (Test destination rd = x19)
la x2, scratch
li x3, 0x9228b7172b25ad2a # load x3 with value 0x9228b7172b25ad2a
sw x3, 0(x2) # store 0x9228b7172b25ad2a in memory
flh f10, 0(x2) # load 0x9228b7172b25ad2a from memory into f10
fcvt.wu.h x19, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 152)

# Testcase cp_rd (Test destination rd = x20)
la x2, scratch
li x3, 0x333c75e21c26fb8c # load x3 with value 0x333c75e21c26fb8c
sw x3, 0(x2) # store 0x333c75e21c26fb8c in memory
flh f25, 0(x2) # load 0x333c75e21c26fb8c from memory into f25
fcvt.wu.h x20, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 160)

# Testcase cp_rd (Test destination rd = x21)
la x2, scratch
li x3, 0xab82cf9cb729a98f # load x3 with value 0xab82cf9cb729a98f
sw x3, 0(x2) # store 0xab82cf9cb729a98f in memory
flh f26, 0(x2) # load 0xab82cf9cb729a98f from memory into f26
fcvt.wu.h x21, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 168)

# Testcase cp_rd (Test destination rd = x22)
la x2, scratch
li x3, 0x7154949398ef038e # load x3 with value 0x7154949398ef038e
sw x3, 0(x2) # store 0x7154949398ef038e in memory
flh f24, 0(x2) # load 0x7154949398ef038e from memory into f24
fcvt.wu.h x22, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 176)

# Testcase cp_rd (Test destination rd = x23)
la x2, scratch
li x3, 0x6cfa2c5a903b0aad # load x3 with value 0x6cfa2c5a903b0aad
sw x3, 0(x2) # store 0x6cfa2c5a903b0aad in memory
flh f5, 0(x2) # load 0x6cfa2c5a903b0aad from memory into f5
fcvt.wu.h x23, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 184)

# Testcase cp_rd (Test destination rd = x24)
la x2, scratch
li x3, 0xad2facc6f5556241 # load x3 with value 0xad2facc6f5556241
sw x3, 0(x2) # store 0xad2facc6f5556241 in memory
flh f25, 0(x2) # load 0xad2facc6f5556241 from memory into f25
fcvt.wu.h x24, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 192)

# Testcase cp_rd (Test destination rd = x25)
la x2, scratch
li x3, 0x9d5c4d7575d1b851 # load x3 with value 0x9d5c4d7575d1b851
sw x3, 0(x2) # store 0x9d5c4d7575d1b851 in memory
flh f8, 0(x2) # load 0x9d5c4d7575d1b851 from memory into f8
fcvt.wu.h x25, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 200)

# Testcase cp_rd (Test destination rd = x26)
la x2, scratch
li x3, 0x3431a30afb45c774 # load x3 with value 0x3431a30afb45c774
sw x3, 0(x2) # store 0x3431a30afb45c774 in memory
flh f18, 0(x2) # load 0x3431a30afb45c774 from memory into f18
fcvt.wu.h x26, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 208)

# Testcase cp_rd (Test destination rd = x27)
la x2, scratch
li x3, 0x14203d9c546776b5 # load x3 with value 0x14203d9c546776b5
sw x3, 0(x2) # store 0x14203d9c546776b5 in memory
flh f17, 0(x2) # load 0x14203d9c546776b5 from memory into f17
fcvt.wu.h x27, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 216)

# Testcase cp_rd (Test destination rd = x28)
la x2, scratch
li x3, 0xe0950286f3bcae3a # load x3 with value 0xe0950286f3bcae3a
sw x3, 0(x2) # store 0xe0950286f3bcae3a in memory
flh f6, 0(x2) # load 0xe0950286f3bcae3a from memory into f6
fcvt.wu.h x28, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 224)

# Testcase cp_rd (Test destination rd = x29)
la x2, scratch
li x3, 0x3020994be184e64f # load x3 with value 0x3020994be184e64f
sw x3, 0(x2) # store 0x3020994be184e64f in memory
flh f10, 0(x2) # load 0x3020994be184e64f from memory into f10
fcvt.wu.h x29, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 232)

# Testcase cp_rd (Test destination rd = x30)
la x2, scratch
li x3, 0x68119c1a5085e95e # load x3 with value 0x68119c1a5085e95e
sw x3, 0(x2) # store 0x68119c1a5085e95e in memory
flh f3, 0(x2) # load 0x68119c1a5085e95e from memory into f3
fcvt.wu.h x30, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 240)

# Testcase cp_rd (Test destination rd = x31)
la x2, scratch
li x3, 0xe735a6ee9f1bd2a0 # load x3 with value 0xe735a6ee9f1bd2a0
sw x3, 0(x2) # store 0xe735a6ee9f1bd2a0 in memory
flh f1, 0(x2) # load 0xe735a6ee9f1bd2a0 from memory into f1
fcvt.wu.h x31, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 248)

# Testcase cp_gpr/fpr_hazard nohaz test
add x16, x28, x12 # perform first operation
fcvt.wu.h x19, f18 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x24, x21, x26 # perform first operation
fcvt.wu.h x30, f29 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x18, x17, x16 # perform first operation
fcvt.wu.h x20, f8 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
fmul.s f23, f25, f14 # perform first operation
fcvt.wu.h x23, f23 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x12, x23, x15 # perform first operation
fcvt.wu.h x23, f17 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x31, x15, x26 # perform first operation
fcvt.wu.h x26, f10 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x21, x8, x18 # perform first operation
fcvt.wu.h x23, f15 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x26, x31, x2 # perform first operation
fcvt.wu.h x1, f12 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x13, x28, x8 # perform first operation
fcvt.wu.h x19, f7 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x11, x9, x8 # perform first operation
fcvt.wu.h x11, f10 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x19, x20, x25 # perform first operation
fcvt.wu.h x19, f27 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x16, x19, x29 # perform first operation
fcvt.wu.h x16, f1 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x24, x22, x12 # perform first operation
fcvt.wu.h x22, f28 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x12, x2, x13 # perform first operation
fcvt.wu.h x13, f24 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x5, x28, x25 # perform first operation
fcvt.wu.h x10, f23 # perform second (triggering) operation

# Testcase cp_fs1 (Test source fs1 = f0)
la x2, scratch
li x3, 0x88edf02e3411d3e6 # load x3 with value 0x88edf02e3411d3e6
sw x3, 0(x2) # store 0x88edf02e3411d3e6 in memory
flh f0, 0(x2) # load 0x88edf02e3411d3e6 from memory into f0
fcvt.wu.h x6, f0 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 256)

# Testcase cp_fs1 (Test source fs1 = f1)
la x2, scratch
li x3, 0x1ea7b4a97153219f # load x3 with value 0x1ea7b4a97153219f
sw x3, 0(x2) # store 0x1ea7b4a97153219f in memory
flh f1, 0(x2) # load 0x1ea7b4a97153219f from memory into f1
fcvt.wu.h x21, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 264)

# Testcase cp_fs1 (Test source fs1 = f2)
la x2, scratch
li x3, 0x805bb0de41e5f57d # load x3 with value 0x805bb0de41e5f57d
sw x3, 0(x2) # store 0x805bb0de41e5f57d in memory
flh f2, 0(x2) # load 0x805bb0de41e5f57d from memory into f2
fcvt.wu.h x13, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 272)

# Testcase cp_fs1 (Test source fs1 = f3)
la x2, scratch
li x3, 0x11557bcca6fc1cb9 # load x3 with value 0x11557bcca6fc1cb9
sw x3, 0(x2) # store 0x11557bcca6fc1cb9 in memory
flh f3, 0(x2) # load 0x11557bcca6fc1cb9 from memory into f3
fcvt.wu.h x13, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 280)

# Testcase cp_fs1 (Test source fs1 = f4)
mv x6, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xfd824c133bfb9665 # load x3 with value 0xfd824c133bfb9665
sw x3, 0(x2) # store 0xfd824c133bfb9665 in memory
flh f4, 0(x2) # load 0xfd824c133bfb9665 from memory into f4
fcvt.wu.h x20, f4 # perform operation
RVTEST_SIGUPD(x6, x0, x20, 288)

# Testcase cp_fs1 (Test source fs1 = f5)
la x2, scratch
li x3, 0x7bc56f387f0c4c6f # load x3 with value 0x7bc56f387f0c4c6f
sw x3, 0(x2) # store 0x7bc56f387f0c4c6f in memory
flh f5, 0(x2) # load 0x7bc56f387f0c4c6f from memory into f5
fcvt.wu.h x31, f5 # perform operation
RVTEST_SIGUPD(x6, x0, x31, 296)

# Testcase cp_fs1 (Test source fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xc5ce5c563718963f # load x3 with value 0xc5ce5c563718963f
sw x3, 0(x2) # store 0xc5ce5c563718963f in memory
flh f6, 0(x2) # load 0xc5ce5c563718963f from memory into f6
fcvt.wu.h x17, f6 # perform operation
RVTEST_SIGUPD(x7, x0, x17, 304)

# Testcase cp_fs1 (Test source fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x449b591d37419895 # load x3 with value 0x449b591d37419895
sw x3, 0(x2) # store 0x449b591d37419895 in memory
flh f7, 0(x2) # load 0x449b591d37419895 from memory into f7
fcvt.wu.h x2, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 312)

# Testcase cp_fs1 (Test source fs1 = f8)
la x2, scratch
li x3, 0xa3598ff595a141a8 # load x3 with value 0xa3598ff595a141a8
sw x3, 0(x2) # store 0xa3598ff595a141a8 in memory
flh f8, 0(x2) # load 0xa3598ff595a141a8 from memory into f8
fcvt.wu.h x13, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 320)

# Testcase cp_fs1 (Test source fs1 = f9)
la x2, scratch
li x3, 0x5edd88da454d94bd # load x3 with value 0x5edd88da454d94bd
sw x3, 0(x2) # store 0x5edd88da454d94bd in memory
flh f9, 0(x2) # load 0x5edd88da454d94bd from memory into f9
fcvt.wu.h x30, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 328)

# Testcase cp_fs1 (Test source fs1 = f10)
la x2, scratch
li x3, 0xa3e61bb4cc948ab # load x3 with value 0xa3e61bb4cc948ab
sw x3, 0(x2) # store 0xa3e61bb4cc948ab in memory
flh f10, 0(x2) # load 0xa3e61bb4cc948ab from memory into f10
fcvt.wu.h x24, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 336)

# Testcase cp_fs1 (Test source fs1 = f11)
la x2, scratch
li x3, 0x651631a412a4d34b # load x3 with value 0x651631a412a4d34b
sw x3, 0(x2) # store 0x651631a412a4d34b in memory
flh f11, 0(x2) # load 0x651631a412a4d34b from memory into f11
fcvt.wu.h x6, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 344)

# Testcase cp_fs1 (Test source fs1 = f12)
la x2, scratch
li x3, 0x105ba2ac69783c31 # load x3 with value 0x105ba2ac69783c31
sw x3, 0(x2) # store 0x105ba2ac69783c31 in memory
flh f12, 0(x2) # load 0x105ba2ac69783c31 from memory into f12
fcvt.wu.h x23, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 352)

# Testcase cp_fs1 (Test source fs1 = f13)
la x2, scratch
li x3, 0xa6110a06b93d587e # load x3 with value 0xa6110a06b93d587e
sw x3, 0(x2) # store 0xa6110a06b93d587e in memory
flh f13, 0(x2) # load 0xa6110a06b93d587e from memory into f13
fcvt.wu.h x17, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 360)

# Testcase cp_fs1 (Test source fs1 = f14)
la x2, scratch
li x3, 0xd7f7b4ef32d13875 # load x3 with value 0xd7f7b4ef32d13875
sw x3, 0(x2) # store 0xd7f7b4ef32d13875 in memory
flh f14, 0(x2) # load 0xd7f7b4ef32d13875 from memory into f14
fcvt.wu.h x14, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 368)

# Testcase cp_fs1 (Test source fs1 = f15)
la x2, scratch
li x3, 0xfe3686606db2bfe8 # load x3 with value 0xfe3686606db2bfe8
sw x3, 0(x2) # store 0xfe3686606db2bfe8 in memory
flh f15, 0(x2) # load 0xfe3686606db2bfe8 from memory into f15
fcvt.wu.h x25, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 376)

# Testcase cp_fs1 (Test source fs1 = f16)
la x2, scratch
li x3, 0xf63dfa96a49132f2 # load x3 with value 0xf63dfa96a49132f2
sw x3, 0(x2) # store 0xf63dfa96a49132f2 in memory
flh f16, 0(x2) # load 0xf63dfa96a49132f2 from memory into f16
fcvt.wu.h x26, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 384)

# Testcase cp_fs1 (Test source fs1 = f17)
la x2, scratch
li x3, 0x2c9a328e7a1a4b6d # load x3 with value 0x2c9a328e7a1a4b6d
sw x3, 0(x2) # store 0x2c9a328e7a1a4b6d in memory
flh f17, 0(x2) # load 0x2c9a328e7a1a4b6d from memory into f17
fcvt.wu.h x13, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 392)

# Testcase cp_fs1 (Test source fs1 = f18)
la x2, scratch
li x3, 0xdda5c14264d192ff # load x3 with value 0xdda5c14264d192ff
sw x3, 0(x2) # store 0xdda5c14264d192ff in memory
flh f18, 0(x2) # load 0xdda5c14264d192ff from memory into f18
fcvt.wu.h x13, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 400)

# Testcase cp_fs1 (Test source fs1 = f19)
la x2, scratch
li x3, 0x1a805d8882d0cacb # load x3 with value 0x1a805d8882d0cacb
sw x3, 0(x2) # store 0x1a805d8882d0cacb in memory
flh f19, 0(x2) # load 0x1a805d8882d0cacb from memory into f19
fcvt.wu.h x27, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 408)

# Testcase cp_fs1 (Test source fs1 = f20)
la x2, scratch
li x3, 0xe081efbd19a7afa2 # load x3 with value 0xe081efbd19a7afa2
sw x3, 0(x2) # store 0xe081efbd19a7afa2 in memory
flh f20, 0(x2) # load 0xe081efbd19a7afa2 from memory into f20
fcvt.wu.h x28, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 416)

# Testcase cp_fs1 (Test source fs1 = f21)
la x2, scratch
li x3, 0xdecc06cfbc7a6687 # load x3 with value 0xdecc06cfbc7a6687
sw x3, 0(x2) # store 0xdecc06cfbc7a6687 in memory
flh f21, 0(x2) # load 0xdecc06cfbc7a6687 from memory into f21
fcvt.wu.h x16, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 424)

# Testcase cp_fs1 (Test source fs1 = f22)
la x2, scratch
li x3, 0x702eb46985e55d26 # load x3 with value 0x702eb46985e55d26
sw x3, 0(x2) # store 0x702eb46985e55d26 in memory
flh f22, 0(x2) # load 0x702eb46985e55d26 from memory into f22
fcvt.wu.h x21, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 432)

# Testcase cp_fs1 (Test source fs1 = f23)
la x2, scratch
li x3, 0x210299cad576033 # load x3 with value 0x210299cad576033
sw x3, 0(x2) # store 0x210299cad576033 in memory
flh f23, 0(x2) # load 0x210299cad576033 from memory into f23
fcvt.wu.h x12, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 440)

# Testcase cp_fs1 (Test source fs1 = f24)
la x2, scratch
li x3, 0x11edbf427a3214e4 # load x3 with value 0x11edbf427a3214e4
sw x3, 0(x2) # store 0x11edbf427a3214e4 in memory
flh f24, 0(x2) # load 0x11edbf427a3214e4 from memory into f24
fcvt.wu.h x10, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 448)

# Testcase cp_fs1 (Test source fs1 = f25)
la x2, scratch
li x3, 0xf5a5a066cf24e86e # load x3 with value 0xf5a5a066cf24e86e
sw x3, 0(x2) # store 0xf5a5a066cf24e86e in memory
flh f25, 0(x2) # load 0xf5a5a066cf24e86e from memory into f25
fcvt.wu.h x14, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 456)

# Testcase cp_fs1 (Test source fs1 = f26)
la x2, scratch
li x3, 0x91ee79fb00514c04 # load x3 with value 0x91ee79fb00514c04
sw x3, 0(x2) # store 0x91ee79fb00514c04 in memory
flh f26, 0(x2) # load 0x91ee79fb00514c04 from memory into f26
fcvt.wu.h x15, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 464)

# Testcase cp_fs1 (Test source fs1 = f27)
la x2, scratch
li x3, 0xfa7f4005bade6b6f # load x3 with value 0xfa7f4005bade6b6f
sw x3, 0(x2) # store 0xfa7f4005bade6b6f in memory
flh f27, 0(x2) # load 0xfa7f4005bade6b6f from memory into f27
fcvt.wu.h x8, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 472)

# Testcase cp_fs1 (Test source fs1 = f28)
la x2, scratch
li x3, 0xe4a9e1378dd8ef3b # load x3 with value 0xe4a9e1378dd8ef3b
sw x3, 0(x2) # store 0xe4a9e1378dd8ef3b in memory
flh f28, 0(x2) # load 0xe4a9e1378dd8ef3b from memory into f28
fcvt.wu.h x26, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 480)

# Testcase cp_fs1 (Test source fs1 = f29)
la x2, scratch
li x3, 0xe00131fb78d8cfd7 # load x3 with value 0xe00131fb78d8cfd7
sw x3, 0(x2) # store 0xe00131fb78d8cfd7 in memory
flh f29, 0(x2) # load 0xe00131fb78d8cfd7 from memory into f29
fcvt.wu.h x31, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 488)

# Testcase cp_fs1 (Test source fs1 = f30)
la x2, scratch
li x3, 0x97cac2d104738468 # load x3 with value 0x97cac2d104738468
sw x3, 0(x2) # store 0x97cac2d104738468 in memory
flh f30, 0(x2) # load 0x97cac2d104738468 from memory into f30
fcvt.wu.h x25, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 496)

# Testcase cp_fs1 (Test source fs1 = f31)
la x2, scratch
li x3, 0xaa23c0237b3f8b29 # load x3 with value 0xaa23c0237b3f8b29
sw x3, 0(x2) # store 0xaa23c0237b3f8b29 in memory
flh f31, 0(x2) # load 0xaa23c0237b3f8b29 from memory into f31
fcvt.wu.h x7, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 504)

# Testcase cp_fs1_corners (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f3, 0(x2) # load 0x00000000 from memory into f3
fcvt.wu.h x18, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 512)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f6, 0(x2) # load 0x00008000 from memory into f6
fcvt.wu.h x23, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 520)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f23, 0(x2) # load 0x00003c00 from memory into f23
fcvt.wu.h x10, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 528)

# Testcase cp_fs1_corners (Test source fs1 value = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f29, 0(x2) # load 0x0000bc00 from memory into f29
fcvt.wu.h x7, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 536)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f3, 0(x2) # load 0x00003e00 from memory into f3
fcvt.wu.h x10, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 544)

# Testcase cp_fs1_corners (Test source fs1 value = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f29, 0(x2) # load 0x0000be00 from memory into f29
fcvt.wu.h x3, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 552)

# Testcase cp_fs1_corners (Test source fs1 value = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f23, 0(x2) # load 0x00004000 from memory into f23
fcvt.wu.h x22, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 560)

# Testcase cp_fs1_corners (Test source fs1 value = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f24, 0(x2) # load 0x0000c000 from memory into f24
fcvt.wu.h x6, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 568)

# Testcase cp_fs1_corners (Test source fs1 value = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f29, 0(x2) # load 0x00000400 from memory into f29
fcvt.wu.h x19, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 576)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f6, 0(x2) # load 0x00008400 from memory into f6
fcvt.wu.h x23, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 584)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f16, 0(x2) # load 0x00007bff from memory into f16
fcvt.wu.h x17, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 592)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f5, 0(x2) # load 0x0000fbff from memory into f5
fcvt.wu.h x31, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 600)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f7, 0(x2) # load 0x000003ff from memory into f7
fcvt.wu.h x19, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 608)

# Testcase cp_fs1_corners (Test source fs1 value = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f9, 0(x2) # load 0x000083ff from memory into f9
fcvt.wu.h x18, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 616)

# Testcase cp_fs1_corners (Test source fs1 value = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f24, 0(x2) # load 0x00000200 from memory into f24
fcvt.wu.h x23, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 624)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f8, 0(x2) # load 0x00008200 from memory into f8
fcvt.wu.h x25, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 632)

# Testcase cp_fs1_corners (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f9, 0(x2) # load 0x00000001 from memory into f9
fcvt.wu.h x12, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 640)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f9, 0(x2) # load 0x00008001 from memory into f9
fcvt.wu.h x17, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 648)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f16, 0(x2) # load 0x00007c00 from memory into f16
fcvt.wu.h x3, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 656)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f7, 0(x2) # load 0x0000fc00 from memory into f7
fcvt.wu.h x31, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 664)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f2, 0(x2) # load 0x00007e00 from memory into f2
fcvt.wu.h x1, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 672)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f14, 0(x2) # load 0x00007fff from memory into f14
fcvt.wu.h x15, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 680)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f23, 0(x2) # load 0x0000fe00 from memory into f23
fcvt.wu.h x27, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 688)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f14, 0(x2) # load 0x00007c01 from memory into f14
fcvt.wu.h x5, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 696)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f9, 0(x2) # load 0x00007dff from memory into f9
fcvt.wu.h x15, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 704)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f13, 0(x2) # load 0x0000fc01 from memory into f13
fcvt.wu.h x14, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 712)

# Testcase cp_fs1_corners (Test source fs1 value = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f30, 0(x2) # load 0x000058b4 from memory into f30
fcvt.wu.h x5, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 720)

# Testcase cp_fs1_corners (Test source fs1 value = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f28, 0(x2) # load 0x0000c93a from memory into f28
fcvt.wu.h x2, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 728)

# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f23, 0(x2) # load 0x00000000 from memory into f23
fcvt.wu.h x30, f23, dyn # perform operation
fcvt.wu.h x30, f23, rdn # perform operation
fcvt.wu.h x30, f23, rmm # perform operation
fcvt.wu.h x30, f23, rne # perform operation
fcvt.wu.h x30, f23, rtz # perform operation
fcvt.wu.h x30, f23, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x30, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 736)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x30, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 744)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x30, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 752)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x30, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 760)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x30, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 768)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f6, 0(x2) # load 0x00008000 from memory into f6
fcvt.wu.h x25, f6, dyn # perform operation
fcvt.wu.h x25, f6, rdn # perform operation
fcvt.wu.h x25, f6, rmm # perform operation
fcvt.wu.h x25, f6, rne # perform operation
fcvt.wu.h x25, f6, rtz # perform operation
fcvt.wu.h x25, f6, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x25, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 776)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x25, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 784)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x25, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 792)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x25, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 800)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x25, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 808)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f30, 0(x2) # load 0x00003c00 from memory into f30
fcvt.wu.h x15, f30, dyn # perform operation
fcvt.wu.h x15, f30, rdn # perform operation
fcvt.wu.h x15, f30, rmm # perform operation
fcvt.wu.h x15, f30, rne # perform operation
fcvt.wu.h x15, f30, rtz # perform operation
fcvt.wu.h x15, f30, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x15, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 816)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x15, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 824)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x15, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 832)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x15, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 840)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x15, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 848)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f9, 0(x2) # load 0x0000bc00 from memory into f9
fcvt.wu.h x29, f9, dyn # perform operation
fcvt.wu.h x29, f9, rdn # perform operation
fcvt.wu.h x29, f9, rmm # perform operation
fcvt.wu.h x29, f9, rne # perform operation
fcvt.wu.h x29, f9, rtz # perform operation
fcvt.wu.h x29, f9, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x29, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 856)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x29, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 864)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x29, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 872)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x29, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 880)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x29, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 888)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f7, 0(x2) # load 0x00003e00 from memory into f7
fcvt.wu.h x30, f7, dyn # perform operation
fcvt.wu.h x30, f7, rdn # perform operation
fcvt.wu.h x30, f7, rmm # perform operation
fcvt.wu.h x30, f7, rne # perform operation
fcvt.wu.h x30, f7, rtz # perform operation
fcvt.wu.h x30, f7, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x30, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 896)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x30, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 904)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x30, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 912)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x30, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 920)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x30, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 928)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f26, 0(x2) # load 0x0000be00 from memory into f26
fcvt.wu.h x31, f26, dyn # perform operation
fcvt.wu.h x31, f26, rdn # perform operation
fcvt.wu.h x31, f26, rmm # perform operation
fcvt.wu.h x31, f26, rne # perform operation
fcvt.wu.h x31, f26, rtz # perform operation
fcvt.wu.h x31, f26, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x31, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 936)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x31, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 944)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x31, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 952)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x31, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 960)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x31, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 968)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f21, 0(x2) # load 0x00004000 from memory into f21
fcvt.wu.h x12, f21, dyn # perform operation
fcvt.wu.h x12, f21, rdn # perform operation
fcvt.wu.h x12, f21, rmm # perform operation
fcvt.wu.h x12, f21, rne # perform operation
fcvt.wu.h x12, f21, rtz # perform operation
fcvt.wu.h x12, f21, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x12, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 976)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x12, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 984)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x12, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 992)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x12, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 1000)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x12, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 1008)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f7, 0(x2) # load 0x0000c000 from memory into f7
fcvt.wu.h x23, f7, dyn # perform operation
fcvt.wu.h x23, f7, rdn # perform operation
fcvt.wu.h x23, f7, rmm # perform operation
fcvt.wu.h x23, f7, rne # perform operation
fcvt.wu.h x23, f7, rtz # perform operation
fcvt.wu.h x23, f7, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x23, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 1016)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x23, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 1024)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x23, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 1032)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x23, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 1040)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x23, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 1048)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f26, 0(x2) # load 0x00000400 from memory into f26
fcvt.wu.h x12, f26, dyn # perform operation
fcvt.wu.h x12, f26, rdn # perform operation
fcvt.wu.h x12, f26, rmm # perform operation
fcvt.wu.h x12, f26, rne # perform operation
fcvt.wu.h x12, f26, rtz # perform operation
fcvt.wu.h x12, f26, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x12, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 1056)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x12, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 1064)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x12, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 1072)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x12, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 1080)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x12, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 1088)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f18, 0(x2) # load 0x00008400 from memory into f18
fcvt.wu.h x3, f18, dyn # perform operation
fcvt.wu.h x3, f18, rdn # perform operation
fcvt.wu.h x3, f18, rmm # perform operation
fcvt.wu.h x3, f18, rne # perform operation
fcvt.wu.h x3, f18, rtz # perform operation
fcvt.wu.h x3, f18, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x3, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 1096)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x3, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 1104)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x3, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 1112)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x3, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 1120)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x3, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 1128)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f5, 0(x2) # load 0x00007bff from memory into f5
fcvt.wu.h x2, f5, dyn # perform operation
fcvt.wu.h x2, f5, rdn # perform operation
fcvt.wu.h x2, f5, rmm # perform operation
fcvt.wu.h x2, f5, rne # perform operation
fcvt.wu.h x2, f5, rtz # perform operation
fcvt.wu.h x2, f5, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x2, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 1136)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x2, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 1144)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x2, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 1152)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x2, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 1160)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x2, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 1168)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f6, 0(x2) # load 0x0000fbff from memory into f6
fcvt.wu.h x13, f6, dyn # perform operation
fcvt.wu.h x13, f6, rdn # perform operation
fcvt.wu.h x13, f6, rmm # perform operation
fcvt.wu.h x13, f6, rne # perform operation
fcvt.wu.h x13, f6, rtz # perform operation
fcvt.wu.h x13, f6, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x13, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 1176)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x13, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 1184)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x13, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 1192)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x13, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 1200)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x13, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 1208)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f24, 0(x2) # load 0x000003ff from memory into f24
fcvt.wu.h x8, f24, dyn # perform operation
fcvt.wu.h x8, f24, rdn # perform operation
fcvt.wu.h x8, f24, rmm # perform operation
fcvt.wu.h x8, f24, rne # perform operation
fcvt.wu.h x8, f24, rtz # perform operation
fcvt.wu.h x8, f24, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x8, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 1216)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x8, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 1224)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x8, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 1232)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x8, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 1240)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x8, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 1248)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f26, 0(x2) # load 0x000083ff from memory into f26
fcvt.wu.h x15, f26, dyn # perform operation
fcvt.wu.h x15, f26, rdn # perform operation
fcvt.wu.h x15, f26, rmm # perform operation
fcvt.wu.h x15, f26, rne # perform operation
fcvt.wu.h x15, f26, rtz # perform operation
fcvt.wu.h x15, f26, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x15, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 1256)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x15, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 1264)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x15, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 1272)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x15, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 1280)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x15, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 1288)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f24, 0(x2) # load 0x00000200 from memory into f24
fcvt.wu.h x11, f24, dyn # perform operation
fcvt.wu.h x11, f24, rdn # perform operation
fcvt.wu.h x11, f24, rmm # perform operation
fcvt.wu.h x11, f24, rne # perform operation
fcvt.wu.h x11, f24, rtz # perform operation
fcvt.wu.h x11, f24, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x11, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 1296)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x11, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 1304)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x11, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 1312)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x11, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 1320)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x11, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 1328)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f18, 0(x2) # load 0x00008200 from memory into f18
fcvt.wu.h x15, f18, dyn # perform operation
fcvt.wu.h x15, f18, rdn # perform operation
fcvt.wu.h x15, f18, rmm # perform operation
fcvt.wu.h x15, f18, rne # perform operation
fcvt.wu.h x15, f18, rtz # perform operation
fcvt.wu.h x15, f18, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x15, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 1336)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x15, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 1344)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x15, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 1352)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x15, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 1360)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x15, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 1368)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f6, 0(x2) # load 0x00000001 from memory into f6
fcvt.wu.h x30, f6, dyn # perform operation
fcvt.wu.h x30, f6, rdn # perform operation
fcvt.wu.h x30, f6, rmm # perform operation
fcvt.wu.h x30, f6, rne # perform operation
fcvt.wu.h x30, f6, rtz # perform operation
fcvt.wu.h x30, f6, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x30, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 1376)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x30, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 1384)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x30, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 1392)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x30, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 1400)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x30, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 1408)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f6, 0(x2) # load 0x00008001 from memory into f6
fcvt.wu.h x31, f6, dyn # perform operation
fcvt.wu.h x31, f6, rdn # perform operation
fcvt.wu.h x31, f6, rmm # perform operation
fcvt.wu.h x31, f6, rne # perform operation
fcvt.wu.h x31, f6, rtz # perform operation
fcvt.wu.h x31, f6, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x31, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 1416)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x31, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 1424)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x31, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 1432)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x31, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 1440)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x31, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 1448)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f19, 0(x2) # load 0x00007c00 from memory into f19
fcvt.wu.h x18, f19, dyn # perform operation
fcvt.wu.h x18, f19, rdn # perform operation
fcvt.wu.h x18, f19, rmm # perform operation
fcvt.wu.h x18, f19, rne # perform operation
fcvt.wu.h x18, f19, rtz # perform operation
fcvt.wu.h x18, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 1456)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 1464)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 1472)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 1480)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x18, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 1488)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f26, 0(x2) # load 0x0000fc00 from memory into f26
fcvt.wu.h x10, f26, dyn # perform operation
fcvt.wu.h x10, f26, rdn # perform operation
fcvt.wu.h x10, f26, rmm # perform operation
fcvt.wu.h x10, f26, rne # perform operation
fcvt.wu.h x10, f26, rtz # perform operation
fcvt.wu.h x10, f26, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x10, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 1496)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x10, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 1504)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x10, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 1512)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x10, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 1520)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x10, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 1528)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f30, 0(x2) # load 0x00007e00 from memory into f30
fcvt.wu.h x23, f30, dyn # perform operation
fcvt.wu.h x23, f30, rdn # perform operation
fcvt.wu.h x23, f30, rmm # perform operation
fcvt.wu.h x23, f30, rne # perform operation
fcvt.wu.h x23, f30, rtz # perform operation
fcvt.wu.h x23, f30, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x23, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 1536)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x23, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 1544)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x23, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 1552)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x23, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 1560)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x23, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 1568)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f24, 0(x2) # load 0x00007fff from memory into f24
fcvt.wu.h x1, f24, dyn # perform operation
fcvt.wu.h x1, f24, rdn # perform operation
fcvt.wu.h x1, f24, rmm # perform operation
fcvt.wu.h x1, f24, rne # perform operation
fcvt.wu.h x1, f24, rtz # perform operation
fcvt.wu.h x1, f24, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x1, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 1576)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x1, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 1584)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x1, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 1592)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x1, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 1600)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x1, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 1608)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f30, 0(x2) # load 0x0000fe00 from memory into f30
fcvt.wu.h x1, f30, dyn # perform operation
fcvt.wu.h x1, f30, rdn # perform operation
fcvt.wu.h x1, f30, rmm # perform operation
fcvt.wu.h x1, f30, rne # perform operation
fcvt.wu.h x1, f30, rtz # perform operation
fcvt.wu.h x1, f30, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x1, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 1616)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x1, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 1624)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x1, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 1632)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x1, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 1640)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x1, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 1648)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f3, 0(x2) # load 0x00007c01 from memory into f3
fcvt.wu.h x2, f3, dyn # perform operation
fcvt.wu.h x2, f3, rdn # perform operation
fcvt.wu.h x2, f3, rmm # perform operation
fcvt.wu.h x2, f3, rne # perform operation
fcvt.wu.h x2, f3, rtz # perform operation
fcvt.wu.h x2, f3, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x2, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 1656)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x2, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 1664)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x2, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 1672)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x2, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 1680)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x2, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 1688)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f29, 0(x2) # load 0x00007dff from memory into f29
fcvt.wu.h x24, f29, dyn # perform operation
fcvt.wu.h x24, f29, rdn # perform operation
fcvt.wu.h x24, f29, rmm # perform operation
fcvt.wu.h x24, f29, rne # perform operation
fcvt.wu.h x24, f29, rtz # perform operation
fcvt.wu.h x24, f29, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x24, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 1696)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x24, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 1704)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x24, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 1712)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x24, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 1720)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x24, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 1728)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f16, 0(x2) # load 0x0000fc01 from memory into f16
fcvt.wu.h x28, f16, dyn # perform operation
fcvt.wu.h x28, f16, rdn # perform operation
fcvt.wu.h x28, f16, rmm # perform operation
fcvt.wu.h x28, f16, rne # perform operation
fcvt.wu.h x28, f16, rtz # perform operation
fcvt.wu.h x28, f16, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x28, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 1736)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x28, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 1744)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x28, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 1752)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x28, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 1760)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x28, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 1768)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f28, 0(x2) # load 0x000058b4 from memory into f28
fcvt.wu.h x19, f28, dyn # perform operation
fcvt.wu.h x19, f28, rdn # perform operation
fcvt.wu.h x19, f28, rmm # perform operation
fcvt.wu.h x19, f28, rne # perform operation
fcvt.wu.h x19, f28, rtz # perform operation
fcvt.wu.h x19, f28, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x19, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 1776)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x19, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 1784)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x19, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 1792)
addi x4, x4, 1800 # increment signature pointer and reset offset

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x19, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 0)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x19, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 8)


# Testcase cr_fs1_corners_frm (Test source fs1 value = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f18, 0(x2) # load 0x0000c93a from memory into f18
fcvt.wu.h x20, f18, dyn # perform operation
fcvt.wu.h x20, f18, rdn # perform operation
fcvt.wu.h x20, f18, rmm # perform operation
fcvt.wu.h x20, f18, rne # perform operation
fcvt.wu.h x20, f18, rtz # perform operation
fcvt.wu.h x20, f18, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x20, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 16)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x20, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 24)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x20, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 32)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x20, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 40)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x20, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 48)


# Testcase cp_frm
la x2, scratch
li x3, 0xb02ebbd09f30d981 # load x3 with value 0xb02ebbd09f30d981
sw x3, 0(x2) # store 0xb02ebbd09f30d981 in memory
flh f19, 0(x2) # load 0xb02ebbd09f30d981 from memory into f19
fcvt.wu.h x1, f19, dyn # perform operation
fcvt.wu.h x1, f19, rdn # perform operation
fcvt.wu.h x1, f19, rmm # perform operation
fcvt.wu.h x1, f19, rne # perform operation
fcvt.wu.h x1, f19, rtz # perform operation
fcvt.wu.h x1, f19, rup # perform operation

 # set fcsr.frm to 0x4 
fsrmi 0x4
fcvt.wu.h x1, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 56)

 # set fcsr.frm to 0x3 
fsrmi 0x3
fcvt.wu.h x1, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 64)

 # set fcsr.frm to 0x2 
fsrmi 0x2
fcvt.wu.h x1, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 72)

 # set fcsr.frm to 0x1 
fsrmi 0x1
fcvt.wu.h x1, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 80)

 # set fcsr.frm to 0x0 
fsrmi 0x0
fcvt.wu.h x1, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 88)


# Testcase Improper NaNBoxed argument test (Value 0x0 in f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f31, 0(x2) # load 0x00000000 from memory into f31
fcvt.wu.h x8, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 96)

# Testcase Improper NaNBoxed argument test (Value 0xfffe8000 in f20)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfffe8000 # load x3 with value 0xfffe8000
sw x3, 0(x2) # store 0xfffe8000 in memory
flw f20, 0(x2) # load 0xfffe8000 from memory into f20
fcvt.wu.h x13, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 104)

# Testcase Improper NaNBoxed argument test (Value 0x7fff3c00 in f24)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fff3c00 # load x3 with value 0x7fff3c00
sw x3, 0(x2) # store 0x7fff3c00 in memory
flw f24, 0(x2) # load 0x7fff3c00 from memory into f24
fcvt.wu.h x31, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 112)

# Testcase Improper NaNBoxed argument test (Value 0xbeefbc00 in f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbeefbc00 # load x3 with value 0xbeefbc00
sw x3, 0(x2) # store 0xbeefbc00 in memory
flw f8, 0(x2) # load 0xbeefbc00 from memory into f8
fcvt.wu.h x2, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 120)

# Testcase Improper NaNBoxed argument test (Value 0xfeff0400 in f12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeff0400 # load x3 with value 0xfeff0400
sw x3, 0(x2) # store 0xfeff0400 in memory
flw f12, 0(x2) # load 0xfeff0400 from memory into f12
fcvt.wu.h x31, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 128)

# Testcase Improper NaNBoxed argument test (Value 0xfff8400 in f11)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0fff8400 # load x3 with value 0x0fff8400
sw x3, 0(x2) # store 0x0fff8400 in memory
flw f11, 0(x2) # load 0x0fff8400 from memory into f11
fcvt.wu.h x9, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 136)

# Testcase Improper NaNBoxed argument test (Value 0xefff7bff in f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xefff7bff # load x3 with value 0xefff7bff
sw x3, 0(x2) # store 0xefff7bff in memory
flw f8, 0(x2) # load 0xefff7bff from memory into f8
fcvt.wu.h x16, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 144)

# Testcase Improper NaNBoxed argument test (Value 0xc0defbff in f12)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc0defbff # load x3 with value 0xc0defbff
sw x3, 0(x2) # store 0xc0defbff in memory
flw f12, 0(x2) # load 0xc0defbff from memory into f12
fcvt.wu.h x20, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 152)

# Testcase Improper NaNBoxed argument test (Value 0x4f1a7c00 in f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4f1a7c00 # load x3 with value 0x4f1a7c00
sw x3, 0(x2) # store 0x4f1a7c00 in memory
flw f31, 0(x2) # load 0x4f1a7c00 from memory into f31
fcvt.wu.h x22, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 160)

# Testcase Improper NaNBoxed argument test (Value 0xffffc00 in f8)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0ffffc00 # load x3 with value 0x0ffffc00
sw x3, 0(x2) # store 0x0ffffc00 in memory
flw f8, 0(x2) # load 0x0ffffc00 from memory into f8
fcvt.wu.h x15, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 168)

# Testcase Improper NaNBoxed argument test (Value 0xffef7e00 in f25)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffef7e00 # load x3 with value 0xffef7e00
sw x3, 0(x2) # store 0xffef7e00 in memory
flw f25, 0(x2) # load 0xffef7e00 from memory into f25
fcvt.wu.h x30, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 176)

# Testcase Improper NaNBoxed argument test (Value 0xfeef7fff in f5)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeef7fff # load x3 with value 0xfeef7fff
sw x3, 0(x2) # store 0xfeef7fff in memory
flw f5, 0(x2) # load 0xfeef7fff from memory into f5
fcvt.wu.h x15, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 184)

# Testcase Improper NaNBoxed argument test (Value 0xa1b27c01 in f18)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa1b27c01 # load x3 with value 0xa1b27c01
sw x3, 0(x2) # store 0xa1b27c01 in memory
flw f18, 0(x2) # load 0xa1b27c01 from memory into f18
fcvt.wu.h x20, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 192)

# Testcase Improper NaNBoxed argument test (Value 0x4fd77dff in f27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4fd77dff # load x3 with value 0x4fd77dff
sw x3, 0(x2) # store 0x4fd77dff in memory
flw f27, 0(x2) # load 0x4fd77dff from memory into f27
fcvt.wu.h x22, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 200)

#.EQU SIGSIZE,2008


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
li x0, 0x7291e37fe7277035 # load immediate value into integer register
fmv.h.x f1, x0 # perform operation

# Testcase cp_rs1 (Test source rs1 = x1)
fsflagsi 0b00000 # clear all fflags
li x1, 0x7eb8b118dd0f557e # load immediate value into integer register
fmv.h.x f23, x1 # perform operation

# Testcase cp_rs1 (Test source rs1 = x2)
fsflagsi 0b00000 # clear all fflags
li x2, 0xc7e4584f8c681ae5 # load immediate value into integer register
fmv.h.x f16, x2 # perform operation

# Testcase cp_rs1 (Test source rs1 = x3)
fsflagsi 0b00000 # clear all fflags
li x3, 0x0e168588e6ce3627 # load immediate value into integer register
fmv.h.x f23, x3 # perform operation

# Testcase cp_rs1 (Test source rs1 = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x4, 0xf3bc8bd21c2deb85 # load immediate value into integer register
fmv.h.x f12, x4 # perform operation

# Testcase cp_rs1 (Test source rs1 = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x5, 0x5d8d85ca4ae568c2 # load immediate value into integer register
fmv.h.x f27, x5 # perform operation

# Testcase cp_rs1 (Test source rs1 = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x6, 0xabb0bdbbff886990 # load immediate value into integer register
fmv.h.x f18, x6 # perform operation

# Testcase cp_rs1 (Test source rs1 = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x7, 0xc64bca657a82cc85 # load immediate value into integer register
fmv.h.x f1, x7 # perform operation

# Testcase cp_rs1 (Test source rs1 = x8)
fsflagsi 0b00000 # clear all fflags
li x8, 0x72858fb390fab891 # load immediate value into integer register
fmv.h.x f9, x8 # perform operation

# Testcase cp_rs1 (Test source rs1 = x9)
fsflagsi 0b00000 # clear all fflags
li x9, 0xbc6cb1e36cbb6c98 # load immediate value into integer register
fmv.h.x f1, x9 # perform operation

# Testcase cp_rs1 (Test source rs1 = x10)
fsflagsi 0b00000 # clear all fflags
li x10, 0x1f37ca47f1c07931 # load immediate value into integer register
fmv.h.x f17, x10 # perform operation

# Testcase cp_rs1 (Test source rs1 = x11)
fsflagsi 0b00000 # clear all fflags
li x11, 0xde06b07f375894cc # load immediate value into integer register
fmv.h.x f24, x11 # perform operation

# Testcase cp_rs1 (Test source rs1 = x12)
fsflagsi 0b00000 # clear all fflags
li x12, 0x8a43a25b1fd34489 # load immediate value into integer register
fmv.h.x f2, x12 # perform operation

# Testcase cp_rs1 (Test source rs1 = x13)
fsflagsi 0b00000 # clear all fflags
li x13, 0x51eb7907d8c898d2 # load immediate value into integer register
fmv.h.x f22, x13 # perform operation

# Testcase cp_rs1 (Test source rs1 = x14)
fsflagsi 0b00000 # clear all fflags
li x14, 0x03f0505259844b4a # load immediate value into integer register
fmv.h.x f24, x14 # perform operation

# Testcase cp_rs1 (Test source rs1 = x15)
fsflagsi 0b00000 # clear all fflags
li x15, 0xd463a59621384cca # load immediate value into integer register
fmv.h.x f16, x15 # perform operation

# Testcase cp_rs1 (Test source rs1 = x16)
fsflagsi 0b00000 # clear all fflags
li x16, 0xadaf4bf42cd702e7 # load immediate value into integer register
fmv.h.x f24, x16 # perform operation

# Testcase cp_rs1 (Test source rs1 = x17)
fsflagsi 0b00000 # clear all fflags
li x17, 0xeb8be7fa97f599bf # load immediate value into integer register
fmv.h.x f14, x17 # perform operation

# Testcase cp_rs1 (Test source rs1 = x18)
fsflagsi 0b00000 # clear all fflags
li x18, 0xfd5229de28639341 # load immediate value into integer register
fmv.h.x f17, x18 # perform operation

# Testcase cp_rs1 (Test source rs1 = x19)
fsflagsi 0b00000 # clear all fflags
li x19, 0x11e182616fe02bab # load immediate value into integer register
fmv.h.x f5, x19 # perform operation

# Testcase cp_rs1 (Test source rs1 = x20)
fsflagsi 0b00000 # clear all fflags
li x20, 0xf56737b34ab9c5c2 # load immediate value into integer register
fmv.h.x f17, x20 # perform operation

# Testcase cp_rs1 (Test source rs1 = x21)
fsflagsi 0b00000 # clear all fflags
li x21, 0xc28564b188ce4eb2 # load immediate value into integer register
fmv.h.x f15, x21 # perform operation

# Testcase cp_rs1 (Test source rs1 = x22)
fsflagsi 0b00000 # clear all fflags
li x22, 0x16d179cdf9704134 # load immediate value into integer register
fmv.h.x f31, x22 # perform operation

# Testcase cp_rs1 (Test source rs1 = x23)
fsflagsi 0b00000 # clear all fflags
li x23, 0xbbc1bbc4b2c77e24 # load immediate value into integer register
fmv.h.x f12, x23 # perform operation

# Testcase cp_rs1 (Test source rs1 = x24)
fsflagsi 0b00000 # clear all fflags
li x24, 0x63be22d2a1b87379 # load immediate value into integer register
fmv.h.x f28, x24 # perform operation

# Testcase cp_rs1 (Test source rs1 = x25)
fsflagsi 0b00000 # clear all fflags
li x25, 0x4d5aee358f1a80b9 # load immediate value into integer register
fmv.h.x f28, x25 # perform operation

# Testcase cp_rs1 (Test source rs1 = x26)
fsflagsi 0b00000 # clear all fflags
li x26, 0x7e0ef81544200a35 # load immediate value into integer register
fmv.h.x f1, x26 # perform operation

# Testcase cp_rs1 (Test source rs1 = x27)
fsflagsi 0b00000 # clear all fflags
li x27, 0xcb32c2de72feab28 # load immediate value into integer register
fmv.h.x f16, x27 # perform operation

# Testcase cp_rs1 (Test source rs1 = x28)
fsflagsi 0b00000 # clear all fflags
li x28, 0x59b0afc2e5ef035f # load immediate value into integer register
fmv.h.x f5, x28 # perform operation

# Testcase cp_rs1 (Test source rs1 = x29)
fsflagsi 0b00000 # clear all fflags
li x29, 0xa4d36462aa66503c # load immediate value into integer register
fmv.h.x f16, x29 # perform operation

# Testcase cp_rs1 (Test source rs1 = x30)
fsflagsi 0b00000 # clear all fflags
li x30, 0x33fdff6f94ee336c # load immediate value into integer register
fmv.h.x f7, x30 # perform operation

# Testcase cp_rs1 (Test source rs1 = x31)
fsflagsi 0b00000 # clear all fflags
li x31, 0x341ccbc01a859798 # load immediate value into integer register
fmv.h.x f7, x31 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
li x23, 0x0000000000000000 # load immediate value into integer register
fmv.h.x f11, x23 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
li x7, 0x0000000000000001 # load immediate value into integer register
fmv.h.x f23, x7 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x2)
fsflagsi 0b00000 # clear all fflags
li x19, 0x0000000000000002 # load immediate value into integer register
fmv.h.x f24, x19 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x8000000000000000)
fsflagsi 0b00000 # clear all fflags
li x20, 0x8000000000000000 # load immediate value into integer register
fmv.h.x f16, x20 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x8000000000000001)
fsflagsi 0b00000 # clear all fflags
li x18, 0x8000000000000001 # load immediate value into integer register
fmv.h.x f25, x18 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x7fffffffffffffff)
fsflagsi 0b00000 # clear all fflags
li x23, 0x7fffffffffffffff # load immediate value into integer register
fmv.h.x f22, x23 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x7ffffffffffffffe)
fsflagsi 0b00000 # clear all fflags
li x6, 0x7ffffffffffffffe # load immediate value into integer register
fmv.h.x f28, x6 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0xffffffffffffffff)
fsflagsi 0b00000 # clear all fflags
li x21, 0xffffffffffffffff # load immediate value into integer register
fmv.h.x f20, x21 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0xfffffffffffffffe)
fsflagsi 0b00000 # clear all fflags
li x23, 0xfffffffffffffffe # load immediate value into integer register
fmv.h.x f6, x23 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x5bbc887763ae86f2)
fsflagsi 0b00000 # clear all fflags
li x3, 0x5bbc887763ae86f2 # load immediate value into integer register
fmv.h.x f22, x3 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0xaaaaaaaaaaaaaaaa)
fsflagsi 0b00000 # clear all fflags
li x17, 0xaaaaaaaaaaaaaaaa # load immediate value into integer register
fmv.h.x f1, x17 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x5555555555555555)
fsflagsi 0b00000 # clear all fflags
li x3, 0x5555555555555555 # load immediate value into integer register
fmv.h.x f21, x3 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0xffffffff)
fsflagsi 0b00000 # clear all fflags
li x2, 0x00000000ffffffff # load immediate value into integer register
fmv.h.x f5, x2 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0xfffffffe)
fsflagsi 0b00000 # clear all fflags
li x22, 0x00000000fffffffe # load immediate value into integer register
fmv.h.x f25, x22 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x100000000)
fsflagsi 0b00000 # clear all fflags
li x25, 0x0000000100000000 # load immediate value into integer register
fmv.h.x f19, x25 # perform operation

# Testcase cp_rs1_corners (Test source rs1 value = 0x100000001)
fsflagsi 0b00000 # clear all fflags
li x13, 0x0000000100000001 # load immediate value into integer register
fmv.h.x f3, x13 # perform operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x2, x24, x16 # perform first operation
fmv.h.x f13, x21 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x2, x19, x1 # perform first operation
fmv.h.x f9, x23 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x11, x7, x28 # perform first operation
fmv.h.x f3, x24 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f3, f25, f10 # perform first operation
fmv.h.x f3, x20 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f19, f2, f10 # perform first operation
fmv.h.x f19, x12 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
fmul.s f31, f25, f13 # perform first operation
fmv.h.x f31, x9 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f1, f5, f8 # perform first operation
fmv.h.x f5, x17 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f11, f10, f28 # perform first operation
fmv.h.x f28, x16 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
fmul.s f29, f19, f11 # perform first operation
fmv.h.x f3, x8 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x17, x27, x21 # perform first operation
fmv.h.x f23, x2 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x5, x18, x9 # perform first operation
fmv.h.x f10, x21 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x28, x31, x5 # perform first operation
fmv.h.x f8, x13 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x25, x18, x6 # perform first operation
fmv.h.x f25, x9 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x18, x22, x20 # perform first operation
fmv.h.x f29, x3 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x12, x22, x2 # perform first operation
fmv.h.x f22, x9 # perform second (triggering) operation

# Testcase cp_fd (Test destination fd = x0)
fsflagsi 0b00000 # clear all fflags
li x18, 0x42e05ce7a66ee81e # load immediate value into integer register
fmv.h.x f0, x18 # perform operation

# Testcase cp_fd (Test destination fd = x1)
fsflagsi 0b00000 # clear all fflags
li x18, 0x6b9c18483f96f65d # load immediate value into integer register
fmv.h.x f1, x18 # perform operation

# Testcase cp_fd (Test destination fd = x2)
fsflagsi 0b00000 # clear all fflags
li x19, 0x6f0f8ce657a3380e # load immediate value into integer register
fmv.h.x f2, x19 # perform operation

# Testcase cp_fd (Test destination fd = x3)
fsflagsi 0b00000 # clear all fflags
li x24, 0x74d6050bb7f2d208 # load immediate value into integer register
fmv.h.x f3, x24 # perform operation

# Testcase cp_fd (Test destination fd = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x7, 0x00211f0b93e3abd9 # load immediate value into integer register
fmv.h.x f4, x7 # perform operation

# Testcase cp_fd (Test destination fd = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x21, 0xef8aec56b2346d11 # load immediate value into integer register
fmv.h.x f5, x21 # perform operation

# Testcase cp_fd (Test destination fd = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x16, 0x644a07a3822e6d0d # load immediate value into integer register
fmv.h.x f6, x16 # perform operation

# Testcase cp_fd (Test destination fd = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
fsflagsi 0b00000 # clear all fflags
li x25, 0x44d8a99a12d89397 # load immediate value into integer register
fmv.h.x f7, x25 # perform operation

# Testcase cp_fd (Test destination fd = x8)
fsflagsi 0b00000 # clear all fflags
li x18, 0x701f2cb91624d3a5 # load immediate value into integer register
fmv.h.x f8, x18 # perform operation

# Testcase cp_fd (Test destination fd = x9)
fsflagsi 0b00000 # clear all fflags
li x12, 0x1040bff84b5e4eec # load immediate value into integer register
fmv.h.x f9, x12 # perform operation

# Testcase cp_fd (Test destination fd = x10)
fsflagsi 0b00000 # clear all fflags
li x23, 0xd57a554beaa192eb # load immediate value into integer register
fmv.h.x f10, x23 # perform operation

# Testcase cp_fd (Test destination fd = x11)
fsflagsi 0b00000 # clear all fflags
li x18, 0xbf5857de0d298c7d # load immediate value into integer register
fmv.h.x f11, x18 # perform operation

# Testcase cp_fd (Test destination fd = x12)
fsflagsi 0b00000 # clear all fflags
li x19, 0x654c84bd6144a64c # load immediate value into integer register
fmv.h.x f12, x19 # perform operation

# Testcase cp_fd (Test destination fd = x13)
fsflagsi 0b00000 # clear all fflags
li x30, 0xb36d4f4c073753ac # load immediate value into integer register
fmv.h.x f13, x30 # perform operation

# Testcase cp_fd (Test destination fd = x14)
fsflagsi 0b00000 # clear all fflags
li x17, 0x1c19fbf0b9d14963 # load immediate value into integer register
fmv.h.x f14, x17 # perform operation

# Testcase cp_fd (Test destination fd = x15)
fsflagsi 0b00000 # clear all fflags
li x15, 0x88d575df0a203de7 # load immediate value into integer register
fmv.h.x f15, x15 # perform operation

# Testcase cp_fd (Test destination fd = x16)
fsflagsi 0b00000 # clear all fflags
li x10, 0x5233ffe4843e92f3 # load immediate value into integer register
fmv.h.x f16, x10 # perform operation

# Testcase cp_fd (Test destination fd = x17)
fsflagsi 0b00000 # clear all fflags
li x27, 0xa55c22181f8b51aa # load immediate value into integer register
fmv.h.x f17, x27 # perform operation

# Testcase cp_fd (Test destination fd = x18)
fsflagsi 0b00000 # clear all fflags
li x27, 0xb2a0d490a6621560 # load immediate value into integer register
fmv.h.x f18, x27 # perform operation

# Testcase cp_fd (Test destination fd = x19)
fsflagsi 0b00000 # clear all fflags
li x29, 0xefa5bddb89926151 # load immediate value into integer register
fmv.h.x f19, x29 # perform operation

# Testcase cp_fd (Test destination fd = x20)
fsflagsi 0b00000 # clear all fflags
li x13, 0x57454446d6cc91f4 # load immediate value into integer register
fmv.h.x f20, x13 # perform operation

# Testcase cp_fd (Test destination fd = x21)
fsflagsi 0b00000 # clear all fflags
li x22, 0x0274aabce1d21290 # load immediate value into integer register
fmv.h.x f21, x22 # perform operation

# Testcase cp_fd (Test destination fd = x22)
fsflagsi 0b00000 # clear all fflags
li x12, 0xbd18a0736466c6b0 # load immediate value into integer register
fmv.h.x f22, x12 # perform operation

# Testcase cp_fd (Test destination fd = x23)
fsflagsi 0b00000 # clear all fflags
li x26, 0x513afed98f9842b2 # load immediate value into integer register
fmv.h.x f23, x26 # perform operation

# Testcase cp_fd (Test destination fd = x24)
fsflagsi 0b00000 # clear all fflags
li x14, 0x5ec668bc87787603 # load immediate value into integer register
fmv.h.x f24, x14 # perform operation

# Testcase cp_fd (Test destination fd = x25)
fsflagsi 0b00000 # clear all fflags
li x17, 0x47568ae51938934d # load immediate value into integer register
fmv.h.x f25, x17 # perform operation

# Testcase cp_fd (Test destination fd = x26)
fsflagsi 0b00000 # clear all fflags
li x28, 0xdf6b3bbaae436aa7 # load immediate value into integer register
fmv.h.x f26, x28 # perform operation

# Testcase cp_fd (Test destination fd = x27)
fsflagsi 0b00000 # clear all fflags
li x8, 0xcabf718849aa9601 # load immediate value into integer register
fmv.h.x f27, x8 # perform operation

# Testcase cp_fd (Test destination fd = x28)
fsflagsi 0b00000 # clear all fflags
li x22, 0x21bd4b5f9337cbb0 # load immediate value into integer register
fmv.h.x f28, x22 # perform operation

# Testcase cp_fd (Test destination fd = x29)
fsflagsi 0b00000 # clear all fflags
li x25, 0x2e302480511c8f35 # load immediate value into integer register
fmv.h.x f29, x25 # perform operation

# Testcase cp_fd (Test destination fd = x30)
fsflagsi 0b00000 # clear all fflags
li x1, 0xe32115db4e883d89 # load immediate value into integer register
fmv.h.x f30, x1 # perform operation

# Testcase cp_fd (Test destination fd = x31)
fsflagsi 0b00000 # clear all fflags
li x3, 0x9468ec73c76fc9ae # load immediate value into integer register
fmv.h.x f31, x3 # perform operation

# Testcase Random test for cp_NaNBox 
fsflagsi 0b00000 # clear all fflags
li x11, 0x89872fd75a8ac38f # load immediate value into integer register
fmv.h.x f1, x11 # perform operation

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
li x3, 0xf747dae95ffca24a # load x3 with value 0xf747dae95ffca24a
sw x3, 0(x2) # store 0xf747dae95ffca24a in memory
flh f25, 0(x2) # load 0xf747dae95ffca24a from memory into f25
fclass.h x0, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x0, 0)

# Testcase cp_rd (Test destination rd = x1)
la x2, scratch
li x3, 0x2212e04518a751da # load x3 with value 0x2212e04518a751da
sw x3, 0(x2) # store 0x2212e04518a751da in memory
flh f20, 0(x2) # load 0x2212e04518a751da from memory into f20
fclass.h x1, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 8)

# Testcase cp_rd (Test destination rd = x2)
la x2, scratch
li x3, 0x74a6264b92d38d87 # load x3 with value 0x74a6264b92d38d87
sw x3, 0(x2) # store 0x74a6264b92d38d87 in memory
flh f2, 0(x2) # load 0x74a6264b92d38d87 from memory into f2
fclass.h x2, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 16)

# Testcase cp_rd (Test destination rd = x3)
la x2, scratch
li x3, 0x9576fc2017c97267 # load x3 with value 0x9576fc2017c97267
sw x3, 0(x2) # store 0x9576fc2017c97267 in memory
flh f19, 0(x2) # load 0x9576fc2017c97267 from memory into f19
fclass.h x3, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x3, 24)

# Testcase cp_rd (Test destination rd = x4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x54234057a7c52283 # load x3 with value 0x54234057a7c52283
sw x3, 0(x2) # store 0x54234057a7c52283 in memory
flh f1, 0(x2) # load 0x54234057a7c52283 from memory into f1
fclass.h x4, f1 # perform operation
RVTEST_SIGUPD(x5, x0, x4, 32)

# Testcase cp_rd (Test destination rd = x5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xb915d50425c00f6d # load x3 with value 0xb915d50425c00f6d
sw x3, 0(x2) # store 0xb915d50425c00f6d in memory
flh f11, 0(x2) # load 0xb915d50425c00f6d from memory into f11
fclass.h x5, f11 # perform operation
RVTEST_SIGUPD(x6, x0, x5, 40)

# Testcase cp_rd (Test destination rd = x6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x3a62d20043d0547f # load x3 with value 0x3a62d20043d0547f
sw x3, 0(x2) # store 0x3a62d20043d0547f in memory
flh f3, 0(x2) # load 0x3a62d20043d0547f from memory into f3
fclass.h x6, f3 # perform operation
RVTEST_SIGUPD(x7, x0, x6, 48)

# Testcase cp_rd (Test destination rd = x7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xb3faf838724e8912 # load x3 with value 0xb3faf838724e8912
sw x3, 0(x2) # store 0xb3faf838724e8912 in memory
flh f29, 0(x2) # load 0xb3faf838724e8912 from memory into f29
fclass.h x7, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 56)

# Testcase cp_rd (Test destination rd = x8)
la x2, scratch
li x3, 0xed82f672914c5a5f # load x3 with value 0xed82f672914c5a5f
sw x3, 0(x2) # store 0xed82f672914c5a5f in memory
flh f24, 0(x2) # load 0xed82f672914c5a5f from memory into f24
fclass.h x8, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x8, 64)

# Testcase cp_rd (Test destination rd = x9)
la x2, scratch
li x3, 0xff53d35eef2d6665 # load x3 with value 0xff53d35eef2d6665
sw x3, 0(x2) # store 0xff53d35eef2d6665 in memory
flh f6, 0(x2) # load 0xff53d35eef2d6665 from memory into f6
fclass.h x9, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 72)

# Testcase cp_rd (Test destination rd = x10)
la x2, scratch
li x3, 0x3ee896c751904fd5 # load x3 with value 0x3ee896c751904fd5
sw x3, 0(x2) # store 0x3ee896c751904fd5 in memory
flh f14, 0(x2) # load 0x3ee896c751904fd5 from memory into f14
fclass.h x10, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 80)

# Testcase cp_rd (Test destination rd = x11)
la x2, scratch
li x3, 0x9e8fd5d5bfbe56d9 # load x3 with value 0x9e8fd5d5bfbe56d9
sw x3, 0(x2) # store 0x9e8fd5d5bfbe56d9 in memory
flh f5, 0(x2) # load 0x9e8fd5d5bfbe56d9 from memory into f5
fclass.h x11, f5 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 88)

# Testcase cp_rd (Test destination rd = x12)
la x2, scratch
li x3, 0x3293247620755047 # load x3 with value 0x3293247620755047
sw x3, 0(x2) # store 0x3293247620755047 in memory
flh f12, 0(x2) # load 0x3293247620755047 from memory into f12
fclass.h x12, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 96)

# Testcase cp_rd (Test destination rd = x13)
la x2, scratch
li x3, 0x2d457de0b188bd21 # load x3 with value 0x2d457de0b188bd21
sw x3, 0(x2) # store 0x2d457de0b188bd21 in memory
flh f10, 0(x2) # load 0x2d457de0b188bd21 from memory into f10
fclass.h x13, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x13, 104)

# Testcase cp_rd (Test destination rd = x14)
la x2, scratch
li x3, 0xc980d4b83e73b05c # load x3 with value 0xc980d4b83e73b05c
sw x3, 0(x2) # store 0xc980d4b83e73b05c in memory
flh f3, 0(x2) # load 0xc980d4b83e73b05c from memory into f3
fclass.h x14, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x14, 112)

# Testcase cp_rd (Test destination rd = x15)
la x2, scratch
li x3, 0x30d84fd2426a191c # load x3 with value 0x30d84fd2426a191c
sw x3, 0(x2) # store 0x30d84fd2426a191c in memory
flh f11, 0(x2) # load 0x30d84fd2426a191c from memory into f11
fclass.h x15, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 120)

# Testcase cp_rd (Test destination rd = x16)
la x2, scratch
li x3, 0x5aa0086904405e4c # load x3 with value 0x5aa0086904405e4c
sw x3, 0(x2) # store 0x5aa0086904405e4c in memory
flh f6, 0(x2) # load 0x5aa0086904405e4c from memory into f6
fclass.h x16, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 128)

# Testcase cp_rd (Test destination rd = x17)
la x2, scratch
li x3, 0x6e07eba8abd37bfa # load x3 with value 0x6e07eba8abd37bfa
sw x3, 0(x2) # store 0x6e07eba8abd37bfa in memory
flh f10, 0(x2) # load 0x6e07eba8abd37bfa from memory into f10
fclass.h x17, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 136)

# Testcase cp_rd (Test destination rd = x18)
la x2, scratch
li x3, 0x8d52335eff806a56 # load x3 with value 0x8d52335eff806a56
sw x3, 0(x2) # store 0x8d52335eff806a56 in memory
flh f17, 0(x2) # load 0x8d52335eff806a56 from memory into f17
fclass.h x18, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 144)

# Testcase cp_rd (Test destination rd = x19)
la x2, scratch
li x3, 0xe97f656bb9c470b4 # load x3 with value 0xe97f656bb9c470b4
sw x3, 0(x2) # store 0xe97f656bb9c470b4 in memory
flh f1, 0(x2) # load 0xe97f656bb9c470b4 from memory into f1
fclass.h x19, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 152)

# Testcase cp_rd (Test destination rd = x20)
la x2, scratch
li x3, 0x1666a7170a870f60 # load x3 with value 0x1666a7170a870f60
sw x3, 0(x2) # store 0x1666a7170a870f60 in memory
flh f9, 0(x2) # load 0x1666a7170a870f60 from memory into f9
fclass.h x20, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 160)

# Testcase cp_rd (Test destination rd = x21)
la x2, scratch
li x3, 0xaf413b7041b2a509 # load x3 with value 0xaf413b7041b2a509
sw x3, 0(x2) # store 0xaf413b7041b2a509 in memory
flh f13, 0(x2) # load 0xaf413b7041b2a509 from memory into f13
fclass.h x21, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 168)

# Testcase cp_rd (Test destination rd = x22)
la x2, scratch
li x3, 0xbf299fb8dc04f672 # load x3 with value 0xbf299fb8dc04f672
sw x3, 0(x2) # store 0xbf299fb8dc04f672 in memory
flh f7, 0(x2) # load 0xbf299fb8dc04f672 from memory into f7
fclass.h x22, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 176)

# Testcase cp_rd (Test destination rd = x23)
la x2, scratch
li x3, 0x3428e343a77ff082 # load x3 with value 0x3428e343a77ff082
sw x3, 0(x2) # store 0x3428e343a77ff082 in memory
flh f25, 0(x2) # load 0x3428e343a77ff082 from memory into f25
fclass.h x23, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 184)

# Testcase cp_rd (Test destination rd = x24)
la x2, scratch
li x3, 0xaf4d27991e15064e # load x3 with value 0xaf4d27991e15064e
sw x3, 0(x2) # store 0xaf4d27991e15064e in memory
flh f10, 0(x2) # load 0xaf4d27991e15064e from memory into f10
fclass.h x24, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 192)

# Testcase cp_rd (Test destination rd = x25)
la x2, scratch
li x3, 0xd8e723e05582b82d # load x3 with value 0xd8e723e05582b82d
sw x3, 0(x2) # store 0xd8e723e05582b82d in memory
flh f27, 0(x2) # load 0xd8e723e05582b82d from memory into f27
fclass.h x25, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 200)

# Testcase cp_rd (Test destination rd = x26)
la x2, scratch
li x3, 0xb15cd2f9add249a4 # load x3 with value 0xb15cd2f9add249a4
sw x3, 0(x2) # store 0xb15cd2f9add249a4 in memory
flh f6, 0(x2) # load 0xb15cd2f9add249a4 from memory into f6
fclass.h x26, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 208)

# Testcase cp_rd (Test destination rd = x27)
la x2, scratch
li x3, 0x79cfe6d6e5a75dcc # load x3 with value 0x79cfe6d6e5a75dcc
sw x3, 0(x2) # store 0x79cfe6d6e5a75dcc in memory
flh f15, 0(x2) # load 0x79cfe6d6e5a75dcc from memory into f15
fclass.h x27, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 216)

# Testcase cp_rd (Test destination rd = x28)
la x2, scratch
li x3, 0xdd9fb21c846e7c1b # load x3 with value 0xdd9fb21c846e7c1b
sw x3, 0(x2) # store 0xdd9fb21c846e7c1b in memory
flh f1, 0(x2) # load 0xdd9fb21c846e7c1b from memory into f1
fclass.h x28, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 224)

# Testcase cp_rd (Test destination rd = x29)
la x2, scratch
li x3, 0x153ca536671c21d0 # load x3 with value 0x153ca536671c21d0
sw x3, 0(x2) # store 0x153ca536671c21d0 in memory
flh f21, 0(x2) # load 0x153ca536671c21d0 from memory into f21
fclass.h x29, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 232)

# Testcase cp_rd (Test destination rd = x30)
la x2, scratch
li x3, 0x755464de28281e0b # load x3 with value 0x755464de28281e0b
sw x3, 0(x2) # store 0x755464de28281e0b in memory
flh f23, 0(x2) # load 0x755464de28281e0b from memory into f23
fclass.h x30, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 240)

# Testcase cp_rd (Test destination rd = x31)
la x2, scratch
li x3, 0xd0d1e19a5a5c6e66 # load x3 with value 0xd0d1e19a5a5c6e66
sw x3, 0(x2) # store 0xd0d1e19a5a5c6e66 in memory
flh f19, 0(x2) # load 0xd0d1e19a5a5c6e66 from memory into f19
fclass.h x31, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 248)

# Testcase cp_gpr/fpr_hazard nohaz test
add x28, x9, x11 # perform first operation
fclass.h x2, f18 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x23, x24, x22 # perform first operation
fclass.h x11, f27 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x8, x25, x11 # perform first operation
fclass.h x14, f3 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
fmul.s f7, f28, f16 # perform first operation
fclass.h x7, f7 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x1, x26, x17 # perform first operation
fclass.h x1, f19 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard raw test
add x9, x6, x19 # perform first operation
fclass.h x9, f7 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x3, x29, x8 # perform first operation
fclass.h x27, f12 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x3, x17, x2 # perform first operation
fclass.h x7, f29 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard nohaz test
add x10, x19, x25 # perform first operation
fclass.h x12, f31 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x21, x6, x3 # perform first operation
fclass.h x21, f12 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x9, x27, x11 # perform first operation
fclass.h x9, f20 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard waw test
add x15, x2, x10 # perform first operation
fclass.h x15, f29 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x5, x24, x7 # perform first operation
fclass.h x24, f13 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x16, x25, x11 # perform first operation
fclass.h x11, f6 # perform second (triggering) operation

# Testcase cp_gpr/fpr_hazard war test
add x2, x25, x9 # perform first operation
fclass.h x14, f6 # perform second (triggering) operation

# Testcase cp_fs1 (Test source fs1 = f0)
la x2, scratch
li x3, 0x66a33183bb191cdd # load x3 with value 0x66a33183bb191cdd
sw x3, 0(x2) # store 0x66a33183bb191cdd in memory
flh f0, 0(x2) # load 0x66a33183bb191cdd from memory into f0
fclass.h x12, f0 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 256)

# Testcase cp_fs1 (Test source fs1 = f1)
la x2, scratch
li x3, 0xecc94a8855d21382 # load x3 with value 0xecc94a8855d21382
sw x3, 0(x2) # store 0xecc94a8855d21382 in memory
flh f1, 0(x2) # load 0xecc94a8855d21382 from memory into f1
fclass.h x20, f1 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 264)

# Testcase cp_fs1 (Test source fs1 = f2)
la x2, scratch
li x3, 0xf756b7477e7afa35 # load x3 with value 0xf756b7477e7afa35
sw x3, 0(x2) # store 0xf756b7477e7afa35 in memory
flh f2, 0(x2) # load 0xf756b7477e7afa35 from memory into f2
fclass.h x26, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 272)

# Testcase cp_fs1 (Test source fs1 = f3)
la x2, scratch
li x3, 0x7c286dc744d66aaa # load x3 with value 0x7c286dc744d66aaa
sw x3, 0(x2) # store 0x7c286dc744d66aaa in memory
flh f3, 0(x2) # load 0x7c286dc744d66aaa from memory into f3
fclass.h x20, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 280)

# Testcase cp_fs1 (Test source fs1 = f4)
mv x5, x4 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x58c13e9c679c2be8 # load x3 with value 0x58c13e9c679c2be8
sw x3, 0(x2) # store 0x58c13e9c679c2be8 in memory
flh f4, 0(x2) # load 0x58c13e9c679c2be8 from memory into f4
fclass.h x8, f4 # perform operation
RVTEST_SIGUPD(x5, x0, x8, 288)

# Testcase cp_fs1 (Test source fs1 = f5)
mv x6, x5 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x4241f698538c7d42 # load x3 with value 0x4241f698538c7d42
sw x3, 0(x2) # store 0x4241f698538c7d42 in memory
flh f5, 0(x2) # load 0x4241f698538c7d42 from memory into f5
fclass.h x2, f5 # perform operation
RVTEST_SIGUPD(x6, x0, x2, 296)

# Testcase cp_fs1 (Test source fs1 = f6)
mv x7, x6 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0x122e3c3e558a1454 # load x3 with value 0x122e3c3e558a1454
sw x3, 0(x2) # store 0x122e3c3e558a1454 in memory
flh f6, 0(x2) # load 0x122e3c3e558a1454 from memory into f6
fclass.h x11, f6 # perform operation
RVTEST_SIGUPD(x7, x0, x11, 304)

# Testcase cp_fs1 (Test source fs1 = f7)
mv x4, x7 # switch signature pointer register to avoid conflict with test
la x2, scratch
li x3, 0xcf861205f119c75e # load x3 with value 0xcf861205f119c75e
sw x3, 0(x2) # store 0xcf861205f119c75e in memory
flh f7, 0(x2) # load 0xcf861205f119c75e from memory into f7
fclass.h x1, f7 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 312)

# Testcase cp_fs1 (Test source fs1 = f8)
la x2, scratch
li x3, 0xe00ffbb483b0fa09 # load x3 with value 0xe00ffbb483b0fa09
sw x3, 0(x2) # store 0xe00ffbb483b0fa09 in memory
flh f8, 0(x2) # load 0xe00ffbb483b0fa09 from memory into f8
fclass.h x16, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 320)

# Testcase cp_fs1 (Test source fs1 = f9)
la x2, scratch
li x3, 0x882f1ecd44a31d47 # load x3 with value 0x882f1ecd44a31d47
sw x3, 0(x2) # store 0x882f1ecd44a31d47 in memory
flh f9, 0(x2) # load 0x882f1ecd44a31d47 from memory into f9
fclass.h x20, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 328)

# Testcase cp_fs1 (Test source fs1 = f10)
la x2, scratch
li x3, 0x50ae9f7a4fe4c3ec # load x3 with value 0x50ae9f7a4fe4c3ec
sw x3, 0(x2) # store 0x50ae9f7a4fe4c3ec in memory
flh f10, 0(x2) # load 0x50ae9f7a4fe4c3ec from memory into f10
fclass.h x5, f10 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 336)

# Testcase cp_fs1 (Test source fs1 = f11)
la x2, scratch
li x3, 0x37cb04d5c440782d # load x3 with value 0x37cb04d5c440782d
sw x3, 0(x2) # store 0x37cb04d5c440782d in memory
flh f11, 0(x2) # load 0x37cb04d5c440782d from memory into f11
fclass.h x16, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 344)

# Testcase cp_fs1 (Test source fs1 = f12)
la x2, scratch
li x3, 0x852243c84d96975d # load x3 with value 0x852243c84d96975d
sw x3, 0(x2) # store 0x852243c84d96975d in memory
flh f12, 0(x2) # load 0x852243c84d96975d from memory into f12
fclass.h x20, f12 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 352)

# Testcase cp_fs1 (Test source fs1 = f13)
la x2, scratch
li x3, 0x55ec6091613be397 # load x3 with value 0x55ec6091613be397
sw x3, 0(x2) # store 0x55ec6091613be397 in memory
flh f13, 0(x2) # load 0x55ec6091613be397 from memory into f13
fclass.h x26, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 360)

# Testcase cp_fs1 (Test source fs1 = f14)
la x2, scratch
li x3, 0x7b42842a720d2a2f # load x3 with value 0x7b42842a720d2a2f
sw x3, 0(x2) # store 0x7b42842a720d2a2f in memory
flh f14, 0(x2) # load 0x7b42842a720d2a2f from memory into f14
fclass.h x1, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 368)

# Testcase cp_fs1 (Test source fs1 = f15)
la x2, scratch
li x3, 0x3ab4cdc753cc21ab # load x3 with value 0x3ab4cdc753cc21ab
sw x3, 0(x2) # store 0x3ab4cdc753cc21ab in memory
flh f15, 0(x2) # load 0x3ab4cdc753cc21ab from memory into f15
fclass.h x10, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 376)

# Testcase cp_fs1 (Test source fs1 = f16)
la x2, scratch
li x3, 0x6eb25b4506829db3 # load x3 with value 0x6eb25b4506829db3
sw x3, 0(x2) # store 0x6eb25b4506829db3 in memory
flh f16, 0(x2) # load 0x6eb25b4506829db3 from memory into f16
fclass.h x11, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x11, 384)

# Testcase cp_fs1 (Test source fs1 = f17)
la x2, scratch
li x3, 0x2d886b6e1dea9c53 # load x3 with value 0x2d886b6e1dea9c53
sw x3, 0(x2) # store 0x2d886b6e1dea9c53 in memory
flh f17, 0(x2) # load 0x2d886b6e1dea9c53 from memory into f17
fclass.h x10, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 392)

# Testcase cp_fs1 (Test source fs1 = f18)
la x2, scratch
li x3, 0x66221dcf23988d63 # load x3 with value 0x66221dcf23988d63
sw x3, 0(x2) # store 0x66221dcf23988d63 in memory
flh f18, 0(x2) # load 0x66221dcf23988d63 from memory into f18
fclass.h x24, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 400)

# Testcase cp_fs1 (Test source fs1 = f19)
la x2, scratch
li x3, 0x1676456cf675fcd5 # load x3 with value 0x1676456cf675fcd5
sw x3, 0(x2) # store 0x1676456cf675fcd5 in memory
flh f19, 0(x2) # load 0x1676456cf675fcd5 from memory into f19
fclass.h x28, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x28, 408)

# Testcase cp_fs1 (Test source fs1 = f20)
la x2, scratch
li x3, 0x2582b5ff47f3cffa # load x3 with value 0x2582b5ff47f3cffa
sw x3, 0(x2) # store 0x2582b5ff47f3cffa in memory
flh f20, 0(x2) # load 0x2582b5ff47f3cffa from memory into f20
fclass.h x15, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x15, 416)

# Testcase cp_fs1 (Test source fs1 = f21)
la x2, scratch
li x3, 0x167c0535f2ee4036 # load x3 with value 0x167c0535f2ee4036
sw x3, 0(x2) # store 0x167c0535f2ee4036 in memory
flh f21, 0(x2) # load 0x167c0535f2ee4036 from memory into f21
fclass.h x22, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 424)

# Testcase cp_fs1 (Test source fs1 = f22)
la x2, scratch
li x3, 0x434d7257b3093ef3 # load x3 with value 0x434d7257b3093ef3
sw x3, 0(x2) # store 0x434d7257b3093ef3 in memory
flh f22, 0(x2) # load 0x434d7257b3093ef3 from memory into f22
fclass.h x9, f22 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 432)

# Testcase cp_fs1 (Test source fs1 = f23)
la x2, scratch
li x3, 0xfb651d1db4aacb55 # load x3 with value 0xfb651d1db4aacb55
sw x3, 0(x2) # store 0xfb651d1db4aacb55 in memory
flh f23, 0(x2) # load 0xfb651d1db4aacb55 from memory into f23
fclass.h x30, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x30, 440)

# Testcase cp_fs1 (Test source fs1 = f24)
la x2, scratch
li x3, 0xf72bbc7955ec33d0 # load x3 with value 0xf72bbc7955ec33d0
sw x3, 0(x2) # store 0xf72bbc7955ec33d0 in memory
flh f24, 0(x2) # load 0xf72bbc7955ec33d0 from memory into f24
fclass.h x6, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 448)

# Testcase cp_fs1 (Test source fs1 = f25)
la x2, scratch
li x3, 0xabce4cc28c03553e # load x3 with value 0xabce4cc28c03553e
sw x3, 0(x2) # store 0xabce4cc28c03553e in memory
flh f25, 0(x2) # load 0xabce4cc28c03553e from memory into f25
fclass.h x19, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x19, 456)

# Testcase cp_fs1 (Test source fs1 = f26)
la x2, scratch
li x3, 0x346146a33ddbb948 # load x3 with value 0x346146a33ddbb948
sw x3, 0(x2) # store 0x346146a33ddbb948 in memory
flh f26, 0(x2) # load 0x346146a33ddbb948 from memory into f26
fclass.h x16, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 464)

# Testcase cp_fs1 (Test source fs1 = f27)
la x2, scratch
li x3, 0x4f44f53cebe349ba # load x3 with value 0x4f44f53cebe349ba
sw x3, 0(x2) # store 0x4f44f53cebe349ba in memory
flh f27, 0(x2) # load 0x4f44f53cebe349ba from memory into f27
fclass.h x29, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 472)

# Testcase cp_fs1 (Test source fs1 = f28)
la x2, scratch
li x3, 0xc16a8d540076c97 # load x3 with value 0xc16a8d540076c97
sw x3, 0(x2) # store 0xc16a8d540076c97 in memory
flh f28, 0(x2) # load 0xc16a8d540076c97 from memory into f28
fclass.h x25, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 480)

# Testcase cp_fs1 (Test source fs1 = f29)
la x2, scratch
li x3, 0x7a6f600e67a353d8 # load x3 with value 0x7a6f600e67a353d8
sw x3, 0(x2) # store 0x7a6f600e67a353d8 in memory
flh f29, 0(x2) # load 0x7a6f600e67a353d8 from memory into f29
fclass.h x10, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 488)

# Testcase cp_fs1 (Test source fs1 = f30)
la x2, scratch
li x3, 0xaa10d583b4f9f4ff # load x3 with value 0xaa10d583b4f9f4ff
sw x3, 0(x2) # store 0xaa10d583b4f9f4ff in memory
flh f30, 0(x2) # load 0xaa10d583b4f9f4ff from memory into f30
fclass.h x29, f30 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 496)

# Testcase cp_fs1 (Test source fs1 = f31)
la x2, scratch
li x3, 0xa75e3afab3a34bed # load x3 with value 0xa75e3afab3a34bed
sw x3, 0(x2) # store 0xa75e3afab3a34bed in memory
flh f31, 0(x2) # load 0xa75e3afab3a34bed from memory into f31
fclass.h x21, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 504)

# Testcase cp_fs1_corners (Test source fs1 value = 0x0)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flh f24, 0(x2) # load 0x00000000 from memory into f24
fclass.h x23, f24 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 512)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008000 # load x3 with value 0x00008000
sw x3, 0(x2) # store 0x00008000 in memory
flh f19, 0(x2) # load 0x00008000 from memory into f19
fclass.h x20, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 520)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003c00 # load x3 with value 0x00003c00
sw x3, 0(x2) # store 0x00003c00 in memory
flh f15, 0(x2) # load 0x00003c00 from memory into f15
fclass.h x1, f15 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 528)

# Testcase cp_fs1_corners (Test source fs1 value = 0xbc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000bc00 # load x3 with value 0x0000bc00
sw x3, 0(x2) # store 0x0000bc00 in memory
flh f20, 0(x2) # load 0x0000bc00 from memory into f20
fclass.h x1, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x1, 536)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00003e00 # load x3 with value 0x00003e00
sw x3, 0(x2) # store 0x00003e00 in memory
flh f2, 0(x2) # load 0x00003e00 from memory into f2
fclass.h x27, f2 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 544)

# Testcase cp_fs1_corners (Test source fs1 value = 0xbe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000be00 # load x3 with value 0x0000be00
sw x3, 0(x2) # store 0x0000be00 in memory
flh f19, 0(x2) # load 0x0000be00 from memory into f19
fclass.h x21, f19 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 552)

# Testcase cp_fs1_corners (Test source fs1 value = 0x4000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00004000 # load x3 with value 0x00004000
sw x3, 0(x2) # store 0x00004000 in memory
flh f13, 0(x2) # load 0x00004000 from memory into f13
fclass.h x7, f13 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 560)

# Testcase cp_fs1_corners (Test source fs1 value = 0xc000)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c000 # load x3 with value 0x0000c000
sw x3, 0(x2) # store 0x0000c000 in memory
flh f31, 0(x2) # load 0x0000c000 from memory into f31
fclass.h x25, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 568)

# Testcase cp_fs1_corners (Test source fs1 value = 0x400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000400 # load x3 with value 0x00000400
sw x3, 0(x2) # store 0x00000400 in memory
flh f6, 0(x2) # load 0x00000400 from memory into f6
fclass.h x21, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 576)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8400)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008400 # load x3 with value 0x00008400
sw x3, 0(x2) # store 0x00008400 in memory
flh f16, 0(x2) # load 0x00008400 from memory into f16
fclass.h x12, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x12, 584)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7bff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007bff # load x3 with value 0x00007bff
sw x3, 0(x2) # store 0x00007bff in memory
flh f26, 0(x2) # load 0x00007bff from memory into f26
fclass.h x9, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 592)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfbff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fbff # load x3 with value 0x0000fbff
sw x3, 0(x2) # store 0x0000fbff in memory
flh f23, 0(x2) # load 0x0000fbff from memory into f23
fclass.h x9, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x9, 600)

# Testcase cp_fs1_corners (Test source fs1 value = 0x3ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000003ff # load x3 with value 0x000003ff
sw x3, 0(x2) # store 0x000003ff in memory
flh f20, 0(x2) # load 0x000003ff from memory into f20
fclass.h x24, f20 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 608)

# Testcase cp_fs1_corners (Test source fs1 value = 0x83ff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000083ff # load x3 with value 0x000083ff
sw x3, 0(x2) # store 0x000083ff in memory
flh f8, 0(x2) # load 0x000083ff from memory into f8
fclass.h x18, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 616)

# Testcase cp_fs1_corners (Test source fs1 value = 0x200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000200 # load x3 with value 0x00000200
sw x3, 0(x2) # store 0x00000200 in memory
flh f8, 0(x2) # load 0x00000200 from memory into f8
fclass.h x22, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 624)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8200)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008200 # load x3 with value 0x00008200
sw x3, 0(x2) # store 0x00008200 in memory
flh f14, 0(x2) # load 0x00008200 from memory into f14
fclass.h x24, f14 # perform operation
RVTEST_SIGUPD(x4, x0, x24, 632)

# Testcase cp_fs1_corners (Test source fs1 value = 0x1)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000001 # load x3 with value 0x00000001
sw x3, 0(x2) # store 0x00000001 in memory
flh f27, 0(x2) # load 0x00000001 from memory into f27
fclass.h x6, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x6, 640)

# Testcase cp_fs1_corners (Test source fs1 value = 0x8001)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00008001 # load x3 with value 0x00008001
sw x3, 0(x2) # store 0x00008001 in memory
flh f23, 0(x2) # load 0x00008001 from memory into f23
fclass.h x5, f23 # perform operation
RVTEST_SIGUPD(x4, x0, x5, 648)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c00 # load x3 with value 0x00007c00
sw x3, 0(x2) # store 0x00007c00 in memory
flh f27, 0(x2) # load 0x00007c00 from memory into f27
fclass.h x26, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x26, 656)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc00 # load x3 with value 0x0000fc00
sw x3, 0(x2) # store 0x0000fc00 in memory
flh f11, 0(x2) # load 0x0000fc00 from memory into f11
fclass.h x10, f11 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 664)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7e00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007e00 # load x3 with value 0x00007e00
sw x3, 0(x2) # store 0x00007e00 in memory
flh f28, 0(x2) # load 0x00007e00 from memory into f28
fclass.h x20, f28 # perform operation
RVTEST_SIGUPD(x4, x0, x20, 672)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7fff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007fff # load x3 with value 0x00007fff
sw x3, 0(x2) # store 0x00007fff in memory
flh f16, 0(x2) # load 0x00007fff from memory into f16
fclass.h x31, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 680)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfe00)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fe00 # load x3 with value 0x0000fe00
sw x3, 0(x2) # store 0x0000fe00 in memory
flh f21, 0(x2) # load 0x0000fe00 from memory into f21
fclass.h x17, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x17, 688)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7c01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007c01 # load x3 with value 0x00007c01
sw x3, 0(x2) # store 0x00007c01 in memory
flh f8, 0(x2) # load 0x00007c01 from memory into f8
fclass.h x18, f8 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 696)

# Testcase cp_fs1_corners (Test source fs1 value = 0x7dff)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00007dff # load x3 with value 0x00007dff
sw x3, 0(x2) # store 0x00007dff in memory
flh f9, 0(x2) # load 0x00007dff from memory into f9
fclass.h x31, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x31, 704)

# Testcase cp_fs1_corners (Test source fs1 value = 0xfc01)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000fc01 # load x3 with value 0x0000fc01
sw x3, 0(x2) # store 0x0000fc01 in memory
flh f6, 0(x2) # load 0x0000fc01 from memory into f6
fclass.h x23, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 712)

# Testcase cp_fs1_corners (Test source fs1 value = 0x58b4)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x000058b4 # load x3 with value 0x000058b4
sw x3, 0(x2) # store 0x000058b4 in memory
flh f16, 0(x2) # load 0x000058b4 from memory into f16
fclass.h x2, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 720)

# Testcase cp_fs1_corners (Test source fs1 value = 0xc93a)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0000c93a # load x3 with value 0x0000c93a
sw x3, 0(x2) # store 0x0000c93a in memory
flh f25, 0(x2) # load 0x0000c93a from memory into f25
fclass.h x27, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x27, 728)

# Testcase Improper NaNBoxed argument test (Value 0x0 in f31)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x00000000 # load x3 with value 0x00000000
sw x3, 0(x2) # store 0x00000000 in memory
flw f31, 0(x2) # load 0x00000000 from memory into f31
fclass.h x25, f31 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 736)

# Testcase Improper NaNBoxed argument test (Value 0xfffe8000 in f16)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfffe8000 # load x3 with value 0xfffe8000
sw x3, 0(x2) # store 0xfffe8000 in memory
flw f16, 0(x2) # load 0xfffe8000 from memory into f16
fclass.h x29, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 744)

# Testcase Improper NaNBoxed argument test (Value 0x7fff3c00 in f26)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x7fff3c00 # load x3 with value 0x7fff3c00
sw x3, 0(x2) # store 0x7fff3c00 in memory
flw f26, 0(x2) # load 0x7fff3c00 from memory into f26
fclass.h x22, f26 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 752)

# Testcase Improper NaNBoxed argument test (Value 0xbeefbc00 in f3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xbeefbc00 # load x3 with value 0xbeefbc00
sw x3, 0(x2) # store 0xbeefbc00 in memory
flw f3, 0(x2) # load 0xbeefbc00 from memory into f3
fclass.h x25, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x25, 760)

# Testcase Improper NaNBoxed argument test (Value 0xfeff0400 in f18)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeff0400 # load x3 with value 0xfeff0400
sw x3, 0(x2) # store 0xfeff0400 in memory
flw f18, 0(x2) # load 0xfeff0400 from memory into f18
fclass.h x10, f18 # perform operation
RVTEST_SIGUPD(x4, x0, x10, 768)

# Testcase Improper NaNBoxed argument test (Value 0xfff8400 in f17)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0fff8400 # load x3 with value 0x0fff8400
sw x3, 0(x2) # store 0x0fff8400 in memory
flw f17, 0(x2) # load 0x0fff8400 from memory into f17
fclass.h x22, f17 # perform operation
RVTEST_SIGUPD(x4, x0, x22, 776)

# Testcase Improper NaNBoxed argument test (Value 0xefff7bff in f16)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xefff7bff # load x3 with value 0xefff7bff
sw x3, 0(x2) # store 0xefff7bff in memory
flw f16, 0(x2) # load 0xefff7bff from memory into f16
fclass.h x21, f16 # perform operation
RVTEST_SIGUPD(x4, x0, x21, 784)

# Testcase Improper NaNBoxed argument test (Value 0xc0defbff in f25)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xc0defbff # load x3 with value 0xc0defbff
sw x3, 0(x2) # store 0xc0defbff in memory
flw f25, 0(x2) # load 0xc0defbff from memory into f25
fclass.h x18, f25 # perform operation
RVTEST_SIGUPD(x4, x0, x18, 792)

# Testcase Improper NaNBoxed argument test (Value 0x4f1a7c00 in f3)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4f1a7c00 # load x3 with value 0x4f1a7c00
sw x3, 0(x2) # store 0x4f1a7c00 in memory
flw f3, 0(x2) # load 0x4f1a7c00 from memory into f3
fclass.h x16, f3 # perform operation
RVTEST_SIGUPD(x4, x0, x16, 800)

# Testcase Improper NaNBoxed argument test (Value 0xffffc00 in f29)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x0ffffc00 # load x3 with value 0x0ffffc00
sw x3, 0(x2) # store 0x0ffffc00 in memory
flw f29, 0(x2) # load 0x0ffffc00 from memory into f29
fclass.h x2, f29 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 808)

# Testcase Improper NaNBoxed argument test (Value 0xffef7e00 in f9)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xffef7e00 # load x3 with value 0xffef7e00
sw x3, 0(x2) # store 0xffef7e00 in memory
flw f9, 0(x2) # load 0xffef7e00 from memory into f9
fclass.h x2, f9 # perform operation
RVTEST_SIGUPD(x4, x0, x2, 816)

# Testcase Improper NaNBoxed argument test (Value 0xfeef7fff in f6)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xfeef7fff # load x3 with value 0xfeef7fff
sw x3, 0(x2) # store 0xfeef7fff in memory
flw f6, 0(x2) # load 0xfeef7fff from memory into f6
fclass.h x7, f6 # perform operation
RVTEST_SIGUPD(x4, x0, x7, 824)

# Testcase Improper NaNBoxed argument test (Value 0xa1b27c01 in f27)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0xa1b27c01 # load x3 with value 0xa1b27c01
sw x3, 0(x2) # store 0xa1b27c01 in memory
flw f27, 0(x2) # load 0xa1b27c01 from memory into f27
fclass.h x23, f27 # perform operation
RVTEST_SIGUPD(x4, x0, x23, 832)

# Testcase Improper NaNBoxed argument test (Value 0x4fd77dff in f21)
fsflagsi 0b00000 # clear all fflags
la x2, scratch
li x3, 0x4fd77dff # load x3 with value 0x4fd77dff
sw x3, 0(x2) # store 0x4fd77dff in memory
flw f21, 0(x2) # load 0x4fd77dff from memory into f21
fclass.h x29, f21 # perform operation
RVTEST_SIGUPD(x4, x0, x29, 840)

#.EQU SIGSIZE,848
.EQU SIGSIZE,2856 #combined


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
