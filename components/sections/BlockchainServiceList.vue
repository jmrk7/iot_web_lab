<template>
  <section id="service_list" class="secondary darken-2 white--text">
    <v-row no-gutters>
      <v-col cols="12">
        <v-container class="py-16">
          <h2
            class="text-uppercase text-h4 text-md-h3 text-center font-weight-black"
          >
            {{ $t('sections.blockchainServicesList.title') }}
          </h2>
          <v-row class="mt-16">
            <v-col
              v-for="item in $t('sections.blockchainServicesList.services')"
              :key="item"
              cols="12"
              sm="6"
              class="font-weight-black text-uppercase py-2"
            >
              <v-icon v-if="!$vuetify.theme.dark" light left>
                mdi-circle-medium
              </v-icon>
              <v-icon v-if="$vuetify.theme.dark" dark left>
                mdi-circle-medium
              </v-icon>
              {{ item }}
            </v-col>
          </v-row></v-container
        ></v-col
      >
    </v-row>
  </section>
</template>
