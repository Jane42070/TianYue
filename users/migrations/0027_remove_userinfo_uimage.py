# Generated by Django 3.0.5 on 2020-05-17 02:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0026_userinfo_uimage'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userinfo',
            name='uimage',
        ),
    ]
