"use strict"

const fs = require('fs');
const os = require('os');
const consul = require('consul');
const rethinkdb = require('rethinkdb');

let CONFIG_PATH = process.env['CONFIG_PATH'] || '/data/rethinkdb.conf';
let SERVICE_NAME = process.env['SERVICE_NAME'] || 'rethinkdb';
let CONSUL_ADDRESS = process.env['CONSUL_ADDRESS'];

console.log(CONFIG_PATH);

function writeConfiguration(opts) {
	let configLines = [];
	configLines.push(['server-name', os.hostname()].join('='));
	if (opts.existingNodes) {
		opts.existingNodes.forEach(function(node) {
			configLines.push(['join', node].join('='));
		});
	}
	fs.writeFile(CONFIG_PATH, configLines.join('\n'), (err) => {
	  if (err) throw err;
	  process.exit(0);
	});
}

function clusterNodes() {

}

function compileConfiguration() {

}

function healthCheck() {

}


writeConfiguration({
	existingNodes: ['172.23.23.1:3434']
});