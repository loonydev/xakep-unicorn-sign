#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import print_function
from unicorn import *
from unicorn.x86_const import *
import struct

def read(name):
    with open(name,'rb') as f:
        return f.read()

instructions_skip_list = []

def hook_mem_invalid(uc, access, address, size, value, user_data):
    if access == UC_MEM_WRITE_UNMAPPED:
        print(">>> Missing memory is being WRITE at 0x%x, data size = %u, data value = 0x%x" %(address, size, value))
        return True
    else:
        print(">>> Missing memory is being READ at 0x%x, data size = %u, data value = 0x%x" %(address, size, value))
        return False

def hook_mem_access(uc, access, address, size, value, user_data):
    if access == UC_MEM_WRITE:
        print(">>> Memory is being WRITE at 0x%x, data size = %u, data value = 0x%x" %(address, size, value))
    else:   # READ
        print(">>> Memory is being READ at 0x%x, data size = %u" %(address, size))




def hook_code(mu, address, size, user_data):
    print('>>> Tracing instruction at 0x%x, instruction size = 0x%x' %(address, size))

    if address == 0xa96cb862:
        if mu.reg_read(UC_X86_REG_EAX)>0x118:
            result.append("00")
        else:
            result.append("".join('{:02x}'.format(mu.reg_read(UC_X86_REG_EAX))))

    if address in instructions_skip_list:
        mu.reg_write(UC_X86_REG_EIP,address+size)


libnative_adr = 0xa96cb000 # dump_native_lib 0xa96cb000 0xa96ce000
libnative_size = 0x1000 + 0x1000 + 0x1000

main_stack_adr = 0xbf055000 # dump_main_stack 0xbf055000 0xbf854000
main_stack_size = 0x7ff000

mu = Uc(UC_ARCH_X86, UC_MODE_32)

mu.mem_map(0x0,0x1000,UC_PROT_ALL)

mu.mem_map(libnative_adr,libnative_size,UC_PROT_ALL)
mu.mem_write(libnative_adr, read("dump_native_lib"))

mu.mem_map(main_stack_adr,main_stack_size,UC_PROT_ALL)
mu.mem_write(main_stack_adr, read("stack"))

string_for_hash = '{"login":"long_login","password":"long_pass"}'

mu.mem_write(0x0, bytes(string_for_hash))

mu.reg_write(UC_X86_REG_EAX,0xa96ccfd8)
mu.reg_write(UC_X86_REG_ECX,len(string_for_hash))
mu.reg_write(UC_X86_REG_EDX,len(string_for_hash)*4)
mu.reg_write(UC_X86_REG_EBX,0xa96ccfd8)
mu.reg_write(UC_X86_REG_ESP,0xbf84f2d0)
mu.reg_write(UC_X86_REG_EBP,0xbf84f3e8)
mu.reg_write(UC_X86_REG_ESI,0xbf84f360)
mu.reg_write(UC_X86_REG_EDI,0xbf84f2d0)
mu.reg_write(UC_X86_REG_EIP,0xa96cb83b)

mu.mem_write(mu.reg_read(UC_X86_REG_ESI)+0x40,b'\x00\x00\x00\x00')

result = []
mu.hook_add(UC_HOOK_CODE, hook_code, user_data=result)
mu.hook_add(UC_HOOK_MEM_READ_UNMAPPED | UC_HOOK_MEM_WRITE_UNMAPPED, hook_mem_invalid)
mu.hook_add(UC_HOOK_MEM_WRITE, hook_mem_access)
mu.hook_add(UC_HOOK_MEM_READ, hook_mem_access)

mu.emu_start(0xa96cb83b,0xa96cb8be)


print(" ".join(result))
