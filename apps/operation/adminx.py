#coding:utf-8
__author__ = 'WangDy'
__date__ = '2018/1/25 10:31'

import xadmin

from .models import UserAsk,CousreComments,UserFavorite,UserMessage,UserCourse


class UserAskAdmin(object):
    list_display = ['name','mobile','course_name','add_time']
    search_fields = ['name','mobile','course_name']
    list_filter = ['name','mobile','course_name','add_time']


class CouCousreCommentsAdmin(object):
    list_display = ['user','course','comments','add_time']
    search_fields = ['user','course','comments']
    list_filter = ['user__username','course__name','comments','add_time']
    style_fields = {"comments": "ueditor"}


class UserFavoriteAdmin(object):
    list_display = ['user','fav_id','fav_type','add_time']
    search_fields = ['user','fav_id','fav_type']
    list_filter = ['user__username','fav_id','fav_type','add_time']


class UserMessageAdmin(object):
    list_display = ['user','message','is_read','add_time']
    search_fields = ['user','message','is_read']
    list_filter = ['user','message','is_read','add_time']


class UserCourseAdmin(object):
    list_display = ['user', 'course', 'add_time']
    search_fields = ['user', 'course']
    list_filter = ['user__username', 'course__name', 'add_time']


xadmin.site.register(UserAsk,UserAskAdmin)
xadmin.site.register(CousreComments,CouCousreCommentsAdmin)
xadmin.site.register(UserFavorite,UserFavoriteAdmin)
xadmin.site.register(UserMessage,UserMessageAdmin)
xadmin.site.register(UserCourse,UserCourseAdmin)
