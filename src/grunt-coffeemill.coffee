{ CoffeeMill } = require 'coffeemill'

module.exports = (grunt) ->
  grunt.registerMultiTask 'coffeemill', 'coffemill task', ->
    new CoffeeMill(grunt.config('coffeemill')[@target]).run()