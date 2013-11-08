module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    bower:
      target:
        rjsConfig: "app/scripts/main.js"
    clean:
      test: [
        'bower_components'
      ]
    karma:
      unit:
          # base path, that will be used to resolve all patterns, eg. files, exclude
        basePath: ''

        # frameworks to use
        frameworks: ['jasmine', 'requirejs']

        # list of files / patterns to load in the browser
        files: [
          {pattern: 'app/scripts/**/*.js', included: false},
          {pattern: 'app/scripts/**/*.coffee', included: false},
          {pattern: 'app/specs/**/*Spec.coffee', included: false},
          'app/specs/test-main.js'
        ]

        # list of files to exclude
        exclude: [
          'app/scripts/main.js'
        ]

        # test results reporter to use
        # possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
        reporters: ['progress']

        # web server port
        port: 9876

        # enable / disable colors in the output (reporters and logs)
        colors: true

        # enable / disable watching file and executing tests whenever any file changes
        autoWatch: false

        # Start these browsers, currently available:
        # - Chrome
        # - ChromeCanary
        # - Firefox
        # - Opera (has to be installed with `npm install karma-opera-launcher`)
        # - Safari (only Mac; has to be installed with `npm install karma-safari-launcher`)
        # - PhantomJS
        # - IE (only Windows; has to be installed with `npm install karma-ie-launcher`)
        browsers: ['Firefox']

        # If browser does not capture in given timeout [ms], kill it
        captureTimeout: 60000

        # Continuous Integration mode
        # if true, it capture browsers, run tests and exit
        singleRun: true

  # Load bower-requirejs plugin
  grunt.loadNpmTasks "grunt-bower-requirejs"

  # Load grunt-karma plugin
  grunt.loadNpmTasks "grunt-karma"

  grunt.registerTask 'bower-install', () ->
    done = @async()
    spawn = require('child_process').spawn
    ls = spawn 'bower', ['install']

    ls.stdout.on 'data', (data) ->
      grunt.log.write data

    ls.stderr.on 'data', (data) ->
      grunt.log.write data

    ls.on 'close', (code) ->
      grunt.log.writeln('child process exited with code ' + code)
      done()

  grunt.registerTask 'build', [
    'clean',
    'bower-install',
    'bower',
    'karma:unit',
  ]

  grunt.registerTask "default", ["build"]