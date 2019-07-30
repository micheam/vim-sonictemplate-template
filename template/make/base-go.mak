TARGET = {{_expr_:expand('%:p:h:t')}}

$(TARGET) : main.go
	go build -o $(TARGET) .

clean :
	rm -f bin/ $(TARGET)
