import { FETCH_SCOPES } from '@/graphql/gql/solution/types'
import { hasura } from '@/axios'

export const actions = {
  async fetchScopeAreas({ commit }, data) {
    const result = await hasura({
      data: {
        query: FETCH_SCOPES(data),
      },
    })
    if (result.scope_area) {
      commit('SET_SCOPES', result.scope_area)
    } else {
      throw new Error("CANN'T SET_SCOPES in action 'solution'")
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
