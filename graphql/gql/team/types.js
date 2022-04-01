export const FETCH_TEAM = () => {
  return `query fetchTeam{
        team {
          photo
          id
          name
          position
          phone
        }
      } 
    `
}
