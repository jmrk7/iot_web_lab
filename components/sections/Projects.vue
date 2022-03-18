<template>
  <section id="projects" class="py-16">
    <h2 class="text-h4 text-md-h3 text-center font-weight-black mb-16">
      Projects
    </h2>
    <v-carousel
      draggable="false"
      hide-delimiter-background
      hide-delimiters
      show-arrows-on-hover
      height="auto"
      ><template v-for="item in projects">
        <v-carousel-item
          v-if="item.technologies && item.challenge && item.description"
          :key="item.id"
          class=""
        >
          <v-container fill-height>
            <div class="row">
              <div class="col-12 col-sm-4 d-flex align-item-center">
                <img
                  class="image_item"
                  :src="item.url_img ? item.url_img : 'default.png'"
                />
              </div>
              <div class="col-12 col-sm-8">
                <div style="max-width: 700px" class="mx-auto body-2">
                  <h3
                    :class="
                      $vuetify.theme.dark ? '' : ' grey--text text--darken-2'
                    "
                    class="mb-1 font-weight-black text-center text-uppercase"
                  >
                    {{ item.name }}
                  </h3>
                  <div
                    class="mb-8 font-weight-light text-center grey--text text-uppercase"
                  >
                    {{ item.description }}
                  </div>
                  <v-row>
                    <v-col v-if="item.solution" cols="12">
                      <div
                        :class="
                          $vuetify.theme.dark
                            ? ''
                            : ' grey--text text--darken-2'
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
                    <v-col v-if="item.challenge">
                      <div
                        :class="
                          $vuetify.theme.dark
                            ? ''
                            : ' grey--text text--darken-2'
                        "
                      >
                        <template v-if="item.challenge">
                          <span
                            v-for="challenge in item.challenge"
                            :key="challenge"
                            class="text-left body-2 text--secondary"
                          >
                            {{ challenge }},
                          </span>
                        </template>
                      </div>
                    </v-col>
                  </v-row>
                  <v-row>
                    <v-col v-if="item.technologies">
                      <h4
                        :class="
                          $vuetify.theme.dark
                            ? ''
                            : ' grey--text text--darken-2'
                        "
                        class="mb-1 font-weight-black text-center text-uppercase mb-3"
                      >
                        Technologies:
                      </h4>
                      <div
                        :class="
                          $vuetify.theme.dark
                            ? ''
                            : ' grey--text text--darken-4'
                        "
                      >
                        <span
                          v-for="technologies in item.technologies"
                          :key="technologies"
                          class="font-weight-bold text-uppercase text-left body-2"
                          :class="
                            $vuetify.theme.dark
                              ? 'text--secondary'
                              : ' black--text'
                          "
                        >
                          {{ technologies }}, </span
                        >,
                      </div>
                    </v-col>
                    <v-col v-if="item.integrations">
                      <h4
                        :class="
                          $vuetify.theme.dark
                            ? ''
                            : ' grey--text text--darken-2'
                        "
                        class="mb-1 font-weight-black text-uppercase mb-3"
                      >
                        Intagrations with:
                      </h4>
                      <div>
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
                      <div v-if="item.urls" class="d-flex">
                        <div
                          v-for="url in item.urls"
                          :key="url"
                          class="v-btn v-btn--outlined theme--light v-size--default primary--text example__link"
                        >
                          <a
                            :href="url"
                            :class="
                              $vuetify.theme.dark
                                ? ''
                                : ' black--text text--darken-2'
                            "
                          >
                            More
                          </a>
                        </div>
                      </div>
                    </v-col>
                  </v-row>
                </div>
              </div>
            </div>
          </v-container>
        </v-carousel-item>
      </template>
    </v-carousel>
  </section>
</template>

<script>
export default {
  computed: {
    projects() {
      return this.$store.getters['projects/projects']
    },
  },
}
</script>
<style lang="scss" scoped>
.image_item {
  width: 100%;
  align-self: center;
}
.example__link {
  width: 100px !important;
  &:not(:last-child) {
    margin-right: 20px;
  }
  display: flex;
  a {
    margin: auto;
    text-decoration: none;
    font-weight: 700;
    color: white;
  }
}
</style>
