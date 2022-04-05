export const actions = {
  async nuxtServerInit({ dispatch }) {
    await dispatch('hero/fetchHeroCaruselItems')
    await dispatch('partners/fetchPartners')
    await dispatch('solution/fetchScopeAreas')
    await dispatch('techs/fetchTechs')
    await dispatch('reviews/fetchReviews')
    await dispatch('timeline/fetchTimeline')
    await dispatch('team/fetchTeam')
    await dispatch('projects/fetchProjects')
    await dispatch('blockchain/fetchTechnologies')
    await dispatch('blockchain/fetchClouds')
    await dispatch('ecommerce/fetchEcommerceScopes')
    await dispatch('websites/fetchWebsitesTypes')
  },
}
