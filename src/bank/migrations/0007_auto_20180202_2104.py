# Generated by Django 2.0.2 on 2018-02-02 21:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bank', '0006_auto_20180202_1901'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customer',
            name='id',
        ),
        migrations.AlterField(
            model_name='customer',
            name='cus_accno',
            field=models.CharField(max_length=34, primary_key=True, serialize=False),
        ),
    ]
