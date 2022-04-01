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
            {{ $t('sections.mobileWellcome.title-first') }}
          </h2>
          <h2
            class="text-uppercase grey--text text-h5 text-md-h4 text-center font-weight-black mb-8"
          >
            {{ $t('sections.mobileWellcome.title-second') }}
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
            <p class="px-8 pb-8">{{ $t('sections.mobileWellcome.about') }}</p>
            <div
              class="image__content__wrapper flex-shrink-0 align-items-end ml-auto mt-auto"
            >
              <span
                class="text-uppercase text-center font-weight-black pt-4 d-block"
              >
                {{ $t('sections.mobileWellcome.title-in-img-top') }}
              </span>
              <span
                class="text-uppercase text-center font-weight-black pt-8 d-block"
              >
                {{ $t('sections.mobileWellcome.title-in-img-down') }}
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
