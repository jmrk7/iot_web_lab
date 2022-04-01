import { FETCH_TEAM } from '@/graphql/gql/team/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchTeam({ commit }) {
    const response = await hasura({
      data: {
        query: FETCH_TEAM(),
      },
    })
    if (response.team) {
      commit('SET_TEAM', response.team)
    } else {
      errorHandler('SET_TEAM', 'team')
    }
  },
}

export const mutations = {
  SET_TEAM(state, team) {
    state.team = team
  },
}

export const state = () => ({
  team: [],
})

export const getters = {
  team: (state) => state.team,
}
