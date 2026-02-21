.section .text
.globl hamming_distance

# rdi = pointer to string 1
# rsi = pointer to string 2
# rdx = length
# total = 0

#Function: hamming_distance
#rdi = pointer to first string
#rsi = pointer to second string
#rdx = length of shorter string
#Returns:
#rax = Hamming distance (number of differing bit positions)


hamming_distance:
   
    xor %rax, %rax  
    #Charcter index is 0      
    xor %r10, %r10        


#Iterate over each character up to given length
char_loop:
    cmp %rdx, %r10
    jge done

    mov (%rdi,%r10,1), %r9b
    xor (%rsi,%r10,1), %r9b

    mov $8, %rcx
#Count number of 1 bits in XOR result
bit_loop:
    test $1, %r9b
    jz skip
    inc %rax

skip:
    shr $1, %r9b
    loop bit_loop

    inc %r10
    jmp char_loop

done:
    ret
.section .note.GNU-stack,"",@progbits

