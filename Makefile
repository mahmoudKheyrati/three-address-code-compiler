.PHONY: build
build: clean
	bison -d -o ./build/parser.c parser.y
	flex -o ./build/lexer.c lexer.l
	gcc -o ./build/a.out -lfl ./build/lexer.c ./build/parser.c
run: build
	./build/a.out
test: build
	for i in `seq 1 1` ; do \
	  echo "Test $$i" ; \
	  ./build/a.out < ./tests/input/input$$i.txt 2> ./tests/output/output$$i-error.txt > ./tests/output/output$$i.txt; \
	done

clean:
	rm -rf ./build/*;
	rm -rf ./tests/output/*;
