from django.db import models
from django.core.validators import RegexValidator
# Create your models here.
class Bank(models.Model):
    b_code =    models.CharField(max_length=50,primary_key=True)
    b_name =    models.CharField(max_length=100)
    b_ifsc =    models.CharField(max_length=11)
    b_address = models.TextField()
    b_email   = models.EmailField(max_length=254)
    phone_regex = RegexValidator(regex=r'^\+?1?\d{9,15}$', message="Phone number must be entered in the format: '+999999999'. Up to 15 digits allowed.")
    b_phone = models.CharField(validators=[phone_regex], max_length=17, blank=True)
