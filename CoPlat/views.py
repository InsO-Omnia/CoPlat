from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt
import json

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
    encodedjson = json.dumps(res)
    return HttpResponse(encodedjson, content_type="application/json")


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


#######################################################################
# Responses for requests from teachers.
#######################################################################


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

