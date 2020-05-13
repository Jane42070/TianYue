# Generated by Django 3.0.5 on 2020-05-12 08:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BookInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bname', models.CharField(blank=True, max_length=20, unique=True)),
                ('bout', models.CharField(blank=True, default='未知', max_length=20)),
                ('bauthor', models.CharField(blank=True, default='不详', max_length=20)),
                ('bdate', models.DateField(default='1970-01-01')),
                ('bpic', models.CharField(default='暂无图片', max_length=20)),
                ('bintro', models.CharField(default='此书暂无简介', max_length=100)),
                ('bcontent', models.TextField(default='暂无内容，敬请期待', max_length=10000)),
                ('bprice', models.DecimalField(blank=True, decimal_places=2, default=20.0, max_digits=5)),
            ],
            options={
                'db_table': 'book_info',
            },
        ),
        migrations.CreateModel(
            name='UserInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uid', models.CharField(blank=True, max_length=20, unique=True)),
                ('upassword', models.CharField(max_length=20)),
                ('uname', models.CharField(blank=True, default=models.CharField(blank=True, max_length=20, unique=True), max_length=20)),
                ('ugender', models.BooleanField(default=False)),
                ('udate', models.DateField()),
                ('uemail', models.CharField(blank=True, max_length=40)),
                ('uaddr', models.CharField(default='未知', max_length=100)),
                ('uphone', models.CharField(blank=True, max_length=20)),
                ('ucomment', models.CharField(blank=True, default='这个人很懒，什么都没有写', max_length=100)),
            ],
            options={
                'db_table': 'user_info',
            },
        ),
        migrations.CreateModel(
            name='CommentInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ccomment', models.CharField(max_length=100)),
                ('cstar', models.IntegerField(null=True)),
                ('cbook', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.BookInfo')),
                ('cuser', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.UserInfo')),
            ],
            options={
                'db_table': 'comment_info',
            },
        ),
    ]
