<template>
  <section id="projects" class="py-16">
    <h2 class="text-h4 text-md-h3 text-center font-weight-black mb-8">
      {{ $t('sections.projects.title') }}
    </h2>
    <v-carousel
      draggable="false"
      hide-delimiter-background
      hide-delimiters
      show-arrows
      height="auto"
      @change="showLinks = false"
      ><template v-for="item in projects">
        <v-carousel-item
          v-if="item.technologies && item.challenge && item.description"
          :key="item.id"
        >
          <v-container>
            <div class="row g-0">
              <div class="col-12 col-sm-4 image-wrapper">
                <img
                  class="image_item"
                  :src="item.url_img ? item.url_img : 'default.png'"
                  :alt="item.name + ' logo'"
                />
              </div>
              <div class="col-12 col-sm-8 align-self-start content-block">
                <div style="max-width: 700px" class="mx-auto body-2">
                  <h3
                    :class="
                      $vuetify.theme.dark
                        ? 'grey--text text--lighten-4'
                        : 'grey--text text--darken-4'
                    "
                    class="mb-1 font-weight-black text-center text-uppercase"
                  >
                    {{ item.name }}
                  </h3>
                  <div
                    :class="
                      $vuetify.theme.dark
                        ? 'grey--text text--lighten-4'
                        : 'grey--text text--darken-4'
                    "
                    class="mb-8 font-weight-light text-center grey--text text-uppercase darken-4"
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
                          v-for="(solution, solutionIndex) in item.solution"
                          :key="solution + '_' + solutionIndex"
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
                            v-for="(
                              challenge, challengeIndex
                            ) in item.challenge"
                            :key="challenge + '_' + challengeIndex"
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
                          v-for="(
                            technologies, technologiesIndex
                          ) in item.technologies"
                          :key="technologies + '_' + technologiesIndex"
                          class="font-weight-bold text-uppercase text-left body-2"
                          :class="
                            $vuetify.theme.dark
                              ? 'text--secondary'
                              : ' black--text'
                          "
                        >
                          {{ technologies
                          }}{{
                            !(
                              technologiesIndex + 1 ===
                              item.technologies.length
                            )
                              ? ','
                              : ''
                          }}
                        </span>
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
                          v-for="(
                            integrations, integrationsIndex
                          ) in item.integrations"
                          :key="integrations + '_' + integrationsIndex"
                        >
                          {{ integrations
                          }}{{
                            !(integrationsIndex + 1 === integrations.length)
                              ? ','
                              : ''
                          }}
                        </span>
                      </div>
                    </v-col>
                  </v-row>
                  <v-row v-if="item.urls.length">
                    <v-col cols="12" class="d-flex flex-column">
                      <div class="d-flex align-self-center">
                        <a
                          :href="getLink(item.urls)"
                          target="_blank"
                          class="v-btn v-btn--outlined v-size--default primary--text example__link"
                        >
                          Open
                          {{ getName(item.urls) }}
                        </a>
                        <v-btn
                          v-if="item.urls.length > 1"
                          class="v-btn v-btn--outlined v-size--default secondary--text example__link"
                          @click="showLinks = !showLinks"
                          >All Links</v-btn
                        >
                      </div>
                      <div class="text-center">
                        <div v-if="showLinks" class="px-4 mt-4">
                          <template v-for="(url, urlsIndex) in item.urls">
                            <span
                              :key="url.name + '_' + urlsIndex"
                              class="px-2"
                            >
                              <a
                                :href="url.link"
                                target="_blank"
                                class="additional_link grey--text"
                                >{{ url.name }}</a
                              >
                            </span>
                          </template>
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
import { mapGetters } from 'vuex'
export default {
  data() {
    return {
      showLinks: false,
    }
  },
  computed: {
    ...mapGetters({
      projects: 'projects/projects',
    }),
  },
  methods: {
    getName(urls) {
      const name = urls.find(
        (link) => link.name.includes('Site') || link.name.includes('Git')
      ).name
      if (name && name.includes('Site')) {
        return 'Site'
      } else if (name && name.includes('Git')) {
        return 'Git'
      } else {
        return 'Site'
      }
    },
    getLink(urls) {
      const url = urls.find(
        (url) => url.name.includes('Site') || url.name.includes('Git')
      )
      if (url && url.link) {
        return url.link
      } else {
        return urls[0].link
      }
    },
  },
}
</script>
<style lang="scss" scoped>
.additional_link {
  display: inline-block;
  text-decoration: none;
  text-transform: uppercase;
  letter-spacing: 0.115em;
  white-space: nowrap;
  font-weight: 500;
  &:hover,
  &:focus {
    color: #1976d2 !important;
  }
}
.content-block {
  height: 500px;
}
#projects .container {
  height: 500px;
}
@media (max-width: 768px) {
  #projects .container {
    height: 900px;
  }
  .content-block {
    height: 600px;
  }
  .image-wrapper {
    height: 277px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
}
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
</style>
