# Generated by Django 3.0.5 on 2020-05-14 09:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0008_auto_20200514_1718'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bookinfo',
            name='bauthor',
            field=models.CharField(blank=True, default='不详', max_length=80),
        ),
    ]
