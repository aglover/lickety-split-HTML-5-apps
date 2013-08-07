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

In [Lab #5](/labs/lab5/README.md), you'll be digging deeper into Node application development.


#### Lab #6

Have you ever worked with [Rail's Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html) before? In short, the asset pipeline

>provides a framework to concatenate and minify or compress JavaScript and CSS assets. It also adds the ability to write these assets in other languages such as CoffeeScript, Sass and ERB.

The good news is that the Asset Pipeline isn't limited to Rails -- you can add one to a Node app easily! 

For this lab, we'll be using a Node module dubbed `asset-pipeline`. But before we do that, let's do the familiar steps we've done a few times now. Change directories into the `lab6` directory and type

```
$> npm install
```

Open up your browser and go to [localhost:5000/](http://localhost:5000/) and once again (again!), you should see:

![same old same old](../../docs/imgs/lab_3.png)

Now try and swipe through the list of words.....wait, you can't swipe....what's going on ?! Seriously, again??!

Take a look at the `index.html` file in the `views` directory. Yep, no swipe code. Not to worry, we'll add it...as an asset...in CoffeeScript! 

##### Adding a new dependency

But first, you'll need to add the `asset-pipeline` module into your `package.json` file. Accordingly, add this line to the `dependencies` section:

```
 "asset-pipeline":"latest"
 ``` 

This pulls down the _most recent version_ -- you can also pull down a precise version by replacing `latest` with a version number. 

You'll need to run `npm install` again to get this library. 

Next, you'll need to add some specialized code in `App.coffee` that configures the asset pipeline. 

```
app.use(require('asset-pipeline')({
    server: app,
    assets: './assets',
    debug: false,
    extensions: ['.js'],
    cache: './public/js'
}))
```

The above code should be added above the `app.set 'view engine', 'html'` line; what's more, this code configures the asset pipeline to look for assets in the `assets` directory. Note, in this case, this pipeline will only handle CoffeeScript files (because we've set that we only want to produce files with `extensions:['.js']` which are, naturally, JavaScript files) and will put the corresponding JavaScripts in the `public/js` directory.

Now all that's left is to write an asset. And what asset would that be? Yes! The swipe code! Here's the _JavaScript_: 

```
$(document).on("pageinit", function(event) {
  $("div.ui-page").on("swipeleft", function() {
    var nextpage;
    console.log("swipeleft invoked");
    nextpage = $(this).next("div[data-role=\"page\"]");
    if (nextpage.length > 0) {
      return $.mobile.changePage(nextpage, "slide", false, true);
    }
  });
  return $("div.ui-page").on("swiperight", function() {
    var prevpage;
    console.log("swiperight invoked");
    prevpage = $(this).prev("div[data-role=\"page\"]");
    if (prevpage.length > 0) {
      return $.mobile.changePage(prevpage, {
        transition: "slide",
        reverse: true
      }, true, true);
    }
  });
});
```

__Question__: Can you make this a CoffeeScript asset? Hint, you should place the resultant `.coffee` file in an `assets` directory that you'll need to create in the root of the project. 

__Question__: Once you've defined that asset, how do you make use of it? Hint: if you named your asset `swipe.coffee` then it'll be called `swipe.js` and it can be referenced via a `script` tag like so: 

```
<script src="swipe.js"></script>
```

Warning though! You will need to add this script _before_ the inclusion of jQuery Mobile; that is, you should add it before this line:

```
<script src="https://d10ajoocuyu32n.cloudfront.net/mobile/1.3.1/jquery.mobile-1.3.1.min.js"></script>
```

Once you've completed these steps, fire the app up (using `foreman start` of course) and if things worked, you should be able to swipe through your jQuery Mobile app!


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
