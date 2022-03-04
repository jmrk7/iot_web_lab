<template>
  <v-form v-model="isValid" @submit="sentForm">
    <v-text-field
      v-model="name"
      label="Name *"
      :rules="fieldRules"
      dense
      outlined
    >
    </v-text-field>
    <v-text-field
      v-model="email"
      :rules="emailRules"
      label="Email *"
      dense
      outlined
    ></v-text-field>
    <v-text-field
      v-model="subject"
      label="Subject *"
      dense
      outlined
      :rules="fieldRules"
    ></v-text-field>
    <v-textarea
      v-model="message"
      dense
      label="Your Message *"
      auto-grow
      outlined
      rows="8"
      row-height="20"
      :rules="messageRules"
    ></v-textarea>
    <v-btn type="submit" outlined block color="primary">SEND MESSAGE</v-btn>
  </v-form>
</template>
<script>
import { mapActions } from 'vuex'

export default {
  data() {
    return {
      isValid: false,
      name: null,
      email: null,
      subject: null,
      message: null,
      emailRules: [
        (v) =>
          !v ||
          /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) ||
          'E-mail must be valid',
      ],
      fieldRules: [(v) => v?.length > 0 || 'Field is required'],
      messageRules: [
        (v) => v?.length > 0 || 'Field is required',
        (v) => v?.length >= 10 || 'Name must be less than 10 characters',
      ],
    }
  },
  methods: {
    ...mapActions({
      insertCustomerRequest: 'customer/insertCustomerRequest',
    }),

    sentForm(event) {
      event.preventDefault()
      event.stopPropagation()

      if (this.isValid) {
        this.insertCustomerRequest({
          name: this.name,
          email: this.email,
          subject: this.subject,
          message: this.message,
        })
      }
    },
  },
}
</script>
