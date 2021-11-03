Ext.define "BS.model.BooksCategory",
  extend: "Ext.data.Model"
  fields: [
    { name: 'category_id', type: 'int' }
    { name: 'category', type: 'string' }
  ]
  idProperty: "category_id"
