<template>
  <article id="blockchain">
    <SectionsHeroAlt :hero-alt="heroAlt" />
    <SectionsBlockchainServiceList />
    <SectionsBlockchainClouds />
    <SectionsBlockchainTechnologies />
  </article>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('blockchain/fetchTechnologies')
    await store.dispatch('blockchain/fetchClouds')
  },
  data() {
    return {
      heroAlt: [
        {
          src: 'pexels-ekaterina-bolovtsova-4048767.jpg',
          heading: ' Block Chain Development ',
        },
      ],
    }
  },
}
</script>
<style scoped>
.custom__item {
  width: fit-content;
  justify-self: center;
  align-self: center;
}
.image__wrapper {
  display: flex;
  height: 100px;
  justify-content: center;
  align-items: center;
}
</style>
