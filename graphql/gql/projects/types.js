export const GET_PROJECTS = `
query fetchProjects {
    projects {
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
