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
            Make your application accessible.
          </h3>
          <p
            class="grey--text text--lighten-2"
            :class="$vuetify.theme.dark ? 'text--lighten-2' : 'text--darken-2'"
          >
            One of the important tasks today is the integration of applications
            into mobile platforms. The ability to provide access to your
            services through mobile devices is one of the tasks in which we are
            ready to help you. Our experts will help you both in creating an
            application and integrating it to any of the popular stores. We will
            solve or help you work out all the technical requirements that are
            necessary to host your application.
          </p>
          <ul class="my-5 d-flex flex-column flex-sm-row">
            <li
              v-for="tech in technologies"
              :key="tech.name"
              class="font-weight-black mx-auto py-2"
            >
              <div class="d-flex flex-column">
                <div class="custom__item">
                  <SimpleSVG
                    :src="tech.icon"
                    :width="propertiesWidth"
                    :height="propertiesHeight"
                    fill-class-name="fill-to-change"
                    :custom-id="tech.name"
                    :fill="$vuetify.theme.dark ? '#FBFBFB' : '#454545'"
                    :stroke="$vuetify.theme.dark ? '#FBFBFB' : '#454545'"
                  />
                </div>
              </div>
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
      propertiesWidth: '200px',
      propertiesHeight: '100px',
      technologies: [
        { name: 'Apple Store', icon: '/services/mobile/apple.svg' },
        { name: 'Google Play', icon: '/services/mobile/gplay.svg' },
        { name: 'Galaxy Store', icon: '/services/mobile/galaxy.svg' },
      ],
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
