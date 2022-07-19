export const FETCH_SCOPES = () => {
  return `query fetchScopes {
        scope_area(where: {is_show: {_eq: true}})  {
          collout
          description
          id
          subtitle
          svg
          title
          tools
        }
      }  
    `
}
