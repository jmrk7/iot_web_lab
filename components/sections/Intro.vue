<template>
  <section id="intro" class="py-16">
    <v-container class="static_height">
      <v-responsive class="max-auto mx-auto text-center" max-width="600">
        <v-avatar color="primary" size="70" class="mb-8">
          <v-icon x-large dark>mdi-web</v-icon>
        </v-avatar>
        <h2 class="text-h4 text-md-h3 text-center font-weight-black mb-7">
          {{ $t('sections.intro.title') }} <br />
        </h2>
        <p class="title font-weight-light">
          {{ $t('sections.intro.subtitle') }}
          <!-- <strong>Vue.js</strong>
          and
          <strong>Nuxt.js</strong>, it comes with the features you need to
          quickly start developing your application. -->
        </p>
      </v-responsive>
      <p>
        {{ $t('sections.intro.descripotion') }}
      </p>
      <v-row v-show="galleryIsShow" class="pt-12">
        <v-col v-for="card in cards" :key="card.title" cols="12" sm="6" md="6">
          <div class="d-flex pa-3 industy__block" @click="viewDeteils(card)">
            <SimpleSVG
              fill-class-name="fill-to-change"
              :src="card.svg"
              :width="size"
              :height="size"
              :custom-id="card.title"
              :fill="$vuetify.theme.dark ? '#B2B2B2' : '#343434'"
              :stroke="$vuetify.theme.dark ? '#B2B2B2' : '#343434'"
            />
            <div
              class="ml-2 pr-2 d-flex flex-column justify-center content__scope"
            >
              <div class="text--disabled caption" v-text="card.subtitle"></div>
              <h4
                class="text-uppercase mt-1"
                style="letter-spacing: 0.15em"
                v-text="card.title"
              ></h4>
            </div>
          </div>
        </v-col>
      </v-row>
      <v-row v-if="currentCard && !galleryIsShow">
        <div class="d-flex flex-column flex-sm-row width-100 pa-3">
          <SimpleSVG
            fill-class-name="fill-to-change"
            :src="currentCard.svg"
            :width="size"
            :height="size"
            :custom-id="currentCard.title"
            :fill="$vuetify.theme.dark ? '#B2B2B2' : '#343434'"
            :stroke="$vuetify.theme.dark ? '#B2B2B2' : '#343434'"
          />
          <div class="ml-2 mt-4 mt-sm-0">
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
import { mapGetters } from 'vuex'
export default {
  components: {
    SimpleSVG,
  },
  data() {
    return {
      galleryIsShow: true,
      currentCard: null,
      size: '70px',
    }
  },
  computed: {
    ...mapGetters({
      cards: 'solution/scopes',
    }),
  },
  methods: {
    viewDeteils(card) {
      this.currentCard = card
      this.galleryIsShow = false
      this.size = '200px'
    },
    closeDeteils() {
      this.currentCard = null
      this.galleryIsShow = true
      this.size = '100px'
    },
  },
}
</script>
<style lang="scss" scoped>
.content__scope {
  width: 300px;
}
.static_height {
  height: 800px;
}
@media (max-width: 768px) {
  .static_height {
    height: 1200px;
  }
}
.industy__block {
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  transition-property: all;
  transition-duration: 250ms;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  &:hover {
    transform: scale(1.1);
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
