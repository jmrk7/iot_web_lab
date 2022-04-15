<template>
  <article id="service_list">
    <v-container class="py-8">
      <h2
        class="text-uppercase text-h4 text-md-h4 text-center font-weight-black mt-16"
      >
        {{ $t('sections.ecommerceList.title') }}
      </h2>
      <p class="secondary--text mt-6">
        {{ $t('sections.ecommerceList.description') }}
      </p>
    </v-container>
    <section
      v-for="(scope, index) in scopes"
      :key="scope.name"
      cols="12"
      :class="
        $vuetify.theme.dark
          ? index % 2 == 0
            ? 'grey darken-4'
            : ''
          : index % 2 == 0
          ? 'grey lighten-2 '
          : ''
      "
    >
      <v-container class="py-8">
        <div v-if="index % 2 == 0" class="d-flex flex-column flex-sm-row">
          <div class="text__wrapper mb-4">
            <h3
              class="text__tittle text-uppercase text-center font-weight-black mt-1 mb-4"
              :class="scope.name == 'B2B2C' ? 'text-h2' : 'text-h1'"
              style="letter-spacing: 0.15em"
              v-text="scope.name"
            ></h3>
          </div>
          <div>{{ scope.text }}</div>
        </div>

        <div v-if="index % 2 !== 0" class="d-flex flex-column flex-sm-row">
          <div>{{ scope.text }}</div>
          <div class="text__wrapper mt-4">
            <h3
              class="text__tittle text-uppercase text-center font-weight-black mt-1 mb-4"
              :class="scope.name == 'B2B2C' ? 'text-h2' : 'text-h1'"
              style="letter-spacing: 0.15em"
              v-text="scope.name"
            ></h3>
          </div>
        </div>
      </v-container>
    </section>
  </article>
</template>
<script>
import { mapGetters } from 'vuex'
export default {
  computed: {
    ...mapGetters({
      scopes: 'ecommerce/scopes',
    }),
  },
}
</script>
<style scoped>
.text__wrapper {
  margin: 0px 50px;
  padding: 20px;
  width: 100px;
  height: 100px;

  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 120px;
  box-sizing: content-box;
  background-color: #ff8f00;
}
</style>
