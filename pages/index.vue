<template>
  <section id="home">
    <v-row no-gutters>
      <v-col cols="12">
        <SectionsHero />
        <SectionsIntro />
        <SectionsCalloutBlock />
        <SectionsFeatures />
        <SectionsBrands :partners="partners" />
        <SectionsTestimonials />
        <SectionsProjects :projects="projects" />
      </v-col>
    </v-row>
  </section>
</template>
<script>
export default {
  async asyncData({ store }) {
    const partners = await store.dispatch('partners/fetchPartners')
    const projects = await store.dispatch('projects/fetchProjects')
    return {
      partners,
      projects,
    }
  },
}
</script>
