# Generated by Django 2.2.2 on 2021-06-18 21:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_auto_20210617_1658'),
    ]

    operations = [
        migrations.AddField(
            model_name='structure',
            name='address',
            field=models.CharField(default='LUMAR', max_length=60, verbose_name='address'),
        ),
    ]
