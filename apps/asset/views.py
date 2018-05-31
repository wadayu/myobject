from django.shortcuts import render
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.backends import ModelBackend
from django.views.generic.base import View
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.db.models import Q
from django.contrib.auth.hashers import make_password
from django.http import HttpResponse
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import Asset

# Create your views here.
class AssetInfo(View):
    def post(self,request):
        data = eval(request.body.decode('utf-8'))
        asset = Asset.objects.filter(ipaddress=data.get('ipaddress'))
        if not asset:
            asset = Asset.objects.create(**data)
        else:
            asset = Asset.objects.filter(ipaddress=data.get('ipaddress')).update(**data)

        return render(request, 'result.html')


# 后端资产扫描推送服务端

# #/usr/bin/python
# #coding:utf-8
#
# import json,subprocess
# from urllib import request,parse
#
# mem = int(subprocess.getoutput('free -m').split('Mem:')[1].strip().split(' ')[0]) / 1024
# hostname = subprocess.getoutput('hostname')
# ipadd = subprocess.getoutput('ifconfig eth1').split('\n')[1].split('addr:')[1].split(' ')[0]
# mft = subprocess.getoutput('dmidecode -s system-manufacturer')
# model = subprocess.getoutput('dmidecode -s system-product-name')
# macadd = subprocess.getoutput('ifconfig eth1').split('HWaddr')[1].split('\n')[0]
#
# url = 'http://192.168.1.100:8000/asset/info/'
# data = {
# 	'memory': '%.2f' %mem,
# 	'hostname': hostname,
# 	'ipaddress': ipadd,
# 	'manufacturer':mft,
# 	'machinemodel':model,
# 	'macaddress':macadd
#     }
# #post_data = bytes(parse.urlencode(data),encoding="utf8")
# post_data = json.dumps(data).encode('utf-8')
# #headers = {'Content-Type': 'application/json'}
# headers = {
#     #伪装一个火狐浏览器
#     "User-Agent":'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',
#     "host":'httpbin.org'
# }
#
#
# req = request.Request(url=url,data=post_data,headers=headers,method="POST")
# response = request.urlopen(req)
# print(response.read().decode("utf-8"))
