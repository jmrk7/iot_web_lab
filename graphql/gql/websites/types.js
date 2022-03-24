export const FETCH_WEBSITES_TYPES = () => {
  return `query fetchWebsitesTypes{
        websites_types {
          additional_text
          benefits
          icon
          id
          image
          name
          text
        }
      }  
    `
}
