from django.contrib import admin
from .models import Bank, BankManager,Customer,Beneficiary
# Register your models here.
admin.site.register(Bank)
admin.site.register(BankManager)
admin.site.register(Customer)
admin.site.register(Beneficiary)
