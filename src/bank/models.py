from django.db import models
from django.core.validators import RegexValidator,MinLengthValidator,MaxLengthValidator
from django.contrib.auth.models import User
# Create your models here.
class Bank(models.Model):
    b_code =    models.CharField(max_length=50,primary_key=True)
    b_name =    models.CharField(max_length=100)
    b_ifsc =    models.CharField(max_length=11)
    b_address = models.TextField()
    b_email   = models.EmailField(max_length=254)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    b_phone = models.CharField(validators=[phone_regex], max_length=17, blank=True)

class BankManager(models.Model):
    Manager_id          = models.CharField(max_length=50,primary_key=True)
    manager_username    = models.ForeignKey(User,on_delete=models.CASCADE)
    manager_name        = models.CharField(max_length=100)
    manager_address     = models.TextField()
    manager_email       = models.EmailField(max_length=254)
    manager_bcode       = models.ForeignKey(Bank,on_delete=models.CASCADE)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    manager_phone = models.CharField(validators=[phone_regex], max_length=17, blank=True)
ACCOUNTTYPE_CHOICES = (
    ('saving','Saving'),
    ('current','Current'),
    ('recurring deposit','Recurring Deposit'),
    ('fixed deposit','Fixed Deposit')
)
class Customer(models.Model):
    cus_accno           = models.CharField(max_length=34)
    cus_username        = models.ForeignKey(User,on_delete=models.CASCADE)
    cus_cifno           = models.CharField(max_length=11,validators=[MinLengthValidator(11)])
    cus_bcode           = models.ForeignKey(Bank,on_delete=models.CASCADE)
    cus_accountType     = models.CharField(max_length=25,choices= ACCOUNTTYPE_CHOICES)
    cus_balance         = models.DecimalField(max_digits=10, decimal_places=2)
    cus_acc_start_date  = models.DateField(auto_now_add=True)
    cus_acc_status      = models.BooleanField(default = True)
