<template>
  <article id="mobile">
    <SectionsHeroAlt :hero-alt="$t('mobile.heroAlt')" />
    <SectionsMobileWellcome />
    <SectionsMobileStores />
  </article>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('meta/fetchMetaTags', this.name)
  },
  head() {
    return this.makeCurrentMeta(this.$store.getters['meta/meta'])
  },
}
</script>
