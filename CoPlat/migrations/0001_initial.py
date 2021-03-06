# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-11 16:05
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Admin',
            fields=[
                ('Id', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Assignment',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('Title', models.CharField(max_length=200)),
                ('Content', models.CharField(max_length=2000)),
                ('Attachment', models.FileField(upload_to='Coursework')),
                ('Score', models.IntegerField(null=True)),
                ('Comment', models.CharField(max_length=2000)),
            ],
        ),
        migrations.CreateModel(
            name='Course',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('Title', models.CharField(max_length=50)),
                ('Credit', models.FloatField(max_length=10)),
                ('Start_Date', models.DateField()),
                ('End_Date', models.DateField()),
                ('Duration', models.PositiveIntegerField()),
                ('Team_Admittance', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Coursework',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('Title', models.CharField(max_length=200)),
                ('Description', models.CharField(max_length=2000)),
                ('Start_Time', models.DateTimeField()),
                ('End_Time', models.DateTimeField()),
                ('Is_Teamwork', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Enrollment',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Course')),
            ],
        ),
        migrations.CreateModel(
            name='Instruction',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Course')),
            ],
        ),
        migrations.CreateModel(
            name='Membership',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.TextField()),
                ('time', models.DateTimeField(auto_now_add=True)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Course')),
                ('sender', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='has_chats', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Resource',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('Title', models.CharField(max_length=200)),
                ('Description', models.CharField(max_length=2000)),
                ('Attachment', models.FileField(upload_to='Resource')),
                ('Category', models.CharField(choices=[('documentation', 'DOCUMENTATION'), ('uncategoried', 'UNCATEGORIED'), ('vedio', 'VEDIO'), ('handouts', 'HANDOUTS')], default='uncategoried', max_length=20)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Course')),
            ],
        ),
        migrations.CreateModel(
            name='Semester',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('Start_Date', models.DateField()),
                ('End_Date', models.DateField()),
                ('Duration_Weeks', models.PositiveIntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('Id', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('Id', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Team',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('No', models.CharField(max_length=128)),
                ('Name', models.CharField(max_length=500)),
                ('Description', models.CharField(max_length=2000)),
                ('Capacity', models.IntegerField(default=1)),
                ('Limit', models.IntegerField(default=20)),
                ('Readily_Builded', models.BooleanField(default=False)),
                ('Admittance_Status', models.CharField(choices=[('waiting', 'WAITING'), ('admitted', 'ADMITTED'), ('rejected', 'REJECTED')], default='waiting', max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Team_Application',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('Request_Info', models.CharField(max_length=2000)),
                ('Response_Status', models.CharField(choices=[('waiting', 'WAITING'), ('admitted', 'ADMITTED'), ('rejected', 'REJECTED')], default='waiting', max_length=20)),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Student')),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Team')),
            ],
        ),
        migrations.CreateModel(
            name='Team_Assignment',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('Title', models.CharField(max_length=200)),
                ('Content', models.CharField(max_length=2000)),
                ('Attachment', models.FileField(upload_to='Coursework')),
                ('Score', models.IntegerField(blank=True)),
                ('Comment', models.CharField(max_length=2000)),
                ('coursework', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Coursework')),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Team')),
            ],
        ),
        migrations.CreateModel(
            name='Team_Enrollment',
            fields=[
                ('No', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Course')),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Team')),
            ],
        ),
        migrations.AddField(
            model_name='team',
            name='Candidates',
            field=models.ManyToManyField(related_name='applications_set', through='CoPlat.Team_Application', to='CoPlat.Student'),
        ),
        migrations.AddField(
            model_name='team',
            name='Leader',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Owningteams_set', to='CoPlat.Student'),
        ),
        migrations.AddField(
            model_name='team',
            name='Members',
            field=models.ManyToManyField(through='CoPlat.Membership', to='CoPlat.Student'),
        ),
        migrations.AddField(
            model_name='team',
            name='course',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Course'),
        ),
        migrations.AddField(
            model_name='membership',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Student'),
        ),
        migrations.AddField(
            model_name='membership',
            name='team',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Team'),
        ),
        migrations.AddField(
            model_name='instruction',
            name='teacher',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Teacher'),
        ),
        migrations.AddField(
            model_name='enrollment',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Student'),
        ),
        migrations.AddField(
            model_name='coursework',
            name='Enrolled_Students',
            field=models.ManyToManyField(through='CoPlat.Assignment', to='CoPlat.Student'),
        ),
        migrations.AddField(
            model_name='coursework',
            name='Enrolled_Teams',
            field=models.ManyToManyField(through='CoPlat.Team_Assignment', to='CoPlat.Team'),
        ),
        migrations.AddField(
            model_name='coursework',
            name='course',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Course'),
        ),
        migrations.AddField(
            model_name='course',
            name='Course_Instructors',
            field=models.ManyToManyField(through='CoPlat.Instruction', to='CoPlat.Teacher'),
        ),
        migrations.AddField(
            model_name='course',
            name='Enrolled_Students',
            field=models.ManyToManyField(through='CoPlat.Enrollment', to='CoPlat.Student'),
        ),
        migrations.AddField(
            model_name='course',
            name='semester',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Semester'),
        ),
        migrations.AddField(
            model_name='assignment',
            name='coursework',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Coursework'),
        ),
        migrations.AddField(
            model_name='assignment',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CoPlat.Student'),
        ),
    ]
