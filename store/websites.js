import { FETCH_WEBSITES_TYPES } from '@/graphql/gql/websites/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchWebsitesTypes({ commit }, data) {
    const response = await hasura({
      data: {
        query: FETCH_WEBSITES_TYPES(data),
      },
    })
    if (response.websites_types) {
      commit('SET_WEBSITES_TYPES', response.websites_types)
    } else {
      errorHandler('SET_WEBSITES_TYPES', 'websites')
    }
  },
}

export const mutations = {
  SET_WEBSITES_TYPES(state, data) {
    state.types = data
  },
}

export const state = () => ({
  types: [],
})

export const getters = {
  types: (state) => state.types,
}
