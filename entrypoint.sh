#!/usr/bin/env bash
if [[ "$1" == "dev" ]]; then
    export DJANGO_SETTINGS_MODULE=demo.settings.settings-dev
    make dev
elif [[ "$1" == "prod" ]]; then
    export DJANGO_SETTINGS_MODULE=demo.settings.settings-prod
    make prod
fi

make collectstatic
make migrate

if [[ "$2" == "test" ]]; then
  python manage.py test
else
  make run
fi