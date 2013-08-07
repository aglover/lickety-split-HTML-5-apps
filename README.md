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

##### Pages

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

##### Colors

By default, jQuery Mobile allows you to easily change the color scheme of a web app. You can get rather fancy with jQuery's [ThemeRoller](http://jquerymobile.com/themeroller/index.php) or you can simply change the values of `data-theme` within the various `div`s associated with a page.

__Question__: How would you change the colors of this app? Hint: the valid attribute values for `data-theme` are `a`, `b`, `c`, `d`, and `e`.

##### Themes

Now check out [jQuery Mobile Flat-UI Theme](https://github.com/ququplay/jquery-mobile-flat-ui-theme). 

![Flat UI](/docs/imgs/flat-ui.png)

Looks rather nice, right? Almost like iOS 7 or Windows Phone 8?

__Question__: How would you change the current web app to leverage it?

##### Parting thoughts

How do you navigate between pages in this app? See that __Next__ button on the top right or the __Back__ button on the top left (after you hit __Next__)? Is that an optimal way to navigate?

#### Lab #2

In Lab #2, you will enhance the UX and the UI of the jQuery Mobile App from Lab #1. Mainly, you'll remove those non-snazzy navigation buttons and replae them with gestures; then, you'll refactor the footer of this app to use two custom icons (that is, you'll remove one button entirely and leave the app with only two).

Go ahead and open up the `index.html` file like you did in lab #1. 

![lab 2 UI](/docs/imgs/lab_2_web.png)


Looking nice, eh? 

Try navigating back and forth in this app using the buttons on the top right and left. 

While navigation via buttons works and it's the traditional way of doing things on the desktop, mobile devices present new opportunities for engaging UX. That is, does a user really need to tap a button or can they use a simple gesture like a swipe? 

Of course, the answer is "Yes! You can use gestures!" 

##### Gestures

jQuery Mobile, being a mobile first framework, supports the usage of gestures -- all you have to do is plug 'em in. Open up the `index.html` file with your favorite editor and remove the old, pedestrian button logic and replace it with this logic:

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

Don't just blindly do this, by the way. Study the code -- what does it do? Also be careful where you add this code! It _must_ come after the inclusion of jQuery but before the inclusion of jQuery Mobile!

Once you've added this logic, how can you test it? 

If you have Chrome, open up the JavaScript Console and then click the button right gear icon. Find the option dubbed __Emulate Touch Events__ and check it. 

![emulate touch](/docs/imgs/touch_events.png)

Also note the JavaScript code from earlier -- there are calls to `console.log`. You can see that output in the JavaScript Console.

##### Custom icons

Take a look in the `images` directory. There are two icons in there: `42-info.png` & `258-checkmark.png`. Double-click them to view them -- aren't they nice? They sure beat the default icons available to you in jQuery. You did study the code in lab #1 and notice that the footer had some icons, right?

Let's reduce the footer to have only 2 navigation options and let's use custom icons. Copy the CSS code below into a `style` block in the `index.html` file:

```
div[data-role='navbar'] .ui-btn .ui-btn-inner { 
  padding-top: 50px; 
}
div[data-role='navbar'] .ui-btn .ui-icon { 
  width: 40px; 
  height: 40px; 
  margin-left: -20px; 
}
#csinfo .ui-icon { 
  background:  url(/img/42-info.png) 50% 50% no-repeat; 
}
#quiz .ui-icon { 
  background:  url(/img/258-checkmark.png) 50% 50% no-repeat; 
}
```

Then, change the footer to make use of these icons! Hint: you'll need to replace the current `li`'s with something like this: 

```
<li><a href='#' data-icon='custom' id='csinfo'>Help</a></li>
```

#### Lab #3

In Lab #3, you're going to get up and running with Node.js. 

##### Installing Node.js

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

##### Foreman

Next, you'll want to install [Foreman](https://github.com/ddollar/foreman), which is a process runner (for lack of a better definition). Foreman makes running a series of processes easier by allowing you to define process requirements in one file, known as a `Profile`. 

You can install Foreman either as a [Ruby Gem](http://rubygems.org/) (so you'll need to [install Ruby](http://www.ruby-lang.org/en/)) or if you are on OSX, there is a .dmg installer. 

##### Project setup

```
$> npm install
```


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
