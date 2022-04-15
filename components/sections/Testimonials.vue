<template>
  <section
    id="testimonials"
    :class="$vuetify.theme.dark ? 'black' : 'grey lighten-4'"
    class="py-16"
  >
    <h2 class="text-h4 text-md-h3 text-center font-weight-black mb-8 my-8">
      {{ $t('sections.testimonials.title') }}
    </h2>
    <v-carousel
      cycle
      draggable="true"
      hide-delimiter-background
      hide-delimiters
    >
      <v-carousel-item v-for="(item, i) in testimonials" :key="i" class="">
        <v-container fill-height>
          <div style="max-width: 700px" class="mx-auto text-center">
            <v-avatar size="128" class="mb-7">
              <img
                :src="`/team/${item.avatar}`"
                :alt="item.name"
                width="128"
                height="128"
              />
            </v-avatar>
            <h3
              :class="
                $vuetify.theme.dark
                  ? 'black'
                  : 'grey lighten-4 grey--text text--darken-2'
              "
              class="mb-1 font-weight-black text-uppercase"
            >
              {{ item.name }}
            </h3>
            <div class="mb-10 font-weight-light grey--text text-uppercase">
              {{ item.post }}
            </div>
            <v-row>
              <v-col cols="1"
                ><v-icon x-large class="grey--text text--lighten-4"
                  >mdi-format-quote-open</v-icon
                ></v-col
              >
              <v-col cols="10">
                <div
                  :class="
                    $vuetify.theme.dark
                      ? 'black'
                      : 'grey lighten-4 grey--text text--darken-4'
                  "
                  class="mb-5 font-italic"
                >
                  {{ item.review }}
                </div>
              </v-col>
              <v-col cols="1"
                ><v-icon x-large class="grey--text text--lighten-1"
                  >mdi-format-quote-close</v-icon
                ></v-col
              >
            </v-row>
          </div>
        </v-container>
      </v-carousel-item>
    </v-carousel>
  </section>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  computed: {
    ...mapGetters({
      testimonials: 'reviews/reviews',
    }),
  },
}
</script>
