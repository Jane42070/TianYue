# Generated by Django 3.0.5 on 2020-05-17 02:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0027_remove_userinfo_uimage'),
    ]

    operations = [
        migrations.AddField(
            model_name='userinfo',
            name='uimage',
            field=models.ImageField(default='/media/users/default.jpg', upload_to='users'),
        ),
    ]
