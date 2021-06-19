# Generated by Django 2.2.2 on 2021-06-17 16:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adm', '0002_auto_20180607_1211'),
    ]

    operations = [
        migrations.AlterField(
            model_name='asset',
            name='customer',
            field=models.CharField(blank=True, default='', max_length=80, null=True, verbose_name='add_time'),
        ),
        migrations.AlterField(
            model_name='customer',
            name='add_time',
            field=models.DateTimeField(auto_now_add=True, verbose_name='add time'),
        ),
        migrations.AlterField(
            model_name='customer',
            name='address',
            field=models.CharField(max_length=100, verbose_name='Address'),
        ),
        migrations.AlterField(
            model_name='customer',
            name='desc',
            field=models.TextField(blank=True, null=True, verbose_name='Note'),
        ),
        migrations.AlterField(
            model_name='customer',
            name='name',
            field=models.CharField(max_length=20, verbose_name='name'),
        ),
        migrations.AlterField(
            model_name='customer',
            name='phone',
            field=models.CharField(max_length=30, verbose_name='phone'),
        ),
        migrations.AlterField(
            model_name='customer',
            name='status',
            field=models.BooleanField(default=True, verbose_name='status'),
        ),
    ]