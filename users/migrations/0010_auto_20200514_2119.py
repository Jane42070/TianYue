# Generated by Django 3.0.5 on 2020-05-14 13:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0009_auto_20200514_1731'),
    ]

    operations = [
        migrations.CreateModel(
            name='PicTest',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('goods_pic', models.ImageField(upload_to='users')),
            ],
        ),
        migrations.AlterField(
            model_name='bookinfo',
            name='bauthor',
            field=models.CharField(blank=True, default='不详', max_length=80, verbose_name='作者'),
        ),
        migrations.AlterField(
            model_name='bookinfo',
            name='bcontent',
            field=models.CharField(default='0', max_length=20, verbose_name='字数'),
        ),
        migrations.AlterField(
            model_name='bookinfo',
            name='bdate',
            field=models.DateField(default='1970-01-01', verbose_name='出版日期'),
        ),
        migrations.AlterField(
            model_name='bookinfo',
            name='bintro',
            field=models.TextField(default='此书暂无简介', max_length=1000, verbose_name='简介'),
        ),
        migrations.AlterField(
            model_name='bookinfo',
            name='bname',
            field=models.CharField(blank=True, max_length=200, verbose_name='书名'),
        ),
        migrations.AlterField(
            model_name='bookinfo',
            name='bout',
            field=models.CharField(blank=True, default='未知', max_length=40, verbose_name='出版社'),
        ),
        migrations.AlterField(
            model_name='bookinfo',
            name='bpic',
            field=models.CharField(default='暂无图片', max_length=200, verbose_name='封面'),
        ),
        migrations.AlterField(
            model_name='bookinfo',
            name='bprice',
            field=models.DecimalField(blank=True, decimal_places=2, default=20.0, max_digits=10, verbose_name='价格'),
        ),
        migrations.AlterField(
            model_name='bookinfo',
            name='btype',
            field=models.CharField(default='小说', max_length=20, verbose_name='分类'),
        ),
    ]
