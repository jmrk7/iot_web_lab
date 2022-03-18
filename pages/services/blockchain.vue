<template>
  <section id="blockchain">
    <SectionsHeroAlt :hero-alt="heroAlt" />
    <SectionsBlockchainServiceList />
    <SectionsBlockchainClouds />
    <SectionsBlockchainTechnologies />
  </section>
</template>
<script>
export default {
  data() {
    return {
      heroAlt: [
        {
          src: 'pexels-ekaterina-bolovtsova-4048767.jpg',
          heading: ' Block Chain Development ',
        },
      ],

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
.custom__item {
  width: fit-content;
  justify-self: center;
  align-self: center;
}
.image__wrapper {
  display: flex;
  height: 100px;
  justify-content: center;
  align-items: center;
}
</style>
