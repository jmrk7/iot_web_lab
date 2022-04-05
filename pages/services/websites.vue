<template>
  <article id="mobile">
    <SectionsHeroAlt :hero-alt="$t('websites.heroAlt')" />
    <SectionsWebsitesTypeList />
  </article>
</template>
<script>
export default {
  head() {
    // return this.makeCurrentMeta($t('websites.meta_tags'))
  },
}
</script>
