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
        basePath: ''
        frameworks: ['jasmine', 'requirejs']
        files: [
          ## App files
          {pattern: 'app/scripts/**/*.coffee', included: false},
          ## Dependencies files
          {pattern: 'bower_components/**/*.js', included: false},
          ## Test files
          {pattern: 'app/specs/**/*Spec.coffee', included: false},

          {pattern: 'app/scripts/main.js'},
          {pattern: 'app/specs/test-main.coffee'}
        ]
        reporters: ['progress', 'coverage']
        preprocessors:
          "app/scripts/**/*.coffee": ['coverage'],
          "app/specs/**/*.coffee": ['coffee']
        port: 9876
        colors: true
        autoWatch: false
        browsers: ['Firefox']
        captureTimeout: 60000
        singleRun: true

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