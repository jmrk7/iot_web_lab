<template>
  <article id="mobile">
    <SectionsHeroAlt :hero-alt="$t('mobile.heroAlt')" />
    <SectionsMobileWellcome />
    <SectionsMobileStores />
  </article>
</template>
<script>
export default {
  head() {
    return this.makeCurrentMeta(this.$t('mobile.meta_tags'))
  },
}
</script>
