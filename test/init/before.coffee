process.env.NODE_ENV = "test"
require("../../server/server.coffee")
global.lt = require("loopback-testing")
global.chai = require('chai')
global.chai.use(require('chai-properties'))
global.assert = chai.assert
global.should = chai.should()
global.async = require('async')


before (done) ->
  lt.beforeEach.withApp app
  done()
