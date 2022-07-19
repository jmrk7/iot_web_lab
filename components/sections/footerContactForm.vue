<template>
  <v-form ref="contactFrom" v-model="isValid" class="row" @submit="sentForm">
    <div class="col-12 col-sm-6">
      <v-text-field
        v-model="name"
        :label="$t('sections.footerContactForm.labels.name')"
        :rules="fieldRules"
        dense
        outlined
      >
      </v-text-field>
      <v-text-field
        v-model="email"
        :rules="emailRules"
        :label="$t('sections.footerContactForm.labels.email')"
        dense
        outlined
      ></v-text-field>
      <v-text-field
        v-model="subject"
        :label="$t('sections.footerContactForm.labels.subject')"
        dense
        outlined
        :rules="subjectRules"
      ></v-text-field>
      <v-text-field
        v-model="link"
        :label="$t('sections.footerContactForm.labels.link')"
        dense
        outlined
      ></v-text-field>
    </div>
    <div class="col-12 col-sm-6">
      <v-textarea
        v-model="message"
        dense
        :label="$t('sections.footerContactForm.labels.message')"
        auto-grow
        outlined
        rows="5"
        row-height="21"
        :rules="messageRules"
      ></v-textarea>
      <v-file-input
        v-model="onloadedFile"
        label="File"
        dense
        prepend-icon=""
        prepend-inner-icon="mdi-paperclip"
        outlined
      ></v-file-input>
      <v-btn type="submit" outlined block color="primary">{{
        $t('sections.footerContactForm.submit')
      }}</v-btn>
    </div>
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
      file: null,
      link: null,
      onloadedFile: null,
      subject: null,
      message: null,
      isRuled: true,
      emailRules: [
        (v) => v?.length > 0 || 'Field is required',
        (v) =>
          !v ||
          /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) ||
          'E-mail must be valid',
      ],
      fieldRules: [
        (v) => v?.length > 0 || 'Field is required',
        (v) => v?.length >= 3 || 'Name must be less than 10 characters',
      ],
      messageRules: [
        (v) => v?.length > 0 || 'Field is required',
        (v) => v?.length >= 10 || 'Name must be less than 10 characters',
      ],
      subjectRules: [
        (v) => v?.length > 0 || 'Field is required',
        (v) => v?.length >= 3 || 'Name must be less than 10 characters',
      ],
      isResetStyle: true,
    }
  },
  methods: {
    ...mapActions({
      insertCustomerRequest: 'customer/insertCustomerRequest',
      sendCustomerRequestToMail: 'customer/sendCustomerRequestToMail',
      fetchCustomerRequestByEamil: 'customer/fetchCustomerRequestByEamil',
      sendAlert: 'alert/sendAlert',
      setStatus: 'loader/setStatus',
    }),
    sentForm(event) {
      event.preventDefault()
      event.stopPropagation()

      this.setStatus(true)
      this.$refs.contactFrom.validate()
      // if (await this.fetchCustomerRequestByEamil(this.email)) {
      //   this.sendAlert({
      //     typeresetRules

      //   return
      // }

      if (this.onloadedFile) {
        this.file = this.onloadedFile
      }

      if (
        this.isValid &&
        this.email &&
        this.name &&
        this.message &&
        this.message.length > 10
      ) {
        // await this.insertCustomerRequest({
        //   name: this.name,
        //   email: this.email,
        //   subject: this.subject,
        //   message: this.message,
        //   link: this.link,
        // }).then((res) => {
        //   this.sendAlert({
        //     type: 'success',
        //     message: `Fine, message has been sent. We will ansver to your email: ${this.email}`,
        //   })
        //     .catch(() => {
        //       this.sendAlert({
        //         type: 'error',
        //         message:
        //           "Couldn't send message. The service is temporarily unavailable, please try again later.",
        //       })
        //     })
        //     .finally(() => {
        //       this.setStatus(false)
        //     })

        //   this.clearReference()
        // })

        const formData = new FormData()
        formData.append('name', this.name)
        formData.append('email', this.email)
        formData.append('subject', this.subject)
        formData.append('message', this.message)
        formData.append('link', this.link)
        formData.append('file', this.file)
        formData.append('feedback', this.$t('send_mail.feedback'))

        this.sendCustomerRequestToMail(formData)
          .then((response) => {
            this.sendAlert({
              type: 'success',
              message: `Fine, message has been sent. We will ansver to your email: ${this.email}`,
            })
          })
          .catch(() => {
            this.sendAlert({
              type: 'error',
              message:
                "Couldn't send message. The service is temporarily unavailable, please try again later.",
            })
          })
          .finally(() => {
            setTimeout(() => {
              this.clearReference()
            }, 500)
            this.setStatus(false)
          })
      } else {
        this.setStatus(false)
        this.sendAlert({
          type: 'error',
          message: "Cann't send message. Please, check fields and try again",
        })
      }
    },
    clearReference() {
      this.$refs.contactFrom.reset()
      this.isValid = false
    },
  },
  watch: {
    '$route.query'(value) {
      this.$refs.contactFrom.reset()
    },
  },
}
</script>
