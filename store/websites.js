import { FETCH_WEBSITES_TYPES } from '@/graphql/gql/websites/types'
import { hasura } from '@/axios'

export const actions = {
  async fetchWebsitesTypes({ commit }, data) {
    const result = await hasura({
      data: {
        query: FETCH_WEBSITES_TYPES(data),
      },
    })
    if (result.websites_types) {
      commit('SET_WEBSITES_TYPES', result.websites_types)
    } else {
      throw new Error("CANN'T SET_WEBSITES_TYPES in action 'websites'")
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
