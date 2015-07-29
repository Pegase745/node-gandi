'use strict';

var path  = require('path');
var assert = require('assert');
var _ = require('lodash');

var cliPath = path.resolve(__dirname, '../src/gandi.js');
var cli;
var gandi;


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

var apikey = process.env.ote_apikey;


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

    it('should throw an error when no arguments are passed', function() {
        assert.throws(function() {new cli()}, TypeError);
    });

    it('should throw an error when apikey is not 24 characters long', function() {
        var bad_apikey = '1234erty';

        assert.throws(function() {new cli(bad_apikey)}, TypeError);
    });

    it('should be ok when apikey and not ote', function() {
        gandi = new cli(apikey);

        assert.equal(gandi.apikey, apikey);
        assert.ok(_.isEqual(gandi.config, config_prod));
        assert.ok(gandi.client);
    });

    it('should be ok when apikey and ote', function() {
        gandi = new cli(apikey, true);

        assert.equal(gandi.apikey, apikey);
        assert.ok(_.isEqual(gandi.config, config_ote));
        assert.ok(gandi.client);
    });
});


/**
 * Describe Gandi OTE query tests
 */
describe('Gandi OT&E query', function () {

    before(function () {
        cli = require('../src/gandi.js');
        gandi = new cli(apikey, true);
    });

    after(function () {
        cli = null;
        delete require.cache[cliPath];
    });

    it('should be ok when a request is made and it doesn\'t need params', function(done) {
        gandi.call('version.info', [], function(err, data) {
            assert.ifError(err);
            assert.ok('api_version' in data);
            assert.notEqual(data.api_version, null);
            done();
        });
    });

    it('should be ok when a request is made with params passed while not needed', function(done) {
        gandi.call('version.info', ['toto', 'titi'], function(err, data) {
            assert.ifError(err);
            assert.ok('api_version' in data);
            assert.notEqual(data.api_version, null);
            done();
        });
    });

    it('should throw a `method not supported` error when calling a non-existant API method', function(done) {
        gandi.call('version.detail', [], function(err, data) {
            assert.equal(err['faultCode'], 150020);
            done();
        });
    });

    it('should throw a `invalid method parameter(s)` error when calling with bad param type', function(done) {
        gandi.call('domain.available', ['pegase745.org'], function(err, data) {
            assert.equal(err['faultCode'], 500037);
            done();
        });
    });

    it('should throw a `takes at least X arguments` error when calling with bad param number', function(done) {
        gandi.call('domain.available', [], function(err, data) {
            assert.equal(err['faultCode'], 150020);
            done();
        });
    });

    it('should be ok when listing API available methods', function(done) {
        gandi.list(function(err, data) {
            assert.notEqual(data.length, 0);
            done();
        });
    });

    it('should be ok when asking for API method signature', function(done) {
        gandi.signature('domain.list', function(err, data) {
            assert.notEqual(typeof data, 'undefined');
            done();
        });
    });

    it('should be ok when asking for API method help', function(done) {
        gandi.help('domain.list', function(err, data) {
            assert.notEqual(typeof data, 'undefined');
            done();
        });
    });
});
