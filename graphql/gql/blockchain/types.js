export const FETCH_BLOCKCHAIN_TECHNOLOGIES = () => {
  return `query fetchTechnologies{
        blockchain_technologies {
          name
          id
          icon
        }
      }  
    `
}

export const FETCH_BLOCKCHAIN_CLOUDS = () => {
  return `query fetchTechnologies{
        blockchain_clouds {
          name
          id
          src
        }
      }  
    `
}
