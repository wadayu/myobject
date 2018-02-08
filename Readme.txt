#coding:utf-8
1、导出当前项目pip安装的包表
pip freeze > myobject/requirements.txt
2、根据导出的pip安装包表安装pip包
pip install -r myobject/requirements.txt