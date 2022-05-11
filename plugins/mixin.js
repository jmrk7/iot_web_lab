import Vue from 'vue'

Vue.mixin({
  methods: {
    makeCurrentMeta(meta) {
      if (meta) {
        const head = {
          title: meta.title,
          meta: [],
        }
        if (meta.description) {
          head.meta.push({
            hid: 'description',
            name: 'description',
            content: meta.description,
          })
        }
        if (meta.keywards) {
          head.meta.push({
            hid: 'keywords',
            name: 'keywords',
            content: meta.keywords.join(),
          })
        }
        if (meta.additional && meta.additional.length) {
          meta.additional.forEach((element) => {
            head.meta.push({
              content: element.content,
              property: element.property,
            })
          })
        }

        return head
      } else {
        return {}
      }
    },
  },
})
