Ext.define 'BS.view.manager.TabPanel',
  extend: 'Ext.tab.Panel'
  alias: 'widget.manager_tabpanel'
  id: 'main_tabpanel'
  width: '100%'
  height: '100%'
  activeTab: 0
  border: 1
  tabBar:
    style:
      borderColor: '#333'
      borderStyle: 'solid'
      background: "#333"
  layout: 'fit'
  cls: 'manager_main_menu_tabpanel'

  listeners:
    tabchange: (self, newTab) -> localStorage.setItem(self.lastActiveTabKey, newTab.itemId)

  initComponent: ->
    @items = @getItemList()
    @callParent arguments


  TABS: [
    {
      title: 'Книги'
      xtype: 'books_panel'
      order: 10
    },
    {
      title: 'Фиды'
      url: 'feed_jobs'
      order: 20
    },    
    {
      title: 'Владельцы'
      xtype: 'vladelcy'
      order: 20
    }
    {
      title: 'Заказы'
      xtype: 'orders'
      order: 30
    }
  ]

  getItemList: ->
    items = []

    for item in @TABS
      # for old tabs set iframe html
      if item.url
        item.layout = "fit"
        item.height = "100%"
        item.width = "100%"
        item.html = @setHtml(item.url)
        delete item.url

      item.tooltip = "Alt+#{String.fromCharCode(item.key)}" if item.key
      items.push(item)
    items

  setHtml: (page) ->
    "<iframe src=\"/manager/#{page}\" height='100%' width='100%'\" onload=\"window.initIframeKeyMapHandler()\"></iframe>"
