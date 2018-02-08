#coding:utf-8
__author__ = 'WangDy'
__date__ = '2018/1/30 15:44'

from django.conf.urls import url,include

from .views import OrglistView,UserAddView,OrgHomeView,OrgCourseView,OrgDescView,OrgTeacherView,AddFavView
from .views import TeacherListView,TeacherDetailView

urlpatterns = [
    url(r'^list/$',OrglistView.as_view(),name='org_list'),
    url(r'^add_ask/$',UserAddView.as_view(),name='add_ask'),
    url(r'^home/(?P<org_id>\d+)/$',OrgHomeView.as_view(),name='org_home'),
    url(r'^course/(?P<org_id>\d+)/$',OrgCourseView.as_view(),name='org_course'),
    url(r'^desc/(?P<org_id>\d+)/$',OrgDescView.as_view(),name='org_desc'),
    url(r'^teacher/(?P<org_id>\d+)/$', OrgTeacherView.as_view(), name='org_teacher'),
    url(r'^add_fav/$',AddFavView.as_view(),name='add_fav'),

    url(r'^teacher_list/$', TeacherListView.as_view(), name='teacher_list'),
    url(r'^teacher_detail/(?P<teacher_id>.*)/$', TeacherDetailView.as_view(), name='teacher_detail'),
]