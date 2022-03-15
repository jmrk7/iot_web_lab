import { FETCH_TECHS } from '@/graphql/gql/techs/types'
import axios from 'axios'

export const actions = {
  async fetchTechs({ commit }, data) {
    const result = await axios({
      url: 'http://localhost:8080/v1/graphql/',
      method: 'post',
      data: {
        query: FETCH_TECHS(data),
      },
    })

    if (result.data.data?.technologies) {
      commit('SET_TECHS', result.data.data.technologies)
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
