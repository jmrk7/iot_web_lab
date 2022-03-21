export const FETCH_ECOMMERCE_SCOPES = () => {
  return `query fetchEcommerceScopes {
        ecommerce_scope {
          name
          id
          text
          icon
        }
      }  
    `
}
