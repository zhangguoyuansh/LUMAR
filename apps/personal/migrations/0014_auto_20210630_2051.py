# Generated by Django 2.2.2 on 2021-06-30 20:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('personal', '0013_auto_20210628_2155'),
    ]

    operations = [
        migrations.AlterField(
            model_name='explorationapplicationrecord',
            name='record_type',
            field=models.CharField(choices=[('0', 'Return'), ('1', 'Assess'), ('2', 'Receipt'), ('3', 'Confirm')], max_length=10, verbose_name='记录类型'),
        ),
    ]
