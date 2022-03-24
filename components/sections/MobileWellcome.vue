<template>
  <section
    id="service_list"
    :class="$vuetify.theme.dark ? 'grey darken-4' : 'grey lighten-4 '"
  >
    <v-row no-gutters>
      <v-col cols="12">
        <v-container>
          <h2
            class="text-uppercase text-h4 text-md-h3 text-center font-weight-black mt-16 mb-2"
          >
            mobile applications priority
          </h2>
          <h2
            class="text-uppercase grey--text text-h5 text-md-h4 text-center font-weight-black mb-8"
          >
            Make business accessible from your smartphone
          </h2>
          <div class="d-flex flex-column flex-sm-row">
            <div class="wrapper__img_element">
              <v-img
                width="180px"
                src="apple.png"
                alt="apple logo image"
              ></v-img>
            </div>
            <div class="wrapper__img_element">
              <v-img
                width="180px"
                src="android.png"
                alt="android logo image"
              ></v-img>
            </div>
          </div>
          <div class="d-flex flex-column flex-sm-row mt-8">
            <p class="px-8 pb-8">{{ about }}</p>
            <div
              class="image__content__wrapper flex-shrink-0 align-items-end ml-auto mt-auto"
            >
              <span
                class="text-uppercase text-center font-weight-black pt-4 d-block"
              >
                Priority Mobile Developing
              </span>
              <span
                class="text-uppercase text-center font-weight-black pt-8 d-block"
              >
                Best of mobile solutiions
              </span>
              <v-img
                width="200px"
                class="container__custom"
                src="mobile.png"
                alt=""
              ></v-img>
            </div>
          </div>
        </v-container>
      </v-col>
    </v-row>
  </section>
</template>
<script>
export default {
  data() {
    return {
      about: `              
              Smartphones and other mobile devices have not only become part of
              our daily lives, they are a complete offer of us. With the help of
              mobile phones, we not only communicate with each other, but also
              order goods from stores, buy tickets, book accommodation, call a
              taxi, use phones as navigators, photo and video cameras, readers,
              online banks, and just as a way to have fun and pass time.
              According to statistics published in Datareportal, 67% of adults
              worldwide use smartphones daily, which is almost 5.19 billion
              people (out of a total population of 7.75 billion). The trend
              towards the transition from simple mobile devices to feature-rich
              smartphones is only increasing every year. It is assumed that in
              the near future a person will be directly connected with his
              smartphone, that is, all functions and all information from our
              gadgets will directly enter our brain. And while many inventors
              are working on it, people are wasting their time on seemingly
              useless apps like a low-frequency mosquito repeller, a watermelon
              ripeness indicator, a bubble wrap simulator, or an app that
              visually transforms a smartphone screen into a glass of beer. In
              short, the relevance of mobile application development is growing
              not only every year, but also every month. Hundreds of new mobile
              apps are released online every day. It would seem difficult to
              come up with something new, but good developments in collaboration
              with good marketing can bring a lot of money to the creator, a
              clear confirmation of this is the recently sensational TikTok,
              whose ratings continue to grow at lightning speed.`,
    }
  },
}
</script>
<style lang="scss" scoped>
.image__content__wrapper {
  position: relative;
  width: 200px;
  height: 263px;
  padding: 20px 60px 20px 35px;
  font-size: 1em;
}
.container__custom {
  position: absolute;
  top: 0;
  right: 0;
  display: block;
}
.wrapper__img_element {
  width: fit-content;
  flex-shrink: 0;
  align-self: center;
  margin: auto;
}
</style>
