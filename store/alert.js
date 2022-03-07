export const actions = {
  async sendAlert({ commit }, data) {
    await new Promise((resolve, reject) => {
      if (data) {
        commit('SET_ALERT_MESSAGE', data)
        setTimeout(() => {
          commit('SET_ALERT_MESSAGE', null)
        }, 5000)
        resolve(data)
      }
    })
  },
}

export const mutations = {
  SET_ALERT_MESSAGE(state, alert) {
    state.alert = alert
  },
}

export const state = () => ({
  alert: null,
})

export const getters = {}
