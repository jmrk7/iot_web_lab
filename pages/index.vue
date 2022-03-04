<template>
  <section id="home">
    <v-row no-gutters>
      <v-col cols="12">
        <SectionsHero />
        <SectionsIntro />
        <SectionsCalloutBlock />
        <SectionsFeatures />
        <SectionsBrands />
        <SectionsTestimonials />
        <SectionsProjects />
      </v-col>
    </v-row>
  </section>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('partners/fetchPartners')
    await store.dispatch('projects/fetchProjects')
  },
}
</script>
