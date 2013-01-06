"use strict"

Client = require './client'

exports.createClient = (apikey, callback) ->
	return new Client apikey, false, callback

exports.createOTEClient = (apikey, callback) ->
	return new Client apikey, true, callback