// Define callback to be called
// Depending of the env
// IF window.__karma__ is set THEN we are in TEST
var startCallback = function() {};
if (window && !window.__karma__) {
  startCallback = function () {
    require(['app'], function(App) {
      var app = new App();
      app.start();
    });
  };
}

require.config({
  shim: {

  },
  paths: {
    requirejs: '../../bower_components/requirejs/require'
  },
  callback: function () {
startCallback();
}
});