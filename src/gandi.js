'use strict';

var xmlrpc = require('xmlrpc');

var config = {
    host: 'rpc.gandi.net',
    port: 443,
    path: '/xmlrpc/'
};

var config_ote = {
    host: 'rpc.ote.gandi.net',
    port: 443,
    path: '/xmlrpc/'
};

/**
 * Returns apikey to constructor after some validation.
 *
 * @param {string} apikey - Apikey passed onto the constructor.
 * @private
 */
function defaultApikey(apikey) {
    if (typeof apikey !== 'undefined') {
        if (typeof apikey !== 'string') {
            throw new TypeError('`apikey` argument must be a string');
        }

        if (apikey.length !== 24) {
            throw new TypeError('`apikey` argument must be 24 characters long');
        }

        return apikey;
    }
    throw new TypeError('Gandi client needs an apikey as a first argument');
}

/**
 * Returns config to constructor whether OT&E is used or wether or not.
 *
 * @param {boolean} is_ote - Use OT&E environment or not.
 * @private
 */
function defaultConfig(is_ote) {
    if (typeof is_ote !== 'undefined') {
        if (typeof is_ote !== 'boolean') {
            throw new TypeError('`is_ote` argument must be a boolean');
        }
        if (is_ote) {
            return config_ote;
        } else {
            return config;
        }
    } else {
        return config;
    }
}

/**
 * Creates a new Gandi client.
 * @example
 * var cli = require('node-gandi');
 * var apikey = 'your-24-char-apikey';
 *
 * gandi = new cli(apikey, true);
 *
 * @class
 * @param {string} apikey - Apikey to be used for calls.
 * @param {boolean} [is_ote=false] - Use OT&E environment or not.
 */
var Gandi = function(apikey, is_ote) {
    this.apikey = defaultApikey(apikey);
    this.config = defaultConfig(is_ote);
    this.client = xmlrpc.createSecureClient(this.config);
};

/**
 * This callback type is called `requestCallback` and is displayed as a global symbol.
 *
 * @callback requestCallback
 * @param {string} err
 * @param {Object|Array} value
 */

/**
 * Calls an API method with given parameters and returns a result
 * @example
 * var domain = 'pegase745.org';
 *
 *  var cb = function(err, data) {
 *    if (data[domain] == 'pending') {
 *      console.log('result is not yet ready')
 *      setTimeout(function() {
 *        gandi.call('domain.available', [[domain]], cb);
 *      }, 700)
 *    }
 *    else {
 *      console.dir(data);
 *    }
 *  }
 *
 *  gandi.call('domain.available', [[domain]], cb);
 *
 * @param {string} method - API method to call.
 * @param {array} params - Parameters given to method.
 * @param {requestCallback} callback - The callback that handles the response.
 * @returns
 */
Gandi.prototype.call = function(method, params, callback) {
    if (!params) {params = [];}
    params.unshift(this.apikey);
    this.client.methodCall(method, params, function(error, value) {
        callback(error, value);
    });
};

/**
 * Lists API available methods
 * @example
 * gandi.list(function(err, data) {
 *   if (err) throw err;
 *   console.log(data);
 * });
 *
 * @param {requestCallback} callback - The callback that handles the response.
 * @returns {Array}
 */
Gandi.prototype.list = function(callback) {
    this.client.methodCall('system.listMethods', [], function(error, value) {
        callback(error, value);
    });
};

/**
 * Lists signature for given method
 * @example
 * gandi.signature('domain.list', function(err, data) {
 *   if (err) throw err;
 *   console.log(data);
 * });
 *
 * @param {string} method - API method wanted.
 * @param {requestCallback} callback - The callback that handles the response.
 * @returns {Array}
 */
Gandi.prototype.signature = function(method, callback) {
    this.client.methodCall('system.methodSignature', [method], function(error, value) {
        callback(error, value);
    });
};

/**
 * Lists help for given method
 * @example
 * gandi.help('domain.list', function(err, data) {
 *   if (err) throw err;
 *   console.log(data);
 * });
 *
 * @param {string} method - API method wanted.
 * @param {requestCallback} callback - The callback that handles the response.
 * @returns {Array}
 */
Gandi.prototype.help = function(method, callback) {
    this.client.methodCall('system.methodHelp', [method], function(error, value) {
        callback(error, value);
    });
};

module.exports = Gandi;
