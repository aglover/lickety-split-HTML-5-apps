# Whiskered Robot 

Simple Node, [Coffeescript](http://coffeescript.org/), and jQuery Mobile template (plus deployment to Heroku). Uses [Whiskers](https://github.com/gsf/whiskers.js) as template engine as well as [Asset pipeline](https://github.com/rlidwka/asset-pipeline).

Makes use of [Bower](http://bower.io/) for UI components such as [jQuery Mobile Flat-UI Theme](https://github.com/ququplay/jquery-mobile-flat-ui-theme).

MongoDB interaction via [node-mongoskin](https://github.com/kissjs/node-mongoskin).

## Installation 

Make sure you have a current version of Node. I recommend [NVM](http://thediscoblog.com/blog/2013/03/12/node-in-3-commands/). Then `cd` into the root of this project and type:

`$> npm install`

Next, make sure you have Coffeescript in your path -- just install it for your current installation of Node:

`$> sudo npm install -g coffee-script`


Finally, make sure you have Ruby & Foreman (what if you don't? Install Heroku toolbet as that'll give it to you) and then type:

`$> foreman start`

Boom. Done. 