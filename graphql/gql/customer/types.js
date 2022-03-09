export const INSERT_REQUEST = (data) => {
  return `mutation insertRequest {
    insert_customer_requests_one(object: {
      subject: "${data.subject}",
      name: "${data.name}", 
      message: "${data.message}", 
      email: "${data.email}", 
      file: "${data.file}", 
      link: "${data.link}"
    }) {
      id
    }
  }
        `
}

export const FETCH_REQUEST_BY_EMAIL = (data) => {
  return `query fetchCustomerRequestByEmail {
        customer_requests(where: {email: {_eq: "${data}"}}) {
          id
        }
      }  
    `
}
