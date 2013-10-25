module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    bower:
      target:
        rjsConfig: "app/config.js"

  grunt.loadNpmTasks "grunt-bower-requirejs"
  grunt.registerTask "default", ["bower"]