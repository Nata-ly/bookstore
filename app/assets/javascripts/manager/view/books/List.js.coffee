Ext.define "BS.view.books.List",
  extend: "Ext.grid.Panel"
  alias: "widget.books_list"
  store: "Books"
  border: false
  scroll: false
  pageSizeConfig:
    fitPageSize: true
    hasTopBar: true

  style:
    "border-top": "1px solid #99bbe8;"
  initComponent: ->
    @columns =
      defaults:
        menuDisabled: true

      items: [
        header    : "ID"
        dataIndex : "id"
        width     : 60
      ,
        header    : 'Название'
        dataIndex : "title"
        flex      : 1
      ]
    @tbar = [
        xtype    : "button"
        text     : 'Создать РК'
        action   : 'create'
    ]
    @callParent arguments
