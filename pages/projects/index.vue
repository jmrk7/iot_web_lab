<template>
  <section
    id="projects_page"
    :class="$vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-4'"
  >
    <SectionsHeroAlt :hero-alt="$t('projects.heroAlt')" />
    <v-carousel
      draggable="false"
      hide-delimiter-background
      hide-delimiters
      show-arrows
      height="auto"
      @change="showLinks = false"
    >
      <template v-for="(item, projectsIndex) in projects">
        <v-carousel-item
          :key="item.id"
          class="py-8"
          :class="
            $vuetify.theme.dark
              ? projectsIndex % 2 == 0
                ? 'black'
                : ''
              : projectsIndex % 2 == 0
              ? 'white'
              : ''
          "
        >
          <v-container class="d-flex flex-column projects_container">
            <div>
              <h2
                :class="{ ' grey--text text--darken-2': !$vuetify.theme.dark }"
                class="font-weight-black text-center text-uppercase"
              >
                {{ item.name }}
              </h2>
            </div>
            <div
              class="mb-8 font-weight-light text-center grey--text text-uppercase"
            >
              {{ item.description }}
            </div>
            <div class="d-flex justify-center">
              <img
                class="image_item"
                :src="item.url_img ? item.url_img : 'projects/default.png'"
                :alt="item.name + ' logo'"
              />
            </div>
            <div class="d-flex flex-column flex-sm-row mx-auto body-2">
              <div v-if="item.solution" class="mt-6 mr-6">
                <h4
                  :class="{
                    ' grey--text text--darken-2': !$vuetify.theme.dark,
                  }"
                  class="mb-1 font-weight-black text-center text-uppercase mb-3"
                >
                  Solution:
                </h4>
                <div
                  :class="{ ' grey--text text--darken-2': $vuetify.theme.dark }"
                >
                  <span
                    v-for="(solution, solutionIndex) in item.solution"
                    :key="solution + '_' + solutionIndex"
                    class="mb-8 font-italic text--secondary font-weight-regular body-2"
                  >
                    {{ solution }},
                  </span>
                </div>
              </div>

              <div
                v-if="item.challenge"
                class="mt-6 mr-6"
                :class="{
                  ' grey--text text--darken-2': !$vuetify.theme.dark,
                }"
              >
                <h4
                  :class="{
                    ' grey--text text--darken-2': !$vuetify.theme.dark,
                  }"
                  class="mb-1 font-weight-black text-center text-uppercase mb-3"
                >
                  Challenge:
                </h4>
                <template v-if="item.challenge">
                  <span
                    v-for="(challenge, challengeIndex) in item.challenge"
                    :key="challenge + '_' + challengeIndex"
                    class="text-left body-2 text--secondary"
                  >
                    {{ challenge }},
                  </span>
                </template>
              </div>
            </div>
            <div v-if="item.integrations" class="mt-6 align-self-center">
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
                  v-for="(integrations, integrationsIndex) in item.integrations"
                  :key="integrations + '_' + integrationsIndex"
                >
                  {{ integrations }},
                </span>
              </div>
            </div>
            <div v-if="item.technologies" class="mt-6">
              <h4
                :class="{ ' grey--text text--darken-2': !$vuetify.theme.dark }"
                class="mb-1 font-weight-black text-center text-uppercase mb-3"
              >
                Technologies:
              </h4>
              <div
                :class="{ ' grey--text text--darken-4': !$vuetify.theme.dark }"
              >
                <span
                  v-for="(technologies, technologiesIndex) in item.technologies"
                  :key="technologies + '_' + technologiesIndex"
                  class="font-weight-bold text-uppercase text-left body-2"
                  :class="
                    $vuetify.theme.dark ? 'text--secondary' : ' black--text'
                  "
                >
                  {{ technologies
                  }}{{
                    !(technologiesIndex + 1 === item.technologies.length)
                      ? ','
                      : ''
                  }}
                </span>
              </div>
            </div>
            <div class="mt-8 align-self-center">
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
            </div>
            <div class="text-center">
              <div v-if="showLinks" class="px-4 mt-4">
                <template v-for="(url, urlsIndex) in item.urls">
                  <span :key="url.name + '_' + urlsIndex" class="px-2">
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
  head() {
    return this.makeCurrentMeta(this.$t('projects.meta_tags'))
  },
}
</script>
<style lang="scss" scoped>
.projects_container {
  height: 1100px;
}
.image_item {
  height: 500px;
}
.example__link {
  width: 100px !important;
  background-color: inherit !important;
  &:not(:last-child) {
    margin-right: 20px;
  }
  display: flex;
}
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
@media (max-width: 768px) {
  .projects_container {
    height: 1000px;
  }
  .image_item {
    max-height: 200px;
  }
}
</style>
