<template>
  <v-form ref="contactFrom" v-model="isValid" class="row" @submit="sentForm">
    <div class="col-12 col-sm-6">
      <v-text-field
        v-model="name"
        :label="$t('sections.footerContactForm.labels.name')"
        :rules="fieldRules"
        dense
        outlined
        @input="setRulesField"
      >
      </v-text-field>
      <v-text-field
        v-model="email"
        :rules="emailRules"
        :label="$t('sections.footerContactForm.labels.email')"
        dense
        outlined
        @input="setRulesEmail"
      ></v-text-field>
      <v-text-field
        v-model="subject"
        :label="$t('sections.footerContactForm.labels.subject')"
        dense
        outlined
        :rules="subjectRules"
        @input="setRulesSubject"
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
        @input="setRulesMessage"
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
      emailRules: [(v) => true],
      fieldRules: [(v) => true],
      messageRules: [(v) => true],
      subjectRules: [(v) => true],
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
    setRules() {
      this.setRulesField()
      this.setRulesEmail()
      this.setRulesMessage()
      this.setRulesSubject()
    },
    setRulesField() {
      this.fieldRules = [
        (v) => v?.length > 0 || 'Field is required',
        (v) => v?.length >= 3 || 'Name must be less than 10 characters',
      ]
    },
    setRulesEmail() {
      this.emailRules = [
        (v) => v?.length > 0 || 'Field is required',
        (v) =>
          !v ||
          /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) ||
          'E-mail must be valid',
      ]
    },
    setRulesMessage() {
      this.messageRules = [
        (v) => v?.length > 0 || 'Field is required',
        (v) => v?.length >= 10 || 'Name must be less than 10 characters',
      ]
    },
    setRulesSubject() {
      this.subjectRules = [
        (v) => v?.length > 0 || 'Field is required',
        (v) => v?.length >= 3 || 'Name must be less than 10 characters',
      ]
    },

    sentForm(event) {
      event.preventDefault()
      event.stopPropagation()

      this.setRules()

      this.setStatus(true)
      this.$refs.contactFrom.validate()
      // if (await this.fetchCustomerRequestByEamil(this.email)) {
      //   this.sendAlert({
      //     type: 'warning',
      //     message:
      //       'You have one not ansvered message. Please, wait for ansver and check you email',
      //   })

      //   return
      // }

      if (this.onloadedFile) {
        this.file = this.onloadedFile
      }

      if (this.isValid && this.email) {
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
      this.name = null
      this.email = null
      this.subject = null
      this.message = null
      this.link = null
      this.file = null
      this.isValid = false
      this.emailRules = [(v) => true]
      this.fieldRules = [(v) => true]
      this.messageRules = [(v) => true]
      this.subjectRules = [(v) => true]
    },
  },
}
</script>
