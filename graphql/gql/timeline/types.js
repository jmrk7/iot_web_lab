export const FETCH_TIMELINE_YEARS = () => {
  return `query fetchTimeline {
        timeline {
          color
          decsription
          id
          title
          year
        }
      } 
    `
}
