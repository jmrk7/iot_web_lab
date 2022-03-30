import { GET_PROJECTS } from '@/graphql/gql/projects/types'
import { hasura } from '@/axios'

export const actions = {
  async fetchProjects({ commit }) {
    const { projects } = await hasura({
      data: {
        query: GET_PROJECTS,
      },
    })
    commit('SET_PROJECTS', projects)
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
