BIN=../../gbdk-n/bin
OBJ=./obj



build:
	mkdir -p $(OBJ)
	$(BIN)/gbdk-n-compile.sh Snek.c -o $(OBJ)/Snek.rel
	$(BIN)/gbdk-n-link.sh $(OBJ)/Snek.rel -o $(OBJ)/Snek.ihx
	$(BIN)/gbdk-n-make-rom.sh $(OBJ)/Snek.ihx Snek.gb

clean:
	rm -rf $(OBJ)
	rm -f Snek.gb
