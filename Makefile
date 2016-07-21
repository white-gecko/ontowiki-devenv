test-unit:
	docker run --rm -v `pwd`/..:/var/www devenv_phpserver /bin/sh -c 'cd /var/www && php vendor/bin/phpunit --testsuite "OntoWiki Unit Tests"'

test-virtuoso:
	docker run --rm -v `pwd`/..:/var/www -e EF_STORE_ADAPTER=virtuoso --link devenv_virtuoso-test_1:virtuoso-test devenv_phpserver /bin/sh -c 'cd /var/www && php vendor/bin/phpunit --testsuite "OntoWiki Virtuoso Integration Tests"'

test-mysql:
	docker run --rm -v `pwd`/..:/var/www -e EF_STORE_ADAPTER=zenddb --link devenv_mysql-test_1:mysql-test devenv_phpserver /bin/sh -c 'cd /var/www && php vendor/bin/phpunit --testsuite "OntoWiki Virtuoso Integration Tests"'