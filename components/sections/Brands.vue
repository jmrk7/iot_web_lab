<template>
  <section
    id="sponsors"
    :class="$vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-4'"
  >
    <v-container>
      <v-row>
        <v-col cols="12" sm="4" align-self="center">
          <h3
            :class="$vuetify.theme.dark ? 'grey--text' : null"
            class="text-h4 text-center font-weight-light mb-xs-4"
          >
            OUR PARTNERS
          </h3>
        </v-col>
        <v-col cols="12" sm="8">
          <v-slide-group show-arrows draggable="true">
            <template v-for="(item, index) in partners">
              <v-slide-item :key="item.id + item.url" v-model="partners">
                <v-card
                  :class="
                    $vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-4'
                  "
                  class="mx-4 pa-0"
                  height="90"
                  width="140"
                  flat
                >
                  <a :href="item.url" target="blanc">
                    <v-img height="90" contain :src="item.logo_url"></v-img>
                  </a>
                </v-card>
              </v-slide-item>
              <v-responsive
                v-if="index < partners.length - 1"
                :key="index"
                height="50"
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
  props: {
    partners: Array || [],
  },
}
</script>
