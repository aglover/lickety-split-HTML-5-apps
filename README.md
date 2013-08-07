# Lickety-split HTML 5 apps with jQuery Mobile and Node.js


Building mobile web apps is surprisingly easy with [jQuery Mobile](http://jquerymobile.com/). Combine jQuery Mobile's simplicity with [Node's rapid development platform](http://nodejs.org/) and you have yourself a recipe for immediate satisfaction. 

In this hands-on workshop, I'll show you how to build a jQuery Mobile app using Node.js that works on a variety of mobile devices. We'll go over the pros and cons of jQuery Mobile and [HTML5](http://en.wikipedia.org/wiki/HTML5) in general and I'll present alternative options. You'll leave this workshop armed with the knowledge of how to leverage what's arguably the most popular mobile web app framework today, HTML5, and the web to build single code base apps that run across a wide variety of devices. 


## Let's get started! 

This workshop is organized into 3 labs. We don't have a lot of time, so I strongly suggest you pair with someone. People with OSX, please volunteer to be pairing partners as it'll reduce friction because I'm also on OSX. That is, if you have Windows or Linux and someone near you is on a MacBook, then you should probably ask to pair with that person as my directions are tailored to OSX. 

### Clone or download this repository

To work on the 6 labs for this workshop, you'll need to either clone ([using Git](http://git-scm.com/)) this repository or you can [download a zip file of the source](https://github.com/aglover/lickety-split-HTML-5-apps/archive/master.zip). Either way, you will need the lab files on your local machine! 

### Pro tip

We're going to be looking at and editing source code. You'll want to use a developer friendly editor like [Sublime Text 2](http://www.sublimetext.com/2) or [TextMate](http://macromates.com/). You are free to use an IDE too -- it's entirely up to you. 

#### Lab #1

In [Lab #1](/labs/lab1/README.md), you'll learn the basics of jQuery Mobile.

#### Lab #2

In [Lab #2](/labs/lab2/README.md), you'll implement gestures and add custom icons to a jQuery Mobile app.

#### Lab #3

In [Lab #3](/labs/lab3/README.md), you'll get started with Node.js!


#### Lab #4

In this lab, we're going to learn about [CoffeeScript](http://coffeescript.org/), which is

>a little language that compiles into JavaScript. Underneath that awkward Java-esque patina, JavaScript has always had a gorgeous heart. CoffeeScript is an attempt to expose the good parts of JavaScript in a simple way.

Thus, CoffeeScript makes JavaScript more concise and easier to program. There's no semi-colons, curly braces, and `var`s. As you'll see, it is rapidly becoming the language of choice for a wide range of Node developers.

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

![familiar, no?](/docs/imgs/lab_3.png)


#### Lab #5


#### Lab #6


## Helpful Resources
  
  * [jQuery Mobile](http://jquerymobile.com/)
    * [jQuery Mobile Tutorial](http://the-jquerymobile-tutorial.org/index.php)
  * [Node.js](http://nodejs.org/)
    * [Node.js for Java developers](http://www.ibm.com/developerworks/library/j-nodejs/)
    * [Getting started with Node.js](http://www.ibm.com/developerworks/offers/lp/demos/summary/j-jnodejs.html) (video)
    * [Node.js beyond the basics](http://www.ibm.com/developerworks/training/kp/j-kp-node/index.html?cmp=dw&cpb=dwjav&ct=dwnew&cr=dwnen&ccy=zz&csr=062912)
  * [CoffeeScript](http://coffeescript.org/)
    * [Rocking Out With CoffeeScript](http://net.tutsplus.com/tutorials/javascript-ajax/rocking-out-with-coffeescript/)
    * [Writing Better JavaScript with CoffeeScript: The Basics](http://sixrevisions.com/javascript/coffeescript-basics/)
    * [Functional JavaScript with CoffeeScript and Node](http://www.ibm.com/developerworks/library/j-coffeescript/)
    * [The Java technology zone technical podcast series: What is CoffeeScript with Ryan McGeary](http://www.ibm.com/developerworks/podcast/ag/gloverseries-mcgeary.mp3)
    * [coffeescript-koans](https://github.com/sleepyfox/coffeescript-koans)
    * [Another coffeescript-koans](https://github.com/liammclennan/coffeescript-koans)
  * JavaScript
    * [Didacto: JavaScript](http://javascript.didacto.net/)
    * [JavaScript-Koans](https://github.com/liammclennan/JavaScript-Koans)
    * [Another javascript-koans](https://github.com/mrdavidlaing/javascript-koans)
  * [The Disco Blog](http://thediscoblog.com/)
    * [Javascript](http://thediscoblog.com/blog/categories/javascript/)
    * [Node](http://thediscoblog.com/blog/categories/node/)
    * [Mobile](http://thediscoblog.com/blog/categories/mobile/)
    * [HTML5](http://thediscoblog.com/blog/categories/html5/)
    * [CoffeeScript](http://thediscoblog.com/blog/categories/coffeescript/)
    * [jQuery Mobile](http://thediscoblog.com/blog/categories/jquery-mobile/)
