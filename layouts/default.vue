<template>
  <v-app dark>
    <template>
      <loader></loader>
    </template>
    <Alert />
    <siteHeader />
    <v-main>
      <nuxt />
      <footerTop />
    </v-main>
    <siteFooter />
    <Notification />
    <CookiesModal />
  </v-app>
</template>

<script>
import moment from 'moment'
import { mapActions } from 'vuex'
import loader from '~/components/loader.vue'
import siteHeader from '~/components/siteHeader.vue'
import footerTop from '~/components/footerTop.vue'
import siteFooter from '~/components/siteFooter.vue'
import CookiesModal from '~/components/CookiesModal.vue'
export default {
  components: {
    siteHeader,
    footerTop,
    siteFooter,
    CookiesModal,
    loader,
  },
  async fetch({ store }) {
    await store.dispatch('nuxtServerInit')
  },
  created() {
    this.setTheme()
  },
  methods: {
    ...mapActions({
      setStatus: 'loader/setStatus',
    }),
    async setTheme() {
      const theme = await this.$cookies.get('theme')
      if (theme) {
        if (theme === 'dark') {
          this.changeTheme(true)
        } else {
          this.changeTheme(false)
        }
      } else {
        this.changeThemeByTime()
      }
    },

    changeTheme(status) {
      setTimeout(() => {
        this.$vuetify.theme.dark = status
        this.setStatus(false)
      }, 50)
    },

    changeThemeByTime() {
      if (moment().hour() > 6 && moment().hour() < 21) {
        this.changeTheme(false)
      } else {
        this.changeTheme(true)
      }
    },
  },
}
</script>

<style></style>
