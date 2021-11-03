Ext.application
  name: 'BS'
  appFolder: '/assets/app'
  launch: () ->
    Ext.create "Ext.container.Viewport",
      layout: "border"
      items: [
        xtype: "container"
        cls: "bo-header-container"
        region: "north"
        layout: "border"
        height: 40
        items: [
          xtype: "container"
          layout: "hbox"
          height: "100%"
          width: "100%"
          border: false
          region: "center"
          items: [
            xtype: "container"
            height: "100%"
            region: "center"
            html: "Логотип"
          ,
            xtype: "container"
            flex: 1
          ]
        ,
          xtype: "container"
          height: "100%"
          width: 200
          region: "east"
          layout: "hbox"
          style:
            "padding-top": "8"
          items: [
            xtype: "container"
            height: "100%"
            flex: 1
            html: "Профиль"
          ,
            xtype: "container"
            height: "100%"
            flex: 1
            html: "<a href=\"/\">На сайт</a>"
          ,
            xtype: "container"
            height: "100%"
            flex: 1
            html: "<a href=\"/users/sign_out\" data-method=\"DELETE\">Выход</a>"
          ]
        ]
      ,
        xtype: "manager_tabpanel"
        region: "center"
      ]
  renderTo: Ext.getBody()
