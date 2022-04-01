import { FETCH_REVIEWS } from '@/graphql/gql/reviews/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchReviews({ commit }) {
    const response = await hasura({
      data: {
        query: FETCH_REVIEWS(),
      },
    })
    if (response.reviews) {
      commit('SET_REVIEWS', response.reviews)
    } else {
      errorHandler('SET_REVIEWS', 'reviews')
    }
  },
}

export const mutations = {
  SET_REVIEWS(state, reviews) {
    state.reviews = reviews
  },
}

export const state = () => ({
  reviews: [],
})

export const getters = {
  reviews: (state) => state.reviews,
}
