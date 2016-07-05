from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt, ensure_csrf_cookie
import json
from django.core.files.base import ContentFile
from .models import *
from django.core.exceptions import ObjectDoesNotExist
import os

# Create your views here.

#######################################################################
# For CoPlat - version 1.0beta
#
# Author: Cloudyrie
#
# Description:
# views.py is used to implement most of the functions of CoPlat,
# namely receiving requests from the front-end and sending
# requests to the database-end. each function is associated to a
# python function here. We divide python functions into several
# sections with specific naming conventions, which you should
# refer to when adding or modifying python functions.
#
# License: GPL
#######################################################################


#######################################################################
# Page load section: functions in this section are atteched with
# html pages, and are named in the form of "*Pagename*_load".
# Replace *Pagename* with name of specific html page files when
# adding new functions.
#######################################################################

@ensure_csrf_cookie
def index_load(request):
    template = loader.get_template('CoPlat/index.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))

def login_load(request):
    template = loader.get_template('CoPlat/login.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))

def student_load(request):
    template = loader.get_template('CoPlat/student.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))

### test for file upload
def upload_load(request):
    template = loader.get_template('CoPlat/test_upload.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))

#######################################################################
# Info verification section: functions in this section are
# implementation of verifying for authority of fucntions,
# and are named in the form of "*Functionname*_verify". Replace
# *Fucntionname* with name of specific functions when adding.
#######################################################################

# use csrf_exempt, need to be reconsidered before production.
@csrf_exempt
def login_verify(request):
    idstr = request.POST.get('Id','')
    password = request.POST.get('Password','')
    identity = request.POST.get('Identity','')
    # a little trivial, try to rewrite it!
    if identity == "student":
        try:
            request_student = Student.objects.get(Id = idstr)
        except ObjectDoesNotExist:
            res = "{Status : 'Fail'}"
        else:
            request_user = User.objects.get(username = request_student.user.username)
            if request_user.check_password(password) == True:
                res = "{Status : 'Success'}"
            else:
                res = "{Status : 'Fail'}"
    elif identity == "teacher":
        try:
            request_teacher = Teacher.objects.get(Id = idstr)
        except ObjectDoesNotExist:
            res = "{Status : 'Fail'}"
        else:
            request_user = User.objects.get(username = request_teacher.user.username)
            if request_user.check_password(password) == True:
                res = "{Status : 'Success'}"
            else:
                res = "{Status : 'Fail'}"
    else:
        try:
            request_admin = Admin.objects.get(Id = idstr)
        except ObjectDoesNotExist:
            res = "{Status : 'Fail'}"
        else:
            request_user = User.objects.get(username = request_admin.user.username)
            if request_user.check_password(password) == True:
                res = "{Status : 'Success'}"
            else:
                res = "{Status : 'Fail'}"
    response = json.dumps(res)
    return HttpResponse(response, content_type="application/json")


########################################################################
# Request response section: functions in this section are
# responses to the requests from the front-end, and are named
# in the form of "*Requestname*_response". Replace *Requestname*
# with name of specific request when adding.
#
# ATTENTION!: If you want to operate on many to many relationships,
# please refer to
# https://docs.djangoproject.com/en/1.9/topics/db/models/#relationships
########################################################################

#######################################################################
# Responses for requests from students.
#######################################################################

def coursework_upload_response(request):
    if request.method == 'POST':
        student_id = request.POST.get('student_id','')
        coursework_no = request.POST.get('coursework_no','')
        rela_course = Course.objects.get(No = coursework_no)
        upload_file = request.FILES.get('File','')
        result = "{Status : 'Fail'}"
        if upload_file:
            file_content = ContentFile(upload_file.read())
            new_assignment = Assignment(student = Student.objects.get(Id = student_id), coursework = Coursework.objects.get(No = coursework_no))
            new_assignment.Attachment.save(upload_file.name, file_content)
            new_assignment.save()
            result = "{Status : 'Success'}"
    response = json.dumps(result)
    return HttpResponse(response, content_type="application/json")

#######################################################################
# Responses for requests from teachers.
#######################################################################

@csrf_exempt
def resource_upload_response(request):
    if request.method == 'POST':
        resource_no = '000101'
        rela_course = Course.objects.get(No = '0001') 
        resource_category = request.POST.get('Type','')
        upload_file = request.FILES.get('File','')
        result = "{Status : 'Fail'}"
        if upload_file:
            file_content = ContentFile(upload_file.read())
            new_resource = Resource(No = resource_no, Category = resource_category, course = rela_course)
            new_resource.Attachment.save(upload_file.name, file_content)
            new_resource.save()
            result = "{Status : 'Success'}"
    response = json.dumps(result)
    return HttpResponse(response, content_type="application/json")

### Global variables to set coursework info
global Student_Id
global Coursework_No

def set_coursework_info(request):
    global Student_Id
    global Coursework_No
    Student_Id = request.POST.get('Studentid','')
    Coursework_No = request.POST.get('Courseworkno','')
    if Student_Id != "" and Coursework_No != "":
        response = json.dumps("{Status : 'Success'}")
    else:
        response = json.dumps("{Status : 'Fail'}")
    return HttpResponse(response, content_type="application/json")

def file_download_response(request):
    global Student_Id
    global Coursework_No
    file_name = Student_Id + '_' + Coursework_No + '.pdf'
    path = "/home/cloudyrie/pyenv/base/CoPlat/media/Coursework/" + file_name
    response = open(path, "rb").read()
    ### content_type can be specified here!
    return HttpResponse(response, content_type="application/octet-stream")

#######################################################################
# Responses for requests from administrators.
#######################################################################

@csrf_exempt
def get_semester_response(request):
    semester = Semester.objects.get(No = "1")
    info = str(semester.get_semester_info())
    response = json.dumps(info)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def set_semester_response(request):
    start = request.POST.get('StartTime','')
    end = request.POST.get('EndTime','')
    duration = request.POST.get('Weeks','')
    semester = Semester.objects.get(No = "1")
    try:
        semester.Start_Date = start 
        semester.End_Date = end
        semester.Duration_Weeks = int(duration)
    except TypeError:
        response = "{Status : 'Fail'}"
    else:
        response =  "{Status : 'Success'}"
    response = json.dumps(reponse)
    return HttpResponse(response, content_type="application/json")

