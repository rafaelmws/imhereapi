(function(window, Phoenix){

  function ChatRoom(){
    this.socket =  new Phoenix.Socket("ws://" + location.host + "/ws");
    this.room = null;
    this.chan = null;
  }

  ChatRoom.prototype.send = function(message) {
    if (this.chan) {
      this.chan.send("room:in", { data: message, to: this.room });
    }
  };

  ChatRoom.prototype.join = function(room, onMessage) {
    var that = this;
    this.leave();
    this.room = "room:" + room;
    this.socket.join(this.room, null, function(chan){
      that.chan = chan;
      chan.on(that.room, onMessage);
    });
  };

  ChatRoom.prototype.leave = function() {
    if (this.room) {
      this.socket.leave(this.room);
    }
  };

  window.ChatRoom = ChatRoom;

})(window, Phoenix);
