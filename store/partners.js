import { GET_PARTNERS } from '@/graphql/gql/partners/types'
import axios from 'axios'

export const actions = {
  async fetchPartners({ commit }) {
    const result = await axios({
      url: 'http://localhost:8080/v1/graphql/',
      method: 'post',
      data: {
        query: GET_PARTNERS,
      },
    })

    commit('SET_PARTNERS', result.data.data.partners)
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
