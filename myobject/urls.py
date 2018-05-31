"""myobject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url,include
from django.contrib import admin
from django.views.generic import TemplateView
from django.views.static import serve
import xadmin

from users import views
from myobject.settings import MEDIA_ROOT

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    # url(r'^$',TemplateView.as_view(template_name='index.html'),name='index'),
    url(r'^$',views.IndexView.as_view(),name='index'),
    url(r'^login/$',views.LoginView.as_view(),name='login'),
    url(r'^logout/$',views.LogoutView.as_view(),name='logout'),
    url(r'^register/$',views.RegisterView.as_view(),name='register'),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<active_code>.*)/$',views.ActiveUserView.as_view(),name='user_active'),
    url(r'^forgetpwd/$', views.ForgetpwdView.as_view(), name='forget'),
    url(r'^resetpwd/(?P<active_code>.*)/$',views.ResetpwdView.as_view(),name='reset_pwd'),
    url(r'^modifypwd/$',views.ModifypwdView.as_view(),name='modify_pwd'),

    url(r'^media/(?P<path>.*)$',serve,{'document_root':MEDIA_ROOT}),
    # url(r'^static/(?P<path>.*)$',serve,{'document_root':STATIC_ROOT}),

    url(r'^org/', include('organization.urls',namespace='org')),
    url(r'^course/', include('courses.urls',namespace='course')),
    url(r'^user/', include('users.urls', namespace='user')),

    url(r'^ueditor/',include('DjangoUeditor.urls' )),

    # 资产收集测试
    url(r'^asset/', include('asset.urls', namespace='asset')),
]

handler404 = 'users.views.page_404error'
handler500 = 'users.views.page_500error'
