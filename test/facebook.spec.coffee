request = require("supertest")


describe "test facebook service", ->
  facebook = null

  before  (done) ->
    facebook = app.models.facebook
    done()

  it "call facebook service test function", (done) ->
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


  it "get friends list", (done) ->
    userId = "100000233810027"
    token = "CAACEdEose0cBAH3ovpJmJTD8RJnVvwMVN1L1WNtONYZB6jKLZAEXKUWS9DldoOa6zxuzWATFa3a0McAFzfKjRWXiI9ZBES9Fi4I4V5Ul8ycjb2QJyABZBh5Dtd3IwDbd4yUnMFJgjG5965M2hdHDZC7W8mTy665JLJdZCTyf9lFlXVHe4YUYRn5MASEZC2FWoeZAe9okG7bdgiDEb2ePd7d5N6Pgs8xwhF0ZD"

    facebook.getFriends userId, token, (error, friends) ->
      friends.should.be.Array
      friends[0].should.have.keys "name", "id"

      done();

  it "get friends list by rest", (done) ->

    params =
      userid: "100000233810027"
      token: "CAACEdEose0cBAH3ovpJmJTD8RJnVvwMVN1L1WNtONYZB6jKLZAEXKUWS9DldoOa6zxuzWATFa3a0McAFzfKjRWXiI9ZBES9Fi4I4V5Ul8ycjb2QJyABZBh5Dtd3IwDbd4yUnMFJgjG5965M2hdHDZC7W8mTy665JLJdZCTyf9lFlXVHe4YUYRn5MASEZC2FWoeZAe9okG7bdgiDEb2ePd7d5N6Pgs8xwhF0ZD"

    request(app).post("/api/facebooks/getFriends")

    .send(params)
    .end (error, res) ->
      res.body.result.should.be.Array
      res.body.result[0].should.have.keys "name", "id"

      done();
