#coding:utf-8
__author__ = 'WangDy'
__date__ = '2018/2/6 16:57'

from django.conf.urls import url,include

from .views import  AssetInfo



urlpatterns = [
    # 测试urllib.request 资产收集
   url(r'^info/$', AssetInfo.as_view(), name='info'),
]