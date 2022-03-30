import { GET_META_TAG } from '@/graphql/gql/meta/types'
import { hasura } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async fetchMetaTags({ commit }, data) {
    const response = await hasura({
      data: {
        query: GET_META_TAG(data),
      },
    })
    if (response.meta_tags) {
      commit('SET_META_TAG', response.meta_tags)
    } else {
      errorHandler('SET_META_TAG', 'meta')
    }
  },
}

export const mutations = {
  SET_META_TAG(state, meta) {
    state.meta = meta
  },
}

export const state = () => ({
  meta: [],
})

export const getters = {
  meta: (state) => state.meta[0],
}
