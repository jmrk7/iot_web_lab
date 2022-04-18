<template>
  <section
    id="footer-top"
    :class="
      $vuetify.theme.dark
        ? 'blue-grey darken-4 grey--text text--lighten-1'
        : 'grey lighten-3 grey--text text--darken-4'
    "
  >
    <v-container>
      <v-row>
        <v-col cols="12" md="12" class="pt-8"
          ><v-row no-gutters>
            <v-col cols="12">
              <Logo />
            </v-col>
            <v-col v-show="isFooterShow" cols="12">
              <v-list two-line class="transparent">
                <div class="row mt-2">
                  <div class="col-12 col-sm-6">
                    <v-list-item>
                      <v-list-item-icon>
                        <v-icon> mdi-map-marker </v-icon>
                      </v-list-item-icon>

                      <v-list-item-content>
                        <v-list-item-title>{{
                          $t('components.footerTop.address.title')
                        }}</v-list-item-title>
                        <v-list-item-subtitle>{{
                          $t('components.footerTop.address.index')
                        }}</v-list-item-subtitle>
                        <v-list-item-subtitle>
                          {{ $t('components.footerTop.address.street') }}
                        </v-list-item-subtitle>
                        <v-list-item-subtitle>{{
                          $t('components.footerTop.address.city')
                        }}</v-list-item-subtitle>
                      </v-list-item-content>
                    </v-list-item>
                  </div>
                  <div class="col-12 col-sm-6">
                    <v-list-item>
                      <v-list-item-icon>
                        <v-icon> mdi-email </v-icon>
                      </v-list-item-icon>

                      <v-list-item-content>
                        <v-list-item-title>{{
                          $t('components.footerTop.email.title')
                        }}</v-list-item-title>
                        <v-list-item-subtitle>{{
                          $t('components.footerTop.email.first')
                        }}</v-list-item-subtitle>
                        <v-list-item-subtitle>{{
                          $t('components.footerTop.email.second')
                        }}</v-list-item-subtitle>
                      </v-list-item-content>
                    </v-list-item>
                  </div>
                </div>

                <!-- <v-list-item>
                  <v-list-item-icon>
                    <v-icon> mdi-phone </v-icon>
                  </v-list-item-icon>

                  <v-list-item-content>
                    <v-list-item-title>PHONE</v-list-item-title>
                    <v-list-item-subtitle>(323) 555-6789</v-list-item-subtitle>
                    <v-list-item-subtitle>(650) 555-1234</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item> -->
                <v-divider></v-divider>
              </v-list>
            </v-col>
          </v-row>
        </v-col>
        <!-- <v-col cols="1" class="text-center hidden-sm-and-down col col-2 py-12">
          <v-divider vertical></v-divider>
        </v-col> -->
        <v-col cols="12" md="12" class="pt-2">
          <div v-show="isFooterShow">
            <h3 class="mb-6 text--primary text-center">
              {{ $t('components.footerTop.title') }}
            </h3>
            <v-col cols="12">
              <p class="text-justify">
                {{ $t('components.footerTop.descripotion') }}
              </p>
            </v-col>
            <footerContactForm />
          </div>
          <div class="d-flex justify-center mt-5">
            <v-btn
              v-for="(socialm, i) in $t('components.footerTop.social')"
              :key="`social-${i}`"
              class="d-flex"
              icon
              large
              color="primary"
              :href="socialm.link"
              target="_blank"
            >
              <v-icon :alt="socialm.platform">{{ socialm.icon }}</v-icon>
            </v-btn>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </section>
</template>

<script>
import footerContactForm from '~/components/sections/footerContactForm.vue'
export default {
  components: {
    footerContactForm,
  },
  data() {
    return {
      isFooterShow: true,
    }
  },
  watch: {
    $route() {
      if (this.$router.history.current.path === '/contact') {
        this.isFooterShow = false
      } else {
        this.isFooterShow = true
      }
    },
  },
  mounted() {
    if (this.$router.history.current.path === '/contact') {
      this.isFooterShow = false
    }
  },
}
</script>

<style scoped>
.icon-telegram {
  background-image: url('~/static/icon/telegram.svg');
}
</style>
