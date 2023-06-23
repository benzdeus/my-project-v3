build:
	docker build -t my-project .
	docker run -p 80:1323 -d my-project 