// Generated by CoffeeScript 1.9.1
(function() {
  var BrowserWindow, api, app, dialog, ipc, mainWindow;

  app = require("app");

  BrowserWindow = require("browser-window");

  ipc = require("ipc");

  dialog = require("dialog");

  api = require("./api");

  require("crash-reporter").start();

  mainWindow = null;

  app.on('window-all-closed', function() {
    if (process.platform !== 'darwin') {
      return app.quit();
    }
  });

  app.on('ready', function() {
    mainWindow = new BrowserWindow({
      width: 800,
      height: 600
    });
    mainWindow.loadUrl("file://" + __dirname + "/index.html");
    return mainWindow.on('closed', function() {
      return mainWindow = null;
    });
  });

  ipc.on('compress', function(e, args) {
    var minifyFunc;
    minifyFunc = null;
    switch (args.type) {
      case 'js':
        minifyFunc = api.minifyJS;
        break;
      case 'css':
        minifyFunc = api.minifyCss;
        break;
      case 'html':
        minifyFunc = api.minifyHTML;
    }
    return minifyFunc.call(null, args.code, function(err, code) {
      if (err) {
        return dialog.showErrorBox(err.message, err.stack);
      } else {
        return e.sender.send('compressed', {
          error: err,
          code: code
        });
      }
    });
  });

}).call(this);

//# sourceMappingURL=main.js.map
