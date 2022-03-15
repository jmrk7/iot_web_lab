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
    await store.dispatch('partners/fetchPartners')
    await store.dispatch('projects/fetchProjects')
    await store.dispatch('solution/fetchScopeAreas')
    await store.dispatch('techs/fetchTechs')
  },
}
</script>
