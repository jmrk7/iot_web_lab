export const FETCH_SCOPES = () => {
  return `query fetchScopes {
        scope_area {
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
