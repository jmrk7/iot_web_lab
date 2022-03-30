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
          head.push({
            hid: 'keywords',
            name: 'keywords',
            content: meta.keywords.join(),
          })
        }

        return head
      } else {
        return {}
      }
    },
  },
})
