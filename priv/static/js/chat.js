$(function () {
  var socket = new Phoenix.Socket("ws://" + location.host + "/ws");
  var $messages = $("#messages");
  var $messageInput = $("#message-input");
  var $usernameInput = $("#username");
  var $userTokenInput = $("#user-token");
  var users = [];

  socket.join("rooms:lobby", {
    username: $usernameInput.val(),
    user_token: $userTokenInput.val()
  }, function (chan) {
    chan.on("joined", function(message) {
      users = message.users;
      $("#users").html(users.join(" "));
    });

    chan.on("user:entered", function(message){
      users.push(message.username);
      $("#users").html(users.join(" "));
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
