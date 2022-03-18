<template>
  <section class="primary darken-1 white--text py-16">
    <v-container>
      <v-row>
        <v-col class="text-center">
          <h2 class="text-h4 text-md-h3 text-center font-weight-black">
            Blockchain Development
          </h2>
          <p class="text-center mt-4">
            Explore the world of secure, scalable, and interoperable
            decentralized applications with our end-to-end blockchain
            development services. We help enterprises leverage the power of
            blockchain technologies and solutions to achieve next-level
            transparency and automation in their business processes.
          </p>
        </v-col>
      </v-row>
      <v-row>
        <v-col
          v-for="(card, index) in cards"
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

<script>
export default {
  data() {
    return {
      cards: [
        {
          title: 'Cryptocurrency',
          subtitle: 'Best Productivity',
          callout: '01',
        },
        {
          title: 'Smart Contract',
          subtitle: 'Special Offers',
          callout: '02',
        },
        {
          title: 'NFT',
          subtitle: 'Income Flow',
          callout: '03',
        },
      ],
    }
  },
}
</script>
