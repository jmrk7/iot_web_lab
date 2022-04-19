import {
  INSERT_REQUEST,
  FETCH_REQUEST_BY_EMAIL,
} from '@/graphql/gql/customer/types'
import { hasura, email } from '@/axios'
import { errorHandler } from './helpers/helper'

export const actions = {
  async insertCustomerRequest({ commit }, data) {
    const response = await hasura({
      data: {
        query: INSERT_REQUEST(data),
      },
    })
    if (response && response.insert_customer_requests_one.id) {
      return response.insert_customer_requests_one.id
    } else {
      return errorHandler("Cann't insert message to db", 'customer')
    }
  },

  async sendCustomerRequestToMail({ commit }, data) {
    return await email({
      data,
    })
  },

  async fetchCustomerRequestByEamil({ commit }, data) {
    const response = await hasura({
      data: {
        query: FETCH_REQUEST_BY_EMAIL(data),
      },
    })

    if (response.customer_requests.length > 0) {
      return response.customer_requests[0]
    } else {
      return null
    }
  },
}

export const mutations = {}

export const state = () => ({})

export const getters = {}
