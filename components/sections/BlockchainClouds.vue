<template>
  <section id="service_list" class="grey darken-4 white--text">
    <v-row no-gutters>
      <v-col cols="12">
        <v-container class="py-8">
          <h3
            class="text-uppercase text-h6 text-md-h5 text-center font-weight-black my-16"
          >
            We will help to integrate your prodject into services
          </h3>
          <v-row>
            <v-col v-for="item in clouds" :key="item.name">
              <div class="image__wrapper">
                <img width="100px" :src="item.src" dark />
              </div>
              <h6
                class="text-uppercase text-center mt-1 mb-4"
                style="letter-spacing: 0.15em"
                v-text="item.name"
              ></h6>
            </v-col> </v-row></v-container
      ></v-col>
    </v-row>
  </section>
</template>
<script>
export default {
  data() {
    return {
      clouds: [
        {
          name: 'Oracle Blockchain Cloud Service',
          src: '/services/oracle.png',
        },
        {
          name: 'IBM Blockchain Platform',
          src: '/services/ibm2.png',
        },
        {
          name: 'Azure Blockchain Workbench',
          src: '/services/azure2.png',
        },
        {
          name: 'Amazon Managed Blockchain',
          src: '/services/aws2.png',
        },
        {
          name: 'Google Cloud Platform',
          src: '/services/google2.png',
        },
      ],
    }
  },
}
</script>
<style scoped>
.image__wrapper {
  display: flex;
  height: 100px;
  justify-content: center;
  align-items: center;
}
</style>
