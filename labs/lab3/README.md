## Lab #3

In Lab #3, you're going to get up and running with Node.js. 

#### Installing Node.js

You can install Node.js in [three steps](http://thediscoblog.com/blog/2013/03/12/node-in-3-commands/):

Step 1: Download and install nvm.

```
$> curl https://raw.github.com/creationix/nvm/master/install.sh | sh
```

Step 2: Reload your shell.

```
$> source .bash_profile
```

Step 2.5: Obtain a list of available node versions to install.

```
$> nvm ls-remote
```

Step 3: Install your desired version of node.

```
$> nvm install v0.10.0
```

#### Foreman

Next, you'll want to install [Foreman](https://github.com/ddollar/foreman), which is a process runner (for lack of a better definition). Foreman makes running a series of processes easier by allowing you to define process requirements in one file, known as a `Profile`. 

You can install Foreman either as a [Ruby Gem](http://rubygems.org/) (so you'll need to [install Ruby](http://www.ruby-lang.org/en/)) or if you are on OSX, there is a .dmg installer. 

#### Project setup

_Make sure you open up a terminal (if you don't have one open already) in the `lab3` directory as it is the root of Node web app. The commands from here on out assume you're in the root of that directory._

NPM is Node's package manager -- it manages a project's dependencies (direct & transitive). Take a look at the project's `package.json` file. This file defines the libraries this project depends on -- NPM will install them if we run the following command:

```
$> npm install
```

The major dependency of this project is [Express](http://expressjs.com/), which is the de-facto web application framework for Node these days. Almost all higher-level full stack frameworks for Node are built on top of Express, so it pays to understand Express before you start to dive into the more Rails-like (or non-Rails-like!) Node frameworks out there. 

Now that you've installed all the dependencies of this project, you're ready to run it. 

#### Up & Running

To run this app, you'll use foreman. If you look at the `Profile` defined in this project, you'll see that it instructs foreman to use the `node` command to run the file `App.js`:

```
web: node App.js
```

Simple right? Give it a try -- run the app like so:

```
$> foreman start
```

Finally, open up a browser and go to [localhost:5000](http://localhost:5000).

![Lab 3](../../docs/imgs/lab_3.png)

If you see the above web app, then you are now up and running with Node.js! 

#### What just happened

Take some time now and study the file `App.js` -- this _is the app_. Not a lot of code, no?

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

Note how in Node's case, you don't deploy this to some web container (like you would, for example, with a Java web app). The Node app itself is a web server as seen from the line `app.listen`. 

As you can see, the Node platform exudes conciseness. But wait! Do you find yourself asking if things could things get any easier? Yes, someone shouts. "Yes they can! Check out [CoffeeScript](http://coffeescript.org/)!"
