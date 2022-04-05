<template>
  <section>
    <v-row no-gutters>
      <v-col cols="12">
        <SectionsHeroAlt :hero-alt="$t('about.heroAlt')" />
        <v-container>
          <v-row class="py-16">
            <v-col cols="12">
              <h2
                class="text-h4 text-md-h3 text-center font-weight-black text-capitalize"
              >
                {{ $t('about.title') }}
              </h2>
              <h3
                class="text-h4 text-uppercase font-weight-thin text-center my-8"
              >
                {{ $t('about.subtitle') }}
              </h3>
            </v-col>
            <v-col cols="12" md="6">
              <p>
                {{ $t('about.top-description') }}
              </p>
              <blockquote class="text-h4 pa-5 my-4 font-weight-thin">
                {{ $t('about.blockquote') }}
              </blockquote>
              <p>
                {{ $t('about.bottom-description') }}
              </p>
            </v-col>
            <v-col cols="12" md="6">
              <p>
                {{ $t('about.about') }}
              </p>
            </v-col>
          </v-row>
        </v-container>
        <SectionsTeam />

        <v-row no-gutters>
          <v-col cols="12" md="6" align-self="center">
            <v-img
              max-height="800"
              src="pexels-canva-studio-3277806.jpg"
              lazy-src="pexels-canva-studio-3277806.jpg"
            >
            </v-img>
          </v-col>
          <v-col cols="12" md="6" align-self="center">
            <div class="pa-lg-16 pa-md-10 px-4 py-16">
              <h2 class="text-h3 text-center font-weight-black">
                {{ $t('about.vision.title') }}
              </h2>
              <h3
                class="text-h5 text-uppercase font-weight-thin text-center my-8"
              >
                {{ $t('about.vision.subtitle') }}
              </h3>
              <p>
                {{ $t('about.vision.text') }}
              </p>
            </div>
          </v-col>
        </v-row>
        <v-row no-gutters class="flex-row-reverse">
          <v-col cols="12" md="6" align-self="center">
            <v-img
              max-height="800"
              src="pexels-rfstudio-3810792.jpg"
              lazy-src="pexels-rfstudio-3810792.jpg"
            >
            </v-img>
          </v-col>
          <v-col cols="12" md="6" align-self="center">
            <div class="pa-lg-16 pa-md-10 px-4 py-16">
              <h2 class="text-h3 text-center font-weight-black">
                {{ $t('about.mission.title') }}
              </h2>
              <h3
                class="text-h5 text-uppercase font-weight-thin text-center my-8"
              >
                {{ $t('about.mission.subtitle') }}
              </h3>
              <p>
                {{ $t('about.mission.text') }}
              </p>
            </div>
          </v-col>
        </v-row>

        <SectionsTimeline />
      </v-col>
    </v-row>
  </section>
</template>

<script>
export default {
  head() {
    // return this.makeCurrentMeta($t('about.meta_tags'))
  },
}
</script>
