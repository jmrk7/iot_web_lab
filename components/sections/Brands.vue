<template>
  <section
    id="sponsors"
    :class="$vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-4'"
  >
    <v-container>
      <v-row class="py-3">
        <v-col cols="12" sm="4" align-self="center">
          <h3
            :class="{ 'grey--text': $vuetify.theme.dark }"
            class="text-h4 text-center font-weight-light mb-xs-4"
          >
            {{ $t('sections.brands.title') }}
          </h3>
        </v-col>
        <v-col cols="12" sm="8">
          <v-slide-group multiple :show-arrows="true" draggable="true">
            <template v-for="(item, index) in partners">
              <v-slide-item
                v-if="checkIsShow(item.id)"
                :key="item.id + item.url"
                v-model="partners"
              >
                <v-card
                  class="mx-2 d-flex"
                  :class="
                    $vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-4'
                  "
                  height="70"
                  flat
                >
                  <a
                    :href="item.url"
                    target="_blank"
                    class="body-1 font-weight-black text-center grey--text mt-2"
                  >
                    <v-img
                      height="60"
                      width="120"
                      contain
                      :src="item.logo_url"
                      @error="disableImage(item)"
                    ></v-img>
                  </a>
                </v-card>
              </v-slide-item>
              <v-responsive
                v-if="index < partners.length - 1"
                :key="'partner_' + index"
                class="my-auto"
              >
                <v-divider vertical></v-divider>
              </v-responsive>
            </template>
          </v-slide-group>
        </v-col>
      </v-row>
    </v-container>
  </section>
</template>

<script>
export default {
  data() {
    return {
      isShow: [],
    }
  },
  computed: {
    partners() {
      return this.$store.getters['partners/partners']
    },
  },
  mounted() {
    this.isShow = this.$store.getters['partners/partners'].map(
      (item) => item.id
    )
  },
  methods: {
    disableImage(item) {
      const index = this.isShow.findIndex((elem) => elem === item.id)
      this.isShow.splice(index, 1)
    },
    checkIsShow(id) {
      return this.isShow.find((item) => item === id)
    },
  },
}
</script>
