var CoffeeMill;

CoffeeMill = require('coffeemill').CoffeeMill;

module.exports = function(grunt) {
  return grunt.registerMultiTask('coffeemill', 'coffemill task', function() {
    return new CoffeeMill(grunt.config('coffeemill')[this.target]).run();
  });
};
