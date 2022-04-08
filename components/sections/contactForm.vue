<template>
  <v-form v-model="isValid" @input="isRuled = true" @submit="sentForm">
    <v-row class="mb-n6">
      <v-col
        ><v-text-field
          v-model="name"
          :rules="isRuled ? fieldRules : [(v) => true]"
          :label="$t('sections.contactForm.labels.name')"
          dense
          outlined
        ></v-text-field
      ></v-col>
      <v-col
        ><v-text-field
          v-model="email"
          :label="$t('sections.contactForm.labels.email')"
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
          :label="$t('sections.contactForm.labels.subject')"
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
          :label="$t('sections.contactForm.labels.message')"
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
        ><v-btn class="my-2" color="primary" type="submit">{{
          $t('sections.contactForm.submit')
        }}</v-btn
        ><v-btn class="my-2 ml-3" @click="clearReference">{{
          $t('sections.contactForm.clear')
        }}</v-btn></v-col
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

        const formData = new FormData()
        formData.append('name', this.name)
        formData.append('email', this.email)
        formData.append('subject', this.subject)
        formData.append('message', this.message)
        formData.append('feedback', this.$t('send_mail.feedback'))

        this.sendCustomerRequestToMail(formData)
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
