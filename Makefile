FLAGS = -std=c++11 -g
OBJ = bin/message.o bin/command.o bin/user.o bin/main.o bin/implementation.o bin/common.o bin/text_interface.o

jeeker.out: $(OBJ)
	g++ $(OBJ) -o jeeker.out $(FLAGS) 

bin/common.o:	src/common.cpp	src/common.hpp
	g++ src/common.cpp -c -o bin/common.o $(FLAGS)
bin/message.o:	src/message.cpp src/message.hpp	src/common.hpp	src/user.hpp
	g++ src/message.cpp -c -o bin/message.o $(FLAGS)
bin/command.o:	src/command.cpp src/command.hpp	src/common.hpp
	g++ src/command.cpp -c -o bin/command.o $(FLAGS) 
bin/user.o:		src/user.cpp src/user.hpp		src/common.hpp	src/message.hpp
	g++ src/user.cpp -c -o bin/user.o $(FLAGS)
bin/main.o:		src/main.cpp	src/common.hpp
	g++ src/main.cpp -c -o bin/main.o $(FLAGS)
bin/implementation.o: src/implementation.cpp	src/common.hpp	src/user.hpp src/command.hpp
	g++ src/implementation.cpp -c -o bin/implementation.o $(FLAGS)
bin/text_interface.o: src/text_interface.cpp	src/text_interface.hpp
	g++ src/text_interface.cpp -c -o bin/text_interface.o $(FLAGS)
	
war:
	g++ src/*.cpp $(FLAGS) -Wall -o temp
	rm temp
debug: jeeker.out
	gdb jeeker.out -tui
remove:
	rm *.out bin/*
