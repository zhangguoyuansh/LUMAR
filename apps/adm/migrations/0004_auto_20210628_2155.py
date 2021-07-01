# Generated by Django 2.2.2 on 2021-06-28 21:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('adm', '0003_auto_20210617_1658'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='assetfile',
            name='asset',
        ),
        migrations.RemoveField(
            model_name='assetlog',
            name='asset',
        ),
        migrations.RemoveField(
            model_name='supplier',
            name='belongs_to',
        ),
        migrations.RemoveField(
            model_name='equipment',
            name='supplier',
        ),
        migrations.DeleteModel(
            name='Asset',
        ),
        migrations.DeleteModel(
            name='AssetFile',
        ),
        migrations.DeleteModel(
            name='AssetLog',
        ),
        migrations.DeleteModel(
            name='AssetType',
        ),
        migrations.DeleteModel(
            name='Supplier',
        ),
    ]