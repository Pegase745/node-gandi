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
 * Calls an API method with given parameters and return a result
 * @method call
 * @param {string} method - API method to call.
 * @param {array} params - Parameters given to method.
 * @param {requestCallback} callback - The callback that handles the response.
 * @return
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
 * @method list
 * @param {requestCallback} callback - The callback that handles the response.
 * @return {Array}
 */
Gandi.prototype.list = function(callback) {
    this.client.methodCall('system.listMethods', [], function(error, value) {
        callback(error, value);
    });
};

/**
 * Lists signature for given method
 * @method signature
 * @param {string} method - API method wanted.
 * @param {requestCallback} callback - The callback that handles the response.
 * @return {Array}
 */
Gandi.prototype.signature = function(method, callback) {
    this.client.methodCall('system.methodSignature', [method], function(error, value) {
        callback(error, value);
    });
};

/**
 * Lists help for given method
 * @method help
 * @param {string} method - API method wanted.
 * @param {requestCallback} callback - The callback that handles the response.
 * @return {Array}
 */
Gandi.prototype.help = function(method, callback) {
    this.client.methodCall('system.methodHelp', [method], function(error, value) {
        callback(error, value);
    });
};

module.exports = Gandi;
