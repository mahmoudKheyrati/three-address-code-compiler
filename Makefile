.PHONY: build
build: clean
	bison -d -o ./build/parser.c parser.y
	flex -o ./build/lexer.c lexer.l
	gcc -o ./build/a.out -lfl ./build/lexer.c ./build/parser.c

run: build
	./build/a.out

test: build
	echo "run tests"
	for i in `seq 1 1` ; do \
	  	./build/a.out < ./tests/input/input$$i.txt 2> ./tests/output/output$$i-error.txt > ./tests/output/output$$i.txt; \
	  	cmp --silent ./tests/output/output$$i.txt ./tests/expected_output/output$$i.txt && echo "Test $$i passed" || (echo "Test $$i failed"  &&  exit 1); \
		echo "---------------------------------------------------" ; \
	done

clean:
	rm -rf ./build/*;
	rm -rf ./tests/output/*;
