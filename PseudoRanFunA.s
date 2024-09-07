.global _PseudoRanFunA
_PseudoRanFunA:

#SETUP
pushl %ebp
movl  %esp, %ebp

#BODY
movl 8(%ebp), %ecx #Get the value of seed and store it in %ecx
movl 12(%ebp), %edx #Give initial seed value to %edx

cmpl $0, (%ecx)
jne .L1 #jump if %ecx 's value is not zero
movl (%edx), %esi #make value of the %ecx equal to initial seed
movl %esi, (%ecx)

.L1:
movl (%ecx), %eax #make copy of %ecx 's value
shrl $2, %eax #LFSR >> 2
xorl (%ecx), %eax #(LFSR >> 0)^(LFSR >> 2)

movl (%ecx), %ebx #make copy of %ecx 's value
shrl $6, %ebx #(LFSR >> 6)
xorl %ebx, %eax #(LFSR >> 0) ^ (LFSR >> 2) ^ (LFSR >> 6)

movl (%ecx), %ebx
shrl $7, %ebx #(LFSR >> 7)
xorl %ebx, %eax #(LFSR >> 0) ^ (LFSR >> 2) ^ (LFSR >> 6) ^ (LFSR >> 7)

andl $1, %eax #we only need last bit so mask it with $1
shll $31,%eax #made bit high order bit
shrl $1, (%ecx) #emptied a space to put a bit in
orl (%ecx), %eax #final result
movl %eax, (%ecx) #change value of %ecx for future operation

#Finish
movl %ebp, %esp
pop %ebp
ret
