test-unit:
	docker run --rm -v `pwd`/..:/var/www ontowiki-devenv/phpserver /bin/sh -c 'cd /var/www && php vendor/bin/phpunit --testsuite "OntoWiki Unit Tests"'

test-virtuoso:
	docker run --rm -v `pwd`/..:/var/www -e EF_STORE_ADAPTER=virtuoso --link ontowiki-devenv-virtuoso-test:virtuoso-test --net devenv_default ontowiki-devenv/phpserver /bin/sh -c 'cd /var/www && php vendor/bin/phpunit --testsuite "OntoWiki Virtuoso Integration Tests"'

test-mysql:
	docker run --rm -v `pwd`/..:/var/www -e EF_STORE_ADAPTER=zenddb --link ontowiki-devenv-mysql-test:mysql-test --net devenv_default ontowiki-devenv/phpserver /bin/sh -c 'cd /var/www && php vendor/bin/phpunit --testsuite "OntoWiki Virtuoso Integration Tests"'