<template>
  <v-app dark>
    <template>
      <loader :is-show="loading"></loader>
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
  data() {
    return {
      loading: true,
    }
  },
  created() {
    this.setTheme()
  },
  methods: {
    async setTheme() {
      const theme = await this.$cookies.get('theme')
      if (theme && theme === 'dark') {
        this.changeTheme(true)
      } else {
        this.changeTheme(false)
      }
    },

    changeTheme(status) {
      setTimeout(() => {
        this.$vuetify.theme.dark = status
        this.loading = false
      }, 1000)
    },
  },
}
</script>

<style></style>
