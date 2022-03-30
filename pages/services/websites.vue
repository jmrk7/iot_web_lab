<template>
  <article id="mobile">
    <SectionsHeroAlt :hero-alt="heroAlt" />
    <SectionsWebsitesTypeList />
  </article>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('websites/fetchWebsitesTypes')
    await store.dispatch('meta/fetchMetaTags', this.name)
  },
  data() {
    return {
      heroAlt: [
        {
          src: 'pexels-ekaterina-bolovtsova-4048767.jpg',
          heading: 'Websites',
        },
      ],
    }
  },

  head() {
    return this.makeCurrentMeta(this.$store.getters['meta/meta'])
  },
}
</script>
