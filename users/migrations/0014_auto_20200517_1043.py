# Generated by Django 3.0.5 on 2020-05-17 02:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0013_auto_20200517_1041'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userinfo',
            name='uimage',
            field=models.ImageField(default='users/default.jpg', upload_to='users'),
        ),
    ]
