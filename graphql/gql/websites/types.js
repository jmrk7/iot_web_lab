export const FETCH_WEBSITES_TYPES = () => {
  return `query fetchWebsitesTypes{
        websites_types(where: {is_show: {_eq: true}}) {
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
