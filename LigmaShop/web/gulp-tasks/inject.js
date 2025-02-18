'use strict'
var gulp = require('gulp');
var injectPartials = require('gulp-inject-partials');
var inject = require('gulp-inject');
var prettify = require('gulp-prettify');
var replace = require('gulp-replace');
var merge = require('merge-stream');

/* inject partials like sidebar and navbar */
gulp.task('injectPartial', function () {
    return gulp.src(["./pages/**/*.html", "./index1.html"], {
            base: "./"
        })
        .pipe(injectPartials())
        .pipe(gulp.dest("."));
});

/* inject Js and CCS assets into HTML */
gulp.task('injectAssets', function () {
    return gulp.src(["./**/*.html"])
        .pipe(inject(gulp.src([
           './vendors/feather/feather.css',
            './vendors/mdi/css/materialdesignicons.min.css',
            './vendors/ti-icons/css/themify-icons.css',
            './vendors/font-awesome/css/font-awesome.min.css',
            './vendors/typicons/typicons.css',
            './vendors/simple-line-icons/css/simple-line-icons.css',
            './vendors/css/vendor.bundle.base.css',
            './vendors/js/vendor.bundle.base.js',
            './vendors/bootstrap-datepicker/bootstrap-datepicker.min.js',
            './vendors/bootstrap-datepicker/bootstrap-datepicker.min.css' 
        ], {
            read: false
        }), {
            name: 'plugins',
            relative: true
        }))
        .pipe(inject(gulp.src([
            // './css/shared/style.css',
             './css/*.css',
            './js/off-canvas.js',
            './js/template.js',
            './js/settings.js',
            './js/hoverable-collapse.js',
            './js/todolist.js'
        ], {
            read: false
        }), {
            relative: true
        }))
        .pipe(gulp.dest('.'));
});

/*replace image path and linking after injection*/
gulp.task('replacePath', function () {
    var replacePath1 = gulp.src('./pages/**/*.html', {
            base: "./"
        })
        //.pipe(replace('="../', '="../../'))
        .pipe(replace('href="../pages/', 'href="../../pages/'))
        .pipe(replace('="../docs/', '="../../docs/'))
        .pipe(replace('href="../index.html"', 'href="../../index1.html"'))
        .pipe(gulp.dest('.'));
    var replacePath2 = gulp.src('./index1.html', {base: "./"})
        .pipe(replace('="../', '="'))
        .pipe(replace('="../docs/', '="docs/'))
        .pipe(replace('="../pages/', '="pages/'))
        .pipe(replace('="../index1.html"', '="index1.html"'))
        .pipe(gulp.dest('.'));
    return merge(replacePath1, replacePath2);
});

gulp.task('html-beautify', function () {
    return gulp.src(['./**/*.html', '!node_modules/**/*.html'])
        .pipe(prettify({
            unformatted: ['pre', 'code', 'textarea']
        }))
        .pipe(gulp.dest(function (file) {
            return file.base;
        }));
});

/*sequence for injecting partials and replacing paths*/
gulp.task('inject', gulp.series('injectPartial', 'injectAssets', 'html-beautify', 'replacePath'));
