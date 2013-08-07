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

In [Lab #4](/labs/lab4/README.md), your inner perfectionist is awakened with [CoffeeScript](http://coffeescript.org/).

#### Lab #5

In this lab, you're going to get more familiar with a typical Node app. Like the other labs, this code base produces the same Overheard Word app, however, in this case, the code is organized more appropriately. 

##### Set up

Just like for the other labs, you'll need to run (in the `lab5` directory):

```
$> npm install
```

Open up your browser and go to [localhost:5000/](http://localhost:5000/) and once again, you should see:

![same old same old](/docs/imgs/lab_3.png)

Now try and swipe through the list of words.....wait, you can't swipe....what's going on?!

##### Templates and Databases

Fire up your favorite text editor and begin by examining `App.coffee`. There's a few new lines of code in there that you've not seen before. 

For starters, there's a few more `require` statements. 

__Question__: What does `require './config/Bootstrap'` do? Hint, go into the `config` directory and view the `Bootstrap.coffee` file.  If you can't figure it out yet, don't worry, it'll make some sense shortly.

Back to the `App.coffee` file. You should see this line of code:

```
whiskers = require 'whiskers'
```

[Whiskers.js](https://github.com/gsf/whiskers.js/) is a templating engine for Node apps. It's like Ruby's `ERB` or `Haml` or Java's `Jsp`s but in this case, Whiskers is based off of [Mustache](https://github.com/janl/mustache.js). In short, with a template engine, you can create dynamic web pages and you use `{{}}`'s as delimiters. 

For example, if you have a variable `user` that's value was `Andy`, then the following code:

```
<h4>{{user}}</h4>
```

Would yield:

```
<h4>Andy</h4>
```

When rendered via a Mustache compatible rendering engine like Whiskers. More on this to come...

Now check out this line of code in `App.coffee`:

```
db = require './config/Datastore'
```

Go ahead and checkout the `Datastore.coffee` file in the `config` directory. 


```
mongo = require 'mongoskin'

db = mongo.db('mongodb://metrics:metrics@flame.mongohq.com:27036/metrics', {safe:false})

db.bind 'words', {
  recentlyCreated: (fn) ->
    this.find({}, {limit:10, sort:[['_id', -1]]}).toArray(fn)
}

exports.datastore = db
```

This code does a number of things; suffice it to say, this code talks to a database. In this case, the database is [MongoDB](http://www.mongodb.org/). MongoDB is

>Document-oriented databases like MongoDB are vastly different from relational databases in that they don't store data in tables; instead, they store it in the form of documents. From a developer's perspective, document-oriented (or schemaless) data is simpler and far more flexible to manage than relational data. Rather than storing data into a rigid schema of tables, rows, and columns, joined by relationships, documents are written individually, containing whatever data they require.

What's more, 

>Among open source, document-oriented databases, MongoDB is often billed as a NoSQL database with RDBMS features. One example of this is MongoDB's support for dynamic queries that don't require predefined MapReduce functions. MongoDB also comes with an interactive shell that makes accessing its datastore refreshingly easy, and its out-of-the-box support for sharding enables high scalability across multiple nodes.
>> From [Java development 2.0: MongoDB: A NoSQL datastore with (all the right) RDBMS moves](http://www.ibm.com/developerworks/library/j-javadev2-12/) by yours truly

Back to the code in `Datastore.coffee`....`mongoskin` is the library being used to communicate with MongoDB. The `db.bind` method creates a function dubbed `recentlyCreated` that finds the 10 most recently created  documents in the `words` collection (a.k.a. _table_). This function will show up in a few more minutes. 

Now go into the `routes` directory inside the `app` directory and open up the `Index.coffee` file. This code defines what should happen when the root URL is hit (i.e. `/`). Note the line `db.words.recentlyCreated` -- there's that call to MongoDB.

Look a little lower and you'll see `allWords.push new WordModel.Word...` -- where `allWords` is an Array and new `WordModel`s are bing added to it. Where is `WordModel` defined, you ask? 

Open up the file `Word.coffee` in the `app/models` directory. There's one of those CoffeeScript classes you saw in an earlier lab!

Putting it all together, the `Index.coffee` code gets the 10 most recent word documents from MongoDB and creates a `WordModel` for each one (and note how those functions from `Bootstrap` are being used: `capitalize` & `periodize`). 

Are things coming together for you, yet?

Now on to the lesson at hand here: look closely at `Index.coffee` again -- you see this line: `res.render 'index', {words: allWords}`? That line results in the rending of a web page (the one you've seen now multiple times). And look what variable is passed to that rending process: `words` and what is `words`? Yes! It's an Array of ten `WordModel`s. 

So why then does the resultant web page _not_ display more than one word?

__Your mission__: Make the web app work with a list of words! Have a look in the `views` directory and open up the `Index.html` file. What do you see? 

```
<body>
    <!-- what's that {word.id} doing there? -->
    <div data-role="page" id="page_{word.id}" data-theme='c'>
      <div data-theme="g" data-role="header">
        <h3>
            Overheard Word
        </h3>
      </div>
      
      <div data-role="content"> 
        <div class="center-wrapper">
           <h2>Raucous</h2>
           <p><em>Noun</em> - Boisterously disorderly</p>
           <p>"The partying neighbors kept up their raucous laughter half the night."</p>
         </div>
      </div>

      <div data-theme="g" data-role="footer" data-id="footer" data-position="fixed">
        <div data-role='navbar'>
          <ul>
            <li><a href='#' data-icon='custom' id='csinfo'>Help</a></li>
            <li><a href='#' data-icon='custom' id='quiz'>Quiz</a></li>
          </ul>
        </div>
      </div>
    </div>
</body>
```

How can you make that dynamic? How can you use Whiskers (hint: Whiskers uses _single_ braces: `{}`) to render a list of 10 objects? Another hint: Whiskers uses `{for in object}` for looping. You finish a loop with a `{/for}` tag. And the `WordModel` object has a number of properties you can access: `id`, `spelling`, `definition`, `partOfSpeech`, and `exampleSentence`.



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
    * [Java development 2.0: JavaScript for Java developers](http://www.ibm.com/developerworks/java/library/j-javadev2-18/index.html)
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
