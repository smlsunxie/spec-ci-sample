browserify = require('browserify');
distPath = "./client/app/scripts"
path = require('path');
fs = require('fs');


buildViewModules = (callback) ->

  console.log "=== buildViewModules ==="

  bundlePath = path.resolve(distPath, 'app.js');
  out = fs.createWriteStream(bundlePath);

  b = browserify();
  b.add("./app/scripts/app.js");

  b.bundle()
  .on('error', ()->
    console.log "error 1"
    callback()
  )
  .pipe(out);

  out.on('error', ()->
    console.log "error 2"
    callback()
  );
  out.on('close', ()->
    console.log "finish"
    callback()
  );




module.exports = buildViewModules
