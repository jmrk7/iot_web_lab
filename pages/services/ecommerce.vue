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
}
</script>
