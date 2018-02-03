from django.forms import ModelForm
from .models import Beneficiary

class BenForm(ModelForm):
    class Meta:
        model = Beneficiary
        fields = ['Beneficiary_account_no','Beneficiary_name','Beneficiary_bankname','Beneficiary_ifsc','Beneficiary_transfer_limit']
