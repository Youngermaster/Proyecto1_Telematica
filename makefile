OBJ_DIR=obj/
DIR_UT=Parser/Utility_Functions/

Prueba: $(OBJ_DIR)server.o $(OBJ_DIR)ParserRequest.o $(OBJ_DIR)Body.o $(OBJ_DIR)HeaderClass.o $(OBJ_DIR)utilityFunctions.o
	g++ -o $@ $(OBJ_DIR)server.o $(OBJ_DIR)ParserRequest.o $(OBJ_DIR)Body.o $(OBJ_DIR)HeaderClass.o $(OBJ_DIR)utilityFunctions.o

$(OBJ_DIR)server.o: server.cpp Librerias/commonlibraries.h constante_server.h Parser/ParserRequest.h
	g++ -c server.cpp -o $(OBJ_DIR)server.o

$(OBJ_DIR)ParserRequest.o: Parser/ParserRequest.cpp Parser/ParserRequest.h $(OBJ_DIR)HeaderClass.o $(OBJ_DIR)Body.o
	g++ -c Parser/ParserRequest.cpp -o $(OBJ_DIR)ParserRequest.o

$(OBJ_DIR)HeaderClass.o: Parser/HeaderClass.cpp Parser/HeaderClass.h Librerias/StringLibraries.h $(OBJ_DIR)utilityFunctions.o
	g++ -c Parser/HeaderClass.cpp -o $(OBJ_DIR)HeaderClass.o

$(OBJ_DIR)Body.o: Parser/Body.cpp Parser/Body.h Librerias/StringLibraries.h 
	g++ -c Parser/Body.cpp -o $(OBJ_DIR)Body.o

$(OBJ_DIR)utilityFunctions.o: $(DIR_UT)utilityFunctions.cpp $(DIR_UT)utilityFunctions.h Librerias/StringLibraries.h
	g++ -c $(DIR_UT)utilityFunctions.cpp -o $(OBJ_DIR)utilityFunctions.o

clean:
	rm $(OBJ_DIR)*.o Prueba
