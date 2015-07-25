'use strict';

var path  = require('path');
var assert = require('assert');
var _ = require('lodash');

var cliPath = path.resolve(__dirname, '../src/gandi.js');
var cli;


/**
 * Set of good fixtures
 */
var config_prod = {
    host: 'rpc.gandi.net',
    port: 443,
    path: '/xmlrpc/',
    headers: {
        'User-Agent': 'NodeJS XML-RPC Client',
        'Content-Type': 'text/xml',
        Accept: 'text/xml',
        'Accept-Charset': 'UTF8',
        Connection: 'Keep-Alive'
    },
    method: 'POST'
};


var config_ote = {
    host: 'rpc.ote.gandi.net',
    port: 443,
    path: '/xmlrpc/',
    headers: {
        'User-Agent': 'NodeJS XML-RPC Client',
        'Content-Type': 'text/xml',
        Accept: 'text/xml',
        'Accept-Charset': 'UTF8',
        Connection: 'Keep-Alive'
    },
    method: 'POST'
};

var apikey = 'GJL7RR88hRMRrIRz3R5grAfB';


/**
 * Describe Gandi client tests
 */
describe('Gandi client', function () {

    before(function () {
        cli = require('../src/gandi.js');
    });

    after(function () {
        cli = null;
        delete require.cache[cliPath];
    });

    it('should return an error when no arguments are passed', function() {
        assert.throws(function() {new cli()}, TypeError);
    });

    it('should return an error when apikey is not 24 characters long', function() {
        var bad_apikey = '1234erty';

        assert.throws(function() {new cli(bad_apikey)}, TypeError);
    });

    it('should be ok when apikey and not ote', function() {
        var gandi = new cli(apikey);

        assert.equal(gandi.apikey, apikey);
        assert.ok(_.isEqual(gandi.config, config_prod));
        assert.ok(gandi.client);
    });

    it('should be ok when apikey and ote', function() {
        var gandi = new cli(apikey, true);

        assert.equal(gandi.apikey, apikey);
        assert.ok(_.isEqual(gandi.config, config_ote));
        assert.ok(gandi.client);
    });
});
