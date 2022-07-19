<template>
  <section id="home">
    <v-row no-gutters>
      <v-col cols="12">
        <SectionsHero />
        <SectionsIntro />
        <SectionsBrands />
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
  head() {
    return this.makeCurrentMeta(this.$t('index.meta_tags'))
  },
}
</script>
