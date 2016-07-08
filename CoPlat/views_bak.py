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

###########################################################################
def teacher_load(request):
    template = loader.get_template('CoPlat/teacher.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))

def teacher_course_load(request):
    template = loader.get_template('CoPlat/teacherCourse.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))


def admin_load(request):
    template = loader.get_template('CoPlat/loginadmin.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))


def administrator_load(request):
    template = loader.get_template('CoPlat/administrator.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))


def adminCourse_load(request):
    template = loader.get_template('CoPlat/adminCourse.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))
#######################################################################

def student_courselist_load(request):
    template = loader.get_template('CoPlat/studentCourse.html')
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
            coursework_name = student_id + '_' +coursework_no + '.pdf'
            new_assignment = Assignment(student = Student.objects.get(Id = student_id), coursework = Coursework.objects.get(No = coursework_no))
            new_assignment.Attachment.save(coursework_name, file_content)
            new_assignment.save()
            result = "{Status : 'Success'}"
    response = json.dumps(result)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def student_courselist_response(request):
    request_Id = request.POST.get('StudentId', '')
    rela_student = Student.objects.get(Id = request_Id)
    response = "{\"courses\": ["
    course_list = list(rela_student.course_set.all())
    for element in course_list:
        rela_course_no = str(element)
        rela_course = Course.objects.get(No = rela_course_no)
        response = response + rela_course.get_course_info() + ","
    response = response[0:-1] + "]}"
    response = json.dumps(response)
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
            file_name = rela_course.No + '_resource' + resource_no + '.pdf'
            new_resource = Resource(No = resource_no, Category = resource_category, course = rela_course)
            new_resource.Attachment.save(file_name, file_content)
            new_resource.save()
            result = "{Status : 'Success'}"
    response = json.dumps(result)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def teacher_courselist_response(request):
    request_Id = request.POST.get('Teacherid', '')
    rela_teacher = Teacher.objects.get(Id = request_Id)
    response = "{\"courses\": ["
    course_list = list(rela_teacher.course_set.all())
    for element in course_list:
        rela_course_no = str(element)
        rela_course = Course.objects.get(No = rela_course_no)
        response = response + rela_course.get_course_info() + ","
    response = response[0:-1] + "]}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def teacher_coursedetails_response(request):
    request_Id = request.POST.get('CourseId', '')
    rela_course = Course.objects.get(No = request_Id)
    response = "{\"CourseName\": \"" + rela_course.Title + "\","

    teacher_list = list(rela_course.Course_Instructors.all())
    teacher_info = "\"Teacher\" : ["
    for element in teacher_list:
        rela_teacher_id = str(element)
        rela_teacher = Teacher.objects.get(Id = rela_teacher_id)
        teacher_info = teacher_info + "{\"TeacherId\" : \"" + rela_teacher_id + "\", \"TeacherName\":\"" + rela_teacher.user.first_name + rela_teacher.user.last_name + "\"},"
    teacher_info = teacher_info[0:-1] + "],"
    response = response + teacher_info + "\"Credit\":\"" + str(rela_course.Credit) + "\"," + "\"Weeks\":\"" + str(rela_course.Duration) + "\"}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def courseworklist_response(request):
    request_Id = request.POST.get('CourseId', '')
    rela_course = Course.objects.get(No = request_Id)
    response = "{"
    coursework_list = list(rela_course.coursework_set.all())
    for i in range(0, len(coursework_list) - 1):
        rela_coursework_no = str(coursework_list[i])
        response = response + "\"" + str(i) +  "\" : \"" + rela_coursework_no + "\","
    response = response[0:-1] + "}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def coursework_studentlist_response(request):
    request_Id = request.POST.get('HomeworkId', '')
    rela_coursework = Coursework.objects.get(No = request_Id)
    response = "{\"Description\":\"" + rela_coursework.Description + "\",\"StartTime\":\"" + str(rela_coursework.Start_Time) + "\",\"EndTime\":\"" + str(rela_coursework.End_Time) + "\"," 
    student_list = list(rela_coursework.Enrolled_Students.all())
    student_info = "\"Students\" : ["
    for element in student_list:
        rela_student_id = str(element)
        f = open("text.txt", "w")
        f.write(rela_student_id)
        f.close()
        rela_student = Student.objects.get(Id = rela_student_id)
        student_info = student_info + "{\"StudentId\" : \"" + rela_student_id + "\", \"StudentName\":\"" + rela_student.user.first_name + " " + rela_student.user.last_name + "\"},"
    student_info = student_info[0:-1] + "]}"
    response = response + student_info
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")


### Global variables to set coursework info
global Student_Id
global Coursework_No
@csrf_exempt
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

@csrf_exempt
def file_download_response(request):
    global Student_Id
    global Coursework_No
    file_name = Student_Id + '_' + Coursework_No + '.pdf'
    path = "/home/cloudyrie/pyenv/base/CoPlat/media/Coursework/" + file_name
    response = open(path, "rb").read()
    ### content_type can be specified here!
    return HttpResponse(response, content_type="application/pdf")

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

#######################################################################33
@csrf_exempt
def get_course_list(request):
    course_list = Course.objects.all()
    courses = []
    for cl in course_list:
        courses.append({"CourseId":cl.No,"CourseName":cl.Title})

    response = json.dumps(courses)
    return HttpResponse(response,content_type="application/json")


@csrf_exempt
def create_new_course(request):
    title = request.POST.get('Name','')
    teacherid = request.POST.get('TeacherID','')
    credit = request.POST.get('Credit', '')
    weeks = request.POST.get('Weeks', '')

    try:
        count = Course.objects.count()
        course = Course.__init__(count+1,title,credit,weeks)
        teacherlist = Teacher.objects.all()
        for t in teacherlist:
            if t.Id == teacherid:
                instruction = Instruction.__init__(t,course)
                break
    except:
        response = "{Status : 'Fail'}"
    else:
        response = "{Status : 'Success'}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")


@csrf_exempt
def get_course_details(request):
    courseid = request.POST.get('CourseId','')
    course_details = {}

    for c in Course.objects.all():
        if c.No == courseid:
            course_details["CourseName"] = c.Title
            teacherlist = []
            list = Instruction.objects.all()
            for i in list:
                if i.course.No == courseid:
                    teacherlist.append({"TeacherId": i.teacher.Id, "TeacherName":i.teacher.user.last_name+i.teacher.user.first_name})
            course_details["Teacher"] = teacherlist
            course_details["Credit"] = c.Credit
            course_details["Weeks"] = c.Duration
            break

    response = json.dumps(course_details)
    return HttpResponse(response, content_type="application/json")


@csrf_exempt
def allocate_students_to_course(request):
    courseid = request.POST.get('CourseId', '')
    studentid = request.POST.get('StudentId', '')
    e = Enrollment.__init__()
    try:
        for c in Course.objects.all():
            if c.No == courseid:
                e.course = c
            break

        for s in Student.objects.all():
            if s.Id == studentid:
                e.student = s
            break
    except:
        response = "{Status : 'Fail'}"
    else:
        response = "{Status : 'Success'}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")


@csrf_exempt
def get_student_courselist(request):
    studentid = request.POST.get('StudentId', '')
    courses = []
    for e in Enrollment.objects.all():
        if e.student.Id == studentid :
            courses.append({"CourseId":e.course.No,"CourseName":e.course.Title})

    response = json.dumps(courses)
    return HttpResponse(response, content_type="application/json")
############################################################################
