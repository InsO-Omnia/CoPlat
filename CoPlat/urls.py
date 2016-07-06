from django.conf.urls import url
from . import views
from .views import *
########################################################################
# For CoPlat - version 1.0beta
#
# Author: Cloudyrie
#
# Description: urls.py is used to bind urls to functions implemented
#              in views.py. Specifically, each function is binded with
#              a url the same as their name after /CoPlat/. 
#
# License: GPL
########################################################################

urlpatterns = [
    # page_load urls. 
    url(r'^$', views.index_load, name='index_load'),
    url(r'^login_load', views.login_load, name='login_load'),
    url(r'^student_load', views.student_load, name='student_load'),
    url(r'^upload_load', views.upload_load, name='upload_load'),
    url(r'^student_courselist_load', views.student_courselist_load, name='student_courselist_load'),
    ###################################################################
    
    url(r'^teacher_load', views.teacher_load, name='teacher_load'),
    url(r'^teacher_course_load', views.teacher_course_load, name='teacher_course_load'),
    url(r'^administrator_load', views.administrator_load, name='administrator_load'),
    url(r'^adminCourse_load', views.adminCourse_load, name='adminCourse_load'),

    ####################################################################
    # info verification urls.
    url(r'^login_verify/', views.login_verify, name='login_verify'),

    # request response urls.
    ### requests from student.
    url(r'^student_courselist_response', views.student_courselist_response, name='student_courselist_response'),
    ### requests from teacher.

    url(r'^resource_upload_response', views.resource_upload_response, name='resource_upload_response'),
    url(r'^teacher_courselist_response', views.teacher_courselist_response, name='teacher_courselist_response'),
    url(r'^teacher_coursedetails_response', views.teacher_coursedetails_response, name='teacher_coursedetails_response'),
    url(r'^courseworklist_response', views.courseworklist_response, name='courseworklist_response'),
    url(r'^coursework_studentlist_response', views.coursework_studentlist_response, name='coursework_studentlist_response'),
    url(r'^set_coursework_info', views.set_coursework_info, name='set_coursework_info'),
    url(r'^file_download_response', views.file_download_response, name='file_download_response'),


    ### requests from administrator.
    url(r'^get_semester_response', views.get_semester_response, name='get_semester_response'),
    url(r'^set_semester_response', views.set_semester_response, name='set_semester_response'),

    #######################################################################
    url(r'^get_course_list', views.get_course_list, name='get_course_list'),
    url(r'^get_course_details',views.get_course_details,name='get_course_details'),
    url(r'^create_new_course',views.create_new_course,name='create_new_course'),
    url(r'^allocate_students_to_course',views.allocate_students_to_course,name='allocate_students_to_course'),
    url(r'^get_student_courselist',views.get_student_courselist,name='get_student_courselist')
    #######################################################################

]
