var gulp   = require('gulp')
var del    = require('del')
var config = require('../config')

var cleanTask = function (cb) {
  // Delete everything in the dest directory, but not the directory itself or
  // else inotify on Linux may stop tracking changes. The glob pattern **
  // matches all children and the parent.
  del([config.root.dest + '/**', '!' + config.root.dest]).then(function (paths) {
    cb()
  })
}

gulp.task('clean', cleanTask)
module.exports = cleanTask
