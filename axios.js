import axios from 'axios'

export const hasura = axios.create({
  baseURL: process.env.HASURA_SERVER_HOST,
  method: 'POST',
})

hasura.interceptors.response.use(
  (response) => {
    return response.data.data
  },
  (error) => {
    return Promise.reject(error.message)
  }
)

export const email = axios.create({
  baseURL: process.env.EMAIL_SERVER_HOST,
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
})
