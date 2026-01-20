.model small
.stack 100h

.data
menu db 13,10,"=== SISTEM ANTRIAN PRIORITAS ===",13,10
     db "1. Ambil Reguler",13,10
     db "2. Ambil Prioritas",13,10
     db "3. Panggil Antrian",13,10
     db "4. Keluar",13,10
     db "Pilih: $"

msgR db 13,10,"Nomor Reguler: R$"
msgP db 13,10,"Nomor Prioritas: P$"
msgCall db 13,10,"Dipanggil: $"
msgEmpty db 13,10,"Antrian kosong.$"

regNext db 1
prioNext db 1
regCall db 1
prioCall db 1

.code
main proc
    mov ax,@data
    mov ds,ax

menu_loop:
    lea dx,menu
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,'0'

    cmp al,1
    je ambil_reg
    cmp al,2
    je ambil_prio
    cmp al,3
    je panggil
    cmp al,4
    je keluar
    jmp menu_loop

ambil_reg:
    lea dx,msgR
    mov ah,09h
    int 21h

    mov al,regNext
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h

    inc regNext
    jmp menu_loop

ambil_prio:
    lea dx,msgP
    mov ah,09h
    int 21h

    mov al,prioNext
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h

    inc prioNext
    jmp menu_loop

; ===== PANGGIL ANTRIAN (FIXED) =====
panggil:
    mov al, prioCall     ; AL = nomor prioritas yang akan dipanggil
    cmp al, prioNext
    jb call_prio         ; jika masih ada prioritas

    mov al, regCall
    cmp al, regNext
    jb call_reg          ; jika masih ada reguler

    lea dx,msgEmpty
    mov ah,09h
    int 21h
    jmp menu_loop

call_prio:
    lea dx,msgCall
    mov ah,09h
    int 21h

    mov dl,'P'
    mov ah,02h
    int 21h

    mov al,prioCall
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h

    inc prioCall
    jmp menu_loop

call_reg:
    lea dx,msgCall
    mov ah,09h
    int 21h

    mov dl,'R'
    mov ah,02h
    int 21h

    mov al,regCall
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h

    inc regCall
    jmp menu_loop

keluar:
    mov ah,4Ch
    int 21h

main endp
end main
.model small
.stack 100h

.data
menu db 13,10,"=== SISTEM ANTRIAN PRIORITAS ===",13,10
     db "1. Ambil Reguler",13,10
     db "2. Ambil Prioritas",13,10
     db "3. Panggil Antrian",13,10
     db "4. Keluar",13,10
     db "Pilih: $"

msgR db 13,10,"Nomor Reguler: R$"
msgP db 13,10,"Nomor Prioritas: P$"
msgCall db 13,10,"Dipanggil: $"
msgEmpty db 13,10,"Antrian kosong.$"

regNext db 1
prioNext db 1
regCall db 1
prioCall db 1

.code
main proc
    mov ax,@data
    mov ds,ax

menu_loop:
    lea dx,menu
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,'0'

    cmp al,1
    je ambil_reg
    cmp al,2
    je ambil_prio
    cmp al,3
    je panggil
    cmp al,4
    je keluar
    jmp menu_loop

ambil_reg:
    lea dx,msgR
    mov ah,09h
    int 21h

    mov al,regNext
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h

    inc regNext
    jmp menu_loop

ambil_prio:
    lea dx,msgP
    mov ah,09h
    int 21h

    mov al,prioNext
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h

    inc prioNext
    jmp menu_loop

; ===== PANGGIL ANTRIAN (FIXED) =====
panggil:
    mov al, prioCall     ; AL = nomor prioritas yang akan dipanggil
    cmp al, prioNext
    jb call_prio         ; jika masih ada prioritas

    mov al, regCall
    cmp al, regNext
    jb call_reg          ; jika masih ada reguler

    lea dx,msgEmpty
    mov ah,09h
    int 21h
    jmp menu_loop

call_prio:
    lea dx,msgCall
    mov ah,09h
    int 21h

    mov dl,'P'
    mov ah,02h
    int 21h

    mov al,prioCall
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h

    inc prioCall
    jmp menu_loop

call_reg:
    lea dx,msgCall
    mov ah,09h
    int 21h

    mov dl,'R'
    mov ah,02h
    int 21h

    mov al,regCall
    add al,'0'
    mov dl,al
    mov ah,02h
    int 21h

    inc regCall
    jmp menu_loop

keluar:
    mov ah,4Ch
    int 21h

main endp
end main
