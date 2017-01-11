Page Indexer
===

## Description
A simple JSON API that given a url indexes the h1, h2, h3 and links for that page

## Requirements
1. Ruby 2.3.3
2. Rails 5.0.1
3. Bundler Gem (for installing dependencies)

## Recommended
It's recommend using RVM to isolate Ruby versions and gems from any other Ruby setups you might have. ruby-version and ruby-gemset files are provided.

## Install
A build script has been provided. Change into the projects root directory (page-indexer) and run the below command

<code>./build.sh</code>
*you will need to ensure build.sh has execute permissions*

## Run
A run script has been provided. Change into the projects root directory (page-indexer) and run the below command

<code>./run.sh</code>
*you will need to ensure run.sh has execute permissions*

## Use
The app runs on port 3000 by default (ensure nothing else is running on this port).
Once the app is running you can make a request to **http://localhost:3000/pages** to see all the currently indexed pages.

To index a new page send a **POST** request to **http://localhost:3000/pages** with the url of the page you would like to index. See a sample curl command below.

<code>curl -X POST http://localhost:3000/pages -d '{"url": "http://www.bbc.co.uk"}' --header "Content-Type:application/json"</code>

## Design
The application is split into two. A Page-Parser gem which contains the logic for parsing a page and the API which provides the REST endpoint. The Page-Parser gem is included in the API but can be used in any Ruby project by providing a means of accessing page content as a string and a method for persistance.

The method of page parsing requires the whole document to be loaded into memory which will cause issues for very large documents.

