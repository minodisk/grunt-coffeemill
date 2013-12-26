var CoffeeMill;

CoffeeMill = require('coffeemill').CoffeeMill;

console.log(CoffeeMill);

module.exports = function(grunt) {
  return grunt.registerMultiTask('coffeemill', 'coffemill task', function() {
    return new CoffeeMill(grunt.config('coffeemill')[this.target]).run();
  });
};
