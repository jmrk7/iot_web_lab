<template>
  <article id="mobile">
    <SectionsHeroAlt :hero-alt="heroAlt" />
    <SectionsMobileWellcome />
    <SectionsMobileStores />
  </article>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('meta/fetchMetaTags', this.name)
  },
  data() {
    return {
      heroAlt: [
        {
          src: 'pexels-ekaterina-bolovtsova-4048767.jpg',
          heading: 'Mobile Application',
        },
      ],
    }
  },
  head() {
    return this.makeCurrentMeta(this.$store.getters['meta/meta'])
  },
}
</script>
