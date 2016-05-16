var express = require('express')
var app = express();
var exec = require('child_process').exec;
var cmd = "fortune | cowsay";

app.get('/', function (req, res) {
  res.send('Hello world');
});

app.get('/cowsay', function (req, res) {
  exec(cmd, function (e, stdout, stderr) {
    res.send(stdout
              .replace(/ /g, '\u00a0')
              .replace(/(?:\r\n|\r|\n)/g, '<br />'));
  });
});

app.listen(3000, function () {
  console.log('Started my awesome app!');
});
