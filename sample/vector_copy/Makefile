HSASM := hsailasm

vector_copy: vector_copy.brig

%.brig: %.hsail
	$(HSASM) -assemble -o $@ $< 

clean:
	rm vector_copy.brig 
