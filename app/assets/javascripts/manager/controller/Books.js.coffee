Ext.define "BS.controller.Books",
  extend: "Ext.app.Controller"

  views:  ["books.Filter", "books.Panel", "books.List"]
  models: ["BooksCategory", "Book"]
  stores: ["BooksCategory", "Books"]


  refs: [
    selector: 'books_filters button[action=search]'
    ref: 'searchBtn'
  ,
    selector: 'books_filters'
    ref: 'filters'
  ,
    selector: 'books_list'
    ref: 'grid'
  ]



  init: ->
    @control
      "books_filters button[action=search]":
        click: @search
      "books_filters combobox":
        select: @search
      "books_list button[action=create]":
        click: @addNewBook


  addTabsEvents: ->
    @search()


  search: ->
    filters = @getFilters().getForm().getValues()
    store = @getBooksStore()
    store.getProxy().extraParams = filters

    hasValues = true for f of filters when filters[f]
    unless hasValues
      return store.loadData([],false)

    #reset page
    store.currentPage = 1
    store.getProxy().extraParams._method = 'get'
    store.load
      callback: ->
        @selectCurrentRecord()
      scope: this

  selectCurrentRecord: ->
    rec = @getGrid().getStore().getById(@currentId)
    @getGrid().getSelectionModel().select(rec) if rec

  addNewBook: ->
    
