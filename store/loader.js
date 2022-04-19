export const actions = {
  async setStatus({ commit }, status) {
    await new Promise((resolve, reject) => {
      commit('SET_STATUS', status)
      resolve(status)
    })
  },
}

export const mutations = {
  SET_STATUS(state, status) {
    state.status = status
  },
}

export const state = () => ({
  status: true,
})

export const getters = {
  isShow: (state) => state.status,
}
