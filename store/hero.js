import { FETCH_HERO_ITEMS } from '@/graphql/gql/hero/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchHeroCaruselItems({ commit }, data) {
    const response = await hasura({
      data: {
        query: FETCH_HERO_ITEMS(data),
      },
    })
    if (response.hero_carusel_item) {
      commit('SET_HERO_CARUSEL_ITEMS', response.hero_carusel_item)
    } else {
      errorHandler('SET_HERO_CARUSEL_ITEMS', 'hero')
    }
  },
}

export const mutations = {
  SET_HERO_CARUSEL_ITEMS(state, items) {
    state.heroItems = items
  },
}

export const state = () => ({
  heroItems: [],
})

export const getters = {
  heroItems: (state) => state.heroItems,
}
