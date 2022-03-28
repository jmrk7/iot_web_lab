<template>
  <article id="mobile">
    <SectionsHeroAlt :hero-alt="heroAlt" />
    <SectionsMobileWellcome />
    <SectionsMobileStores />
  </article>
</template>
<script>
export default {
  data() {
    return {
      heroAlt: [
        {
          src: 'pexels-ekaterina-bolovtsova-4048767.jpg',
          heading: 'Mobile Application',
        },
      ],
      article: {
        title: 'Mobile Application',
        description:
          'Mobile app development and PWA. Integration of your application into popular stores.',
        keywords: ['mobile', 'application', 'develop', 'store', 'tools'],
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
