<template>
  <article id="cookies">
    <SectionsHeroAlt :hero-alt="$t('policy.heroAlt')" />
    <section class="py-8">
      <v-container
        ><p v-for="p in $t('policy.text')" :key="p">
          {{ p }}
        </p></v-container
      >
    </section>
  </article>
</template>
<script>
export default {
  head() {
    // return this.makeCurrentMeta($t('policy.meta_tags'))
  },
}
</script>
