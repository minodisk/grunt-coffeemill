{ CoffeeMill } = require 'coffeemill'

module.exports = (grunt) ->
  grunt.registerMultiTask 'coffeemill', ->
    done = @async()
    warnCount = 0
    errorCount = 0

    new CoffeeMill(grunt.config('coffeemill')[@target].options)
    .on 'warn', (message) ->
        warnCount++
        grunt.fail.warn message
    .on 'error', (message) ->
        errorCount++
        grunt.fail.warn message
    .on 'created', (filepath) ->
        grunt.log.writeln "File #{filepath.cyan} created"
    .on 'complete', (filenum) ->
        grunt.log.writeln "Done, with #{warnCount} warns and #{errorCount} errors.".green
        done()
    .run()
