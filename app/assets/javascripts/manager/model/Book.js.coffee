Ext.define "BS.model.Book",
  extend: "Ext.data.Model"
  fields: [
    "id"
  ,
    type: "string"
    name: "title"
  ,
    type: "string"
    name: "picture_url"
  ,
    type: "string"
    name: "description"
  ,
    type: "real"
    name: "price"
  ,
    type: "int"
    name: "author_id"
  ,
    type: "int"
    name: "category_id"
  ]
  proxy:
    type: "rest"
    url: "/manager/books"
    writer:
      root: "book"
    reader:
      root: "data"
  idProperty: "id"
