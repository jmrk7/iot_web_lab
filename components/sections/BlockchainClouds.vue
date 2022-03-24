<template>
  <section id="service_list" class="grey darken-4 white--text">
    <v-row no-gutters>
      <v-col cols="12">
        <v-container class="py-8">
          <h3
            class="text-uppercase text-h6 text-md-h5 text-center font-weight-black my-16"
          >
            We will help to integrate your prodject into services
          </h3>
          <v-row>
            <v-col v-for="item in clouds" :key="item.name">
              <div class="image__wrapper">
                <img width="100px" :src="item.src" dark />
              </div>
              <h4
                class="text-uppercase body-2 text-center mt-1 mb-4"
                style="letter-spacing: 0.15em"
                v-text="item.name"
              ></h4>
            </v-col> </v-row></v-container
      ></v-col>
    </v-row>
  </section>
</template>
<script>
export default {
  computed: {
    clouds() {
      return this.$store.getters['blockchain/clouds']
    },
  },
}
</script>
<style scoped>
.image__wrapper {
  display: flex;
  height: 100px;
  justify-content: center;
  align-items: center;
}
</style>
