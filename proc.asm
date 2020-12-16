; Вывод символов ASCII-таблицы на экран с использованием подпрограммы (см. smile.asm).

use16
org 0x100

    mov ax, 0x0B800
    mov es, ax
    mov al, 1
    mov ah, 31
    mov cx, 254         ; Устанавливаем количество выводимых символов.

next_screen:
    mov di, 0

    call out_chars      ; Вывываем подпрограмму.

    inc al

    loop next_screen

    mov ah, 0x10
    int 0x16
    int 0x20

out_chars:              ; Определяем подпрограмму. Компилятор FASM не предусматривает использование макросов proc и endp.
    mov dx, cx
    mov cx, 2000

next_face:
    mov [es:di], ax
    add di, 2
    loop next_face

    mov cx, dx
    ret