#coding:utf-8
__author__ = 'WangDy'
__date__ = '2018/1/25 10:20'

import xadmin

from .models import CityDict,CourseOrg,Teacher

class CityDictAdmin(object):
    list_display = ['name','desc','add_time']
    search_fields = ['name','desc']
    list_filter = ['name','desc','add_time']


class CourseOrgAdmin(object):
    list_display = ['name', 'desc', 'category','click_nums','fav_nums','image','address','city','students','course_nums','add_time']
    search_fields = ['name', 'desc', 'category','click_nums','fav_nums','image','address','city__name','students']
    list_filter = ['name', 'desc', 'category','click_nums','fav_nums','image','address','city__name','students','add_time']
    relfield_style = 'fk-ajax'  # 添加课程选择机构的时候，可以用搜索的模式

class TeacherAdmin(object):
    list_display = ['name', 'org','age', 'work_years', 'work_company', 'work_position', 'points', 'click_nums', 'fav_nums','image','add_time']
    search_fields = ['name', 'org__name','age', 'work_years', 'work_company', 'work_position', 'points', 'click_nums', 'fav_nums','image']
    list_filter =[ 'name', 'org__name','age', 'work_years', 'work_company', 'work_position', 'points', 'click_nums', 'fav_nums','image','add_time']


xadmin.site.register(CityDict,CityDictAdmin)
xadmin.site.register(CourseOrg,CourseOrgAdmin)
xadmin.site.register(Teacher,TeacherAdmin)





