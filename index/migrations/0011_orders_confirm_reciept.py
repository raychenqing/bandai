# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2018-08-31 07:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0010_orders'),
    ]

    operations = [
        migrations.AddField(
            model_name='orders',
            name='confirm_reciept',
            field=models.BooleanField(default=False, verbose_name='确认收货'),
        ),
    ]