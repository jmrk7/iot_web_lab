import { FETCH_TIMELINE_YEARS } from '@/graphql/gql/timeline/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchTimeline({ commit }) {
    const response = await hasura({
      data: {
        query: FETCH_TIMELINE_YEARS(),
      },
    })
    if (response.timeline) {
      commit('SET_TIMELINE', response.timeline)
    } else {
      errorHandler('SET_TIMELINE', 'timeline')
    }
  },
}

export const mutations = {
  SET_TIMELINE(state, years) {
    state.years = years
  },
}

export const state = () => ({
  years: [],
})

export const getters = {
  years: (state) => state.years,
}
