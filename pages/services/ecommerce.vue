<template>
  <article id="ecommerce">
    <SectionsHeroAlt :hero-alt="heroAlt" />
    <SectionsEcommerceList />
  </article>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('ecommerce/fetchEcommerceScopes')
    await store.dispatch('meta/fetchMetaTags', this.name)
  },
  data() {
    return {
      heroAlt: [
        {
          src: 'pexels-ekaterina-bolovtsova-4048767.jpg',
          heading: 'Ecommerce and Store',
        },
      ],
    }
  },

  head() {
    return this.makeCurrentMeta(this.$store.getters['meta/meta'])
  },
}
</script>
