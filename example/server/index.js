var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('Hello World! from',process.env.MSG);
});

var server = app.listen(process.env.NODE_PORT, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
