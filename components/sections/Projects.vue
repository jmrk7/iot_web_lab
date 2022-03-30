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
                  :alt="item.name + ' logo'"
                />
              </div>
              <div class="col-12 col-sm-8">
                <div style="max-width: 700px" class="mx-auto body-2">
                  <h3
                    :class="{
                      ' grey--text text--darken-2': $vuetify.theme.dark,
                    }"
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
                        :class="{
                          ' grey--text text--darken-2': !$vuetify.theme.dark,
                        }"
                      >
                        <span
                          v-for="(solution, index) in item.solution"
                          :key="solution + '_' + index"
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
                        :class="{
                          ' grey--text text--darken-2': !$vuetify.theme.dark,
                        }"
                      >
                        <template v-if="item.challenge">
                          <span
                            v-for="(challenge, index) in item.challenge"
                            :key="challenge + '_' + index"
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
                        :class="{
                          ' grey--text text--darken-2': !$vuetify.theme.dark,
                        }"
                        class="mb-1 font-weight-black text-center text-uppercase mb-3"
                      >
                        Technologies:
                      </h4>
                      <div
                        :class="{
                          ' grey--text text--darken-2': !$vuetify.theme.dark,
                        }"
                      >
                        <span
                          v-for="(technologies, index) in item.technologies"
                          :key="technologies + '_' + index"
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
                        :class="{
                          ' grey--text text--darken-2': !$vuetify.theme.dark,
                        }"
                        class="mb-1 font-weight-black text-uppercase mb-3"
                      >
                        Intagrations with:
                      </h4>
                      <div>
                        <span
                          v-for="(integrations, index) in item.integrations"
                          :key="integrations + '_' + index"
                        >
                          {{ integrations }},
                        </span>
                      </div>
                    </v-col>
                  </v-row>
                  <v-row>
                    <v-col cols="12">
                      <div class="d-flex">
                        <a
                          :href="item.urls[0]"
                          target="_blank"
                          class="v-btn v-btn--outlined v-size--default primary--text example__link"
                          :class="{
                            ' grey--text text--darken-2': !$vuetify.theme.dark,
                          }"
                        >
                          Site
                        </a>
                        <v-btn
                          v-if="item.urls.length > 1"
                          class="v-btn v-btn--outlined v-size--default secondary--text example__link fs-11"
                          :class="{
                            ' grey--text text--darken-2': !$vuetify.theme.dark,
                          }"
                          @click="showLinks = !showLinks"
                          >Other links</v-btn
                        >
                      </div>
                    </v-col>
                  </v-row>
                </div>
              </div>
              <div v-if="showLinks" class="px-4">
                <div v-for="(url, index) in item.urls" :key="url + '_' + index">
                  <a :href="url" target="_blank">{{ url }}</a>
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
  data() {
    return {
      showLinks: false,
    }
  },
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
  background-color: inherit !important;
  &:not(:last-child) {
    margin-right: 20px;
  }
  display: flex;
}
.fs-11 {
  font-size: 11px;
}
</style>
