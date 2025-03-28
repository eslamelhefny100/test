project=app
CC=gcc
run : $(project).exe
	@echo "*****************Running the Program ************"
	./$(project).exe
$(project).i : $(project).c 
	$(CC) -E $(project).c -o $(project).i 
	@echo "*****************Preprocessing Done ************"

$(project).s : $(project).i
	$(CC) -S $(project).i -o $(project).s 
	@echo "*****************Compilation Done ************"
$(project).o : $(project).s
	$(CC) -c $(project).s -o $(project).o
	@echo "***************** Assembly Done ************"

$(project).exe : $(project).o
	$(CC) $(project).o -o $(project).exe
	@echo "***************** Linking Done ************"


clean : 
	rm *.exe
	@echo "***************** Cleaning Done ************"

clean_all : 
	rm *.i *.o *.s *.exe 
	@echo "***************** Cleaning Done ************"