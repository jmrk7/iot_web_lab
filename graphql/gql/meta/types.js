export const GET_META_TAG = (data) => `
query fetchMetaTag {
  meta_tags(where: {host: {_eq: "${data}"}}) {
    description
    host
    id
    keywords
    title
  }
}
`
