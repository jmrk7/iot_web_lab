export const FETCH_HERO_ITEMS = () => {
  return `query fetchHeroCaruselItems {
    hero_carusel_item(order_by: {priority: asc}) {
          heading
          id
          src
          subHeading
        }
      }  
    `
}
