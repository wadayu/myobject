#coding:utf-8
from django.shortcuts import render
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

# Create your views here.

from django.views.generic import View
from django.http import HttpResponse
from django.db.models import Q

from .models import CityDict,CourseOrg
from .forms import UserAskForm
from operation.models import UserFavorite
from courses.models import Course
from organization.models import CourseOrg,Teacher

class OrglistView(View):
    def get(self,request):
        all_orgs = CourseOrg.objects.all()
        all_citys = CityDict.objects.all()
        hot_orgs = all_orgs.order_by('-click_nums')[:3]

        search_keywords = request.GET.get('keywords','')
        if search_keywords:
            all_orgs = all_orgs.filter(Q(name__icontains=search_keywords)|
                                        Q(desc__icontains=search_keywords))

        city_id  = request.GET.get('city','')
        if city_id:
            all_orgs = CourseOrg.objects.filter(city_id=int(city_id))

        category = request.GET.get('ct','')
        if category:
            all_orgs = CourseOrg.objects.filter(category=category)

        if city_id and category:
            all_orgs = CourseOrg.objects.filter(category=category,city_id=int(city_id))

        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_orgs = all_orgs.order_by('-students')
            elif sort == 'courses':
                all_orgs = all_orgs.order_by('-course_nums')

        org_nums = all_orgs.count()

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_orgs, 2,request=request)
        orgs = p.page(page)

        return render(request,'org-list.html',{
            'all_orgs':orgs,
            'all_citys':all_citys,
            'org_nums':org_nums,
            'city_id':city_id,
            'category':category,
            'hot_orgs':hot_orgs,
            'sort':sort,
        })


class UserAddView(View):
    def post(self,request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            return HttpResponse("{'status':'success'}",content_type='application/json')
        else:
            return HttpResponse("{'status':'fail','msg':u'添加出错'}", content_type='application/json')


class OrgHomeView(View):
    def get(self,request,org_id):
        click_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))
        course_org.click_nums += 1
        course_org.save()

        all_courses = course_org.course_set.all()[:4]
        all_teachers = course_org.teacher_set.all()[:2]
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True
        return  render(request,'org-detail-homepage.html',{
            'all_courses':all_courses,
            'all_teachers':all_teachers,
            'course_org':course_org,
            'click_page':click_page,
            'has_fav':has_fav
        })


class OrgCourseView(View):
    def get(self,request,org_id):
        click_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_courses, 4, request=request)
        courses = p.page(page)

        return  render(request,'org-detail-course.html',{
            'all_courses':courses,
            'course_org':course_org,
            'click_page': click_page,
            'has_fav': has_fav
        })


class OrgDescView(View):
    def get(self,request,org_id):
        click_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True
        return  render(request,'org-detail-desc.html',{
            'course_org':course_org,
            'click_page':click_page,
            'has_fav': has_fav
        })


class OrgTeacherView(View):
    def get(self,request,org_id):
        click_page = 'teacher'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_teachers = course_org.teacher_set.all()
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True
        return  render(request,'org-detail-teachers.html',{
            'all_teachers':all_teachers,
            'course_org':course_org,
            'click_page':click_page,
            'has_fav': has_fav
        })


class AddFavView(View):
    def post(self,request):
        fav_id = request.POST.get('fav_id',0)
        fav_type = request.POST.get('fav_type',0)

        if not request.user.is_authenticated():
            return  HttpResponse("{'status':'fail','msg':'用户未登录'}", content_type='application/json')
        exist_records = UserFavorite.objects.filter(user=request.user,fav_id=int(fav_id),fav_type=int(fav_type))
        if exist_records:
            exist_records.delete()
            if int(fav_type) == 1:
                course = Course.objects.get(id=int(fav_id))
                course.fav_nums -= 1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()
            if int(fav_type) == 2:
                org = CourseOrg.objects.get(id=int(fav_id))
                org.fav_nums -= 1
                if org.fav_nums < 0:
                    org.fav_nums = 0
                org.save()
            if int(fav_type) == 3:
                teacher = Teacher.objects.get(id=int(fav_id))
                teacher.fav_nums -= 1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 1
                teacher.save()

            return HttpResponse("{'status':'success','msg':'收藏'}", content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()

                if int(fav_type) == 1:
                    course = Course.objects.get(id=int(fav_id))
                    course.fav_nums += 1
                    course.save()
                if int(fav_type) == 2:
                    org = CourseOrg.objects.get(id=int(fav_id))
                    org.fav_nums += 1
                    org.save()
                if int(fav_type) == 3:
                    teacher = Teacher.objects.get(id=int(fav_id))
                    teacher.fav_nums += 1
                    teacher.save()

                return HttpResponse("{'status':'success','msg':'已收藏'}", content_type='application/json')
            else:
                return HttpResponse("{'status':'fail','msg':'收藏出错'}", content_type='application/json')


class TeacherListView(View):
    def get(self,request):
        all_teachers = Teacher.objects.all()
        hot_teachers = Teacher.objects.all().order_by('-click_nums')[:3]

        search_keywords = request.GET.get('keywords','')
        if search_keywords:
            all_teachers = all_teachers.filter(Q(name__icontains=search_keywords))

        sort = request.GET.get('sort','')
        if sort:
            if sort == 'hot':
                all_teachers = all_teachers.order_by('-click_nums')

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_teachers, 1, request=request)
        teachers = p.page(page)

        teacher_nums = all_teachers.count()

        return render(request,'teachers-list.html',{
            'all_teachers':teachers,
            'hot_teachers':hot_teachers,
            'teacher_nums':teacher_nums,
            'sort':sort
        })


class TeacherDetailView(View):
    def get(self,request,teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.click_nums += 1
        teacher.save()

        hot_teachers = Teacher.objects.all().order_by('-click_nums')[:3]
        teacher_courses = Course.objects.filter(teacher=teacher)

        teacher_hasfav = False
        org_hasfav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=int(teacher.id), fav_type=3):
                teacher_hasfav = True
            if UserFavorite.objects.filter(user=request.user,fav_id=int(teacher.org.id), fav_type=2):
                org_hasfav = True

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(teacher_courses, 4, request=request)
        courses = p.page(page)

        return render(request,'teacher-detail.html',{
            'teacher':teacher,
            'teacher_courses':courses,
            'hot_teachers':hot_teachers,
            'teacher_hasfav':teacher_hasfav,
            'org_hasfav':org_hasfav
        })