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
    if args.type is 'js'
        e.sender.send 'compressed', api.minifyJS(args.code)
