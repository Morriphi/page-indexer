#!/bin/bash

cd page-parser

echo '-------------------'
echo 'Bundling Page Parser'
echo '-------------------'
bundle install

echo '-------------------'
echo 'Testing Page Parser'
echo '-------------------'
rake test

cd ../api

echo '------------'
echo 'Bundling API'
echo '------------'
bundle install

echo '------------'
echo 'Creating Database'
echo '------------'
rails db:create

echo '---------------------------'
echo 'Running Database Migrations'
echo '---------------------------'
rake db:migrate

echo '-----------'
echo 'Testing API'
echo '-----------'
rake test

