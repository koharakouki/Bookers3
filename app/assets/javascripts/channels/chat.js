App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    console.log('connected')
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(chat) {
    const chats = document.getElementById('messages')
    chats.innerHTML += `<p>${chat.content}</p>`
    // Called when there's incoming data on the websocket for this channel
  },


  speak: function(content, room_id) {
    return this.perform('speak', { content: content, room_id: room_id });
  }
});



document.addEventListener('DOMContentLoaded', function(){
  const input = document.getElementById('chat-input')
  const room = document.getElementById('room_id')
  const button = document.getElementById('button')
  button.addEventListener('click', function(){
    const content = input.value
    const room_id = room.value
    App.chat.speak(content, room_id)
    input.value = ''
  })
})