module.exports = (server) ->
  console.log "set root"
  # Install a `/` route that returns server status
  router = server.loopback.Router()
  router.get "/", server.loopback.status()
  server.use router
  return
