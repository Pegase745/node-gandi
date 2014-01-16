node-gandi
==========

### [Node.js](http://nodejs.org/) client for Gandi.net XML-RPC [API](http://doc.rpc.gandi.net/), written in [CoffeeScript](http://coffeescript.org/).

Usage
-----

This module is available on [npm](https://npmjs.org/package/node-gandi), and it's versionned __1.0__ on January 2013.

#### Simple example

``` javascript
var gandi = require('node-gandi'),
    apikey = 'Your-OT&E-API-Key';

// For mesures of security, always do the first tests on the OT&E system
gandi.createOTEClient(apikey, function(client){
  client.version_info(function(error, value){
   if(error) {
		console.log('ERR: ' + error);
 	}else {
 		console.log('Result: %j', value);
	 	}
	});
});
```
#### Workflow execution using [async](https://github.com/caolan/async) series
``` javascript
var async = require('async'),
    gandi = require('node-gandi'),
    apikey = 'Your-OT&E-API-Key';

gandi.createOTEClient(apikey, function(client){
  // Ask for version info, then ask for domain_info
  async.series({
	    version: function(callback){
	        client.version_info(function(error,value){
	            callback(error,value);
	        });
	    },
	    info: function(callback){
	        client.domain_info('bm-jp.fr', function(error,value){
		        callback(error,value);
	        });
	    },
	},
	function(err, results){ 
       console.log('Domain id: %j' + results.info);
	});
});
```

Dependencies
------------

* Gandi API ~3.2.3
* Coffee-Script ~1.4.0
* xmlrpc ~1.1.0


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/Pegase745/node-gandi/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

