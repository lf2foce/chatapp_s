App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#message').append data['message']
    $('#message').animate { scrollTop: $('#message').prop('scrollHeight') }, 500
    #$('#message').prepend data['message']
    #$('.all_messages').append data['message']
    #$('.all_messages').prepend data['each_message']
  
  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
	if event.keyCode is 13 # return = send
		App.room.speak event.target.value
		event.target.value = ''
		event.preventDefault()
