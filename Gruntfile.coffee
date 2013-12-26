{ spawn } = require 'child_process'

module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    watch:
      files: [
        'src/**/*.coffee'
      ]
      tasks: 'run'

    coffee:
      compile:
        options:
          bare: true
        files  : [
          expand: true
          cwd   : 'src'
          src   : [ '*.coffee' ]
          dest  : 'tasks'
          ext   : '.js'
        ]
      test   :
        files: [
          expand: true
          cwd   : 'tests'
          src   : [ '*_tests.coffee' ]
          dest  : ''
          ext   : '.js'
        ]

    simplemocha:
      options:
        globals    : [ 'should' ]
        ignoreLeaks: false
        ui         : 'bdd'
        reporter   : 'tap'
      all    :
        src: [ 'tests/**/*_tests.js' ]

    clean:
      tests: [ 'tests/**/*_tests.js' ]


  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.loadNpmTasks 'grunt-release'

  grunt.registerTask 'run', [ 'coffee:compile', 'simplemocha', 'clean' ]
  grunt.registerTask 'update', ->
    spawn 'npm', [ 'update', 'coffeemill', '--save-dev' ]
  grunt.registerTask 'default', [ 'run', 'watch' ]