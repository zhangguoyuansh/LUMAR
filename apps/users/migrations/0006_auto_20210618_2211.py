# Generated by Django 2.2.2 on 2021-06-18 22:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0005_auto_20210618_2123'),
    ]

    operations = [
        migrations.AddField(
            model_name='structure',
            name='abn',
            field=models.CharField(default='434-432', max_length=60, verbose_name='abn'),
        ),
        migrations.AddField(
            model_name='structure',
            name='telephone',
            field=models.CharField(default='088880000', max_length=60, verbose_name='telephone'),
        ),
    ]
