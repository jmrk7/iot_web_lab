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
  },
  data() {
    return {
      heroAlt: [
        {
          src: 'pexels-ekaterina-bolovtsova-4048767.jpg',
          heading: 'Websites',
        },
      ],
      article: {
        title: 'Websites',
        description:
          'Creation of websites. Qualified approach to website development. Sites of any complexity.',
        keywords: [
          'website',
          'development',
          'landing',
          'internet',
          'marketing',
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
