import axios from 'axios'

export const hasura = axios.create({
  baseURL: `http://localhost:8080/v1/graphql/`,
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
  baseURL: `http://localhost:7000/public/send_mail.php`,
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
})
