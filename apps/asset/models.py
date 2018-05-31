#coding:utf-8

from datetime import datetime

from django.db import models

# Create your models here.
class Asset(models.Model):
    ipaddress = models.CharField(max_length=20,verbose_name=u'IP地址')
    hostname = models.CharField(max_length=50,verbose_name=u'主机名称')
    memory = models.FloatField(verbose_name=u'内存')
    macaddress = models.CharField(max_length=50,verbose_name=u'MAC地址',default='')
    manufacturer = models.CharField(max_length=50,verbose_name=u'生产厂家')
    machinemodel = models.CharField(max_length=50,verbose_name=u'机器型号',default='')

    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')


    class Meta:
        verbose_name = u'资产详情'
        verbose_name_plural = verbose_name