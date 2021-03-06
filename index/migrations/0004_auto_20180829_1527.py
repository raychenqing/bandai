# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2018-08-29 07:27
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0002_auto_20180814_1055'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cartinfo',
            name='ccount',
            field=models.PositiveIntegerField(verbose_name='数量'),
        ),
        migrations.AlterField(
            model_name='goods',
            name='aoi',
            field=models.PositiveIntegerField(default=1, verbose_name='库存数量'),
        ),
        migrations.AlterField(
            model_name='goods',
            name='goodsType',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='index.GoodsType', verbose_name='类型'),
        ),
        migrations.AlterField(
            model_name='goods',
            name='isActive',
            field=models.BooleanField(default=True, verbose_name='是否上架'),
        ),
        migrations.AlterField(
            model_name='goods',
            name='picture',
            field=models.ImageField(upload_to='static/upload/goods', verbose_name='图片'),
        ),
        migrations.AlterField(
            model_name='goods',
            name='price',
            field=models.DecimalField(decimal_places=2, max_digits=7, verbose_name='商品价格'),
        ),
        migrations.AlterField(
            model_name='goods',
            name='title',
            field=models.CharField(max_length=40, verbose_name='商品名称'),
        ),
    ]
