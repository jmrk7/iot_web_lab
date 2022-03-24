<template>
  <article id="mobile">
    <SectionsHeroAlt :hero-alt="heroAlt" />
    <SectionsMobileWellcome />
    <SectionsMobileStores />
  </article>
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
          heading: 'Mobile Application',
        },
      ],
    }
  },
}
</script>
