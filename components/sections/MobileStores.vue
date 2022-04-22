<template>
  <section
    id="mobile_stores"
    :class="$vuetify.theme.dark ? 'primary darken-1' : 'grey lighten-2 '"
  >
    <v-row no-gutters>
      <v-col cols="12">
        <v-container class="py-8">
          <h3
            class="text-uppercase text-h4 text-md-h4 text-center font-weight-black ma-16"
          >
            {{ $t('sections.mobileStores.title') }}
          </h3>
          <p
            class="grey--text text--lighten-2"
            :class="$vuetify.theme.dark ? 'text--lighten-2' : 'text--darken-2'"
          >
            {{ $t('sections.mobileStores.description') }}
          </p>
          <ul class="my-5 d-flex flex-column flex-sm-row">
            <li
              v-for="tech in $t('sections.mobileStores.technologies')"
              :key="tech.name"
              class="font-weight-black mx-auto py-2"
            >
              <a :href="tech.link" target="_blank" :aria-label="tech.name">
                <div class="d-flex flex-column">
                  <div class="custom__item">
                    <SimpleSVG
                      :src="tech.icon"
                      :width="sizeWidth"
                      :height="sizeHeight"
                      fill-class-name="fill-to-change"
                      :custom-id="tech.name"
                      :fill="$vuetify.theme.dark ? '#FBFBFB' : '#454545'"
                      :stroke="$vuetify.theme.dark ? '#FBFBFB' : '#454545'"
                    />
                  </div>
                </div>
              </a>
            </li>
          </ul> </v-container
      ></v-col>
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
      sizeWidth: '200px',
      sizeHeight: '100px',
    }
  },
}
</script>
<style scoped>
ul,
li {
  padding: 0;
  margin: 0;
  text-decoration: none;
  list-style: none;
}
.custom__item {
  width: fit-content;
  justify-self: center;
  align-self: center;
}
</style>
