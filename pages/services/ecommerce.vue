<template>
  <article id="ecommerce">
    <SectionsHeroAlt :hero-alt="$t('ecommerce.heroAlt')" />
    <SectionsEcommerceList />
  </article>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('ecommerce/fetchEcommerceScopes')
    await store.dispatch('meta/fetchMetaTags', this.name)
  },
  head() {
    return this.makeCurrentMeta(this.$store.getters['meta/meta'])
  },
}
</script>
