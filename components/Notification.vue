<template>
  <v-snackbar
    v-model="snackbar"
    :timeout="-1"
    :dark="$vuetify.theme.dark"
    :light="!$vuetify.theme.dark"
  >
    {{ text }}

    <template v-slot:action="{ attrs }">
      <v-btn
        v-if="dialog"
        color="info"
        small
        v-bind="attrs"
        @click="showPolicy"
      >
        {{ $t('components.notification.more') }}
      </v-btn>
      <v-btn color="primary ml-3" small v-bind="attrs" @click="acceptPolicy">
        {{ $t('components.notification.accert') }}
      </v-btn>
    </template>
  </v-snackbar>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  data() {
    return {
      snackbar: false,
      text: `We use cookies to give you the best user experience.`,
    }
  },
  computed: {
    dialog() {
      return !this.$store.getters['cookies/isShow']
    },
  },
  mounted() {
    if (!this.$cookies.get('accepted')) {
      this.snackbar = true
    } else {
      this.snackbar = false
    }
  },
  methods: {
    ...mapActions({
      sendStatus: 'cookies/sendStatus',
    }),

    showPolicy() {
      this.sendStatus(true)
    },
    acceptPolicy() {
      this.snackbar = false
      this.$cookies.set('accepted', true, {
        path: '/',
        maxAge: 60 * 60 * 24 * 7,
      })
    },
  },
}
</script>
