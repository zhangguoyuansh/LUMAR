# -*- coding: UTF-8 -*-
# __author__ : RobbieHan
# __data__  : 2017/10/17

import xadmin
from xadmin import views

from .models import Menu, Role


class GlobalSettings(object):
    site_title = "LUMAR"
    site_footer = "Copyright © LUMAR. Version1.0.0"
    menu_style = "accordion"  # 导航菜单折叠


class MenuAdmin(object):
    list_display = ['id', 'title', 'is_top', 'icon', 'code', 'url', 'parent']
    list_filter = ['id', 'title', 'is_top', 'icon', 'code', 'parent']
    list_editable = ['is_top', 'url']





class RoleAdmin(object):
    list_display = ['id', 'title', 'permissions']

xadmin.site.register(views.CommAdminView, GlobalSettings)
xadmin.site.register(Menu, MenuAdmin)
xadmin.site.register(Role, RoleAdmin)

