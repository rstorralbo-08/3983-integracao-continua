lint:
	docker run --rm -itv $(CURDIR):/app -w /app golangci/golangci-lint golangci-lint run controllers/ database/ models/ routes/
test:
	docker compose exec app go test main_test.go
start:
	docker compose up -d
ci:	start lint test

build:
	docker build -t api-go-gin .
run:	
	docker run -p 8080:8080 --env-file .env api-go-gin			