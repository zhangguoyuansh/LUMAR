# Generated by Django 2.2.2 on 2021-06-30 21:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('personal', '0014_auto_20210630_2051'),
    ]

    operations = [
        migrations.AlterField(
            model_name='explorationapplicationrecord',
            name='record_type',
            field=models.CharField(choices=[('0', 'Returned'), ('1', 'Assessed'), ('2', 'Receipted'), ('3', 'Confirmed')], max_length=10, verbose_name='记录类型'),
        ),
    ]