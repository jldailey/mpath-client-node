all: dist/index.js

dist/index.js: index.coffee
	coffee -o dist -c index.coffee
