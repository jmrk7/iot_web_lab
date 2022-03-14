<template>
  <section id="intro" class="py-16">
    <v-container>
      <v-responsive class="max-auto mx-auto text-center" max-width="600">
        <v-avatar color="primary" size="70" class="mb-8">
          <v-icon x-large dark>mdi-web</v-icon>
        </v-avatar>
        <h2 class="text-h4 text-md-h3 text-center font-weight-black mb-7">
          IoT Digital Solution <br />
        </h2>
        <p class="title font-weight-light">
          BUILDING HIGH QUALITY SOFTWARE AND SCALING TEAMS ON DEMAND
          <!-- <strong>Vue.js</strong>
          and
          <strong>Nuxt.js</strong>, it comes with the features you need to
          quickly start developing your application. -->
        </p>
      </v-responsive>
      <p>
        We have a wide experience and we will help you find the solution you
        need in any business area.
      </p>
      <h3>We help you with:</h3>
      <v-row v-show="galleryIsShow" class="pt-12">
        <v-col v-for="card in cards" :key="card.title" cols="12" md="4">
          <div class="d-flex pa-3 industy__block" @click="viewDeteils(card)">
            <SimpleSVG
              fill-class-name="fill-to-change"
              :src="card.svg"
              :width="properties"
              :height="properties"
              :custom-id="card.id"
              :fill="$vuetify.theme.dark ? '#B2B2B2' : '#343434'"
              :stroke="$vuetify.theme.dark ? '#B2B2B2' : '#343434'"
            />
            <div class="ml-2">
              <div class="pr-2">
                <div class="text--disabled" v-text="card.subtitle"></div>
                <h4
                  class="text-uppercase mt-1 mb-4"
                  style="letter-spacing: 0.15em"
                  v-text="card.title"
                ></h4>
              </div>
            </div>
          </div>
        </v-col>
      </v-row>
      <v-row v-if="currentCard && !galleryIsShow">
        <div class="d-flex flex-column flex-sm-row width-100 pa-3">
          <SimpleSVG
            fill-class-name="fill-to-change"
            :src="currentCard.svg"
            :width="properties"
            :height="properties"
            :custom-id="currentCard.id"
            :fill="$vuetify.theme.dark ? '#B2B2B2' : '#343434'"
            :stroke="$vuetify.theme.dark ? '#B2B2B2' : '#343434'"
          />
          <div class="ml-2">
            <div class="pr-2">
              <h4
                class="text-uppercase mt-1 mb-4"
                style="letter-spacing: 0.15em"
                v-text="currentCard.title"
              ></h4>
              <div
                v-for="tool in currentCard.tools"
                :key="tool"
                class="text--disabled"
              >
                - {{ tool }}
              </div>
            </div>
          </div>
          <button class="back_button" @click="closeDeteils()">back</button>
        </div>
      </v-row>
    </v-container>
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
      galleryIsShow: true,
      currentCard: null,
      properties: '100px',
      cards: [
        {
          id: '111',
          title: 'Industry',
          subtitle: 'Production automation',
          tools: [
            'Production automation tools',
            'Prototyping and design',
            'Integration of devices and services',
            'Administration and control systems',
          ],
          // text:
          //   'All components and features are developed using the most up-to-date coding practices.',
          // callout: '01',
          svg: 'http://localhost:7000/public/icons/industry-15.svg',
        },
        {
          id: '999',
          title: 'Marketing',
          subtitle: 'Product promotion tools',
          tools: [],
          // text:
          //   'Themes are designed for maximum performance and are semantically structured to maximize SEO.',
          // callout: '02',
          svg: 'http://localhost:7000/public/icons/1515442620.svg',
        },
        {
          id: '222',
          title: 'Media',
          subtitle: 'Digital technologies',
          tools: [],
          // text:
          //   "Being developed with Vuetify means you have access to all of the framework's available features.",
          // callout: '03',
          svg: 'http://localhost:7000/public/icons/play-button-svgrepo-com.svg',
        },
        {
          id: '333',
          title: 'Marketplace',
          subtitle: 'Retail and wholesale',
          // text:
          //   'All components and features are developed using the most up-to-date coding practices.',
          // callout: '04',
          svg: 'http://localhost:7000/public/icons/grocery-15.svg',
        },
        {
          id: '444',
          title: 'Science',
          subtitle: 'Data science and clouds',
          tools: [],
          // text:
          //   'Themes are designed for maximum performance and are semantically structured to maximize SEO.',
          // callout: '05',
          svg: 'http://localhost:7000/public/icons/cloud-svgrepo-com.svg',
        },
        {
          id: '555',
          title: 'Finance',
          subtitle: 'Market and bank instruments',
          tools: [],
          // text:
          //   "Being developed with Vuetify means you have access to all of the framework's available features.",
          // callout: '06',
          svg: 'http://localhost:7000/public/icons/dollar-svgrepo-com.svg',
        },
      ],
    }
  },
  methods: {
    viewDeteils(card) {
      this.currentCard = card
      this.galleryIsShow = false
      this.properties = '200px'
    },
    closeDeteils() {
      this.currentCard = null
      this.galleryIsShow = true
      this.properties = '100px'
    },
  },
}
</script>
<style lang="scss" scoped>
.industy__block {
  transition-property: all;
  transition-duration: 250ms;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  &:hover {
    transform: scale(1.1);
    box-shadow: 1px 1px 5px black;
  }
}
.back_button {
  margin-left: auto;
  margin-top: 20px;
  align-self: center;
  width: 50px;
  height: 50px;
  border-radius: 25px;
  border: 2px solid;
  &:hover {
    transform: scale(1.1);
    box-shadow: 1px 1px 5px black;
  }
}
.dark {
  border: 2px solid #b2b2b2;
}
.light {
  border: 2px solid #343434;
}
.width-100 {
  width: 100%;
}
</style>
