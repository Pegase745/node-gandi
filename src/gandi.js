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

Gandi.prototype.call = function(method, params, callback) {
    if (!params) {params = [];}
    params.unshift(this.apikey);
    this.client.methodCall(method, params, function(error, value) {
        callback(error, value);
    });
};

module.exports = Gandi;
