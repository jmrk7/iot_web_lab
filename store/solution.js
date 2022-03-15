import { FETCH_SCOPES } from '@/graphql/gql/solution/types'
import axios from 'axios'

export const actions = {
  async fetchScopeAreas({ commit }, data) {
    const result = await axios({
      url: 'http://localhost:8080/v1/graphql/',
      method: 'post',
      data: {
        query: FETCH_SCOPES(data),
      },
    })

    if (result.data.data?.scope_area) {
      commit('SET_SCOPES', result.data.data.scope_area)
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
