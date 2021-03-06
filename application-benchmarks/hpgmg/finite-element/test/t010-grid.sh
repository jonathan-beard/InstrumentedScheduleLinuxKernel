#!/bin/sh

test_description='Test grid creation'

. ./hpgmg-sharness.sh

test_expect_stdout 'single-process grid' 1 'hpgmg-fe test-grid -cmax 100 -p 1,1,1 -M 48,48,16' '
[0] Level 4: [   0:  48,   0:  48,   0:  16] of [  48,  48,  16] on [  1,  1,  1]
[0] Level 3: [   0:  24,   0:  24,   0:   8] of [  24,  24,   8] on [  1,  1,  1]
[0] Level 2: [   0:  12,   0:  12,   0:   4] of [  12,  12,   4] on [  1,  1,  1]
[0] Level 1: [   0:   6,   0:   6,   0:   2] of [   6,   6,   2] on [  1,  1,  1]
[0] Level 0: [   0:   3,   0:   3,   0:   1] of [   3,   3,   1] on [  1,  1,  1]
'

test_expect_stdout '3D grid' 9 'hpgmg-fe test-grid -cmax 48 -p 1,3,3 -M 16,48,32' '
[0] Level 4: [   0:  16,   0:  16,   0:  11] of [  16,  48,  32] on [  1,  3,  3]
[0] Level 3: [   0:   8,   0:   8,   0:   6] of [   8,  24,  16] on [  1,  3,  3]
[0] Level 2: [   0:   4,   0:   4,   0:   3] of [   4,  12,   8] on [  1,  3,  3]
[0] Level 1: [   0:   2,   0:   3,   0:   2] of [   2,   6,   4] on [  1,  2,  2]
[0] Level 0: [   0:   1,   0:   3,   0:   2] of [   1,   3,   2] on [  1,  1,  1]
[1] Level 4: [   0:  16,   0:  16,  11:  22] of [  16,  48,  32] on [  1,  3,  3]
[1] Level 3: [   0:   8,   0:   8,   6:  11] of [   8,  24,  16] on [  1,  3,  3]
[1] Level 2: [   0:   4,   0:   4,   3:   6] of [   4,  12,   8] on [  1,  3,  3]
[2] Level 4: [   0:  16,  16:  32,   0:  11] of [  16,  48,  32] on [  1,  3,  3]
[2] Level 3: [   0:   8,   8:  16,   0:   6] of [   8,  24,  16] on [  1,  3,  3]
[2] Level 2: [   0:   4,   4:   8,   0:   3] of [   4,  12,   8] on [  1,  3,  3]
[3] Level 4: [   0:  16,  16:  32,  11:  22] of [  16,  48,  32] on [  1,  3,  3]
[3] Level 3: [   0:   8,   8:  16,   6:  11] of [   8,  24,  16] on [  1,  3,  3]
[3] Level 2: [   0:   4,   4:   8,   3:   6] of [   4,  12,   8] on [  1,  3,  3]
[4] Level 4: [   0:  16,   0:  16,  22:  32] of [  16,  48,  32] on [  1,  3,  3]
[4] Level 3: [   0:   8,   0:   8,  11:  16] of [   8,  24,  16] on [  1,  3,  3]
[4] Level 2: [   0:   4,   0:   4,   6:   8] of [   4,  12,   8] on [  1,  3,  3]
[4] Level 1: [   0:   2,   0:   3,   2:   4] of [   2,   6,   4] on [  1,  2,  2]
[5] Level 4: [   0:  16,  16:  32,  22:  32] of [  16,  48,  32] on [  1,  3,  3]
[5] Level 3: [   0:   8,   8:  16,  11:  16] of [   8,  24,  16] on [  1,  3,  3]
[5] Level 2: [   0:   4,   4:   8,   6:   8] of [   4,  12,   8] on [  1,  3,  3]
[6] Level 4: [   0:  16,  32:  48,   0:  11] of [  16,  48,  32] on [  1,  3,  3]
[6] Level 3: [   0:   8,  16:  24,   0:   6] of [   8,  24,  16] on [  1,  3,  3]
[6] Level 2: [   0:   4,   8:  12,   0:   3] of [   4,  12,   8] on [  1,  3,  3]
[6] Level 1: [   0:   2,   3:   6,   0:   2] of [   2,   6,   4] on [  1,  2,  2]
[7] Level 4: [   0:  16,  32:  48,  11:  22] of [  16,  48,  32] on [  1,  3,  3]
[7] Level 3: [   0:   8,  16:  24,   6:  11] of [   8,  24,  16] on [  1,  3,  3]
[7] Level 2: [   0:   4,   8:  12,   3:   6] of [   4,  12,   8] on [  1,  3,  3]
[8] Level 4: [   0:  16,  32:  48,  22:  32] of [  16,  48,  32] on [  1,  3,  3]
[8] Level 3: [   0:   8,  16:  24,  11:  16] of [   8,  24,  16] on [  1,  3,  3]
[8] Level 2: [   0:   4,   8:  12,   6:   8] of [   4,  12,   8] on [  1,  3,  3]
[8] Level 1: [   0:   2,   3:   6,   2:   4] of [   2,   6,   4] on [  1,  2,  2]
'

