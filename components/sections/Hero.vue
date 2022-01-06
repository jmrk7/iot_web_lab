<template>
  <section id="hero">
    <v-carousel
      height="calc(100vh - 64px)"
      dark
      cycle
      show-arrows-on-hover
      draggable="true"
      hide-delimiter-background
    >
      <v-carousel-item
        v-for="(carousel, carindex) in carouselsData"
        :key="carindex"
        :src="carousel.src"
        class="gradient-fill"
      >
        <v-container fill-height>
          <div style="max-width: 600px">
            <div class="text-md-h2 mb-3 text-sm-h3 text-h5 font-weight-black">
              {{ carousel.heading.toUpperCase() }}
            </div>
            <p class="mb-5">{{ carousel.subHeading }}</p>
            <v-btn :x-large="$vuetify.breakpoint.smAndUp" class="my-3 primary"
              >Get Started</v-btn
            >
            <span class="mx-2 my-4"></span>
            <v-btn
              :x-large="$vuetify.breakpoint.smAndUp"
              text
              class="my-3"
              outlined
              ><v-icon left large color="primary">mdi-play</v-icon>Learn
              More</v-btn
            >
          </div>
        </v-container>
      </v-carousel-item>
    </v-carousel>
  </section>
</template>

<script>
export default {
  data() {
    return {
      carouselsData: [
        {
          src: 'pexels-andrea-piacquadio-3884440.jpg',
          heading: 'SOFTWARE DEVELOPMENT',
          subHeading:
            'Desktop, Web and Mobile development with the hint of data-science and data-engineering.',
        },
        {
          src: 'pexels-peter-olexa-4012966.jpg',
          heading: 'UI/UX DESIGN',
          subHeading:
            'Great products are designed around users. From ideation to prototyping and design, we have got you covered.',
        },
        {
          src: 'pexels-thirdman-5961072.jpg',
          heading: 'DIGITAL MARKETING',
          subHeading: 'sdfgsdfgsdfgsdfgsdfg',
        },
        {
          src: 'pexels-andrea-piacquadio-3830745.jpg',
          heading: 'OUTSOURCE & OUTSTAFF',
          subHeading:
            'Hire flexible, on-demand remote UI/UX Designers, Software Developers, Project Managers and QA Engineers to help you manage dynamic workloads and new projects.',
        },
      ],
    }
  },
}
</script>

<style>
.gradient-fill .v-responsive__content {
  background: rgb(0, 0, 0);
  background: linear-gradient(
    to right,
    rgba(3, 12, 41, 0.75),
    rgba(5, 11, 31, 0.65)
  );
}
</style>
