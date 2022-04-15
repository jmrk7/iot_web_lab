<template>
  <section
    id="technologies"
    :class="$vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-2'"
    class="py-16"
  >
    <h2 class="text-h4 text-md-h3 text-center font-weight-black mb-2 my-2">
      {{ $t('sections.technologies.title') }}
    </h2>
    <v-container>
      <v-row>
        <v-col
          v-for="tech in techs"
          :key="tech.title"
          cols="6"
          sm="3"
          md="2"
          lg="2"
        >
          <a :href="tech.link" target="_blank">
            <div class="d-flex flex-column">
              <div class="custom__item">
                <SimpleSVG :src="tech.svg" :width="size" :height="size" />
              </div>
              <h4
                class="text-uppercase text-center mt-1 mb-4"
                style="letter-spacing: 0.15em"
                v-text="tech.title"
              ></h4>
            </div>
          </a>
        </v-col>
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
      size: '80px',
    }
  },
  computed: {
    ...mapGetters({
      techs: 'techs/techs',
    }),
  },
}
</script>
<style scoped>
.custom__item {
  width: fit-content;
  justify-self: center;
  align-self: center;
}
</style>
