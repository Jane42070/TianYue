# Generated by Django 3.0.5 on 2020-05-13 03:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20200513_1114'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bookinfo',
            name='bpic',
            field=models.CharField(default='暂无图片', max_length=200),
        ),
    ]
