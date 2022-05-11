<template>
  <div class="alert__message">
    <v-alert
      dense
      border="left"
      :type="alert ? alert.type : 'info'"
      :value="isShow"
      >{{ alert ? alert.message : null }}</v-alert
    >
  </div>
</template>
<script>
export default {
  data() {
    return {
      // You cant set this type:
      // 'warning', 'error', 'success', 'info'

      isShow: false,
    }
  },
  computed: {
    alert() {
      return this.$store.state.alert.alert
    },
  },
  watch: {
    alert() {
      if (this.alert) {
        this.isShow = true
      } else {
        this.isShow = false
      }
    },
  },
}
</script>
<style scoped>
.alert__message {
  position: fixed;
  top: 50px;
  left: 30px;
  z-index: 100;
  padding-right: 20px;
}
</style>
