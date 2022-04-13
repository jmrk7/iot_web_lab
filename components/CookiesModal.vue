<template>
  <v-dialog
    v-model="dialog"
    fullscreen
    hide-overlay
    transition="dialog-bottom-transition"
  >
    <section>
      <SectionsHeroAlt :hero-alt="$t('policy.heroAlt')" />
      <v-card class="pa-8 pb-16">
        <p v-for="p in $t('policy.text')" :key="p">
          {{ p }}
        </p>
      </v-card>
    </section>
  </v-dialog>
</template>
<script>
export default {
  computed: {
    dialog() {
      return this.$store.getters['cookies/isShow']
    },
  },
}
</script>
