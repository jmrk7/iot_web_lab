export const FETCH_HERO_ITEMS = () => {
  return `query fetchHeroCaruselItems {
    hero_carusel_item {
          heading
          id
          src
          subHeading
        }
      }  
    `
}
