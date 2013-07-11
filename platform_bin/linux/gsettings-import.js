#!/usr/bin/env node

var fs = require('fs');
var exec = require('child_process').exec;

var settings = fs.readFileSync(process.argv[2], 'utf8').split(/[\n\r]+/g).map(function (line) {
    if ( !line ) { return line; }
    var columns = line.split(' ');
    var schema = columns.shift();
    var key = columns.shift();
    var value = columns.join(' ');
    return [schema, key, value].map(JSON.stringify).join(' ');
}).filter(function (args) {
    return !!args.trim();
}).map(function (args) {
    return 'gsettings set ' + args;
}).forEach(function (command) {
    exec(command, function (error, stdout, stderr) {
        if ( error !== null ) {
            console.log(command);
            console.log(stderr);
        }
    });
});
