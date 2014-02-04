var CoffeeMill;

CoffeeMill = require('coffeemill').CoffeeMill;

module.exports = function(grunt) {
  return grunt.registerMultiTask('coffeemill', function() {
    var done, errorCount, warnCount;
    done = this.async();
    warnCount = 0;
    errorCount = 0;
    return new CoffeeMill(grunt.config('coffeemill')[this.target].options).on('warn', function(message) {
      warnCount++;
      return grunt.log.write(message);
    }).on('error', function(message) {
      errorCount++;
      return grunt.log.error(message);
    }).on('created', function(filepath) {
      return grunt.log.write("File " + filepath.cyan + " created");
    }).on('complete', function(filenum) {
      grunt.log.ok(("Done, with " + warnCount + " warns and " + errorCount + " errors.").green);
      return done();
    }).run();
  });
};
