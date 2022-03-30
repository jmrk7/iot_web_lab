import {
  FETCH_BLOCKCHAIN_TECHNOLOGIES,
  FETCH_BLOCKCHAIN_CLOUDS,
} from '@/graphql/gql/blockchain/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchTechnologies({ commit }, data) {
    const response = await hasura({
      data: {
        query: FETCH_BLOCKCHAIN_TECHNOLOGIES(data),
      },
    })
    if (response.blockchain_technologies) {
      commit('SET_BLOCKCHAIN_TECHNOLOGIES', response.blockchain_technologies)
    } else {
      errorHandler('SET_ECOMMERCE_SCOPES', 'blockchain')
    }
  },
  async fetchClouds({ commit }, data) {
    const response = await hasura({
      data: {
        query: FETCH_BLOCKCHAIN_CLOUDS(data),
      },
    })
    if (response.blockchain_clouds) {
      commit('SET_BLOCKCHAIN_CLOUDS', response.blockchain_clouds)
    } else {
      errorHandler('SET_BLOCKCHAIN_CLOUDS', 'blockchain')
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
