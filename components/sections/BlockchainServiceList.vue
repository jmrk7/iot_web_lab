<template>
  <section id="service_list" class="secondary darken-2 white--text">
    <v-row no-gutters>
      <v-col cols="12">
        <v-container class="py-16">
          <h2
            class="text-uppercase text-h4 text-md-h3 text-center font-weight-black"
          >
            Find your service
          </h2>
          <v-row class="mt-16">
            <v-col
              v-for="item in services"
              :key="item"
              cols="12"
              sm="6"
              class="font-weight-black text-uppercase py-2"
            >
              <v-icon v-if="!$vuetify.theme.dark" light left>
                mdi-bitcoin
              </v-icon>
              <v-icon v-if="$vuetify.theme.dark" dark left>
                mdi-bitcoin
              </v-icon>
              {{ item }}
            </v-col>
          </v-row></v-container
        ></v-col
      >
    </v-row>
  </section>
</template>
<script>
export default {
  data() {
    return {
      services: [
        'Product design workshop',
        'Public blockchain network integration',
        'Permissioned and Permissionless blockchain development',
        'Distributed applications (DApps) development',
        'Smart Contracts development and audit within a project scope',
        'Hybrid centralized systems development with blockchain components',
        'Blockchain technology consulting',
        'Proof of Concept design workshop',
        'Proof of Concept development',
        'Private and permissioned blockchain development',
        'Consortium networks',
        'Integrating blockchain into legacy infrastructure',
        'Migrating to blockchain infrastructure',
        'Public blockchain networks integration',
        'Blockchain technology consulting',
      ],
    }
  },
}
</script>
