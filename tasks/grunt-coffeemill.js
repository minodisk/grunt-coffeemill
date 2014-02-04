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
      return grunt.fail.warn(message);
    }).on('error', function(message) {
      errorCount++;
      return grunt.fail.fatal(message);
    }).on('created', function(filepath) {
      return grunt.log.writeln("File " + filepath.cyan + " created");
    }).on('complete', function(filenum) {
      grunt.log.writeln(("Done, with " + warnCount + " warns and " + errorCount + " errors.").green);
      return done();
    }).run();
  });
};
