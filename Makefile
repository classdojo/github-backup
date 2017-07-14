VERSION=0.1.6
BINARY_NAME=ghbackup

build:
	mkdir -p ./bin/
	go build -o $(BINARY_NAME) .
	mv $(BINARY_NAME) ./bin/

run:
	go run main.go

release:
	mkdir -p bin/
	CGO_ENABLED=0 go build -a -installsuffix cgo -o bin/$(BINARY_NAME) .
	cp config.yml bin/
	tar czf $(BINARY_NAME)-$(VERSION).tar.gz bin/
	mkdir -p release/ 
	mv *.tar.gz release/

test:
	go test . -v
	
install:
	go get github.com/google/go-github/github
	go get github.com/aws/aws-sdk-go/aws
	go get github.com/joho/godotenv
	go get golang.org/x/oauth2


clean:
	rm -rf ./bin/ ./release/ *.tar.gz ./repositories 20* $(BINARY_NAME)
