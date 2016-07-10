from django.shortcuts import render, Http404, HttpResponseRedirect
from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt, csrf_exempt, ensure_csrf_cookie
import json
from datetime import datetime,timedelta
from .models import *
from django.core.exceptions import ObjectDoesNotExist
from django.core.files.base import ContentFile
import os
import time
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

### using login page as index
def index_load(request):
    template = loader.get_template('CoPlat/login.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))


def student_load(request):
    template = loader.get_template('CoPlat/student.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))


def teacher_load(request):
    template = loader.get_template('CoPlat/teacher.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))

def admin_load(request):
    template = loader.get_template('CoPlat/loginadmin.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))

def student_course_load(request):
    template = loader.get_template('CoPlat/studentCourse.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))

def teacher_course_load(request):
    template = loader.get_template('CoPlat/teacherCourse.html')
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

def adminSemester_load(request):
    template = loader.get_template('CoPlat/adminSemester.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))

def displayStudentList_load(request):
    template = loader.get_template('CoPlat/displayStudentList.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))

def studentInformation_load(request):
    template = loader.get_template('CoPlat/studentInformation.html')
    # use context if template variable is included in the respective page.
    context = {}
    return HttpResponse(template.render(context, request))
def teacherInformation_load(request):
    template = loader.get_template('CoPlat/teacherInformation.html')
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
# Responses for requests from both students and teachers.
#######################################################################

@csrf_exempt
def courseworklist_response(request):
    request_Id = request.POST.get('CourseId', '')
    rela_course = Course.objects.get(No = request_Id)
    response = "{"
    coursework_list = list(rela_course.coursework_set.all())
    for i in range(len(coursework_list)):
        rela_coursework_no = str(coursework_list[i])
        response = response + "\"" + str(i) +  "\" : \"" + rela_coursework_no + "\","
    if len(coursework_list) == 0:
        response = response + "}"
    else:
        response = response[0:-1] + "}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")




#######################################################################
# Responses for requests from students.
#######################################################################

@csrf_exempt
def student_courselist_response(request):
    request_Id = request.POST.get('StudentId', '')
    rela_student = Student.objects.get(Id = request_Id)
    response = "{\"courses\": [ "
    course_list = list(rela_student.course_set.all())
    for element in course_list:
        rela_course_no = str(element)
        rela_course = Course.objects.get(No = rela_course_no)
        response = response + rela_course.get_course_info() + ","
    response = response[0:-1] + "]}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def student_teamcourselist_response(request):
    if request.method == "POST":
        response = "{\"courses\": [ "
        course_list = list(Course.objects.filter(Team_Admittance == True))
        for element in course_list:
            rela_course_no = str(element)
            rela_course = Course.objects.get(No = rela_course_no)
            response = response + rela_course.get_course_info() + ","
        response = response[0:-1] + "]}"
        response = json.dumps(response)
        return HttpResponse(response, content_type="application/json")


@csrf_exempt
def get_studentCourse_information(request):
    id = request.POST.get('CourseId', '')
    information = []
    for c in Course.objects.all():
        if (c.No ==id):
            courseName = c.Title
            credit = str(c.Credit)
            weeks = str(c.Duration)
            for i in Instruction.objects.all():
                if (i.course.No == id):
                    teacherId = i.teacher.Id
                    teacherName = i.teacher.user.first_name+i.teacher.user.last_name
                    information.append({"TeacherId": teacherId, "TeacherName": teacherName})
    response = json.dumps(information)
    response = "{ \"CourseName\": "+ "\"" + courseName+"\""+","+"\"Teacher\":"+ response +","+"\"Credit\":"+ "\""+credit+ "\""+","+"\"Weeks\":"+ "\""+weeks+ "\""+"}"
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def get_workInformation(request):
    rela_student = Student.objects.get(Id = request.POST.get('StudentId', ''))
    rela_coursework = Coursework.objects.get(No = request.POST.get('HomeworkId', ''))
    rela_assign = Assignment.objects.get(No = rela_student.Id + '_' + rela_coursework.No)
    description = rela_coursework.Description
    starttime = str(rela_coursework.Start_Time)
    starttime = starttime[0:-6]
    endtime = str(rela_coursework.End_Time)
    endtime = endtime[0:-6]
    content = rela_assign.Content
    score = rela_assign.Score
    comment = rela_assign.Comment
    file_path = "/CoPlat/media/Coursework/" + rela_assign.Title
    response = "{ \"Description\": "+ "\"" + description +"\""+","+"\"StartTime\":\""+ starttime  + "\","+"\"EndTime\":"+ "\""+endtime+ "\""+","+"\"TextHomework\":"+ "\""+content+ "\",\"FileHomeworkPath\":\"" + file_path +  "\",\"Score\":\"" + str(score) + "\",\"Comment\":\"" + comment + "\"}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")
 
@csrf_exempt
def resourcelist_load_response(request):
    if request.method == 'POST':
        rela_course = Course.objects.get(No = request.POST.get('CourseId','')) 
        resource_category = request.POST.get('Type','')
        resource_list = Resource.objects.filter(Category = resource_category)
        response = "{\"Resource\" : [ "
        for element in resource_list:
            resource_des = element.Description
            if (resource_des == ''):
                resource_des = 'Unknown'
            resource_path = '/CoPlat/media/Resource/' + element.Title
            response = response + "{\"ResourceId\" : \"" + element.No + "\", \"ResourceDes\":\"" + resource_des + "\", \"ResourcePath\":\"" + resource_path +"\"},"
    response = response[0:-1] + "]}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def coursework_upload_response(request):
    if request.method == 'POST':
        student_id = request.POST.get('StudentId','')
        coursework_no = request.POST.get('HomeworkId','')
        content = request.POST.get('TextHomework','')
        assign_no = student_id + '_' + coursework_no
        rela_coursework = Coursework.objects.get(No = coursework_no)
        upload_file = request.FILES.get('File','')
        result = "{Status : 'Fail'}"
        try:
            rela_assign = Assignment.objects.get(No = assign_no)
        except ObjectDoesNotExist:
            if upload_file:
                file_content = ContentFile(upload_file.read())
                file_type= upload_file.name.split(".")[-1]
                coursework_name = student_id + '_' +coursework_no + '.' + file_type 
                new_assignment = Assignment(No = assign_no, student = Student.objects.get(Id = student_id), coursework = Coursework.objects.get(No = coursework_no), Title = coursework_name, Content = content)
                new_assignment.Attachment.save(coursework_name, file_content)
                new_assignment.save()
            else:
                new_assignment = Assignment(No = assign_no, student = Student.objects.get(Id = student_id), coursework = Coursework.objects.get(No = coursework_no),Content = content)
                new_assignment.save()
            result = "{Status : 'Success'}"
        else:
            if upload_file:
                file_content = ContentFile(upload_file.read())
                file_type= upload_file.name.split(".")[-1]
                coursework_name = student_id + '_' +coursework_no + '.' + file_type 
                if content != '':
                    rela_assign.Content = content
                rela_assign.Title = coursework_name
                rela_assign.Attachment.save(coursework_name, file_content)
                rela_assign.save()
            else:
                if content != '':
                    rela_assign.Content = content
                    rela_assign.save()
            result = "{Status : 'Success'}"
    response = json.dumps(result)
    return HttpResponse(response, content_type="application/json")

#######################################################################
# Responses for requests from teachers.
#######################################################################

@csrf_exempt
def teacher_courselist_response(request):
    request_Id = request.POST.get('Teacherid', '')
    rela_teacher = Teacher.objects.get(Id = request_Id)
    response = "{\"courses\": [ "
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
    teacher_info = "\"Teacher\" : [ "
    for element in teacher_list:
        rela_teacher_id = str(element)
        rela_teacher = Teacher.objects.get(Id = rela_teacher_id)
        teacher_info = teacher_info + "{\"TeacherId\" : \"" + rela_teacher_id + "\", \"TeacherName\":\"" + rela_teacher.user.first_name + rela_teacher.user.last_name + "\"},"
    teacher_info = teacher_info[0:-1] + "],"
    response = response + teacher_info + "\"Credit\":\"" + str(rela_course.Credit) + "\"," + "\"Weeks\":\"" + str(rela_course.Duration) + "\"}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def coursework_studentlist_response(request):
    id = request.POST.get('HomeworkId','')
    courseWork = Coursework.objects.get(No = id)
    coursedetail = {}
    coursedetail['Description'] = courseWork.Description
    coursedetail['StartTime'] = str(courseWork.Start_Time)[:-6]
    coursedetail['EndTime'] = str(courseWork.End_Time)[:-6]
    assignment = Assignment.objects.filter(coursework=courseWork)
    studentlist =[]
    for i in assignment:
        d = {}
        d['StudentId'] = i.student.Id
        d['StudentName'] = i.student.user.last_name+i.student.user.first_name
        studentlist.append(d)
    coursedetail['Students'] = studentlist
    response = json.dumps(coursedetail)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def particular_courseworkpath_response(request):

    rela_student = Student.objects.get(Id = request.POST.get('StudentId',''))
    rela_coursework = Coursework.objects.get(No = request.POST.get('HomeworkId',''))
    rela_assign = Assignment.objects.get(No = rela_student.Id + '_' + rela_coursework.No)
    if rela_assign.Attachment == '':
        path = ''
    else:
        path = '/CoPlat/media/Coursework/' + rela_assign.Title
    content = rela_assign.Content
    response = {'Path': path,'TextHomework':content}
    response = json.dumps(response)
    print(response)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def add_coursework_response(request):
    courseid = request.POST.get('CourseId','')
    description = request.POST.get('Description','')
    starttime = datetime.strptime(request.POST.get('StartTime' , '') , '%Y-%m-%dT%H:%M')
    starttime = starttime + timedelta(hours=8)
    endtime = datetime.strptime(request.POST.get('EndTime',''),'%Y-%m-%dT%H:%M')
    endtime = endtime + timedelta(hours=8)
    try:
        c = Course.objects.get(No=courseid)
        cw = Coursework(No=courseid + '_' + str(Coursework.objects.count() + 1), Description=description, Start_Time=starttime, End_Time=endtime,course=c)
        cw.save()
    except:
        response = {'Status': 'Fail'}
    else:
        response = {'Status': 'Success'}

    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def resource_upload_response(request):
    if request.method == 'POST':
        rela_course = Course.objects.get(No = request.POST.get('CourseId','')) 
        resource_category = request.POST.get('Type','')
        resource_no = rela_course.No + str(len(list(rela_course.coursework_set.all())))
        upload_file = request.FILES.get('File','')
        result = "{Status : 'Fail'}"
        if upload_file:
            file_content = ContentFile(upload_file.read())
            file_type= upload_file.name.split(".")[-1]
            file_name = 'resource_' + resource_no + '_' + resource_category + '.' + file_type
            new_resource = Resource(No = resource_no, Title = file_name, Description = request.POST.get('Description',''),Category = resource_category, course = rela_course)
            new_resource.Attachment.save(file_name, file_content)
            new_resource.save()
            result = "{Status : 'Success'}"
    response = json.dumps(result)
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
    return HttpResponse(response, content_type="application/octet-stream")

@csrf_exempt
def add_comment_response(request):
    rela_student = Student.objects.get(Id = request.POST.get('StudentId',''))
    rela_coursework = Coursework.objects.get(No = request.POST.get('HomeworkId',''))
    score = request.POST.get('Score','')
    if score == '':
        score = '0'
    comment_text = request.POST.get('CommentText','')
    rela_assign_list = list(Assignment.objects.filter(student = rela_student, coursework = rela_coursework))
    if len(rela_assign_list):
        rela_assign = rela_assign_list[0]
        rela_assign.Score = int(score)
        rela_assign.Comment = comment_text
        rela_assign.save()
        response = json.dumps("{Status : 'Success'}")
    else:
        response = json.dumps("{Status : 'Fail'}")
    return HttpResponse(response, content_type="application/json")


@csrf_exempt
def course_studentlist_response(request):
    id = request.POST.get('CourseId','')
    list =[]
    for e in Enrollment.objects.all():
        if(e.course.No==id):
            studentid = e.student.Id
            studentname = e.student.user.first_name+e.student.user.last_name
            list.append({"StudentId":studentid,"StudentName":studentname})

    response = json.dumps(list)
    d = len(response) - 1
    response = response[1:d]
    response ="{"+"\""+"Students"+"\""+":["+response+"]}"
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def get_studentName_response(request):
    id = request.POST.get('StudentId','')
    s = Student.objects.get(Id =id)
    name = s.user.first_name+s.user.last_name
    response = "{"+"\""+"StudentName"+"\""+":"+"\""+name+"\""+"}"
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def update_studentPassword(request):
    u = User.objects.get(username=request.POST.get('StudentId',''))
    if(u.check_password(request.POST.get('Pwd1','')) == False):
        response="{"+"\""+"Status"+"\""+":"+"\""+"Fail"+"\""+"}"
    else:
        u.set_password(request.POST.get('Pwd2',''))
        u.save()
        response="{"+"\""+"Status"+"\""+":"+"\""+"Success"+"\""+"}"

    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def get_teacherName_response(request):
    id = request.POST.get('TeacherId','')
    t = Teacher.objects.get(Id =id)
    name = t.user.first_name+t.user.last_name
    response = "{"+"\""+"TeacherName"+"\""+":"+"\""+name+"\""+"}"
    return HttpResponse(response, content_type="application/json")
@csrf_exempt
def update_teacherPassword(request):
    u = User.objects.get(username=request.POST.get('TeacherId',''))
    if(u.check_password(request.POST.get('Pwd1','')) == False):
        response="{"+"\""+"Status"+"\""+":"+"\""+"Fail"+"\""+"}"
    else:
        u.set_password(request.POST.get('Pwd2',''))
        u.save()
        response="{"+"\""+"Status"+"\""+":"+"\""+"Success"+"\""+"}"

    return HttpResponse(response, content_type="application/json")


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
        semester.save()
    except TypeError:
        response = {'Status' : 'Fail'}
    else:
        response =  {'Status' : 'Success'}
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def admin_courselist_response(request):
    courses = []
    for cl in Course.objects.all():
        courses.append({"CourseId":cl.No,"CourseName":cl.Title})

    response = json.dumps(courses)
    response = "{\"courses\":"+response+"}"
    return HttpResponse(response,content_type="application/json")

@csrf_exempt
def create_new_course(request):
    title = request.POST.get('Name','')

    credit = request.POST.get('Credit', '')
    weeks = request.POST.get('Weeks', '')
    startdate = request.POST.get('StartDate','')
    enddate = request.POST.get('EndDate', '')

    try:
        sem = Semester.objects.get(No='1')
        newCourse = Course(No=str(Course.objects.count()+1),Title=title,Credit=credit,Start_Date= startdate,End_Date=enddate,Duration=weeks,semester=sem)
        newCourse.save()
    except:
        response = {'Status' : 'Fail'}
    else:
        response = {'Status' : 'Success'}
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
            course_details["Credit"] = str(c.Credit)
            course_details["Weeks"] = str(c.Duration)
            break

    response = json.dumps(course_details)
    return HttpResponse(response, content_type="application/json")


@csrf_exempt
def allocate_students_to_course(request):
    courseid = request.POST.get('CourseId', '')
    studentid = request.POST.get('StudentId', '')
    c = Course.objects.get(No=courseid)
    s = Student.objects.get(Id=studentid)
    try:
        e = Enrollment.objects.get(student = s, course = c)
    except ObjectDoesNotExist:
        e = Enrollment(No = s.Id + '_' + c.No, student = s, course = c)
        e.save()
        response = {'Status' : 'Success'}
    else:
        response = {'Status' : 'Fail'}

    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

@csrf_exempt
def allocate_teachers_to_course(request):
    courseid = request.POST.get('CourseId', '')
    teacherid = request.POST.get('TeacherId', '')
    c = Course.objects.get(No=courseid)
    t = Teacher.objects.get(Id=teacherid)
    try:
        i = Instruction.objects.get(teacher=t,course=c)
    except ObjectDoesNotExist:
        i = Instruction(No = t.Id + '_' + c.No, teacher = t, course = c)
        i.save()
        response = {'Status' : 'Success'}
    else:
        response = {'Status' : 'Fail'}

    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

# @csrf_exempt
# def get_student_courselist(request):
#     id = request.POST.get('StudentId', '')
#     response = ""
#     courses = []
#     for e in Enrollment.objects.all():
#         if (e.student.Id == id):
#             courseId = e.course.No
#             courseName = e.course.Title
#             courses.append({"CourseId": courseId, "CourseName": courseName})

#     response = json.dumps(courses)
#     response = "{ \"courses\":  "+ response +"}"
#     return HttpResponse(response, content_type="application/json")

#######################################################################
# Responses for requests related with team.
#######################################################################


###need reconsidered
def team_build_response(request):
    try:
        rela_course = Course.objects.get(No = request.POST.get('CourseId',''))
    except ObjectDoesNotExist:
        print("Course does not exist!")
        response = json.dumps({'Status' : 'Fail'})
        return HttpResponse(response, content_type="application/json")
    else:
        if rela_course.Team_Admittance == False:
            response = json.dumps({'Status' : 'Fail'})
            return HttpResponse(response, content_type="application/json")
        else:
            rela_student = Student.objects.get(No = request.POST.get('StudentId',''))
            name = request.POST.get('Name','')
            description = request.POST.get('Description','')
            limit = int(request.POST.get('Limit',''))
            new_team = Team(No = rela_course.No + '_' + rela_student.Id, Name = name, Description = description, Capacity = 1, Limit = limit, Leader = rela_student, course = rela_course)
            new_team.save()
            new_memb = Membership(No = new_team.No + '_' + rela_student.Id, Student = rela_student, Team = new_team)
            new_memb.save()
            response = json.dumps({'Status' : 'Success'})
            return HttpResponse(response, content_type="application/json")

def team_memberlist_response(request):
    rela_team = Team.objects.get(No = request.POST.get('TeamId',''))
    response = "{\"Members\": [ "
    member_list = list(rela_team.Members.all())
    for element in member_list:
        rela_member_id = str(element)
        rela_student = Student.objects.get(Id = rela_member_id)
        response = response + rela_student.get_student_info() + ","
    response = response[0:-1] + "]}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

def leader_switch_response(request):
    try:
        rela_team = Team.objects.get(No = request.POST.get('TeamId',''))
        rela_student = Student.objects.get(No = request.POST.get('StudentId',''))
    except ObjectDoesNotExist:
        response = json.dumps({'Status' : 'Fail'})
        return HttpResponse(response, content_type="application/json")
    else:
        rela_team.Leader = rela_student
        rela_team.save()
        response = json.dumps({'Status' : 'Success'})
        return HttpResponse(response, content_type="application/json")

def display_candidateslist_response(request):
    rela_team = Course.objects.get(No = request.POST.get('TeamId',''))
    candidates_list = list(Team_Application.objects.filter(Response_Status = 'waiting'))
    response = "{\"Students\": [ "
    for element in enrolled_teams_list:
        rela_student_id = str(element.student.Id)
        rela_student = Student.objects.get(Id = rela_student_id)
        response = response + rela_student.get_student_info() + ","
    response = response[0:-1] + "]}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

def team_notready_details_response(request):
    rela_team = Team.objects.get(No = request.POST.get('TeamId',''))
    response = "{\"TeamName\": \"" + rela_team.Name + "\",\"TeamDes\": \"" + rela_team.Description + "\", \"TeamLimit\": " + str(rela_team.Limit - rela_team.Capacity) + "]}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

def team_application_response(request):
    rela_team = Team.objects.get(No = request.POST.get('TeamId',''))
    rela_student = Student.objects.get(No = request.POST.get('StudentId',''))
    try:
        memb = Membership.objects.get(No = rela_team.No + '_' + rela_student.Id)
    except ObjectDoesNotExist:
        try:
            new_application = Team_Application.objects.get(No = 'app_' + rela_team.No + '_' + rela_student.Id)
        except ObjectDoesNotExist:
            new_application = Team_Application(No = 'app_' + rela_team.No + '_' + rela_student.Id, team = rela_team, student = rela_student, Request_Info = request.POST.get('Content',''))
            new_application.save()
            response = json.dumps({'Status' : 'Success'})
            return HttpResponse(response, content_type="application/json")
        else:
            if new_application.Response_Status == 'rejected':
                new_application.Response_Status = 'waiting'
                new_application.save()
                response = json.dumps({'Status' : 'Success'})
                return HttpResponse(response, content_type="application/json")
            else:
                print("application already submitted, please wait!")
                response = json.dumps({'Status' : 'Fail'})
                return HttpResponse(response, content_type="application/json")
    else:
        print("you're already a member of this team")
        response = json.dumps({'Status' : 'Fail'})
        return HttpResponse(response, content_type="application/json")

def application_management_response(request):
    rela_student = Student.objects.get(No = request.POST.get('StudentId',''))
    application_list = list(Team_Application.objects.filter(student = rela_student))
    response = response = "{\"Teams\": [ "
    for element in application_list:
        rela_team = Team.objects.get(No = element.team.No)
        team_info = rela_team.get_team_info()
        response = response + team_info[0:-1] + "\"Status\": " + element.Response_Status + "},"
    response = response[0:-1] + "]}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

def application_getstatus_response(request):
    rela_application = Team_Application.objects.get(No = request.POST.get('ApplicationId',''))
    response = { Status : rela_application.Response_Status}
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

def application_setstatus_response(request):
    rela_student = Student.objects.get(Id = request.POST.get('StudentId',''))
    rela_team = Team.objects.get(No = request.POST.get('TeamId',''))
    try:
        rela_application = Team_Application.objects.get(No = 'app_' + rela_team.No + '_' + rela_student.Id)
    except ObjectDoesNotExist:
        print("Application does not exist!")
        response = json.dumps({'Status' : 'Fail'})
        return HttpResponse(response, content_type="application/json")
    else:
        decision = request.POST.get('Decision','')
        rela_application.Response_Status = decision
        rela_application.save()
        if decision == 'admitted':
            new_membership = Membership(student = rela_student, team = rela_team)
            new_membership.save()
        response = json.dumps({'Status' : 'Success'})
        return HttpResponse(response, content_type="application/json")

def team_isready_response(requset):
    try:
        rela_team = Team.objects.get(No = request.POST.get('TeamId',''))
    except ObjectDoesNotExist:
        print("Team does not exist!")
        response = json.dumps({'Status' : 'Fail'})
        return HttpResponse(response, content_type="application/json")
    else:
        response = json.dumps({Status : str(rela_team.Readily_Builded)})

### need to check that is any member already participate in the course.
def team_setready_response(request):
    try:
        rela_team = Team.objects.get(No = request.POST.get('TeamId',''))
    except ObjectDoesNotExist:
        print("Team does not exist!")
        response = json.dumps({'Status' : 'Fail'})
        return HttpResponse(response, content_type="application/json")
    else:
        rela_team.Readily_Builded = True
        response = json.dumps({'Status' : 'Success'})
        return HttpResponse(response, content_type="application/json")

def display_enrolledteams_response(request):
    rela_course = Course.objects.get(No = request.POST.get('CourseId',''))
    enrolled_teams_list = list(Team_Enrollment.objects.filter(course = rela_course))
    response = "{\"Teams\": [ "
    for element in enrolled_teams_list:
        rela_team_no = str(element)
        rela_team = Team.objects.get(No = rela_team_id)
        response = response + rela_team.get_team_info() + ","
    response = response[0:-1] + "]}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

def display_readyteams_response(request):
    rela_course = Course.objects.get(No = request.POST.get('CourseId',''))
    ready_teams_list = list(rela_course.team_set.filter(Readily_Builded = True, Admittance_Status = 'waiting'))
    response = "{\"Teams\": [ "
    for element in ready_teams_list:
        rela_team_no = str(element)
        rela_team = Team.objects.get(No = rela_team_no)
        response = response + rela_team.get_team_info() + ","
    response = response[0:-1] + "]}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

def team_details_response(request):
    rela_team = Team.objects.get(No = request.POST.get('TeamId',''))
    rela_student = Student.objects.get(Id = request.POST.get('StudentId',''))
    response = "{\"TeamName\": \"" + rela_team.Name + "\",\"TeamDes\": \"" + rela_team.Description + "\", \"Members\": [ "
    member_list = list(rela_team.Members.all())
    for element in member_list:
        rela_member_id = str(element)
        rela_student = Student.objects.get(Id = rela_member_id)
        response = response + rela_student.get_student_info() + ","
    response = response[0:-1] + "]"
    if rela_student:
        if rela_team.Leader == rela_student:
            response = response + "\"isLeader\": \"1\""
        else:
            response = response + "\"isLeader\": \"0\""
    if rela_team.Readily_Builded:
        response = response + "\"isComplete\": \"1\""
    else:
        response = response + "\"isComplete\": \"0\""
    response = response + "}"
    response = json.dumps(response)
    return HttpResponse(response, content_type="application/json")

def team_enroll_response(request):
    rela_course = Course.objects.get(No = request.POST.get('CourseId',''))
    rela_team = Team.objects.get(No = request.POST.get('TeamId',''))
    try:
        new_team_enrollment = Team_Enrollment(No = rela_course.No + '_' + rela_team.No, team = rela_team, course = rela_team)
    except:
        response = json.dumps({'Status' : 'Fail'})
        return HttpResponse(response, content_type="application/json")
    else:
        new_team_enrollment.save()
        rela_team.Admittance_Status = 'admitted'
        for member in rela_team.Members.all():
            new_personal_enrollment = Enrollment(No = member.Id + '_' + rela_course.No, student = member, course = rela_course)
            new_personal_enrollment.save()
        response = json.dumps({'Status' : 'Success'})
        return HttpResponse(response, content_type="application/json")


#######################################################################
# Responses for chat requests.
#######################################################################


# @csrf_exempt
# def post(request):
#     if request.method == 'POST':
#         post_type = request.POST.get('post_type')
#         if post_type == 'send_chat':
#             new_chat = Chat.objects.create(
#                 content = request.POST.get('content'),
#                 sender = request.user,
#             )
#             new_chat.save()
#             return HttpResponse()
#         elif post_type == 'get_chat':
#             last_chat_id = int(request.POST.get('last_chat_id'))
#             #print last_chat_id
#             chats = Chat.objects.filter(id__gt = last_chat_id)
#             return render(request, 'chat_list.html', {'chats': chats})
#     else:
#         raise Http404
