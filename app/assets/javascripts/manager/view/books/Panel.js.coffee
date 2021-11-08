Ext.define "BS.view.books.Panel",
  extend: "Ext.Panel"
  alias: "widget.books_panel"
  layout: "border"
  border: false
  width: "100%"
  collapseMode: "mini"
  items: [
    region: "west"
    width: 360
    split: true
    layout: "border"
    items: [
      xtype: "books_filters"
      region: "north"
      collapsible: true
      split: true
    ,
      xtype: "books_list"
      region: "center"
    ]
  ,
    xtype: "panel"
    layout: "border"
    region: "center"
    border: false
    items: [
      xtype: "book_properties"
      region: "center"
    ]
  ]
