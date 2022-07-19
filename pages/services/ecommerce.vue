<template>
  <article id="ecommerce">
    <SectionsHeroAlt :hero-alt="$t('ecommerce.heroAlt')" />
    <SectionsEcommerceList />
  </article>
</template>
<script>
export default {
  head() {
    return this.makeCurrentMeta(this.$t('ecommerce.meta_tags'))
  },
}
</script>
