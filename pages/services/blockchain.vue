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
  head() {
    // return this.makeCurrentMeta($t('blockchain.meta_tags'))
  },
}
</script>
