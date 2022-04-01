<template>
  <article id="blockchain">
    <SectionsHeroAlt :hero-alt="$t('blockchain.heroAlt')" />
    <SectionsBlockchainServiceList />
    <SectionsBlockchainClouds />
    <SectionsBlockchainTechnologies />
  </article>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('blockchain/fetchTechnologies')
    await store.dispatch('blockchain/fetchClouds')
    await store.dispatch('meta/fetchMetaTags', this.name)
  },
  head() {
    return this.makeCurrentMeta(this.$store.getters['meta/meta'])
  },
}
</script>
