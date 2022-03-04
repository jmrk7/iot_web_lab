export const INSERT_REQUEST = (data) => {
  return `mutation insertRequest {
            insert_customer_requests_one(object: {
                    subject: "${data.subject}", 
                    name: "${data.name}", 
                    message: "${data.message}", 
                    email: "${data.email}"
                }) {
            id
            }
        }
        `
}
