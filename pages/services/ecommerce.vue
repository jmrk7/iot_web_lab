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
      article: {
        title: 'E-commerce',
        description:
          'Development of electronic commerce, Creation of online stores, development of application software for your business.',
        keywords: [
          'e-commerce',
          'develop',
          'development',
          'shop',
          'b2b',
          'b2c',
        ],
      },
    }
  },

  head() {
    return {
      title: this.article.title,
      meta: [
        {
          hid: 'description',
          name: 'description',
          content: this.article.description,
        },
        {
          hid: 'keywords',
          name: 'keywords',
          content: this.article.keywords.join(),
        },
      ],
    }
  },
}
</script>
