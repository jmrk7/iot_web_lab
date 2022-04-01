<template>
  <article id="mobile">
    <SectionsHeroAlt :hero-alt="$t('websites.heroAlt')" />
    <SectionsWebsitesTypeList />
  </article>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('websites/fetchWebsitesTypes')
    await store.dispatch('meta/fetchMetaTags', this.name)
  },
  head() {
    return this.makeCurrentMeta(this.$store.getters['meta/meta'])
  },
}
</script>
