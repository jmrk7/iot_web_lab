import {
  FETCH_BLOCKCHAIN_TECHNOLOGIES,
  FETCH_BLOCKCHAIN_CLOUDS,
} from '@/graphql/gql/blockchain/types'
import { hasura } from '@/axios'

export const actions = {
  async fetchTechnologies({ commit }, data) {
    const result = await hasura({
      data: {
        query: FETCH_BLOCKCHAIN_TECHNOLOGIES(data),
      },
    })
    if (result.blockchain_technologies) {
      commit('SET_BLOCKCHAIN_TECHNOLOGIES', result.blockchain_technologies)
    } else {
      throw new Error("CANN'T SET_ECOMMERCE_SCOPES in action 'blockchain'")
    }
  },
  async fetchClouds({ commit }, data) {
    const result = await hasura({
      data: {
        query: FETCH_BLOCKCHAIN_CLOUDS(data),
      },
    })
    if (result.blockchain_clouds) {
      commit('SET_BLOCKCHAIN_CLOUDS', result.blockchain_clouds)
    } else {
      throw new Error("CANN'T SET_BLOCKCHAIN_CLOUDS in action 'blockchain'")
    }
  },
}

export const mutations = {
  SET_BLOCKCHAIN_TECHNOLOGIES(state, data) {
    state.technologies = data
  },
  SET_BLOCKCHAIN_CLOUDS(state, data) {
    state.clouds = data
  },
}

export const state = () => ({
  technologies: [],
  clouds: [],
})

export const getters = {
  technologies: (state) => state.technologies,
  clouds: (state) => state.clouds,
}
