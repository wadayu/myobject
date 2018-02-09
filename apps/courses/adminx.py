#coding:utf-8
__author__ = 'WangDy'
__date__ = '2018/1/25 9:50'

import xadmin

from .models import Course,Lesson,Video,CourseResource


class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class VideoInline(object):
    model = Video
    extra = 0


class CourseAdmin(object):
    list_display = ['name','course_org','desc','detail','degree','learn_times','students','fav_nums','image','click_nums','get_lesson_nums','add_time']
    search_fields = ['name','degree','course_org__name','learn_times','students','fav_nums','image','click_nums']
    list_filter = ['name','course_org__name','desc','detail','degree','learn_times','students','fav_nums','image','click_nums','add_time']
    ordering = ['-click_nums']
    readonly_fields = ['click_nums','fav_nums','students']
    exclude = ['add_time']
    list_editable = ['name','degree']
    inlines = [LessonInline,CourseResourceInline]

class LessonAdmin(object):
    list_display = ['name','course','add_time']
    search_fields = ['name','course__name']
    list_filter = ['name','course__name','add_time']
    inlines = [VideoInline]


class VideoAdmin(object):
    list_display = ['name','lesson','url','learn_times','add_time']
    search_fields = ['name','lesson__name','url','learn_times']
    list_filter = ['name','lesson','url','learn_times','add_time']


class CourseResourceAdmin(object):
    list_display = ['name','course','download','add_time']
    search_fields = ['name','course__name','download']
    list_filter = ['name','course__name','download','add_time']

xadmin.site.register(Course,CourseAdmin)
xadmin.site.register(Lesson,LessonAdmin)
xadmin.site.register(Video,VideoAdmin)
xadmin.site.register(CourseResource,CourseResourceAdmin)



