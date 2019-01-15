from __future__ import print_function
from unicorn import *
from unicorn.x86_const import *

ADDRESS = 0x1000000
X86_CODE32 = b"\x41\x4a\x66\x0f\xef\xc1" # INC ecx; DEC edx; PXOR xmm0, xmm1


def hook_code(uc, address, size, user_data):
    print(">>> Tracing instruction at 0x%x, instruction size = 0x%x" %(address, size))


mu = Uc(UC_ARCH_X86, UC_MODE_32)

mu.mem_map(ADDRESS, 2 * 1024 * 1024)
mu.mem_write(ADDRESS, X86_CODE32)

mu.reg_write(UC_X86_REG_ECX, 0x1234)
mu.reg_write(UC_X86_REG_EDX, 0x7890)

mu.hook_add(UC_HOOK_CODE, hook_code)

mu.emu_start(ADDRESS, ADDRESS + len(X86_CODE32))

r_ecx = mu.reg_read(UC_X86_REG_ECX)
r_edx = mu.reg_read(UC_X86_REG_EDX)
print(">>> ECX = 0x%x" %r_ecx)
print(">>> EDX = 0x%x" %r_edx)

tmp = mu.mem_read(ADDRESS, 4)
print(">>> Read 4 bytes from [0x%x] = 0x" %(ADDRESS), end="")
for i in reversed(tmp):
    print("%x" %(i), end="")
print("")
