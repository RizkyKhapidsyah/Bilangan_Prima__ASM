.386
.model flat,stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.code
start:
    ; inisialisasi variabel
    mov ecx, 100          ; batas angka prima yang ditampilkan
    mov ebx, 2            ; bilangan prima pertama
print_primes:
    ; periksa apakah bilangan saat ini prima
    push ecx
    mov edx, 2            ; pembagi pertama
check_prime:
    cmp ebx, edx          ; periksa apakah pembagi lebih besar dari bilangan
    jle is_prime          ; jika tidak, maka bilangan adalah prima
    mov eax, ebx
    xor edx, edx
    div edx              ; bagi bilangan dengan pembagi
    cmp edx, 0            ; apakah sisa bagi sama dengan nol?
    je not_prime          ; jika ya, maka bukan bilangan prima
    inc edx              ; cek bilangan berikutnya
    jmp check_prime
is_prime:
    ; tampilkan bilangan prima
    invoke StdOut, addr ebx
    invoke StdOut, addr newline
not_prime:
    ; cek bilangan prima berikutnya
    pop ecx
    inc ebx
    loop print_primes

invoke ExitProcess, 0

newline db 0Ah, 0

end start