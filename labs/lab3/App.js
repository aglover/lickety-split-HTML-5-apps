var app, express, port;

express = require('express');
app = express(express.logger());

app.use(express.errorHandler({
  dumpExceptions: true,
  showStack: true
}));

app.set('view options', {layout: false});
// app.use(express.static(__dirname + '/public'));
app.use('/', express["static"](__dirname + '/public'));
app.use('/components', express["static"](__dirname + '/public/components'));
app.use('/img', express["static"](__dirname + '/public/img'));
app.use('/css', express["static"](__dirname + '/public/css'));
app.get('/', function(req, res) {
   res.render('index.html');
});

port = process.env.PORT || 3000;

app.listen(port, function() {
  return console.log("listening on " + port);
});
