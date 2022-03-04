import { INSERT_REQUEST } from '@/graphql/gql/customer/types'
import axios from 'axios'

export const actions = {
  async insertCustomerRequest({ commit }, data) {
    const result = await axios({
      url: 'http://localhost:8080/v1/graphql/',
      method: 'post',
      data: {
        query: INSERT_REQUEST(data),
      },
    })

    return result.data.data.id
  },
}

export const mutations = {}

export const state = () => ({})

export const getters = {}
