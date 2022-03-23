<template>
  <section
    id="service_list"
    :class="
      $vuetify.theme.dark
        ? 'grey darken-2 text--lighten-2'
        : 'grey lighten-2 text--darken-2'
    "
  >
    <h2
      class="primary text-uppercase text-h4 text-md-h3 text-center font-weight-black py-16"
    >
      Create your website
    </h2>
    <v-row
      v-for="(item, index) in types"
      :key="item.name"
      :class="
        $vuetify.theme.dark
          ? index % 2 == 0
            ? 'black'
            : ''
          : index % 2 == 0
          ? 'white'
          : ''
      "
    >
      <v-col cols="12">
        <v-container>
          <v-row class="my-8">
            <v-col cols="12"
              ><h3
                class="text-uppercase text-h5 text-md-h4 text-center font-weight-black"
              >
                {{ item.name }}
              </h3></v-col
            >
            <v-col v-if="item.image" cols="12" sm="4" md="4"
              ><v-img :src="item.image"> </v-img>
            </v-col>

            <v-col
              cols="12"
              :sm="item.image ? 8 : 12"
              :md="item.image ? 8 : 12"
              class="py-2 d-flex"
              ><p class="align-self-end">{{ item.text }}</p>
            </v-col>

            <v-col v-if="item.icon" cols="12" sm="4" md="3"
              ><v-img :src="item.icon"> </v-img>
            </v-col>
            <v-col v-if="item.additional_text" cols="12" class="py-2"
              ><p>{{ item.additional_text }}</p>
            </v-col>
            <v-col
              v-if="item.benefits.length"
              cols="12"
              sm="9"
              md="10"
              class="py-2"
            >
              <h4
                class="text-uppercase text-h6 text-md-h5 font-weight-black my-4"
              >
                Benefits:
              </h4>
              <div v-for="fit in item.benefits" :key="fit">
                <v-icon v-if="!$vuetify.theme.dark" light left>
                  mdi-circle-medium
                </v-icon>
                <v-icon v-if="$vuetify.theme.dark" dark left>
                  mdi-circle-medium </v-icon
                >{{ fit }}
              </div>
            </v-col>
            <v-col
              v-if="item.benefits"
              cols="12"
              sm="3"
              md="2"
              :offset-sm="item.benefits.length ? 0 : 9"
              class="d-flex"
            >
              <div class="wrapper__example__link ml-auto">
                <v-btn
                  class="v-btn v-btn--outlined theme--light v-size--default primary--text example__link"
                  @click="
                    $vuetify.goTo('#footer-top', {
                      duration: 500,
                      easing: 'easeInOutCubic',
                    })
                  "
                >
                  Get Start
                </v-btn>
              </div>
            </v-col>
          </v-row></v-container
        ></v-col
      >
    </v-row>
  </section>
