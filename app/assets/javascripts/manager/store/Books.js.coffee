Ext.define "BS.store.Books",
  extend: "Ext.data.Store"
  model: "BS.model.Book"
  autoLoad: true,
  sorters: [
    property: "id"
  ]
