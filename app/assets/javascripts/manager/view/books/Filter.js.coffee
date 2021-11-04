Ext.define "BS.view.books.Filter",
  extend      : "Ext.form.Panel"
  alias       : "widget.books_filters"
  title       : "Фильтры"
  bodyPadding : 5
  border      : false
  style       :
    "border-bottom": "1px solid #99bbe8;"
  layout      : "vbox"
  defaults    :
    labelAlign    : "right"
    queryMode     : "local"
    lazyLoad      : true
    width: "100%"
    valueField    : "id"
    displayField  : "name"

  defaultType : "combobox"
  items       : [
    fieldLabel    : 'Название'
    xtype         : "textfield"
    name          : "query"
  ,
    fieldLabel    : 'Автор'
    store         : ''
    name          : "author_id"

  ,
    fieldLabel    : "Категория"
    store         : Ext.create('BS.store.BooksCategory')
    name          : "category_id"
    displayField  : 'category'
  ,
    fieldLabel    : "ID книги"
    xtype         : "textfield"
    name          : "id_filter"
  ]
  buttons     : [
    text          : "Искать"
    action        : "search"
  ]
