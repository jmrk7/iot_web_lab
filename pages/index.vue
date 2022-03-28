<template>
  <section id="home">
    <v-row no-gutters>
      <v-col cols="12">
        <SectionsHero />
        <SectionsIntro />
        <SectionsBrands />
        <!-- <SectionsCalloutBlock /> -->

        <SectionsFeatures />
        <SectionsTechnologies />
        <SectionsTestimonials />
        <SectionsProjects />
      </v-col>
    </v-row>
  </section>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('hero/fetchHeroCaruselItems')
    await store.dispatch('partners/fetchPartners')
    await store.dispatch('projects/fetchProjects')
    await store.dispatch('solution/fetchScopeAreas')
    await store.dispatch('techs/fetchTechs')
  },
  data() {
    return {
      article: {
        title: 'Web Development',
        description:
          'IOT WEBLAB specializes in web development and application software development. Our specialists can help you solve your business problems.',
        keywords: [
          'development',
          'blockchain',
          'mobile',
          'website',
          'solution',
          'technologies',
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
