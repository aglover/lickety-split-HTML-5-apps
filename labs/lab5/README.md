## Lab #5

In this lab, you're going to get more familiar with a typical Node app. Like the other labs, this code base produces the same Overheard Word app, however, in this case, the code is organized more appropriately. 

### Set up

Just like for the other labs, you'll need to run (in the `lab5` directory):

```
$> npm install
```

Open up your browser and go to [localhost:5000/](http://localhost:5000/) and once again, you should see:

![same old same old](../../docs/imgs/lab_3.png)

Now try and swipe through the list of words.....wait, you can't swipe....what's going on?!

### Templates and Databases

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


You have successfully updated the app in this lab when you can swipe back and forth between ten words! 
