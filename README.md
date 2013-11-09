[![Dependency Status](https://gemnasium.com/popox/webapp.png)](https://gemnasium.com/popox/webapp)

WebApp - Build your frontend webapp with ease
=====

This is a scaffhold to start coding webapps with ease. Just fork and code!

# How to use the app

## Install

### The asset pipeline

Ensure to have ruby and bundler gem installed on your machine

```
bundle install
```

### The frontend webapp development tech-stack

Ensure to have node and npm installed on your machine


```
npm install
```

## Code

All your frontend webapp needs to be contained in the ```app``` directory as followed:

 * ```scripts``` contains your CoffeeScript or JavaScript code
 * ```styles``` contains your styles in SCSS, SASS or CSS
 * ```layouts``` all you layouts in HTML or HAML

### Getting started

You can start coding your application using the ```app.coffee``` script which is the application main class.

This application code will be loaded directly in the provided ```index.html.haml``` via requireJS.

Your requireJS configuration is kept in the ```main.js``` script and also contains the launch of the application.

### Add frontend dependencies

If you need any external dependencies for your frontend webapp, all you need to do is to fill your ```bower.json``` file.

As an example, you could add:
```json
"dependencies": {
  "jquery": "~1.10.0",
  "marionette": "~1.2.0",
  "requirejs": "~2.1.8",
  "handlebars": "~1.0.0"
}
```

Now to get these dependencies available with requireJS you just need to execute the default grunt task:

```
grunt
```

This will install bower dependencies and then execute the [grunt-bower-require](https://github.com/yeoman/grunt-bower-requirejs) task.

## Run

Run the server by executing

```
ruby config.ru
```

Browse your freshly served application!

```
$BROWSER http://localhost:4567/
```

## Deploy

You could use any server to deploy your webapp but I'll show you here how to deploy your app with ease with [OpenShift](http://www.openshift.com/).

### With OpenShift

Follow the setup instructions from OpenShift [here](https://github.com/openshift/rhc). (Create an account and have the ```rhc``` tool setup on your machine)

At this point you should have an OpenShift account and the ```rhc``` gem installed and setup with your accounts information.

Now create your app via this command:

```
rhc app create <AppName> ruby-1.9 --from-code=git://<AppGitRepo>
```

That's all folks!


## Contributing

Thinking about helping this app to grow?

Here's what you can do:

 * Write an idea to integrate in the app [here](https://github.com/popox/webapp/issues)
 * Code a new feature. Fork, Branch, Pull request..
 * Promote the app to your friends. Talk about it, share it and use it!
 * Eat an Oreo. Because that's always a good thing to do
 * [Buy me a beer](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QHK6TMG66TSD4). If ever you like the project
 * Help someone in need. I'm sure you'll find someone to help