</template>
<script>
export default {
  data() {
    return {
      types: [
        {
          name: 'Website-Card',
          text: `A business card site is, one might say, the ancestor of the Internet. It was this type of sites that stood at the dawn of the emergence of the global network. Of course, now such business pages have visually changed, become more beautiful and more elegant. But the very essence remains the same. What is a business card site? These are just a few pages: information about the company, information about the goods sold / services provided, contact information. There may be several more sections such as Promotions, News and the like. The presented information is static, that is, the business card site does not assume active user interaction with the site. Of all the interaction with the client, only a feedback form for sending email directly from the site.`,
          icon: '',
          image: '/services/websites/landing.png',
          benefits: [
            'low cost of creation',
            'quick launch',
            'it is possible to upgrade to more advanced types of websites (but this possibility should be discussed in advance)',
          ],
        },
        {
          name: 'CORPORATE WEBSITE',
          text: `A corporate website is understood as a multifunctional website of an organization, the purpose of which is both to convey information to the client and directly to pursue commercial goals. That is, this is a site that works for your business.

When compared with the previous type of web sites - business cards, the following analogy is obtained. There you handed a small business card and said goodbye in the hope that you will someday be remembered. Here you immediately give the most complete amount of information, almost a book, which has everything to solve the needs of the client. This is not just a business card, it is already a full-fledged office with all its advantages.

Just as a person is greeted by their appearance, a company is greeted by its website. As a rule, the client always, even if unconsciously, sees / feels seriousness in intentions (or lack of it). A corporate website is a great way to show a serious attitude to business.

Moreover, by creating a corporate type of site, you give the client what he needs. The client feels the respect shown to him when he sees how much necessary and useful information has been created and posted specially for him. Pleasant design, convenient management, reliable and regularly updated information - these are the characteristic features that distinguish a corporate website from business cards.

Well, okay, all of the above is somewhat subjective (although verified from personal experience), so let's add objectivity and highlight the specific pros and cons of a corporate website.`,
          icon: '',
          image: '',
          benefits: [
            'centralized repository of detailed information about the company, products and services',
            'a large amount of reference information for user support',
            'various help services for choosing goods and services: calculators and the like',
            'the possibility of interaction between employees of the organization through internal services',
            'actively attracting customers through customer focus',
          ],
        },
        {
          name: 'PORTAL',
          text: `The portal is, in fact, a heavily pumped and improved corporate website. This type of site is aimed at a much wider range of users and is designed to make their lives much easier in all available ways.

An example of portal functionality: posting and displaying photos, audio and video in the form of convenient galleries and playlists, reading, viewing and listening online, forums, blogs and user diaries, ratings, voting, a commenting and comment management system, private messaging between users, etc. Further. This list is endless. The main feature of the portal is a very active interaction with visitors. There can be thousands of types of these interactions. Each audience has its own needs, and it is the portal site that is able to satisfy them all.

Actually, it is on this that the success or failure of the portal is built. The main thing is to understand the needs of your target audience. If you know what your users need, then you can give it to them through the Internet portal. A portal is a modern look and feel for a site that allows you to effectively meet the needs of your audience. Thus, you will undoubtedly make your business successful. A properly designed portal is a guarantee that everything will work out for you.`,
          icon: '',
          image: '',
          benefits: [],
        },
        {
          name: 'SITE-CATALOG',
          text: `A catalog is a site with a showcase of goods, but without the ability to add them to the cart and place an order. The purchase of goods from the catalog is made through e-mail, telephone or other means of communication with the owner of the resource.`,
          additional_text: `It is worth noting that at this point in time, a catalog website is not the best solution for business (the exception is catalogs with expensive goods, such as special equipment, cars, etc.). Clients are now picky: he needs to be simple and convenient. And what is simple and convenient in that he has to look for an opportunity to contact the owner of the catalog, spend time communicating with them, and only after going through this difficult path, the client will finally be able to get what he needs. In general, this is not the best type of site for developing an online business.

Of course, there are situations when a company has some kind of unique offer or an individual approach to pricing for each person. But even in this case, everything can be automated! Customers will be grateful to you if you screw on the usual shopping cart and give them the opportunity to place an order. But then the next type of site will already turn out.`,
          icon: '',
          image: '/services/websites/catalog.png',
          benefits: [],
        },
        {
          name: 'SITE SERVICE',
          text: `The service, as a rule, is focused on solving one or more of the same type of customer needs.

The best example would be online consultants. Probably, each of us met pop-up windows on modern sites with an appeal from managers or an offer to enter our number so that they would quickly call us back and advise. So, such online assistants are an example of a service - a type of site that provides services to meet a specific user need.

The same cloud hosting (Dropbox, Yandex.Disk), video hosting (Youtube, RuTube), various services for online file conversion, etc. — are a prime example of good and useful service.

There are a huge number of services on the Internet, new ones appear every day. In order to create your own successful service, you just need to understand what people lack. Guess how to solve someone's problem, become useful to people - and the service will certainly succeed. Of course, provided that it is developed and put into operation by professionals. Since a cool idea without a competent technical implementation is most likely to fail.`,
          icon: '',
          image: '',
          benefits: [],
        },
        {
          name: 'ONLINE STORE',
          text: `An online store is a form of electronic commerce that allows consumers to purchase goods or services using a web browser. Consumers find the product of interest by visiting the retailer's website directly or by searching among alternative suppliers. Trading can take place through a small local store, a large retailer, an e-commerce store, or an individual who sells goods through a third-party service. If you need to know what an online store is and how it works, in this article we will describe in detail its structure and tell you how to run a successful online business. The online store has a rather complex structure, which includes both the main menu and submenu elements. The main menu should display the most important information about product categories and promotions. One of the best ways to know which pages to include in the navigation bar and which to skip or use as part of a dropdown is to view user flow data in Google Analytics.`,
          additional_text: `

An example of a successfully created structure can be seen on the websites of many sports brands. Each site displays very simple navigation, despite the fact that the site offers a wide variety of products. This simplicity makes sense. When you want to shop for shorts, you wouldn't want to start with the shorts category because it will show products for both men and women. Instead, when you land on a global sports brand site, you can start by scrolling through the main category you need, and then the options get more and more specific. In this case, the main category is half-customer.

The structure of the online store is based on the "from simple to complex" model, where each category contains even more categories. The structure of a good service includes a convenient search by category, which should be displayed both on the main page and in subcategories.`,
          icon: '',
          image: '/services/websites/store.png',
          benefits: [
            'the possibility of buying with a few clicks of the mouse',
            'wide audience coverage (no geo-referencing)',
            'unlimited number of products in the showcase',
            '24/7 availability',
            'the ability to compare and evaluate products',
            'low prices due to lower costs compared to an offline store',
          ],
        },
        {
          name: 'LANDING',
          text: `Landing or landing page (landing page) is a one-page type of site for capturing the attention of the client for the subsequent performance of the targeted action. A minimum of all distractions: the landing page contains only key information that can interest and encourage you to make a purchase of a product or order services.

Other names for a landing page are a landing page, a capture page.

What is the correct landing?

First, it is a simple and user-friendly design. Due to its lightness, the landing page loads quickly and does not cause unnecessary questions.

Secondly, the landing page contains key information about why the client should make a purchase or take another targeted action (for example, subscribe to a newsletter). Benefits, time-limited promotions, high-quality photos, calls to action are the main points that make up a landing page.

Now there is a real flowering of landings. And there are reasons for this. The main advantage of this type of sites is increased conversion due to narrow focus (a specific product / service for a specific audience). Nothing superfluous - that's the secret to the success of the capture page.

Unlike a huge storefront of an online store, a landing page visitor sees only one thing. When we do not have a wide choice, then often we are even glad of this - there is no need to waste time and energy on comparison and choice.

The disadvantage of landing is just its advantage in the form of a narrow focus. It's like a double-edged sword. If you have a second (third, tenth, thousandth) product / service, then there are two ways out. The first one is once again to make a new landing page for it. The second is to create an online store with a wide range of products.

Some owners of online stores use landing pages at the same time. And this is quite justified. For example, they have a very popular product on sale. It sells well in the store, but if you additionally organize a landing page specifically for this product, then sales will go even better. This tactic of simultaneously attacking on all fronts is becoming more common in online commerce. Why not? After all, it is effective and does not require special costs.`,
          icon: '',
          image: '',
          benefits: [],
        },
      ],
    }
  },
}
</script>
<style lang="scss" scoped>
.wrapper__example__link {
  width: fit-content;
  align-self: center;
}
.example__link {
  width: 100px !important;
  &:not(:last-child) {
    margin-right: 20px;
  }
  display: flex;
  a {
    margin: auto;
    text-decoration: none;
    font-weight: 700;
    color: white;
  }
}
</style>
