module.exports = (server) ->
  console.log "set root"

  router = server.loopback.Router()


  router.get "/", (req, res) ->
    res.render "index"

  server.use router

  return
