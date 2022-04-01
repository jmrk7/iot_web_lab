<template>
  <section
    id="projects_page"
    :class="$vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-4'"
  >
    <SectionsHeroAlt :hero-alt="$t('projects.heroAlt')" />
    <ul>
      <template v-for="(item, index) in projects">
        <li
          :key="item.id"
          class="py-8"
          :class="
            $vuetify.theme.dark
              ? index % 2 == 0
                ? 'black'
                : ''
              : index % 2 == 0
              ? 'white'
              : ''
          "
        >
          <v-container class="d-flex flex-column" fill-height>
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
            <div class="col-12 d-flex justify-center">
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
                    v-for="(solution, index) in item.solution"
                    :key="solution + '_' + index"
                    class="mb-8 font-italic text--secondary font-weight-regular body-2"
                  >
                    {{ solution }},
                  </span>
                </div>
              </div>

              <div v-if="item.challenge" class="mt-6 mr-6">
                <div
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
                      v-for="(challenge, index) in item.challenge"
                      :key="challenge + '_' + index"
                      class="text-left body-2 text--secondary"
                    >
                      {{ challenge }},
                    </span>
                  </template>
                </div>
              </div>

              <div v-if="item.integrations">
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
              </div>
            </div>
            <div v-if="item.technologies" class="mt-8">
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
                  v-for="(technologies, index) in item.technologies"
                  :key="technologies + '_' + index"
                  class="font-weight-bold text-uppercase text-left body-2"
                  :class="
                    $vuetify.theme.dark ? 'text--secondary' : ' black--text'
                  "
                >
                  {{ technologies }}, </span
                >,
              </div>
            </div>
            <div class="mt-8">
              <div class="d-flex">
                <a
                  :href="item.urls[0]"
                  target="_blank"
                  class="v-btn v-btn--outlined v-size--default primary--text example__link"
                  :class="{
                    ' black--text text--darken-2': !$vuetify.theme.dark,
                  }"
                >
                  Site
                </a>
                <v-btn
                  v-if="item.urls.length > 1"
                  class="v-btn v-btn--outlined v-size--default secondary--text example__link fs-11"
                  :class="{
                    ' black--text text--darken-2': !$vuetify.theme.dark,
                  }"
                  @click="showLinks = !showLinks"
                  >Other links</v-btn
                >
              </div>
            </div>
            <div v-if="showLinks" class="px-4">
              <div v-for="(url, index) in item.urls" :key="url + '_' + index">
                <a :href="url" target="_blank">{{ url }}</a>
              </div>
            </div>
          </v-container>
        </li>
      </template>
    </ul>
  </section>
</template>

<script>
export default {
  async fetch({ store }) {
    await store.dispatch('projects/fetchProjects')
    await store.dispatch('meta/fetchMetaTags', this.name)
  },

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
  head() {
    return this.makeCurrentMeta(this.$store.getters['meta/meta'])
  },
}
</script>
<style lang="scss" scoped>
ul,
li {
  padding: 0;
  margin: 0;
  text-decoration: none;
}
.image_item {
  max-width: 100%;
  max-height: 500px;
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
