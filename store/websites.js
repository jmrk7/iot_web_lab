import { FETCH_WEBSITES_TYPES } from '@/graphql/gql/websites/types'
import axios from 'axios'

export const actions = {
  async fetchWebsitesTypes({ commit }, data) {
    const result = await axios({
      url: 'http://localhost:8080/v1/graphql/',
      method: 'post',
      data: {
        query: FETCH_WEBSITES_TYPES(data),
      },
    })
    if (result.data.data?.websites_types) {
      commit('SET_WEBSITES_TYPES', result.data.data.websites_types)
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
