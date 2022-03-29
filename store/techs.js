import { FETCH_TECHS } from '@/graphql/gql/techs/types'
import { hasura } from '@/axios'

export const actions = {
  async fetchTechs({ commit }, data) {
    const result = await hasura({
      data: {
        query: FETCH_TECHS(data),
      },
    })
    if (result.technologies) {
      commit('SET_TECHS', result.technologies)
    } else {
      throw new Error("CANN'T SET_SCOPES in action 'solution'")
    }
  },
}

export const mutations = {
  SET_TECHS(state, techs) {
    state.techs = techs
  },
}

export const state = () => ({
  techs: [],
})

export const getters = {
  techs: (state) => state.techs,
}
