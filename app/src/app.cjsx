
React = window.React = require("react")

app = React.createClass(

  render: ->

    <div>Hello!</div>

)

mountNode = document.getElementById("app")

module.exports = app
