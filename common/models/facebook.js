module.exports = function(Facebook) {
  Facebook.test = function(cb) {
    console.log("call Facebook.test");

    return cb(null, {success: false})
  }

  Facebook.remoteMethod("test", {
    // accepts: [
    //   {arg: "id", type: "string", required: true}
    // ],
    returns: {arg: "result", type: "object"},
    http: {verb: "get"}
  });


};
