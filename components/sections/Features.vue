<template>
  <section class="primary darken-1 white--text py-16">
    <v-container>
      <v-row>
        <v-col class="text-center">
          <h2 class="text-h4 text-md-h3 text-center font-weight-black">
            {{ $t('sections.features.title') }}
          </h2>
          <p class="text-center mt-4">
            {{ $t('sections.features.description') }}
          </p>
        </v-col>
      </v-row>
      <v-row>
        <v-col
          v-for="(card, index) in $t('sections.features.cards')"
          :key="index"
          cols="12"
          sm="4"
          class="text-center"
        >
          <v-avatar
            size="80"
            class="display-1 white font-weight-bold primary--text mb-5"
            style="opacity: 1.15"
            >{{ card.callout }}</v-avatar
          >
          <div class="title text-uppercase mt-1" v-text="card.title"></div>
          <div class="title secondary--text" v-text="card.subtitle"></div>
        </v-col>
      </v-row>
      <v-row no-gutters>
        <v-btn
          to="/services/blockchain"
          x-large
          rounded
          color="white primary--text mx-auto mt-10 px-16"
        >
          <v-icon dark left> mdi-check-bold </v-icon> discover
        </v-btn>
      </v-row>
    </v-container>
  </section>
</template>
