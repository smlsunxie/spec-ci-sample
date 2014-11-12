
React = window.React = require("react")

app = React.createClass(

  getInitialState: ->

    userId = "100000233810027"
    token = "CAACEdEose0cBAJ2InrkJ84R4U1rHD5mPSLWKXsIvlGaqsYNgvNauKCRaOnZAVWZCLM9dwOS4M7ZB301ku0rJ7V017ixKgHZCDBtGc28LsYzpvZA0SA3LvVQkEIfukSt4OoEDxEpYhCcq5ZAVPIUM3MeMw560dgGCwxqw6WmWktqDJsDdrZApfFXSDAbZALqQ78L275IB8zqZCjVrWki1AWxbDzLK6ULRcTHoZD"

    self = this

    client.models.facebook.getFriends userId, token, (error, friends) ->
      console.log "friends", friends
      self.setState friends: friends

    return {
      friends: []
    }

  render: ->

    displayFriends = (friend) ->
      <tr>
        <td>{friend.id}</td>
        <td>{friend.name}</td>
      </tr>


    <table>
      <tr>
        <td>name</td>
        <td>id</td>
      </tr>
      {@state.friends.map(displayFriends)}
    </table>

)

mountNode = document.getElementById("app")

React.renderComponent <app/>, mountNode
