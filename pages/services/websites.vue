<template>
  <section id="mobile">
    <SectionsHeroAlt :hero-alt="heroAlt" />
    <SectionsWebsitesTypeList />
  </section>
</template>
<script>
export default {
  //   async fetch({ store }) {
  //     await store.dispatch('ecommerce/fetchEcommerceScopes')
  //   },
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
}
</script>
