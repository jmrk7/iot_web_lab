<template>
  <section
    id="testimonials"
    :class="$vuetify.theme.dark ? 'grey darken-3' : 'grey lighten-2'"
    class="py-16"
  >
    <h2 class="text-h4 text-md-h3 text-center font-weight-black mb-2 my-2">
      Solutions
    </h2>
    <v-carousel
      draggable="false"
      hide-delimiter-background
      hide-delimiters
      show-arrows-on-hover
    >
      <v-carousel-item v-for="item in projects" :key="item.id" class="">
        <v-container fill-height>
          <div style="max-width: 700px" class="mx-auto text-center body-2">
            <h3
              :class="
                $vuetify.theme.dark
                  ? 'grey darken-3'
                  : 'grey lighten-2 grey--text text--darken-2'
              "
              class="mb-1 font-weight-black text-uppercase"
            >
              {{ item.name }}
            </h3>
            <div class="mb-10 font-weight-light grey--text text-uppercase">
              {{ item.description }}
            </div>
            <v-row>
              <v-col v-if="item.solution" cols="12">
                <div
                  :class="
                    $vuetify.theme.dark
                      ? 'grey darken-3'
                      : 'grey lighten-2 grey--text text--darken-2'
                  "
                >
                  <span
                    v-for="solution in item.solution"
                    :key="solution"
                    class="mb-8 font-italic text--secondary font-weight-regular body-2"
                  >
                    {{ solution }},
                  </span>
                </div>
              </v-col>
            </v-row>
            <v-row>
              <v-col v-if="item.challenge" cols="5">
                <div
                  :class="
                    $vuetify.theme.dark
                      ? 'grey darken-3'
                      : 'grey lighten-2 grey--text text--darken-2'
                  "
                >
                  <template v-if="item.challenge">
                    <div
                      v-for="challenge in item.challenge"
                      :key="challenge"
                      class="text-left body-2 text--secondary"
                    >
                      {{ challenge }}
                    </div>
                  </template>
                </div>
              </v-col>
              <v-col v-if="item.technologies" cols="4">
                <h4
                  :class="
                    $vuetify.theme.dark
                      ? 'grey darken-3'
                      : 'grey lighten-2 grey--text text--darken-2'
                  "
                  class="mb-1 font-weight-black text-uppercase mb-3"
                >
                  Technologies:
                </h4>
                <div
                  :class="
                    $vuetify.theme.dark
                      ? 'grey darken-3'
                      : 'grey lighten-2 grey--text text--darken-2'
                  "
                >
                  <ul v-if="item.technologies">
                    <li
                      v-for="technologies in item.technologies"
                      :key="technologies"
                      class="text--primary text-left body-2"
                    >
                      {{ technologies }}
                    </li>
                  </ul>
                </div>
              </v-col>
              <v-col v-if="item.integrations" cols="3">
                <h4
                  :class="
                    $vuetify.theme.dark
                      ? 'grey darken-3'
                      : 'grey lighten-2 grey--text text--darken-2'
                  "
                  class="mb-1 font-weight-black text-uppercase mb-3"
                >
                  Intagrations with:
                </h4>
                <div
                  :class="
                    $vuetify.theme.dark
                      ? 'grey darken-3'
                      : 'grey lighten-2 grey--text text--darken-2'
                  "
                >
                  <span
                    v-for="integrations in item.integrations"
                    :key="integrations"
                  >
                    {{ integrations }},
                  </span>
                </div>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12">
                <div
                  v-if="item.urls"
                  :class="
                    $vuetify.theme.dark
                      ? 'grey darken-3'
                      : 'grey lighten-2 grey--text text--darken-2'
                  "
                >
                  <template v-if="item.urls">
                    <div v-for="url in item.urls" :key="url">
                      <a :href="url">
                        {{ url }}
                      </a>
                    </div>
                  </template>
                </div>
              </v-col>
            </v-row>
          </div>
        </v-container>
      </v-carousel-item>
    </v-carousel>
  </section>
</template>

<script>
export default {
  props: {
    projects: Array || [],
  },
}
</script>
