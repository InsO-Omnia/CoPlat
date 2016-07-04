from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt
import json

# Create your views here.

#######################################################################
# For CoPlat - version 1.0beta
#
# Author: Cloudyrie
#
# Description: views.py is used to implement most of the functions
#              of CoPlat, namely receiving requests from the
#              front-end and sending requests to the database-end.
#              each function is associated to a python function
#              here. We divide python functions into several sections
#              with specific naming conventions, which you should
#              refer to when adding or modifying python functions.
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
    # use context if template variable is included in respective page.
    context = {}
    return HttpResponse(template.render(context, request))

def login_load(request):
    template = loader.get_template('CoPlat/login.html')
    # use context if template variable is included in respective page.
    context = {}
    return HttpResponse(template.render(context, request))

def student_load(request):
    template = loader.get_template('CoPlat/student.html')
    # use context if template variable is included in respective page.
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
    # test info, need to be rewritten after merged with models.py
    if idstr == "11110000" and password == "123456" and identity == "student":
        res = "{Status : 'Success'}" 
    else:
        res = "{Status : 'Fail'}"
    encodedjson = json.dumps(res)
    return HttpResponse(encodedjson, content_type="application/json")
