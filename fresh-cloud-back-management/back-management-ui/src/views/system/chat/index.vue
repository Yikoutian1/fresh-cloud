<template>
  <div>
    
  </div>
</template>

<script>
import {} from "@/api/system/chat";

export default {
  name: "chat",
  data() {
    return {
      webSocketObject: null,
      username: "calyee",
      messageList: [],
      sendMessage: "",
    };
  },
  created() {
    //初始化WebSocket
    this.webSocketInit();
  },
  beforeDestroy() {
    this.webSocketObject.close(); //在该组件销毁时关闭该连接以节约资源
  },
  methods: {
    webSocketInit() {
      const webSocketUrl = "ws://localhost:8080/websocket/" + this.username;
      this.webSocketObject = new WebSocket(webSocketUrl);
      this.webSocketObject.onopen = this.webSocketOnOpen;
      this.webSocketObject.onmessage = this.webSocketOnMessage;
      this.webSocketObject.onerror = this.webSocketOnError;
      this.webSocketObject.onclose = this.webSocketOnClose;
    },
    webSocketOnOpen(e) {
      console.log("与服务端连接打开->", e);
    },
    webSocketOnMessage(e) {
      console.log("来自服务端的消息->", e);
      const receiveMessage = JSON.parse(e.data);
      this.messageList.push(receiveMessage);
    },
    webSocketOnError(e) {
      console.log("与服务端连接异常->", e);
    },
    webSocketOnClose(e) {
      console.log("与服务端连接关闭->", e);
    },
    handleSendButton() {
      const username = this.username;
      const message = this.sendMessage;
      this.webSocketObject.send(
        JSON.stringify({
          id: 1,
          message,
          username,
          time: new Date().getTime(),
        })
      );
      this.sendMessage = "";
    },
    handleLogoutButton() {
      removeUsername(); //清除username然后断开连接
      this.webSocketObject.close();
      this.$router.push({
        name: "Login",
      });
    },
  },
};
</script>
