<template>
  <section id="hero">
    <v-carousel
      height="calc(100vh - 64px)"
      :light="$vuetify.theme.dark ? false : true"
      cycle
      show-arrows-on-hover
      draggable="true"
      hide-delimiter-background
    >
      <v-carousel-item
        v-for="(carousel, carindex) in carouselsData"
        :key="carindex"
        :src="carousel.src"
        class="gradient-fill"
      >
        <v-container fill-height>
          <div
            style="max-width: 600px"
            :class="
              $vuetify.theme.dark
                ? 'grey--text text--lighten-3'
                : 'grey--text text--darken-3'
            "
          >
            <h2 class="text-md-h2 mb-3 text-sm-h3 text-h5 font-weight-black">
              {{ carousel.heading.toUpperCase() }}
            </h2>
            <p class="mb-5">{{ carousel.subHeading }}</p>
            <v-btn
              :x-large="$vuetify.breakpoint.smAndUp"
              class="my-3 primary"
              @click="
                $vuetify.goTo('#footer-top', {
                  duration: 500,
                  easing: 'easeInOutCubic',
                })
              "
              >Get Started</v-btn
            >
            <span class="mx-2 my-4"></span>
            <v-btn
              :x-large="$vuetify.breakpoint.smAndUp"
              text
              class="my-3"
              outlined
              @click="
                $vuetify.goTo('#intro', {
                  duration: 500,
                  easing: 'easeInOutCubic',
                })
              "
              ><v-icon left large color="primary">mdi-play</v-icon>Learn
              More</v-btn
            >
          </div>
        </v-container>
      </v-carousel-item>
    </v-carousel>
  </section>
</template>

<script>
export default {
  computed: {
    carouselsData() {
      return this.$store.getters['hero/heroItems']
    },
  },
}
</script>

<style>
.theme--dark .gradient-fill .v-responsive__content {
  background: rgb(0, 0, 0);
  background: linear-gradient(
    to right,
    rgba(3, 12, 41, 0.75),
    rgba(5, 11, 31, 0.65)
  );
}
.theme--light .gradient-fill .v-responsive__content {
  background: rgb(211, 211, 211);
  background: linear-gradient(
    to right,
    rgba(211, 211, 211, 0.75),
    rgba(211, 211, 211, 0.65)
  );
}
</style>
