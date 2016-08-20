var config       = require('../config')
if(!config.tasks.html) return

var browserSync  = require('browser-sync')
var gulp         = require('gulp')
var handleErrors = require('../lib/handleErrors')
var path         = require('path')

var exclude = path.normalize('!**/{' + config.tasks.html.excludeFolders.join(',') + '}/**')

var paths = {
  src: [path.join(config.root.src, config.tasks.html.src, '/**/*.{' + config.tasks.html.extensions + '}'), exclude]
}

var htmlTask = function() {

  return browserSync.reload()

}

gulp.task('html', htmlTask)
module.exports = htmlTask
