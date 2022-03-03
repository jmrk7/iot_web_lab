import { GET_PROJECTS } from '@/graphql/gql/projects/types'
import axios from 'axios'

export const actions = {
  async fetchProjects() {
    const result = await axios({
      url: 'http://localhost:8080/v1/graphql/',
      method: 'post',
      data: {
        query: GET_PROJECTS,
      },
    })

    return result.data.data.projects
  },
}
