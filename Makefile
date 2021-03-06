default: run

build:
	docker build -t cs50/cli .

rebuild:
	docker build --no-cache -t cs50/cli .

run:
	docker run --interactive --publish-all --rm --tty --volume "$(PWD)":/root cs50/cli
