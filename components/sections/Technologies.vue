<template>
  <section
    id="testimonials"
    :class="$vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-2'"
    class="py-16"
  >
    <h2 class="text-h4 text-md-h3 text-center font-weight-black mb-2 my-2">
      Technologies
    </h2>

    <v-row class="pa-12">
      <v-col
        v-for="tech in techs"
        :key="tech.title"
        cols="6"
        sm="3"
        md="2"
        lg="2"
      >
        <div class="d-flex flex-column">
          <div class="custom__item">
            <SimpleSVG
              :src="tech.svg"
              :width="properties"
              :height="properties"
            />
          </div>
          <h4
            class="text-uppercase text-center mt-1 mb-4"
            style="letter-spacing: 0.15em"
            v-text="tech.title"
          ></h4>
        </div>
      </v-col>
    </v-row>
  </section>
</template>

<script>
import { SimpleSVG } from 'vue-simple-svg'
export default {
  components: {
    SimpleSVG,
  },
  data() {
    return {
      properties: '100px',
    }
  },
  computed: {
    techs() {
      return this.$store.getters['techs/techs']
    },
  },
}
</script>
<style scoped>
.custom__item {
  width: fit-content;
  justify-self: center;
  align-self: center;
}
</style>