test_expect_stdout '3D grid incompatible coarsening' 9 'hpgmg-fe test-grid -cmax 36 -p 1,3,3 -M 8,48,24' '
[0] Level 3: [   0:   8,   0:  16,   0:   8] of [   8,  48,  24] on [  1,  3,  3]
[0] Level 2: [   0:   4,   0:   8,   0:   4] of [   4,  24,  12] on [  1,  3,  3]
[0] Level 1: [   0:   2,   0:   6,   0:   3] of [   2,  12,   6] on [  1,  2,  2]
[0] Level 0: [   0:   1,   0:   6,   0:   3] of [   1,   6,   3] on [  1,  1,  1]
[1] Level 3: [   0:   8,   0:  16,   8:  16] of [   8,  48,  24] on [  1,  3,  3]
[1] Level 2: [   0:   4,   0:   8,   4:   8] of [   4,  24,  12] on [  1,  3,  3]
[2] Level 3: [   0:   8,  16:  32,   0:   8] of [   8,  48,  24] on [  1,  3,  3]
[2] Level 2: [   0:   4,   8:  16,   0:   4] of [   4,  24,  12] on [  1,  3,  3]
[3] Level 3: [   0:   8,  16:  32,   8:  16] of [   8,  48,  24] on [  1,  3,  3]
[3] Level 2: [   0:   4,   8:  16,   4:   8] of [   4,  24,  12] on [  1,  3,  3]
[4] Level 3: [   0:   8,   0:  16,  16:  24] of [   8,  48,  24] on [  1,  3,  3]
[4] Level 2: [   0:   4,   0:   8,   8:  12] of [   4,  24,  12] on [  1,  3,  3]
[4] Level 1: [   0:   2,   0:   6,   3:   6] of [   2,  12,   6] on [  1,  2,  2]
[5] Level 3: [   0:   8,  16:  32,  16:  24] of [   8,  48,  24] on [  1,  3,  3]
[5] Level 2: [   0:   4,   8:  16,   8:  12] of [   4,  24,  12] on [  1,  3,  3]
[6] Level 3: [   0:   8,  32:  48,   0:   8] of [   8,  48,  24] on [  1,  3,  3]
[6] Level 2: [   0:   4,  16:  24,   0:   4] of [   4,  24,  12] on [  1,  3,  3]
[6] Level 1: [   0:   2,   6:  12,   0:   3] of [   2,  12,   6] on [  1,  2,  2]
[7] Level 3: [   0:   8,  32:  48,   8:  16] of [   8,  48,  24] on [  1,  3,  3]
[7] Level 2: [   0:   4,  16:  24,   4:   8] of [   4,  24,  12] on [  1,  3,  3]
[8] Level 3: [   0:   8,  32:  48,  16:  24] of [   8,  48,  24] on [  1,  3,  3]
[8] Level 2: [   0:   4,  16:  24,   8:  12] of [   4,  24,  12] on [  1,  3,  3]
[8] Level 1: [   0:   2,   6:  12,   3:   6] of [   2,  12,   6] on [  1,  2,  2]
'

test_done
