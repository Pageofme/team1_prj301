'use strict'
var gulp = require('gulp');
var replace = require('gulp-replace');
var merge = require('merge-stream');

//  copy all assets to the dist folder 
function CopyAssetsToTheme() {
    let copyImages = gulp.src('./images/**/*').pipe(gulp.dest(`../dist/images`))
    let copyJs = gulp.src('./js/*').pipe(gulp.dest(`../dist/js`))
    let copyVendors = gulp.src('./vendors/**/*').pipe(gulp.dest(`../dist/vendors`));
    let copyFonts = gulp.src('./fonts/**/*').pipe(gulp.dest(`../dist/fonts`));
    let copyThemeCss = gulp.src('./css/**/*').pipe(gulp.dest('../dist/css'))
    let copyEntry = gulp.src('./index1.html').pipe(gulp.dest('../dist/'));
    let copyPages = gulp.src('./pages/**/*').pipe(gulp.dest('../dist/pages'));
    let copyDocs = gulp.src('./docs/**/*').pipe(gulp.dest('../dist/docs/'));
    return merge(copyImages, copyJs, copyVendors, copyFonts, copyEntry, copyThemeCss, copyDocs, copyPages, copyFonts)
}

gulp.task('replacePaths', () => {
    let replacePath1 = gulp.src(['./index1.html'], {base: '../dist'})
        .pipe(replace('="../../assets', '="assets'))
        .pipe(gulp.dest('../dist'))
    let replacePath2 = gulp.src(['./pages/**/*.html'], {base: '../dist'})
        //.pipe(replace('="../../../../assets', '="../../assets'))
        .pipe(gulp.dest('../dist'))
    return merge(replacePath1, replacePath2)
})

// build necessary file to dist
gulp.task('build', gulp.series(CopyAssetsToTheme, 'replacePaths'))
