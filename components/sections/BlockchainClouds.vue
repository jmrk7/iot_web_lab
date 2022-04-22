<template>
  <section id="service_list" class="grey darken-4 white--text">
    <v-row no-gutters>
      <v-col cols="12">
        <v-container class="py-8">
          <h3
            class="text-uppercase text-h6 text-md-h5 text-center font-weight-black my-16"
          >
            {{ $t('sections.blockchainClouds.title') }}
          </h3>
          <v-row>
            <v-col v-for="item in clouds" :key="item.name + item.id">
              <a
                :href="item.link"
                target="_blank"
                class="grey--text text--lighten-1"
              >
                <div class="image__wrapper">
                  <img width="100px" :src="item.src" dark />
                </div>
                <h4
                  class="text-uppercase body-2 text-center mt-1 mb-4"
                  style="letter-spacing: 0.15em"
                  v-text="item.name"
                ></h4>
              </a>
            </v-col> </v-row></v-container
      ></v-col>
    </v-row>
  </section>
</template>
<script>
import { mapGetters } from 'vuex'
export default {
  computed: {
    ...mapGetters({
      clouds: 'blockchain/clouds',
    }),
  },
}
</script>
<style scoped>
a {
  text-decoration: none;
}
.image__wrapper {
  display: flex;
  height: 100px;
  justify-content: center;
  align-items: center;
}
</style>
