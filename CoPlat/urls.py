from django.conf.urls import url
from . import views
from base import *

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
    # media files
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve',{'document_root': settings.MEDIA_ROOT}),
    # page_load urls.
    url(r'^$', views.index_load, name='index_load'),
    url(r'^student_course_load', views.student_course_load, name='student_course_load'),
    url(r'^teacher_course_load', views.teacher_course_load, name='teacher_course_load'),
    url(r'^admin_load', views.admin_load, name='admin_load'),
    url(r'^student_load/', views.student_load, name='student_load'),
    url(r'^teacher_load/', views.teacher_load, name='teacher_load'),
    url(r'^administrator_load/', views.administrator_load, name='administrator_load'),
    url(r'^adminCourse_load/', views.adminCourse_load, name='adminCourse_load'),
    url(r'^adminSemester_load/', views.adminSemester_load, name='adminSemester_load'),
     url(r'^displayStudentList_load/', views.displayStudentList_load, name='displayStudentList_load'),
    url(r'^studentInformation_load/', views.studentInformation_load, name='studentInformation_load'),
    url(r'^teacherInformation_load/', views.teacherInformation_load, name='teacherInformation_load'),

    # info verification urls.
    url(r'^login_verify/', views.login_verify, name='login_verify'),


    # request response urls.

    ### request from both students and teachers.
    url(r'^courseworklist_response', views.courseworklist_response, name='courseworklist_response'),

    ### request from students.
    url(r'^student_courselist_response', views.student_courselist_response, name='student_courselist_response'),
    url(r'^get_studentCourse_information', views.get_studentCourse_information, name='get_studentCourse_information'),
    url(r'^get_workInformation', views.get_workInformation, name='get_workInformation'),
    url(r'^resourcelist_load_response', views.resourcelist_load_response, name='resourcelist_load_response'),
    url(r'^coursework_upload_response', views.coursework_upload_response, name='coursework_upload_response'),
    url(r'^get_studentName_response', views.get_studentName_response, name='get_studentName_response'),
    url(r'^update_studentPassword', views.update_studentPassword, name='update_studentPassword'),

    ### requests from teacher.
    url(r'^teacher_courselist_response', views.teacher_courselist_response, name='teacher_courselist_response'),
    url(r'^teacher_coursedetails_response', views.teacher_coursedetails_response, name='teacher_coursedetails_response'),
    url(r'^coursework_studentlist_response', views.coursework_studentlist_response,name='coursework_studentlist_response'),
    url(r'^particular_courseworkpath_response', views.particular_courseworkpath_response,name='particular_courseworkpath_response'),
    url(r'^add_coursework_response', views.add_coursework_response, name='add_coursework_response'),
    url(r'^resource_upload_response', views.resource_upload_response, name='resource_upload_response'),
    url(r'^set_coursework_info', views.set_coursework_info, name='set_coursework_info'),
    url(r'^file_download_response', views.file_download_response, name='file_download_response'),
    url(r'^add_comment_response', views.add_comment_response, name='add_comment_response'),
    url(r'^course_studentlist_response',views.course_studentlist_response,name='course_studentlist_response'),
    url(r'^get_teacherName_response', views.get_teacherName_response, name='get_teacherName_response'),
    url(r'^update_teacherPassword', views.update_teacherPassword, name='update_teacherPassword'),

    # url(r'^get_student_courselist',views.get_student_courselist,name='get_student_courselist'),
    #request from administrator.
    url(r'^get_semester_response', views.get_semester_response, name='get_semester_response'),
    url(r'^set_semester_response', views.set_semester_response, name='set_semester_response'),
    url(r'^admin_courselist_response', views.admin_courselist_response, name='admin_courselist_response'),
    url(r'^get_course_details',views.get_course_details,name='get_course_details'),
    url(r'^create_new_course',views.create_new_course,name='create_new_course'),
    url(r'^allocate_students_to_course',views.allocate_students_to_course,name='allocate_students_to_course'),
    url(r'^allocate_teachers_to_course',views.allocate_teachers_to_course,name='allocate_teachers_to_course'),

    ###requests related with teams
    url(r'^team_build_response', views.team_build_response, name='team_build_response'),
    url(r'^team_memberlist_response', views.team_memberlist_response, name='team_memberlist_response'),
    url(r'^leader_switch_response', views.leader_switch_response, name='leader_switch_response'),
    url(r'^display_candidateslist_response',views.display_candidateslist_response,name='display_candidateslist_response'),
    url(r'^team_notready_details_response',views.team_notready_details_response,name='team_notready_details_response'),
    url(r'^team_application_response',views.team_application_response,name='team_application_response'),
    url(r'^application_getstatus_response',views.application_getstatus_response,name='application_getstatus_response'),

    url(r'^application_setstatus_response', views.application_setstatus_response, name='application_setstatus_response'),
    url(r'^team_isready_response', views.team_isready_response, name='team_isready_response'),
    url(r'^team_setready_response', views.team_setready_response, name='team_setready_response'),
    url(r'^display_enrolledteams_response',views.display_enrolledteams_response,name='display_enrolledteams_response'),
    url(r'^display_readyteams_response',views.display_readyteams_response,name='display_readyteams_response'),
    url(r'^team_details_response',views.team_details_response,name='team_details_response'),
    url(r'^team_enroll_response',views.team_enroll_response,name='team_enroll_response'),

]

    # url(r'^chat_load', views.chat_load, name='chat_load'),
    # # url(r'^p/(?P<id>\d+)/$', single_post),
    # # url(r'^topic/(?P<id>\d+)/$', show_topic),
    # url(r'^post/$', views.post),

