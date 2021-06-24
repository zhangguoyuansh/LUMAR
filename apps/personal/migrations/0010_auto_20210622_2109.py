# Generated by Django 2.2.2 on 2021-06-22 21:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('personal', '0009_auto_20210622_2059'),
    ]

    operations = [
        migrations.AlterField(
            model_name='explorationapplication',
            name='accommodation',
            field=models.CharField(blank=True, max_length=50, null=True, verbose_name='accommodation'),
        ),
        migrations.AlterField(
            model_name='explorationapplication',
            name='catering',
            field=models.CharField(blank=True, max_length=50, null=True, verbose_name='catering'),
        ),
        migrations.AlterField(
            model_name='explorationapplication',
            name='travel',
            field=models.CharField(blank=True, max_length=50, null=True, verbose_name='travel'),
        ),
        migrations.AlterField(
            model_name='explorationapplication',
            name='venue',
            field=models.CharField(blank=True, max_length=50, null=True, verbose_name='venue'),
        ),
    ]
