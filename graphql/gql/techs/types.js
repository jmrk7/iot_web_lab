export const FETCH_TECHS = () => {
  return `query fetchTechs {
    technologies {
          id
          svg
          title
        }
      }  
    `
}
