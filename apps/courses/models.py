#coding:utf-8
from datetime import datetime
from DjangoUeditor.models import UEditorField

from django.db import models

from organization.models import CourseOrg,Teacher


# Create your models here.

class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg,verbose_name='课程机构',null=True)
    name = models.CharField(max_length=50,verbose_name=u'课程名')
    desc = models.CharField(max_length=300,verbose_name=u'课程描述')
    detail = UEditorField(verbose_name=u'课程详情', width=600, height=300, imagePath="course/editor/",
                 filePath="course/editor/",default='')
    degree = models.CharField(choices=(('cj',u'初级'),('zj',u'中级'),('gj',u'高级')),max_length=5,verbose_name=u'课程难度')
    learn_times = models.IntegerField(default=0,verbose_name=u'学习时长(分钟数)')
    students = models.IntegerField(default=0,verbose_name=u'学习人数')
    teacher = models.ForeignKey(Teacher, verbose_name=u'讲师', null=True, blank=True)
    fav_nums = models.IntegerField(default=0,verbose_name=u'收藏数')
    image = models.ImageField(upload_to='courses/%Y/%m/',verbose_name=u'封面图')
    click_nums = models.IntegerField(default=0,verbose_name=u'点击数')
    course_type = models.CharField(default='',max_length=50,verbose_name=u'课程类别')
    tag = models.CharField(default='',max_length=20,verbose_name=u'课程标签')
    is_banner = models.BooleanField(default=False,verbose_name=u'是否轮播')
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_lesson_nums(self):
        return self.lesson_set.all().count()
    get_lesson_nums.short_description = '章节数'

    def get_learn_users(self):
        return  self.usercourse_set.all()[:5]

    def get_lessons(self):
        return self.lesson_set.all()

class Lesson(models.Model):
    course = models.ForeignKey(Course,verbose_name=u'课程')
    name = models.CharField(max_length=100,verbose_name=u'章节名')
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_videos(self):
        return self.video_set.all()


class Video(models.Model):
    lesson = models.ForeignKey(Lesson,verbose_name=u'章节')
    name = models.CharField(max_length=100,verbose_name=u'视频名称')
    url = models.URLField(max_length=200,verbose_name=u'视频地址',default='')
    learn_times = models.IntegerField(default=0,verbose_name=u'学习时长（分钟数）')
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'视频'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name=u'课程')
    name = models.CharField(max_length=100, verbose_name=u'名称')
    download = models.FileField(upload_to='course/resource/%Y/%m', verbose_name=u'资源文件', max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'课程资源'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
