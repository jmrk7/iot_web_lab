<template>
  <article id="cookies">
    <SectionsHeroAlt :hero-alt="$t('policy.heroAlt')" />
    <section class="py-8">
      <v-container
        ><p v-for="p in $t('policy.text')" :key="p">
          {{ p }}
        </p></v-container
      >
    </section>
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
