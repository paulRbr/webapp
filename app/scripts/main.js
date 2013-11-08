require.config({
  shim: {

  },
  paths: {

  }
});

require(['app'], function(App) {
  var app = new App();
  app.start();
});