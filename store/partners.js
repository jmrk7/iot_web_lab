import { GET_PARTNERS } from '@/graphql/gql/partners/types'
import axios from 'axios'

export const actions = {
  async fetchPartners() {
    const result = await axios({
      url: 'http://localhost:8080/v1/graphql/',
      method: 'post',
      data: {
        query: GET_PARTNERS,
      },
    })

    return result.data.data.partners
  },
}
