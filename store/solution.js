import { FETCH_SCOPES } from '@/graphql/gql/solution/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchScopeAreas({ commit }, data) {
    const response = await hasura({
      data: {
        query: FETCH_SCOPES(data),
      },
    })
    if (response.scope_area) {
      commit('SET_SCOPES', response.scope_area)
    } else {
      errorHandler('SET_SCOPES', 'solution')
    }
  },
}

export const mutations = {
  SET_SCOPES(state, scopes) {
    state.scopes = scopes
  },
}

export const state = () => ({
  scopes: [],
})

export const getters = {
  scopes: (state) => state.scopes,
}
