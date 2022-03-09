import {
  INSERT_REQUEST,
  FETCH_REQUEST_BY_EMAIL,
} from '@/graphql/gql/customer/types'
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
    console.log(result)
    if (result.data?.data?.insert_customer_requests_one.id) {
      return result.data.data.insert_customer_requests_one.id
    } else {
      throw new Error("Can't insert message to DB")
    }
  },

  async fetchCustomerRequestByEamil({ commit }, data) {
    const result = await axios({
      url: 'http://localhost:8080/v1/graphql/',
      method: 'post',
      data: {
        query: FETCH_REQUEST_BY_EMAIL(data),
      },
    })

    if (result.data.data.customer_requests.length > 0) {
      return result.data.data.customer_requests[0]
    } else {
      return null
    }
  },
}

export const mutations = {}

export const state = () => ({})

export const getters = {}
