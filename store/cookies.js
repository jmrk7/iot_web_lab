export const actions = {
  async sendStatus({ commit }, data) {
    await new Promise((resolve, reject) => {
      commit('SET_IS_SHOW_STATUS', data)
    })
  },
}

export const mutations = {
  SET_IS_SHOW_STATUS(state, isShow) {
    state.isShow = isShow
  },
}

export const state = () => ({
  isShow: false,
})

export const getters = {
  isShow: (state) => state.isShow,
}
