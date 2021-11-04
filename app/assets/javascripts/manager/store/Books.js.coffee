Ext.define "BS.store.Books",
  extend: "Ext.data.Store"
  model: "BS.model.Book"
  pageSize: 25
  autoSync: true
  sorters: [
    property: "id"
  ]

  proxy:
    type: "rest"
    url: "/manager/books"
    actionMethods:
      read: 'POST'
    reader:
      type: "json"
      root: "data"
      successProperty: "success"
      messageProperty: "message"
