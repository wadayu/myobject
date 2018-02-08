#coding:utf-8
import json

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

from .models import UserProfile,EmailVerifyRecord,Banner
from .forms import LoginForm,RegisterForm,ForgetpwdForm,ModifypwdForm,UploadImageForm,UserInfoForm
from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin
from operation.models import UserCourse,UserFavorite,UserMessage
from courses.models import Course
from organization.models import CourseOrg,Teacher


class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class RegisterView(View):
    def get(self,request):
        register_form = RegisterForm()
        return render(request,'register.html',{'regist_form': register_form})

    def post(self,request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get('email','')
            if UserProfile.objects.filter(Q(username=user_name)|Q(email=user_name)):
                return render(request, 'register.html', {'msg': '用户已存在！','regist_form':register_form})
            pass_word = request.POST.get('password','')
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.password = make_password(pass_word)
            user_profile.is_active = False
            user_profile.save()

            user_message = UserMessage(user=user_profile.id,message = u'{0}，欢迎你的注册'.format(user_name))
            user_message.save()

            send_register_email(user_name,'register')
            return render(request,'register.html',{'msg':'激活链接已发送邮箱，请注意查收'})
        else:
            return render(request,'register.html',{'regist_form':register_form})


class LoginView(View):

    def get(self,request):
        login_form = LoginForm()
        return render(request,'login.html',{'login_form':login_form})

    def post(self,request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get('username','')
            if not UserProfile.objects.filter(Q(username=user_name) | Q(email=user_name)):
                return render(request, 'login.html', {'msg': '用户名未注册','login_form':login_form})
            pass_word = request.POST.get('password','')
            user = authenticate(username=user_name,password=pass_word)
            if user:
                if user.is_active:
                    login(request,user)
                    return HttpResponseRedirect(reverse('index'))
                else:
                    return render(request, 'login.html', {'msg': '用户名未激活','login_form':login_form})
            else:
                return render(request, 'login.html', {'msg': '用户名或者密码错误','login_form':login_form})
        else:
            return render(request,'login.html',{'login_form':login_form})


class LogoutView(View):
    def get(self,request):
        logout(request)
        return HttpResponseRedirect(reverse('index'))


class ActiveUserView(View):
    def get(self,request,active_code):
        login_form = LoginForm()
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(username=email)
                user.is_active = True
                user.save()
                record.delete()
            return render(request, 'login.html',{'login_form':login_form})
        else:
            return render(request, 'failed.html')


class ForgetpwdView(View):
    def get(self,request):
        forget_form = ForgetpwdForm()
        return render(request,'forgetpwd.html', {'forget_form': forget_form})

    def post(self,request):
        forget_form = ForgetpwdForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email','')
            send_register_email(email,'forget')
            return render(request, 'forgetpwd.html', {'msg':'验证码已发送邮箱'})
        else:
            return render(request, 'forgetpwd.html', {'forget_form': forget_form,})


class ResetpwdView(View):
    def get(self,request,active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                #record.delete()
                return render(request,'password_reset.html',{'email':email})
        else:
            return render(request, 'failed.html')

class ModifypwdView(View):
    def post(self,request):
        modifypwd_form = ModifypwdForm(request.POST)
        if modifypwd_form.is_valid():
            pwd1 = request.POST.get('password1','')
            pwd2 = request.POST.get('password2','')
            email = request.POST.get('email','')
            if pwd1 != pwd2:
                return render(request,'password_reset.html',{'modifypwd_form':modifypwd_form,'email':email,'msg':u'密码输入不一致，请重新输入'})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd1)
            user.save()
            login_form = LoginForm()
            return HttpResponseRedirect(reverse('login'),{'login_form':login_form})
        else:
            email = request.POST.get('email', '')
            return render(request, 'password_reset.html',{'modifypwd_form': modifypwd_form, 'email': email})


class UserInfoView(LoginRequiredMixin,View):
    def get(self,request):
        user = request.user
        click_page = 'userinfo'
        return render(request,'usercenter-info.html',{
            'user':user,
            'click_page':click_page
        })

    def post(self,request):
        userinfo_form = UserInfoForm(request.POST,instance=request.user)
        if userinfo_form.is_valid():
            userinfo_form.save()
            return HttpResponse("{'status':'success'}", content_type='application/json')
        else:
            return HttpResponse(json.dumps(userinfo_form.errors), content_type='application/json')


class UploadImageView(LoginRequiredMixin,View):
    def post(self,request):
        upload_form = UploadImageForm(request.POST,request.FILES,instance=request.user)
        if upload_form.is_valid():
            upload_form.save()
            return HttpResponse("{'status':'success','msg':'修改成功'}", content_type='application/json')
        else:
            return HttpResponse("{'status':'fail','msg':'添加失败'}", content_type='application/json')

        # upload_form = UploadImageForm(request.POST,request.FILES)
        # if upload_form.is_valid():
        #     image = upload_form.cleaned_data['image']
        #     request.user.image = image
        #     request.user.save()


class UpdatePwdView(LoginRequiredMixin,View):
    def post(self,request):
        updatepwd_form = ModifypwdForm(request.POST)
        if updatepwd_form.is_valid():
            pwd1 = request.POST.get('password1','')
            pwd2 = request.POST.get('password2','')
            if pwd1 != pwd2:
                return HttpResponse("{'status':'fail','msg':'密码不一致'}", content_type='application/json')
            user = request.user
            user.password = make_password(pwd1)
            user.save()
            login_form = LoginForm()
            return HttpResponse("{'status':'success'}", content_type='application/json')
        else:
            return HttpResponse(json.dumps(updatepwd_form.errors), content_type='application/json')

class SendEmailCodeView(LoginRequiredMixin,View):
    #发送邮箱验证码
    def get(self,request):
        email = request.GET.get('email','')

        if UserProfile.objects.filter(email=email):
            return HttpResponse("{'email':'邮箱已经存在'}", content_type='application/json')
        send_register_email(email,'update_email')
        return HttpResponse("{'status':'success'}", content_type='application/json')


class UpdateEmailView(LoginRequiredMixin,View):
    # 更改个人邮箱
    def post(self,request):
        email = request.POST.get('email', '')
        code = request.POST.get('code', '')

        exist_record = EmailVerifyRecord.objects.filter(email=email,code=code,send_type='update_email')
        if exist_record:
            user = request.user
            user.email = email
            user.username = email
            user.save()
            return HttpResponse("{'status':'success'}", content_type='application/json')
        else:
            return HttpResponse("{'email':'验证码不正确'}", content_type='application/json')


class MyCoursesView(LoginRequiredMixin,View):
    def get(self,request):
        user_courses = UserCourse.objects.filter(user=request.user)
        click_page = 'course'
        return render(request,'usercenter-mycourse.html',{
            'user_courses':user_courses,
            'click_page':click_page
        })

class MyFavOrgView(LoginRequiredMixin,View):
    def get(self,request):
        click_page = 'myfav'
        orgs_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user,fav_type=2)
        for fav_org in fav_orgs:
            org_id = fav_org.fav_id
            org = CourseOrg.objects.get(id=int(org_id))
            orgs_list.append(org)
        return render(request,'usercenter-fav-org.html',{'orgs_list':orgs_list,'click_page':click_page})


class MyFavTeacherView(LoginRequiredMixin,View):
    def get(self,request):
        click_page = 'myfav'
        teachers_list = []
        fav_teachers = UserFavorite.objects.filter(user=request.user,fav_type=3)
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=int(teacher_id))
            teachers_list.append(teacher)
        return render(request,'usercenter-fav-teacher.html',{'teachers_list':teachers_list,'click_page':click_page})


