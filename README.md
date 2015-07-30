# node-gandi

[![npm version](https://badge.fury.io/js/node-gandi.svg)](http://badge.fury.io/js/node-gandi) [![Build Status](https://travis-ci.org/Pegase745/node-gandi.svg?branch=master)](https://travis-ci.org/Pegase745/node-gandi) [![Dependency Status](https://david-dm.org/pegase745/node-gandi.svg)](https://david-dm.org/pegase745/node-gandi) [![Inline docs](http://inch-ci.org/github/pegase745/node-gandi.svg?branch=master)](http://inch-ci.org/github/pegase745/node-gandi)

[![NPM](https://nodei.co/npm/node-gandi.png?downloads=true&downloadRank=true)](https://nodei.co/npm/node-gandi/)


[Node.js](http://nodejs.org/) client for Gandi.net XML-RPC [API](http://doc.rpc.gandi.net/).

## Installation

``` bash
  $ npm install --save node-gandi
```

## Usage

Start by instantiating a Gandi client

``` js
  var cli = require('node-gandi');
  var apikey = 'your-24-char-apikey';

  var gandi = new cli(apikey); // or new cli(apikey, true); for OT&E
```

The client exposes four methods to use in your code.

### gandi.call (method, params, callback)
Returns the result(s) of the API call to the method given in parameter.

``` js
  var gandi = new cli(apikey, true);
  var domain = 'pegase745.org';

  var cb = function(err, data) {
    if (data[domain] == 'pending') {
      console.log('result is not yet ready')
      setTimeout(function() {
        gandi.call('domain.available', [[domain]], cb);
      }, 700)
    }
    else {
      console.dir(data);
    }
  }

  gandi.call('domain.available', [[domain]], cb);
```

### gandi.list (callback)
Returns the list of available methods in the API.

``` js
  var gandi = new cli(apikey, true);

  gandi.list(function(err, data) {
    if (err) throw err;
    console.log(data);
  });

```

### gandi.signature (method, callback)
Returns the signature of the API method given in parameter.

``` js
  var gandi = new cli(apikey, true);

  gandi.signature('domain.list', function(err, data) {
    if (err) throw err;
    console.log(data);
  });

```

### gandi.help (method, callback)
Returns a help for the API method given in parameter.

``` js
  var gandi = new cli(apikey, true);

  gandi.help('domain.list', function(err, data) {
    if (err) throw err;
    console.log(data);
  });

```

## Run tests

``` bash
  $ sudo ote_apikey=your-24-char-apikey npm test
```

## License

MIT