all:
	nasm -f bin -o gbanksmp.com gbanksmp.asm

clean:
	rm *.com
