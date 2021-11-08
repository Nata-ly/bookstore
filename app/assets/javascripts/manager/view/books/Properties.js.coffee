Ext.define "BS.view.books.Properties",
  extend: "Ext.form.Panel"
  alias: "widget.book_properties"
  store: "Books"

  initComponent: ->
    @items = [
      @getMainProperties()
    ]

    @bbar = [
      "->"
    ,
      text: "Сохранить"
      action: "save"
    ,
      "-"
    ,
      text: "Удалить"
      action: "delete"
    ]

    @callParent arguments

  getMainProperties: ->
    xtype: 'fieldset'
    title: 'Общие данные'
    margin: 5
    layout: 'anchor'
    items: [
      padding: 5
      xtype: "container"
      flex: 1
      layout: "vbox"
      defaultType: 'textfield'
      defaults:
        width: '100%'
        labelAlign: "right"
        labelWidth: 150
      items: [
        fieldLabel: 'Название'
        name: "title"
        allowBlank: false
      ,
        fieldLabel: 'Описание'
        name: "description"
        allowBlank: false
      ,
        fieldLabel: 'Цена'
        name: "price"
        allowBlank: false
      ,
        fieldLabel    : "Категория"
        xtype: "combobox"
        store         : Ext.create('BS.store.BooksCategory')
        name          : "category_id"
        displayField  : 'category'
      ,
        fieldLabel    : "Автор"
        xtype: "combobox"
        store         : ''
        name          : "author_id"
        displayField  : 'author'
      ]
    ]
