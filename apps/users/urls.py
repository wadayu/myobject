#coding:utf-8
__author__ = 'WangDy'
__date__ = '2018/2/6 16:57'

from django.conf.urls import url,include

from .views import UserInfoView,UploadImageView,UpdatePwdView,SendEmailCodeView
from .views import UpdateEmailView,MyCoursesView,MyFavOrgView,MyFavTeacherView,MyFavCourseView
from .views import MyMessageView

urlpatterns = [
    url(r'^user_info/$',UserInfoView.as_view(),name='user_info'),
    url(r'^image_upload/$',UploadImageView.as_view(),name='image_upload'),
    url(r'^update_pwd/$',UpdatePwdView.as_view(),name='update_pwd'),
    url(r'^sendemail_code/$', SendEmailCodeView.as_view(), name='sendemail_code'),
    url(r'^update_email/$', UpdateEmailView.as_view(), name='update_email'),
    url(r'^mycourses/$', MyCoursesView.as_view(), name='mycourses'),
    url(r'^myfav/org/$', MyFavOrgView.as_view(), name='myfav_org'),
    url(r'^myfav/teacher/$', MyFavTeacherView.as_view(), name='myfav_teacher'),
    url(r'^myfav/course/$', MyFavCourseView.as_view(), name='myfav_course'),
    url(r'^mymessage/$', MyMessageView.as_view(), name='mymessage'),
]