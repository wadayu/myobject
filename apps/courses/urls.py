#coding:utf-8
__author__ = 'WangDy'
__date__ = '2018/2/1 14:53'

from django.conf.urls import url,include

from .views import CourseListView,CourseDetailView,CourseInfoView,CourseCommentView,AddCommentView

urlpatterns = [
    url(r'^list/$',CourseListView.as_view(),name='course_list'),
    url(r'^detail/(?P<course_id>\d+)/$',CourseDetailView.as_view(),name='course_detail'),
    url(r'^info/(?P<course_id>\d+)/$',CourseInfoView.as_view(),name='course_info'),
    url(r'^comment/(?P<course_id>\d+)/$',CourseCommentView.as_view(),name='course_comment'),
    url(r'^add_comment/$', AddCommentView.as_view(), name='add_comment'),
]