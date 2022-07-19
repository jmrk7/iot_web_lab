<template>
  <section
    id="service_list"
    :class="
      $vuetify.theme.dark
        ? 'grey darken-2 text--lighten-2'
        : 'grey lighten-2 text--darken-2'
    "
  >
    <h2
      class="primary text-uppercase text-h4 text-md-h3 text-center font-weight-black py-16"
    >
      {{ $t('sections.websitesTypeList.title') }}
    </h2>
    <ul>
      <li
        v-for="(item, index) in types"
        :key="item.name"
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
        <v-container>
          <v-row class="my-8">
            <v-col cols="12"
              ><h3
                class="text-uppercase text-h5 text-md-h4 text-center font-weight-black"
              >
                {{ item.name }}
              </h3></v-col
            >
            <!-- <v-col v-if="item.image" cols="12" sm="4" md="4"
              ><v-img :src="item.image"> </v-img>
            </v-col> -->

            <v-col
              cols="12"
              :sm="item.image ? 8 : 12"
              :md="item.image ? 8 : 12"
              class="py-2 d-flex"
              ><p class="align-self-end">{{ item.text }}</p>
            </v-col>

            <!-- <v-col v-if="item.icon" cols="12" sm="4" md="3"
              ><v-img :src="item.icon"> </v-img>
            </v-col> -->
            <v-col v-if="item.additional_text" cols="12" class="py-2"
              ><p>{{ item.additional_text }}</p>
            </v-col>
            <v-col v-if="item.benefits" cols="12" sm="9" md="10" class="py-2">
              <h4
                class="text-uppercase text-h6 text-md-h5 font-weight-black my-4"
              >
                {{ $t('sections.websitesTypeList.benefits-title') }}
              </h4>
              <div v-for="fit in item.benefits" :key="fit">
                <v-icon v-if="!$vuetify.theme.dark" light left>
                  mdi-circle-medium
                </v-icon>
                <v-icon v-if="$vuetify.theme.dark" dark left>
                  mdi-circle-medium </v-icon
                >{{ fit }}
              </div>
            </v-col>
            <v-col
              v-if="item.benefits"
              cols="12"
              sm="3"
              md="2"
              :offset-sm="item.benefits.length ? 0 : 9"
              class="d-flex"
            >
              <div class="wrapper__example__link ml-auto">
                <v-btn
                  class="v-btn v-btn--outlined theme--light v-size--default primary--text example__link"
                  @click="
                    $vuetify.goTo('#footer-top', {
                      duration: 500,
                      easing: 'easeInOutCubic',
                    })
                  "
                >
                  {{ $t('sections.websitesTypeList.btn-text-anchor') }}
                </v-btn>
              </div>
            </v-col>
          </v-row></v-container
        >
      </li>
    </ul>
  </section>
</template>
<script>
import { mapGetters } from 'vuex'
export default {
  computed: {
    ...mapGetters({
      types: 'websites/types',
    }),
  },
}
</script>
<style lang="scss" scoped>
ul,
li {
  padding: 0;
  margin: 0;
  text-decoration: none;
  list-style: none;
}
.wrapper__example__link {
  width: fit-content;
  align-self: center;
}
.example__link {
  width: 120px !important;
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
