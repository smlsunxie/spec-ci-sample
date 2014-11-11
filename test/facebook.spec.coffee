describe "test facebook service", ->
  it "call facebook service test function", (done) ->
    facebook = app.models.facebook

    facebook.test(()->)

    done()




  lt.describe.whenCalledRemotely "get", "/api/facebooks/test", ->
    it "should have statusCode 200", ->
      assert.equal @res.statusCode, 200
