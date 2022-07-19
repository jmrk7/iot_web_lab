import { GET_PARTNERS } from '@/graphql/gql/partners/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchPartners({ commit }) {
    const { partners } = await hasura({
      data: {
        query: GET_PARTNERS,
      },
    })
    if (partners) {
      commit('SET_PARTNERS', partners)
    } else {
      return errorHandler('SET_PARTNERS', 'partners')
    }
  },
}

export const mutations = {
  SET_PARTNERS(state, partners) {
    state.partners = partners
  },
}

export const state = () => ({
  partners: [],
})

export const getters = {
  partners: (state) => state.partners,
}
