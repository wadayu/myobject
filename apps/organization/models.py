#coding:utf-8
from datetime import datetime

from django.db import models

# Create your models here.

class CityDict(models.Model):
    name = models.CharField(max_length=20,verbose_name=u'城市')
    desc = models.CharField(max_length=200,verbose_name=u'描述')
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'城市'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseOrg(models.Model):
    name = models.CharField(max_length=50,verbose_name=u'机构名称')
    desc = models.TextField(verbose_name=u'机构描述')
    category = models.CharField(max_length=50,default='pxjg',choices=(('pxjg',u'培训机构'),('gr',u'个人'),('gx',u'高校')),verbose_name=u'机构类别')
    click_nums = models.IntegerField(default=0,verbose_name=u'点击数')
    fav_nums = models.IntegerField(default=0,verbose_name=u'收藏数')
    image = models.ImageField(upload_to='org/%Y/%m',verbose_name=u'logo')
    address = models.CharField(max_length=150,verbose_name=u'机构地址')
    city = models.ForeignKey(CityDict,verbose_name=u'所在城市')
    students = models.IntegerField(default=0,verbose_name=u'学习人数')
    course_nums = models.IntegerField(default=0,verbose_name=u'课程数')
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'机构'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_courses(self):
        return self.course_set.all().count()

    def get_teacher(self):
        return self.teacher_set.all().count()


class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg,verbose_name=u'所属机构')
    name = models.CharField(max_length=50,verbose_name=u'教师名')
    age = models.IntegerField(default=20,verbose_name=u'年龄')
    work_years = models.IntegerField(default=0,verbose_name=u'工作年限')
    work_company = models.CharField(max_length=50,verbose_name=u'就职公司')
    work_position = models.CharField(max_length=50,verbose_name=u'公司职位')
    points = models.CharField(max_length=50,verbose_name=u'教学特点')
    click_nums = models.IntegerField(default=0,verbose_name=u'点击数')
    fav_nums = models.IntegerField(default=0,verbose_name=u'收藏数')
    image = models.ImageField(upload_to='teacher/%Y/%m',verbose_name=u'头像',null=True,blank=True)
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'教师'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_coursenums(self):
        return self.course_set.all().count()




