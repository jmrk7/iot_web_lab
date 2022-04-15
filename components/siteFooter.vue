<template>
  <v-footer
    :class="
      $vuetify.theme.dark
        ? 'blue-grey darken-4 grey--text text--lighten-1'
        : 'grey lighten-3 grey--text text--darken-4'
    "
    class="site-footer"
  >
    <v-container>
      <v-divider class="mb-5"></v-divider>
      <div class="d-flex flex-column flex-sm-row">
        <div
          class="d-flex flex-wrap justify-md-start justify-center justify-md-none pa-3"
        >
          <template v-for="(site, index) in $t('components.siteFooter.menu')">
            <nuxt-link
              :key="site.text + index"
              :to="siteFooter.link"
              class="text--secondary pa-1 pa-md-0 list_item mr-2"
              >{{ site.text }}</nuxt-link
            >
          </template>
        </div>
        <div
          class="text--secondary text-center text-md-right ml-sm-auto pa-3 align-self-center logo_wrapper"
        >
          <div class="fit-content">{{ new Date().getFullYear() }} ©</div>
          <nuxt-link class="primary--text fit-content" to="/">
            <Logo :width="170" :height="15" class="bottom-logo-footer" />
          </nuxt-link>
        </div>
      </div>
    </v-container>
  </v-footer>
</template>
<style scoped>
.list_wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
}
.list_item {
  width: fit-content;
}
.logo_wrapper {
  display: flex;
  align-items: center;
}
.fit-content {
  width: fit-content;
  height: fit-content;
}
.site-footer a {
  text-decoration: none;
}
.bottom-logo-footer {
  display: inline;
  vertical-align: middle;
}
</style>
