#!/bin/bash

# disable xdebug to speed up composer installation
#phpenv config-rm xdebug.ini
composer install --ansi --prefer-dist --no-interaction --optimize-autoloader --no-suggest --no-progress --no-scripts
