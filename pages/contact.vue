<template>
  <section>
    <v-row no-gutters>
      <v-col cols="12">
        <SectionsHeroAlt :hero-alt="$t('contact.heroAlt')" />
        <v-container>
          <v-row class="py-16">
            <v-col md="5" cols="12">
              <div class="text-h6 font-weight-bold mb-5">
                {{ $t('contact.our-office') }}
              </div>
              <v-list two-line class="transparent">
                <v-list-item>
                  <v-list-item-icon>
                    <v-icon color="primary"> mdi-map-marker </v-icon>
                  </v-list-item-icon>

                  <v-list-item-content>
                    <v-list-item-title>{{
                      $t('contact.address')
                    }}</v-list-item-title>
                    <v-list-item-subtitle>{{
                      $t('contact.index')
                    }}</v-list-item-subtitle>
                    <v-list-item-subtitle>
                      {{ $t('contact.street') }}
                    </v-list-item-subtitle>
                    <v-list-item-subtitle>{{
                      $t('contact.city')
                    }}</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>

                <v-list-item>
                  <v-list-item-icon>
                    <v-icon color="primary"> mdi-email </v-icon>
                  </v-list-item-icon>

                  <v-list-item-content>
                    <v-list-item-title>{{
                      $t('contact.email.title')
                    }}</v-list-item-title>
                    <v-list-item-subtitle>{{
                      $t('contact.email.first')
                    }}</v-list-item-subtitle>
                    <v-list-item-subtitle>{{
                      $t('contact.email.second')
                    }}</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>

                <!-- <v-list-item>
                  <v-list-item-icon>
                    <v-icon color="primary"> mdi-phone </v-icon>
                  </v-list-item-icon>

                  <v-list-item-content>
                    <v-list-item-title>PHONE</v-list-item-title>
                    <v-list-item-subtitle>(323) 555-6789</v-list-item-subtitle>
                    <v-list-item-subtitle>(650) 555-1234</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item> -->
              </v-list>
              <div class="text-h6 font-weight-bold mt-12 mb-5">
                {{ $t('contact.business-time.title') }}
              </div>
              <v-list two-line class="transparent">
                <v-list-item>
                  <v-list-item-icon>
                    <v-icon color="primary"> mdi-clock </v-icon>
                  </v-list-item-icon>
                  <v-list-item-content>
                    <v-list-item-title
                      >{{ $t('contact.business-time.week-main') }}
                    </v-list-item-title>
                    <v-list-item-subtitle>{{
                      $t('contact.business-time.time-main')
                    }}</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>

                <v-list-item>
                  <v-list-item-icon>
                    <v-icon color="primary"> mdi-clock </v-icon>
                  </v-list-item-icon>
                  <v-list-item-content>
                    <v-list-item-title>{{
                      $t('contact.business-time.week-additional')
                    }}</v-list-item-title>
                    <v-list-item-subtitle>{{
                      $t('contact.business-time.time-additional')
                    }}</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>

                <v-list-item>
                  <v-list-item-icon>
                    <v-icon color="primary"> mdi-clock </v-icon>
                  </v-list-item-icon>
                  <v-list-item-content>
                    <v-list-item-title>{{
                      $t('contact.business-time.holidays')
                    }}</v-list-item-title>
                    <v-list-item-subtitle>{{
                      $t('contact.business-time.status-closed')
                    }}</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-col>
            <v-col md="7" cols="12">
              <div class="text-h4 font-weight-black mb-8">
                {{ $t('contact.title') }}
              </div>
              <p class="mb-10">
                {{ $t('contact.descripotion') }}
              </p>
              <contactForm />
            </v-col>
          </v-row>
        </v-container>
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2541.1366591441615!2d30.537596782655516!3d50.43855512912551!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40d4cfa834d199e5%3A0x68a4f52b9a127c67!2sCarnegie%20Center%20%2B%20Tower!5e0!3m2!1sru!2sua!4v1636334389140!5m2!1sru!2sua"
          width="100%"
          height="600"
          frameborder="0"
          style="border: 0; display: block"
          allowfullscreen="true"
          aria-hidden="false"
          tabindex="0"
          loading="lazy"
        ></iframe>
      </v-col>
    </v-row>
  </section>
</template>

<script>
import contactForm from '~/components/sections/contactForm.vue'

export default {
  components: {
    contactForm,
  },
  async fetch({ store }) {
    await store.dispatch('meta/fetchMetaTags', this.name)
  },

  head() {
    return this.makeCurrentMeta(this.$store.getters['meta/meta'])
  },
}
</script>

<style scoped>
#footer-top {
  display: none !important;
}
</style>
