UglifyJS = require("uglify-js")

exports.minifyJS = (str, options)->
    return UglifyJS.minify str,
        fromString: true
        compress: options
