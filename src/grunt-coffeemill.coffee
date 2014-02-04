{ CoffeeMill } = require 'coffeemill'

module.exports = (grunt) ->
  grunt.registerMultiTask 'coffeemill', ->
    done = @async()
    warnCount = 0
    errorCount = 0

    new CoffeeMill(grunt.config('coffeemill')[@target].options)
    .on 'warn', (message) ->
        warnCount++
        grunt.log.write message
    .on 'error', (message) ->
        errorCount++
        grunt.log.error message
    .on 'created', (filepath) ->
        grunt.log.write "File #{filepath.cyan} created"
    .on 'complete', (filenum) ->
        grunt.log.ok "Done, with #{warnCount} warns and #{errorCount} errors.".green
        done()
    .run()
