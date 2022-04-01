<template>
  <v-form
    v-model="isValid"
    class="row"
    @input="isRuled = true"
    @submit="sentForm"
  >
    <div class="col-12 col-sm-6">
      <v-text-field
        v-model="name"
        :label="$t('sections.footerContactForm.labels.name')"
        :rules="isRuled ? fieldRules : [(v) => true]"
        dense
        outlined
      >
      </v-text-field>
      <v-text-field
        v-model="email"
        :rules="isRuled ? emailRules : [(v) => true]"
        :label="$t('sections.footerContactForm.labels.email')"
        dense
        outlined
      ></v-text-field>
      <v-text-field
        v-model="subject"
        :label="$t('sections.footerContactForm.labels.subject')"
        dense
        outlined
        :rules="isRuled ? fieldRules : [(v) => true]"
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
        :rules="isRuled ? messageRules : [(v) => true]"
      ></v-textarea>
      <!-- <v-file-input
        v-model="onloadedFile"
        label="File"
        dense
        outlined
      ></v-file-input> -->
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

      if (this.onloadedFile) {
        // await this.fileReader(this.onloadedFile)
        this.file = this.onloadedFile
      }

      if (this.isValid && this.email) {
        this.insertCustomerRequest({
          name: this.name,
          email: this.email,
          subject: this.subject,
          message: this.message,
          link: this.link,
          // file: this.file,
        }).then((res) => {
          this.sendAlert({
            type: 'success',
            message: `Fine, message has been sent. We will ansver to your email: ${this.email}`,
          })

          this.clearReference()
        })

        // const formData = new FormData()
        // formData.append('name', this.name)
        // formData.append('email', this.email)
        // formData.append('subject', this.subject)
        // formData.append('message', this.message)
        // formData.append('link', this.link)
        // formData.append('file', this.file)

        // console.log('formData: ', formData)

        this.sendCustomerRequestToMail({
          name: this.name,
          email: this.email,
          subject: this.subject,
          message: this.message,
          link: this.link,
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
      this.link = null
      this.file = null
    },

    async fileReader(file) {
      return await new Promise((resolve, reject) => {
        const reader = new FileReader()
        reader.readAsArrayBuffer(file)
        reader.onload = async () => {
          try {
            this.file = await reader.result
            resolve(reader.result)
          } catch (error) {
            reject(error)
          }
        }
      })
    },
  },
}
</script>
