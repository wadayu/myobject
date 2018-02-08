#coding:utf-8

from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse
from django.db.models import Q

from utils.mixin_utils import LoginRequiredMixin
from operation.models import UserFavorite,CousreComments,UserCourse
from .models import Course,CourseResource


class CourseListView(View):
    def get(self,request):
        all_courses = Course.objects.all().order_by('-add_time')
        hot_courses = Course.objects.all().order_by('-click_nums')[:2]

        search_keywords = request.GET.get('keywords','')
        if search_keywords:
            all_courses = all_courses.filter(Q(name__icontains=search_keywords)|
                                                Q(desc__icontains=search_keywords)|
                                                Q(detail__icontains=search_keywords))

        sort = request.GET.get('sort','')
        if sort:
            if sort == 'hot':
                all_courses = all_courses.order_by('-click_nums')
            elif sort == 'students':
                all_courses = all_courses.order_by('-students')

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_courses, 6, request=request)
        courses = p.page(page)

        return render(request,'course-list.html',{
            'all_courses':courses,
            'hot_courses':hot_courses,
            'sort':sort,
        })


class CourseDetailView(View):
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        course.click_nums += 1
        course.save()

        tag = course.tag
        if tag:
            relate_courses = Course.objects.filter(tag=tag)[:1]
        else:
            relate_courses = []

        has_fav_course = False
        has_fav_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=int(course.id),fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course.course_org.id), fav_type=2):
                has_fav_org = True
        return render(request,'course-detail.html',{
            'course':course,
            'relate_courses':relate_courses,
            'has_fav_course':has_fav_course,
            'has_fav_org':has_fav_org,
        })


class CourseInfoView(LoginRequiredMixin,View):
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        # course.students += 1
        # course.save()

        if not UserCourse.objects.filter(user=request.user,course=course):
            user_course = UserCourse(user=request.user,course=course)
            user_course.save()

        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user.id for user_course in user_courses]
        all_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [user_course.course.id for user_course in all_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('click_nums')[:3]

        course_resource = CourseResource.objects.filter(course=course)

        return render(request,'course-video.html',{
            'course':course,
            'course_resource':course_resource,
            'relate_courses':relate_courses,
        })

class CourseCommentView(LoginRequiredMixin,View):
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))

        if not UserCourse.objects.filter(user=request.user,course=course):
            user_course = UserCourse(user=request.user,course=course)
            user_course.save()

        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user.id for user_course in user_courses]
        all_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [user_course.course.id for user_course in all_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('click_nums')[:3]

        course_resource = CourseResource.objects.filter(course=course)
        course_comment = CousreComments.objects.filter(course=course).order_by('-add_time')

        return render(request,'course-comment.html',{
            'course':course,
            'course_resource':course_resource,
            'course_comment':course_comment,
            'relate_courses': relate_courses,
        })

class AddCommentView(LoginRequiredMixin,View):
    def post(self,request):
        course_id = request.POST.get('course_id',0)
        comments = request.POST.get('comments','')
        if not request.user.is_authenticated:
            return HttpResponse("{'status':'fail','msg':'用户未登录'}", content_type='application/json')
        if int(course_id) > 0 and comments:
            course_comments = CousreComments()
            course = Course.objects.get(id=int(course_id))
            course_comments.user = request.user
            course_comments.course = course
            course_comments.comments = comments
            course_comments.save()
            return HttpResponse("{'status':'success','msg':'添加成功'}", content_type='application/json')
        else:
            return HttpResponse("{'status':'fail','msg':'添加失败'}", content_type='application/json')