class MyFavCourseView(LoginRequiredMixin,View):
    def get(self, request):
        click_page = 'myfav'
        courses_list = []
        fav_courses = UserFavorite.objects.filter(user=request.user, fav_type=1)
        for fav_course in fav_courses:
            course_id = fav_course.fav_id
            course = Course.objects.get(id=int(course_id))
            courses_list.append(course)
        return render(request, 'usercenter-fav-course.html', {'courses_list': courses_list,'click_page':click_page})


class MyMessageView(LoginRequiredMixin,View):
    def get(self,request):
        all_messages = UserMessage.objects.filter(user=request.user.id)
        click_page = 'message'

        unread_messages = UserMessage.objects.filter(user=request.user.id,is_read=False)
        for unread_message in unread_messages:
            unread_message.is_read = True
            unread_message.save()

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_messages, 5,request=request)
        messages = p.page(page)

        return  render(request,'usercenter-message.html',{
            'all_messages':messages,
            'click_page': click_page
        })


class IndexView(View):
    def get(self,request):
        all_banners = Banner.objects.all().order_by('index')
        banner_courses = Course.objects.filter(is_banner=True)[:3]
        courses = Course.objects.filter(is_banner=False)[:6]
        orgs = CourseOrg.objects.all()
        return render(request,'index.html',{
            'all_banners':all_banners,
            'banner_courses':banner_courses,
            'courses':courses,
            'orgs':orgs
        })



def page_404error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html',{})
    response.status_code = 404
    return response

def page_500error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html',{})
    response.status_code = 500
    return response