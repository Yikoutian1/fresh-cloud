<template>
  <div>
    <iframe
      style="height: 1000px; width: 100%; color: #fff"
      :src="url"
    ></iframe>
  </div>
</template>

<script>
import {} from "@/api/system/chat";

export default {
  name: "chat",
  data() {
    return {
      url: "http://localhost:8005/websocket/connectManager/calyee",
    };
  },

  methods: {},
};
</script>
