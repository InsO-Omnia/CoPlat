from django.conf.urls import url
from . import views

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

    # info verification urls.
    url(r'^login_verify/', views.login_verify, name='login_verify'),

    # request response urls.
    url(r'^get_semester_response', views.get_semester_response, name='get_semester_response'),
]

