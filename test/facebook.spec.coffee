request = require("supertest")


describe "test facebook service", ->
  it "call facebook service test function", (done) ->
    facebook = app.models.facebook

    facebook.test((error, result)->
      result.should.be.Object
    )
    done()




  lt.describe.whenCalledRemotely "get", "/api/facebooks/test", ->
    it "should have statusCode 200", ->
      assert.equal @res.statusCode, 200
      @res.body.should.be.have.property "result"


  it "call facebook rest", (done) ->
    request(app).get("/api/facebooks/test")
    .end (error, res) ->
      res.body.should.be.have.property "result"
      done()
