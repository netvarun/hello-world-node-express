var express = require('express');
var app = express();

// Routes
app.get('/', function(req, res) {
  res.send('hoha ulagam2!');
});

// Listen
var port = process.env.PORT || 3000;
setTimeout( function(){
    console.log('Listening on localhost:'+ port);
    app.listen(port);
}, 12000 );
