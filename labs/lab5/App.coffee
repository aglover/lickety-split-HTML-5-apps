require './config/Bootstrap'
express = require 'express'
whiskers = require 'whiskers'
db = require './config/Datastore'
routes = require('./app/routes/Index')(db.datastore)

app = express express.logger() 
app.use express.errorHandler({ dumpExceptions: true, showStack: true })

app.set 'view engine', 'html'
app.engine 'html', whiskers.__express 

app.use '/components', express.static(__dirname + '/public/components') # set up bower
app.use '/img', express.static(__dirname + '/public/img')
app.use '/css', express.static(__dirname + '/public/css')

app.get '/', routes.index

port = process.env.PORT or 3000

app.listen port, ->
	console.log "listening on #{port}"