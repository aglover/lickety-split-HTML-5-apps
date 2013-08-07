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

In Lab #1, you'll find an `index.html` file.  If you double-click it or open it with a modern browser (i.e _not_ IE) you should see a prototypical jQuery Mobile web app.

![lab 1 jquery app](/docs/imgs/lab_1_web.png)

Go ahead and resize your browser window to make it more like a device (a phone or tablet, for example). 

Now take a look at the source code. 

##### divs and pages

In jQuery Mobile, a web page is delineated by a special `div`. In fact, it's defined by a `div` with a special attribute dubbed `data-role` with a value of `page`. For example, the definition for the page you see above is defined as:

```
<div data-role="page" id="page_1" data-theme='e'>
  <div data-theme="a" data-role="header">
    <h3>Overheard Word</h3>
  </div>

  <div data-role="content"> 
    <div class="center-wrapper">
      <h2>Raucous</h2>
      <p><em>Noun</em> - Boisterously disorderly</p>
      <p>"The partying neighbors kept up their raucous laughter half the night."</p>
    </div>
  </div>

  <div data-theme="a" data-role="footer" data-id="footer" data-position="fixed">
    <div data-role='navbar'>
      <ul>
        <li><a href='#' data-icon='home'>Home</a></li>
        <li><a href='#' data-icon='info'>Help</a></li>
        <li><a href='#' data-icon='search'>Search</a></li>
      </ul>
    </div>
  </div>
</div>
```

Look closely at the code above and note the various `div` attributes, in addition to `data-role`. `id` is helpful for linking as you'll see later. `data-theme` defines colors in jQuery Mobile.

Now look at the sub-`div`s of this page -- they also contain `data-role`s, and they are fairly self explanatory: `content` is, well, the content of the page and `footer` is...yes, you guessed it correctly: the footer of the page. Can you guess what `header` is? 

__Question__: How would you add another page to this app? Need a sample word? See [Merriam-Webster's Word of the Day](http://www.merriam-webster.com/word-of-the-day/).

__Question__: How would you change the colors of this app? Hint: the valid attribute values for `data-theme` are `a`, `b`, `c`, `d`, and `e`.  



##### colors

##### themes


#### Lab #2


#### Lab #3


#### Lab #4


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
