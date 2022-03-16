<template>
  <v-form v-model="isValid" @input="isRuled = true" @submit="sentForm">
    <v-row class="mb-n6">
      <v-col
        ><v-text-field
          v-model="name"
          :rules="isRuled ? fieldRules : [(v) => true]"
          label="Name *"
          dense
          outlined
        ></v-text-field
      ></v-col>
      <v-col
        ><v-text-field
          v-model="email"
          label="Email *"
          dense
          outlined
          :rules="isRuled ? emailRules : [(v) => true]"
        ></v-text-field
      ></v-col>
    </v-row>

    <v-row class="mb-n6">
      <v-col
        ><v-text-field
          v-model="subject"
          label="Subject *"
          dense
          outlined
          :rules="isRuled ? fieldRules : [(v) => true]"
        ></v-text-field
      ></v-col>
    </v-row>
    <v-row class="mb-n6">
      <v-col>
        <v-textarea
          v-model="message"
          dense
          label="Your Message *"
          auto-grow
          outlined
          rows="8"
          row-height="20"
          :rules="isRuled ? messageRules : [(v) => true]"
        ></v-textarea>
      </v-col>
    </v-row>
    <v-row>
      <v-col
        ><v-btn class="my-2" color="primary" type="submit">SEND MESSAGE</v-btn
        ><v-btn class="my-2 ml-3" @click="clearReference">clear</v-btn></v-col
      >
    </v-row>
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
      isRuled: false,
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
      sendCustomerRequestToMail: 'customer/sendCustomerRequestToMail',
      fetchCustomerRequestByEamil: 'customer/fetchCustomerRequestByEamil',
      sendAlert: 'alert/sendAlert',
    }),

    async sentForm(event) {
      event.preventDefault()
      event.stopPropagation()

      if (await this.fetchCustomerRequestByEamil(this.email)) {
        this.sendAlert({
          type: 'warning',
          message:
            'You have one not ansvered message. Please, wait for ansver and check you email',
        })

        return
      }

      if (this.isValid && this.email) {
        this.insertCustomerRequest({
          name: this.name,
          email: this.email,
          subject: this.subject,
          message: this.message,
        }).then((res) => {
          this.sendAlert({
            type: 'success',
            message: `Fine, message has been sent. We will ansver to your email: ${this.email}`,
          })

          this.clearReference()
        })

        this.sendCustomerRequestToMail({
          name: this.name,
          email: this.email,
          subject: this.subject,
          message: this.message,
        })
      } else {
        this.sendAlert({
          type: 'error',
          message: "Cann't send message. Please, check fields and try again",
        })
      }
    },
    clearReference() {
      this.isRuled = false
      this.name = null
      this.email = null
      this.subject = null
      this.message = null
    },
  },
}
</script>
