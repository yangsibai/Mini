UglifyJS = require("uglify-js")
CleanCss = require("clean-css")
HtmlMinify = require("html-minifier")

###
    minify js
    @param {String} source original js source code
###
exports.minifyJS = (source, cb, options)->
    try
        result = UglifyJS.minify source,
            fromString: true
            compress: options
        cb null, result.code
    catch err
        cb err

###
    minify css
    @param {String} source original css source code
###
exports.minifyCss = (source, cb, options)->
    try
        result = new CleanCss(options).minify(source)
        cb null, result.styles
    catch err
        cb err

###
    html minify
    @param {String} source original html source code
###
exports.minifyHTML = (source, cb, options)->
    default_options =
        removeComments: true
        removeCommentsFromCDATA: true
        removeCDATASectionsFromCDATA: true
        collapseWhitespace: true
        conservativeCollapse: true
        preserveLineBreaks: true
        collapseBooleanAttributes: true
        removeAttributeQuotes: true
        removeRedundantAttributes: true
        preventAttributesEscaping: true
        useShortDoctype: true
        removeEmptyAttributes: true
        removeScriptTypeAttributes: true
        removeStyleLinkTypeAttributes: true
        removeoptionaltags: false
        removeignored: false
        removeemptyelements: true
#        lint: true
        keepclosingslash: true
        casesensitive: true
        minifyjs: true
        minifyCSS: true
        minifyURLs: false
        ignoreCustomComments: []
        processScripts: []
        customAttrAssign: []
        customAttrSurround: []

    if options
        for k of default_options
            options[k] = default_options[k] unless options[k]
    else
        options = default_options

    try
        result = HtmlMinify.minify source, options
        cb null, result
    catch err
        cb err
