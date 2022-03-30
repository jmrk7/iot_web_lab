import { FETCH_ECOMMERCE_SCOPES } from '@/graphql/gql/ecommerce/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchEcommerceScopes({ commit }, data) {
    const response = await hasura({
      data: {
        query: FETCH_ECOMMERCE_SCOPES(data),
      },
    })
    if (response.ecommerce_scope) {
      commit('SET_ECOMMERCE_SCOPES', response.ecommerce_scope)
    } else {
      errorHandler('SET_ECOMMERCE_SCOPES', 'ecommerce')
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
