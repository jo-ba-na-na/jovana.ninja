var gulp = require('gulp'),
    plumber = require('gulp-plumber'),
    autoprefixer = require('gulp-autoprefixer'),
    sass = require('gulp-sass'),
    csso = require('gulp-csso'),
    uglify = require('gulp-uglify'),
    imagemin = require('gulp-imagemin'),
    swig = require('gulp-swig'),
    util = require('gulp-util'),
    connect = require('gulp-connect'),
    gulpif = require('gulp-if'),
    del = require('del');


// --- "meta" tasks: default clear build watch -----------------------------------------------------

gulp.task('default', ['clear', 'build']);
gulp.task('clear', ['clear:css', 'clear:img', 'clear:js', 'clear:html']);
gulp.task('build', ['build:css', 'build:img', 'build:js', 'build:html']);
gulp.task('watch', ['watch:css', 'watch:img', 'watch:js', 'watch:html']);

// --- tasks: serve --------------------------------------------------------------------------------

gulp.task('serve', ['watch'], function() {
    connect.server({
        port: 1234,
        host: '127.0.0.1',
        root: './public',
        livereload: true,
    });
});

// --- tasks: css clear:css build:css watch:css ----------------------------------------------------

gulp.task('clear:css', function() {
    return del(['./public/css']);
});

gulp.task('watch:css', ['css'], function() {
    return gulp.watch('src/scss/**/*.scss', {cwd: './'}, ['css'])
        .on('change', logChange);
});

gulp.task('css', css);
gulp.task('build:css', ['clear:css'], css);

function css() {
    return gulp.src('./src/scss/style.scss')
        .pipe(plumber())
        .pipe(sass({
            // make @import "normalize"; work correctly
            //includePaths: require('node-normalize-scss').includePaths,
            
            includePaths: require('node-normalize-scss').with(
                path.dirname(require.resolve('node-waves/src/scss/waves.scss'))
            ),

        }).on('error', sass.logError))
        .pipe(autoprefixer({
            browsers: ['last 2 versions']
        }))
        .pipe(gulpif(util.env.prod, csso()))
        .pipe(gulp.dest('./public/css'))
        .pipe(connect.reload());
}

// --- tasks: img clear:img build:img watch:img ----------------------------------------------------

gulp.task('clear:img', function() {
    return del(['./public/images']);
});

gulp.task('watch:img', ['img'], function() {
    gulp.watch('src/images/**/*', {cwd: './'}, ['img'])
        .on('change', logChange);
});

gulp.task('img', img);
gulp.task('build:img', ['clear:img'], img);

function img() {
    return gulp.src('./src/images/**/*')
        .pipe(plumber())
        .pipe(gulpif(util.env.prod, imagemin()))
        .pipe(gulp.dest('./public/images'))
        .pipe(connect.reload());
}

// --- tasks: js clear:js build:js watch:js --------------------------------------------------------

gulp.task('clear:js', function() {
    return del(['./public/js']);
});

gulp.task('watch:js', ['js'], function() {
    gulp.watch('src/js/**/*.js', {cwd: './'}, ['js'])
        .on('change', logChange);
});

gulp.task('js', js);
gulp.task('build:js', ['clear:js'], js);

function js() {
    return gulp.src(['./src/js/**/*.js', require.resolve('parallax-js/deploy/parallax.js'), require.resolve('node-waves')])
        .pipe(plumber())
        .pipe(gulpif(util.env.prod, uglify()))
        .pipe(gulp.dest('./public/js'))
        .pipe(connect.reload());
}

// --- tasks: html clear:html build:html watch:html ------------------------------------------------

gulp.task('clear:html', function() {
    return del(['./public/**/*.html']);
});

gulp.task('watch:html', ['html'], function() {
    gulp.watch('src/html/**/*.swig', {cwd: './'}, ['html'])
        .on('change', logChange);
});

gulp.task('html', html);
gulp.task('build:html', ['clear:html'], html);

function html() {
    return gulp.src('src/html/pages/**/*.swig')
        .pipe(plumber())
        .pipe(swig({
            defaults: {
            cache: false,
            },
        }))
        .pipe(gulp.dest('./public'))
        .pipe(connect.reload());
}


// --- utility functions ---------------------------------------------------------------------------

// used to log changed/added/removed events while in watch mode
var path = require('path');
function logChange(event) {
    var action = event.type.substr(0, 1).toUpperCase() + event.type.substr(1); // changed => Changed
    action += ' '.repeat(8 - action.length); // add padding to the right if needed
    util.log(action + " '" + util.colors.yellow(path.relative(__dirname, event.path)) + "'");
}
