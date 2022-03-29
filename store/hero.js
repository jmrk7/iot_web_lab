import { FETCH_HERO_ITEMS } from '@/graphql/gql/hero/types'
import { hasura } from '@/axios'

export const actions = {
  async fetchHeroCaruselItems({ commit }, data) {
    const result = await hasura({
      data: {
        query: FETCH_HERO_ITEMS(data),
      },
    })
    if (result.hero_carusel_item) {
      commit('SET_HERO_CARUSEL_ITEMS', result.hero_carusel_item)
    } else {
      throw new Error("CANN'T SET_SCOPES in action 'solution'")
    }
  },
}

export const mutations = {
  SET_HERO_CARUSEL_ITEMS(state, items) {
    state.heroItems = items
  },
}

export const state = () => ({
  scopes: [],
})

export const getters = {
  heroItems: (state) => state.heroItems,
}
