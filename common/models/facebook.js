

module.exports = function(Facebook) {

  Facebook.test = function(cb) {
    console.log("call Facebook.test");

    return cb(null, {success: false})
  }

  Facebook.getFriends = function(userid, token, cb) {

    FB.setAccessToken(token);
    FB.api(userid + '/friends', function (res) {
      return cb(null, res.data)
    });


  }

  Facebook.remoteMethod("test", {

    returns: {arg: "result", type: "object"},
    http: {verb: "get"}
  });

  Facebook.remoteMethod("getFriends", {
    accepts: [
      {arg: "userid", type: "string", required: true},
      {arg: "token", type: "string", required: true}
    ],
    returns: {arg: "result", type: "array"},
    http: {verb: "post"}
  });


};
