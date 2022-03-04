import { GET_PROJECTS } from '@/graphql/gql/projects/types'
import axios from 'axios'

export const actions = {
  async fetchProjects({ commit }) {
    const result = await axios({
      url: 'http://localhost:8080/v1/graphql/',
      method: 'post',
      data: {
        query: GET_PROJECTS,
      },
    })

    commit('SET_PROJECTS', result.data.data.projects)
  },
}

export const mutations = {
  SET_PROJECTS(state, projects) {
    state.projects = projects
  },
}

export const state = () => ({
  projects: [],
})

export const getters = {
  projects: (state) => state.projects,
}
