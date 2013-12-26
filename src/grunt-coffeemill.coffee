{CoffeeMill} = require 'coffeemill'

console.log CoffeeMill

module.exports = (grunt) ->
  grunt.registerMultiTask 'coffeemill', 'coffemill task', ->
    new CoffeeMill(grunt.config('coffeemill')[@target]).run()