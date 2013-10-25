require.config({
  shim: {
  },
  paths: {
  }
});

require(['app'], function(App) {
  app = new App();
  app.start();
});