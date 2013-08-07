## Lab #4

In this lab, we're going to learn about [CoffeeScript](http://coffeescript.org/), which is

>a little language that compiles into JavaScript. Underneath that awkward Java-esque patina, JavaScript has always had a gorgeous heart. CoffeeScript is an attempt to expose the good parts of JavaScript in a simple way.

Thus, CoffeeScript makes JavaScript more concise and easier to program. There's no semi-colons, curly braces, and `var`s. As you'll see, it is rapidly becoming the language of choice for a wide range of Node developers.

#### Proof in the pudding

Don't want to take my word for it? Here's a fun tool -- write some JavaScript and have it automatically converted into CoffeeScript with [JS2Coffee](http://js2coffee.org/).

For example, the following JavaScript, while not terribly complex by any means can easily be converted: 

```
var app, express, port;

express = require('express');
app = express(express.logger());

app.use(express.errorHandler({dumpExceptions: true, showStack: true}));
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
```

And becomes a bit easier on the eyes as follows: 

```
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
```

Note a few things: 
  * no semi-colons
  * no curly braces
  * while space is a delimiter (Python-style)
  * the use of `or` rather than `||`
  * no `var`s
  * Ruby style method invocation -- that is, no `()`
  * no `function` declarations -- instead, they are replaced with `->`

#### Let's get going w/it already

Let's get started with running a CoffeeScript app. Just like in Lab #3, you'll need to run NPM, but in this case, you'll install the project's dependencies as well as a global one. 

Accordingly, first, from within the `lab4` directory, type:

```
$> npm install
```

Then type:

```
$> sudo npm install -g coffee-script
```

The above command installs CoffeeScript as a global library -- this is needed for Foreman to run the `coffee` command.

Once you've done those two steps, then type:

```
$> foreman start
```

Once again, you should see a familiar site (pun _intended_) if you open your browser:

![familiar, no?](../../docs/imgs/lab_3.png)

Thus, you've effectively replaced lab #3's code with CoffeeScript -- that is, both lab #3 and lab #4 are the same exact application, just one is CoffeeScript driven and the other isn't. 

__Question__: which do you prefer? Pure JavaScript or CoffeeScript?

__Question__: Can you take the following JavaScript and make it valid CoffeeScript?

```
var capitalize = function(word) {
  return word.charAt(0).toUpperCase() + word.slice(1);
};

console.log(capitalize("washington"));
```

Hint: to test your answer, throw your code into a file -- call it anything you'd like, such as `lab4.coffee` and then type:

```
$> coffee lab4.coffee
```

If you got your code correct, you should see...what?


___For fun__: Take the following code and put it into a `.coffee` file and run it:


```
class Message
	constructor: (@to, @from, @message) ->
	
	asJSON:  ->
		JSON.stringify({to: @to, from: @from, message: @message})

mess = new Message "Andy", "Joe", "Go to the party!"
console.log mess.asJSON()
``` 

The code above creates a class -- did you know you could even do that in JavaScript? Well, the truth is:

>JavaScript doesn't support classes — at least not in the classical Java language sense. Because JavaScript is a prototype-based language, you don't define classes: instead, behavior is reused via cloning existing objects. Thus, in JavaScript, you don't define class objects, you define them in functions, then use nested functions to define behavior — something you've already seen in action.
> > from [Java development 2.0: JavaScript for Java developers](http://www.ibm.com/developerworks/java/library/j-javadev2-18/index.html)  by yours truly


When you run it, what do you see? Now for the fun. 

Take that file (let's say it's name is `lab4.coffee` (again)) and type:

```
$> coffee -c lab4.coffee
```

That `-c` flag compiles your `.coffee` file into a `.js` one. Open up the resultant `lab4.js`. Compare that with the CoffeeScript code. 

_Which code would you rather write? Which code would you rather maintain?_