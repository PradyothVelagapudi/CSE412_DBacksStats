# Generated by Django 5.1.3 on 2024-11-21 06:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('testdb', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='player',
            name='bat_thr',
            field=models.TextField(),
        ),
        migrations.AlterField(
            model_name='player',
            name='name',
            field=models.TextField(),
        ),
        migrations.AlterField(
            model_name='player',
            name='position',
            field=models.TextField(),
        ),
    ]
