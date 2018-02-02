# Generated by Django 2.0.2 on 2018-02-02 18:35

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('bank', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='BankManager',
            fields=[
                ('Manager_id', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('manager_name', models.CharField(max_length=100)),
                ('manager_address', models.TextField()),
                ('manager_email', models.EmailField(max_length=254)),
                ('manager_phone', models.CharField(blank=True, max_length=17, validators=[django.core.validators.RegexValidator(message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.", regex='^\\+?1?\\d{9,15}$')])),
                ('manager_bcode', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bank.Bank')),
                ('manager_username', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cus_accno', models.CharField(max_length=34)),
                ('cus_cifno', models.DecimalField(decimal_places=0, max_digits=11)),
                ('cus_accountType', models.CharField(choices=[('saving', 'Saving'), ('current', 'Current'), ('recurring deposit', 'Recurring Deposit'), ('fixed deposit', 'Fixed Deposit')], max_length=25)),
                ('cus_balance', models.DecimalField(decimal_places=2, max_digits=10)),
                ('cus_acc_start_date', models.DateField(auto_now_add=True)),
                ('cus_acc_status', models.BooleanField(default=True)),
                ('cus_bcode', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bank.Bank')),
                ('cus_username', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
