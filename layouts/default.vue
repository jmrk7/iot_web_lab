<template>
  <v-app dark>
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
  },
  async fetch({ store }) {
    await store.dispatch('nuxtServerInit')
  },
  created() {
    if (this.$cookies.get('theme') && this.$cookies.get('theme') === 'dark') {
      this.$vuetify.theme.dark = true
    } else {
      this.$vuetify.theme.dark = false
    }
  },
}
</script>

<style></style>
