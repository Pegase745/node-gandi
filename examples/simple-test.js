var gandi = require('../index.js');

var apikey = 'YOUR-API-KEY';

gandi.createOTEClient(apikey, function(client){
	/* Test n°1: Testing API version */
	// client.version_info(function(error, value){
	// 	if(error) {
	// 		console.log('ERR: ' + error);
	// 	}else {
	// 		console.log('Result: %j', value);
	// 	}
	// });
	
	/* Test n°2: Testing domain if available */
	// var domain = 'bm-jp.fr';
	// var domain_available_cb = function(error, value){
	// 	if(error) {
	// 		console.log(error);
	// 	}else {
	// 		if(value[domain] == 'pending') {
	// 			console.log('Result is not yet ready..');
	// 			setTimeout(function(){
	// 				client.domain_available(domain, domain_available_cb);
	// 			}, 700)
	// 		} else {
	// 			console.log('Result: %j', value);
	// 		}
	// 	}
	// }
	// client.domain_available(domain, domain_available_cb);

	/* Test n°3: Test domain count */
	// client.domain_info('bm-jp.fr',function(error, value){
	// 	console.log('Result: %j', value);
	// });
});