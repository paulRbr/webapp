var tests = [];
for (var i=0; i<window.__karma__.file.length-1; i++) {
   var file = window.__karma__.file[i];
   if (window.__karma__.files.hasOwnProperty(file)) {
      if (/Spec\.js$/.test(file)) {
         tests.push(file);
      }
   }
}

requirejs.config({
   // Karma serves files from '/base'
   baseUrl: '/base/app',

   paths: {

   },

   shim: {

   },

   // ask Require.js to load these files (all our tests)
   deps: tests,

   // start test run, once Require.js is done
   callback: window.__karma__.start
});