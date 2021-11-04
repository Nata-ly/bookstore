Ext.define "BS.controller.Books",
  extend: "Ext.app.Controller"

  views:  ["books.Filter", "books.Panel"]
  models: ["BooksCategory", "Book"]
  stores: ["BooksCategory", "Books"]


  refs: [
    selector: 'books_filters button[action=search]'
    ref: 'searchBtn'
  ,
    selector: 'books_filters'
    ref: 'filters'
  ]



  init: ->
    @control
      "books_filters button[action=search]":
        click: @search
      "books_filters combobox":
        select: @search


  addTabsEvents: ->
    @search()

  search: ->
