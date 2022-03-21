import { FETCH_ECOMMERCE_SCOPES } from '@/graphql/gql/ecommerce/types'
import axios from 'axios'

export const actions = {
  async fetchEcommerceScopes({ commit }, data) {
    const result = await axios({
      url: 'http://localhost:8080/v1/graphql/',
      method: 'post',
      data: {
        query: FETCH_ECOMMERCE_SCOPES(data),
      },
    })

    if (result.data.data?.ecommerce_scope) {
      commit('SET_ECOMMERCE_SCOPES', result.data.data.ecommerce_scope)
    } else {
      throw new Error("CANN'T SET_ECOMMERCE_SCOPES in action 'ecommerce'")
    }
  },
}

export const mutations = {
  SET_ECOMMERCE_SCOPES(state, scopes) {
    state.scopes = scopes
  },
}

export const state = () => ({
  scopes: [],
})

export const getters = {
  scopes: (state) => state.scopes,
}
