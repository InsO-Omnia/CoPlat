# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-05 02:05
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CoPlat', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='assignment',
            old_name='Coursework',
            new_name='coursework',
        ),
        migrations.RenameField(
            model_name='assignment',
            old_name='Student',
            new_name='student',
        ),
        migrations.RenameField(
            model_name='instruction',
            old_name='Course',
            new_name='course',
        ),
        migrations.RenameField(
            model_name='instruction',
            old_name='Teacher',
            new_name='teacher',
        ),
        migrations.AlterField(
            model_name='resource',
            name='Category',
            field=models.CharField(choices=[('documentation', 'DOCUMENTATION'), ('uncategoried', 'UNCATEGORIED'), ('handouts', 'HANDOUTS'), ('vedio', 'VEDIO')], default='uncategoried', max_length=20),
        ),
    ]