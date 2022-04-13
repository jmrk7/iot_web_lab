import { FETCH_TECHS } from '@/graphql/gql/techs/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchTechs({ commit }, data) {
    const { technologies } = await hasura({
      data: {
        query: FETCH_TECHS(data),
      },
    })
    if (technologies) {
      commit('SET_TECHS', technologies)
    } else {
      errorHandler('SET_TECHS', 'techs')
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
  techs: (state) => {
    if (state.techs.length) {
      return state.techs
        .map((item) => item)
        .sort((a, b) => (a.stack > b.stack ? 1 : -1))
        .sort((a, b) => (a.sort_priority > b.sort_priority ? 1 : -1))
    } else {
      return []
    }
  },
}
