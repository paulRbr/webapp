tests = []
for filepath,timestamp of window.__karma__.files
  if /Spec\.js$/.test filepath
    tests.push(filepath)

# Add config for requirejs in TEST environment
# Which will be added to the existing require config
# (from scripts/main.js)
require.config
   # Karma serves files from '/base'
   baseUrl: '/base/app/scripts'

   # ask Require.js to load these files (all our tests)
   deps: tests

   # start test run, once Require.js is done
   callback: window.__karma__.start