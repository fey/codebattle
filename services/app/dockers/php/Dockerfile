FROM php:7.3

RUN apt-get update && apt-get install -y build-essential --no-install-recommends && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN cd /tmp && curl -OL /tmp/phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar > /tmp/phpcs.phar
RUN chmod 755 /tmp/phpcs.phar

WORKDIR /usr/src/app

ADD checker_example.php .
ADD solution_example.php .
ADD Makefile .
ADD .phpcs.xml .
