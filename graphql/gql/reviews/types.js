export const FETCH_REVIEWS = () => {
  return `query fetchReviews{
        reviews {
          avatar
          id
          name
          post
          review
        }
      } 
    `
}
