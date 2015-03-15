app = require("app")
BrowserWindow = require("browser-window")
ipc = require("ipc")

api = require("./api")

require("crash-reporter").start()

mainWindow = null

app.on 'window-all-closed', ->
    if process.platform isnt 'darwin'
        app.quit()

app.on 'ready', ->
    mainWindow = new BrowserWindow
        width: 800
        height: 600
    mainWindow.loadUrl "file://#{__dirname}/index.html"
    mainWindow.on 'closed', ->
        mainWindow = null

ipc.on 'compress', (e, args)->
    minifyFunc = null
    switch args.type
        when 'js' then minifyFunc = api.minifyJS
        when 'css' then minifyFunc = api.minifyCss
        when 'html' then minifyFunc = api.minifyHTML

    minifyFunc.call null, args.code, (err, code)->
        e.sender.send 'compressed',
            error: err
            code: code

