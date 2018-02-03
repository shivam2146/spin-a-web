# Generated by Django 2.0.2 on 2018-02-02 22:06

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('bank', '0008_auto_20180202_2133'),
    ]

    operations = [
        migrations.RenameField(
            model_name='beneficiary',
            old_name='ben_acc',
            new_name='ben_account_no',
        ),
        migrations.AlterUniqueTogether(
            name='beneficiary',
            unique_together={('ben_cusacc', 'ben_account_no')},
        ),
    ]
