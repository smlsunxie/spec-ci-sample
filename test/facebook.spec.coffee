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
    token = "CAACEdEose0cBAJ2InrkJ84R4U1rHD5mPSLWKXsIvlGaqsYNgvNauKCRaOnZAVWZCLM9dwOS4M7ZB301ku0rJ7V017ixKgHZCDBtGc28LsYzpvZA0SA3LvVQkEIfukSt4OoEDxEpYhCcq5ZAVPIUM3MeMw560dgGCwxqw6WmWktqDJsDdrZApfFXSDAbZALqQ78L275IB8zqZCjVrWki1AWxbDzLK6ULRcTHoZD"

    facebook.getFriends userId, token, (error, friends) ->
      friends.should.be.Array
      friends[0].should.have.keys "name", "id"

      done();

  it "get friends list by rest", (done) ->

    params =
      userid: "100000233810027"
      token: "CAACEdEose0cBAJ2InrkJ84R4U1rHD5mPSLWKXsIvlGaqsYNgvNauKCRaOnZAVWZCLM9dwOS4M7ZB301ku0rJ7V017ixKgHZCDBtGc28LsYzpvZA0SA3LvVQkEIfukSt4OoEDxEpYhCcq5ZAVPIUM3MeMw560dgGCwxqw6WmWktqDJsDdrZApfFXSDAbZALqQ78L275IB8zqZCjVrWki1AWxbDzLK6ULRcTHoZD"

    request(app).post("/api/facebooks/getFriends")

    .send(params)
    .end (error, res) ->
      res.body.result.should.be.Array
      res.body.result[0].should.have.keys "name", "id"

      done();
