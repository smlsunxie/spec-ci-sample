
React = window.React = require("react")

app = React.createClass(

  getInitialState: ->

    userId = "100000233810027"
    token = "CAACEdEose0cBAH3ovpJmJTD8RJnVvwMVN1L1WNtONYZB6jKLZAEXKUWS9DldoOa6zxuzWATFa3a0McAFzfKjRWXiI9ZBES9Fi4I4V5Ul8ycjb2QJyABZBh5Dtd3IwDbd4yUnMFJgjG5965M2hdHDZC7W8mTy665JLJdZCTyf9lFlXVHe4YUYRn5MASEZC2FWoeZAe9okG7bdgiDEb2ePd7d5N6Pgs8xwhF0ZD"

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
