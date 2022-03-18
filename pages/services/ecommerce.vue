<template>
  <section>
    <v-row no-gutters>
      <v-col cols="12">
        <SectionsHeroAlt :hero-alt="heroAlt" />
        <v-container class="py-16">
          <h2 class="text-h4 text-md-h3 text-center font-weight-black">
            Find your service
          </h2>
        </v-container>
      </v-col>
    </v-row>
  </section>
</template>
<script>
export default {
  data() {
    return {
      heroAlt: [
        {
          src: 'pexels-ekaterina-bolovtsova-4048767.jpg',
          heading: 'Ecommerce and Store',
        },
      ],
    }
  },
}
</script>
