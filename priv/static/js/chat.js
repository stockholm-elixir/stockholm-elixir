$(function () {
  var socket = new Phoenix.Socket("ws://" + location.host + "/ws");
  var $messages = $("#messages");
  var $messageInput = $("#message-input");
  var $usernameInput = $("#username");
  var $userTokenInput = $("#user-token");

  socket.join("rooms:lobby", {
    username: $usernameInput.val(),
    user_token: $userTokenInput.val()
  }, function (chan) {
    chan.on("user:entered", function(message){
      $messages.append("<br/>" + message.username + " entered");
    });

    chan.on("new:msg", function(msg){
      $messages.append("<br/>[" + msg.username + "] " + msg.content);
    });

    $messageInput.off("keypress").on("keypress", function(e){
      if(e.keyCode == 13){
        chan.send("new:msg", {
          content: $messageInput.val(),
          username: $usernameInput.val(),
          user_token: $userTokenInput.val()
        });
        $messageInput.val("");
      }
    });
  });

  $(window).on('beforeunload', function(){
    socket.close();
  });
});
