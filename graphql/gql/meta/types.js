export const GET_META_TAG = () => `
query fetchMetaTag {
  meta_tags {
    description
    host
    id
    keywords
    title
  }
}
`
