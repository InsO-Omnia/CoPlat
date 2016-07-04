from django.db import models

# Create your models here.


class Admin(models.Model):
    ID = models.CharField(max_length=50,primary_key=True)
    Name = models.CharField(max_length=50)
    Password = models.CharField(max_length=50)


class Teacher(models.Model):
    ID = models.CharField(max_length=50,primary_key=True)
    Name = models.CharField(max_length=50)
    Password = models.CharField(max_length=50)
    Email = models.EmailField(max_length=50)


class Student(models.Model):
    ID = models.CharField(max_length=50,primary_key=True)
    Name = models.CharField(max_length=50)
    Password = models.CharField(max_length=50)
    Email = models.EmailField(max_length=50)


class Term(models.Model):
    ID = models.CharField(max_length=50,primary_key=True)
    StartTime = models.DateField()
    EndTime = models.DateField()
    Weeks = models.IntegerField()


class Course(models.Model):
    ID = models.CharField(max_length=50,primary_key=True)
    Name = models.CharField(max_length=50)
    Credit = models.FloatField(max_length=10)
    Weeks = models.IntegerField(max_length=10)
    StartWeek = models.IntegerField(max_length=10)
    EndWeek = models.IntegerField(max_length=10)


class Task(models.Model):
    ID = models.CharField(max_length=50,primary_key=True)
    Description = models.CharField(max_length=2000)
    StartTime = models.DateTimefield()
    DeadLine = models.DateTimeField()
    IsTeamwork = models.CharField(max_length=1)


class CourseSelected(models.Model):
    CourseID = models.CharField(max_length=50)
    TeacherID = models.CharField(max_length=50)
    StudentID = models.CharField(max_length=50)


class TaskBelong(models.Model):
    CourseID = models.CharField(max_length=50)
    TeacherID = models.CharField(max_length=50)
    StudentID = models.CharField(max_length=50)
    Content = models.CharField(max_length=2000)
    Attachment = models.CharField(max_length=2000)
    Score = models.IntegerField(max_length=10)
    Comment = models.CharField(max_length=2000)


class Resource(models.Model):
    ID = models.CharField(max_length=50,primary_key=True)
    CourseID = models.CharField(max_length=50)
    TeacherID = models.CharField(max_length=50)
    Attachment = models.CharField(max_length=2000)
    Category = models.CharField(max_length=50)


