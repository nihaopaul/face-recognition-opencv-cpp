all: test
	CFLAGS=-fPIC -g -Wall `pkg-config --cflags opencv`
	LIBS = `pkg-config --libs opencv`
	INCLUDE = -I/usr/local/Cellar/libfreenect/0.1.2/include/libfreenect -I/usr/local/Cellar/libfreenect/0.1.2/include -I/usr/local/include/libfreenect -I/usr/local/include 
	FREE_LIBS = -L/usr/local/lib -lfreenect -L/usr/local/Cellar/libfreenect/0.1.2/lib

test: xboxCam.cpp
	$(CXX) $(INCLUDE) $(CFLAGS) $? -o $@  $(LIBS) $(FREE_LIBS)

%.o: %.cpp
	$(CXX) -c $(CFLAGS) $< -o $@

clean:
	rm -rf *.o test