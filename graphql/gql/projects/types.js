export const GET_PROJECTS = `
query fetchProjects {
    projects (order_by: {url_img: asc}) {
        challenge
        description
        id
        integrations
        name
        solution
        technologies
        urls
        url_img
    }
  }
`
