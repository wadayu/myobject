#coding:utf-8
__author__ = 'WangDy'
__date__ = '2018/1/24 17:28'

import xadmin
from xadmin import views

from .models import Asset


class AssetAdmin(object):
    list_display = ['hostname','ipaddress','macaddress','memory','manufacturer','machinemodel','is_production']
    search_fields = ['hostname','ipaddress','macaddress','memory','manufacturer','machinemodel','is_production']
    list_filter = ['hostname','ipaddress','macaddress','memory','manufacturer','machinemodel','is_production']


xadmin.site.register(Asset,AssetAdmin)



