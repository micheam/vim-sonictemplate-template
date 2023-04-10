TARGET = bin/{{_expr_:expand('%:p:h:t')}}
SOURCE = $(shell find . -name '*.go')
.PHONY : clean install

$(TARGET) : $(SOURCE)
	go build -o $(TARGET) .

clean :
	rm -f $(TARGET)

install : clean $(TARGET)
	cp $(TARGET) /usr/local/bin

