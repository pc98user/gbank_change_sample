; gbanksmp.asm
; G-VRAMバンク切り替えのサンプル
;
;  Created on: 2023/01/31
;      Author: pc98user
;              pc98user@mydomain.mydns.jp

; 画面左上に、
;   青書き込み、描画バンク切り替え、赤書き込み、表示バンク切り替え
; を実施する。
; バンク切り替えができていれば最終的に
;   青/赤→赤
; できていなければ
;   青＋赤＝マゼンタ
; になる。

cpu 8086
bits 16

org 100h
start:
	; グラフィック画面表示(GDCパラメタ省略)
	mov al,0fh
	out 0a2h,al

	; デフォルト(想定)
	; ・バンク#0を表示
	; ・バンク#0に描画
	; ・バンク#0、#1ともゼロクリア済み

	; 青プレーンを選択
	mov ax,0a800h
	mov ds,ax

	; VRAMへ書き込み
	mov al,0ffh
	mov bx,0
	mov [bx],al

	; バンク#1に描画指定
	mov al,01h
	out 0a6h,al

	; 赤プレーンを選択
	mov ax,0b000h
	mov ds,ax

	; VRAMへ書き込み
	mov al,0ffh
	mov bx,0
	mov [bx],al

	; バンク#1を表示指定
	mov al,01h
	out 0a4h,al

	mov ah,4Ch
	int 21h
