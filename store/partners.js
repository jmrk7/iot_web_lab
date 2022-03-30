import { GET_PARTNERS } from '@/graphql/gql/partners/types'
import { hasura } from '@/axios'

export const actions = {
  async fetchPartners({ commit }) {
    const { partners } = await hasura({
      data: {
        query: GET_PARTNERS,
      },
    })
    commit('SET_PARTNERS', partners)
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
