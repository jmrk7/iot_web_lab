<template>
  <article id="cookies">
    <SectionsHeroAlt :hero-alt="heroAlt" />
    <section class="py-8">
      <v-container
        ><p v-for="p in police" :key="p">{{ p }}</p></v-container
      >
    </section>
  </article>
</template>
<script>
export default {
  async fetch({ store }) {
    await store.dispatch('meta/fetchMetaTags', this.name)
  },
  data() {
    return {
      police: [
        `Cookies are small text files. Websites send cookies to those who visit them ("users"). They are stored on the computer's hard drive, which allows the website to recognize users and store some information about them in order to provide or improve the service they offer. This applies to the user's personal computer as well as any other device that the user may use to visit the website.`,

        `There are different types of cookies. Some of them are necessary for users to browse the site, others have other purposes, such as providing internal security, performing system administration tasks, performing statistical analysis, understanding which sections of the website are most important to users, or allowing personalization. site visit. The site only uses technical cookies, while it does not use any of the so-called consumer profiling cookies. Technical cookies are cookies used exclusively for the transmission of messages over an electronic communications network. They are strictly required by the service provider if the subscriber or user has explicitly requested the service. They are not used for any other purpose and are usually set by the owner or operator of the website.`,

        `They can be divided into browsing cookies, also called session cookies, which guarantee the correct browsing and use of the website (for example, allow you to make a purchase or authenticate to access restricted areas); analytical cookies, similar to technical cookies, are used directly by the site operator to collect information about the number of users and how they actually visit the site; functional cookies that allow the user to browse according to selected criteria (for example, by language or by products selected for purchase) in order to improve the service. Disabling cookies may limit your ability to use a particular website, preventing you from taking full advantage of certain features and services on the Site. The user can decide what to accept or reject. A description of the cookies used on this Site is provided below.`,

        `First-party cookies: First-party cookies (cookies that actually belong to the publisher's site that created them) are set by the website visited by the user whose address appears in the URL bar. The use of these cookies allows us to effectively manage the site and track visitor behavior. Third Party Cookies. Third party cookies are set by a different domain, except for single user visits. If a user visits a site and another company sends information using that site, we have so-called "third party cookies". So-called "session cookies" are stored only temporarily. They are actually removed when the user closes the browser.`,

        `Once one person is registered on the Site, cookies may be used to collect personal data to identify the user on subsequent visits, and to facilitate login and access to the site (for example, storing your username and password) and navigating such same. Taxileader.net also uses cookies for system administration. The Site may contain links to other sites. Taxileader.net does not have access to or control over cookies, web beacons and any other tracking technologies used on third party sites that the user can access from the site itself. Taxileader.net does not control the availability of any content and materials published or obtained through such sites and the procedures they use when processing personal data. Taxileader.net, given the number of such third party websites, expressly disclaims all liability.`,

        `You should always check the privacy policies of third party sites available from the Site for the terms and conditions applicable to the processing of personal data, as Taxileader.net's "Privacy Policy" applies only to the Site, as defined above.`,

        `Persistent cookies: Persistent cookies are stored on the user's device between browser pages, allowing the user to remember settings or actions on the site. They can be used for a variety of purposes, such as remembering preferences and choices when using the site.`,

        `Essential cookies: These cookies are essential for the website to function properly. Without them, some parts of the site will not work. For example, they include cookies that provide access to secure areas of the Site. These cookies do not collect information for marketing purposes and cannot be disabled.`,

        `Functional cookies: these cookies are used to recognize the user who returns to the site again. They allow you to customize content and remember your preferences (such as your chosen language or area). These cookies do not collect information that can identify the user. All information collected is anonymous.`,
      ],

      heroAlt: [
        {
          src: 'pexels-ekaterina-bolovtsova-4048767.jpg',
          heading: 'Cookies Policy',
        },
      ],
    }
  },
  head() {
    return this.makeCurrentMeta(this.$store.getters['meta/meta'])
  },
}
</script>
