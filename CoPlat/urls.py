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
    url(r'^login_load/', views.login_load, name='login_load'),
    url(r'^student_load/', views.student_load, name='student_load'),
    url(r'^upload_load/', views.upload_load, name='upload_load'),
    # info verification urls.
    url(r'^login_verify/', views.login_verify, name='login_verify'),

    # request response urls.
    ### requests from student.
    ### requests from teacher.
    url(r'^resource_upload_response', views.resource_upload_response, name='resource_upload_response'),
    url(r'^set_coursework_info', views.set_coursework_info, name='set_coursework_info'),
    url(r'^file_download_response', views.file_download_response, name='file_download_response'),


    ### requests from administrator.
    url(r'^get_semester_response', views.get_semester_response, name='get_semester_response'),
    url(r'^set_semester_response', views.set_semester_response, name='set_semester_response'),
]

