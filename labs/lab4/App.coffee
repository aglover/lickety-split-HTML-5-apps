express = require("express")
app = express(express.logger())
app.use express.errorHandler(
  dumpExceptions: true
  showStack: true
)
app.use "/", express["static"](__dirname + "/public")
app.use "/components", express["static"](__dirname + "/public/components")
app.use "/img", express["static"](__dirname + "/public/img")
app.use "/css", express["static"](__dirname + "/public/css")
app.get "/", (req, res) ->
  res.render "index.html"

port = process.env.PORT or 3000
app.listen port, ->
  console.log "listening on " + port