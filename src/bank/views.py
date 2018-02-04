from django.shortcuts import render,redirect
from .models import Bank,BankManager,Customer,Beneficiary
from django.views.generic import ListView
from django.http import Http404
from django.contrib.auth import login, authenticate,logout
from django.contrib.auth.decorators import login_required
from .form import BenForm
# Create your views here.
def home(request):
    if request.method=='POST':
        a=request.POST['sb']
        b=Customer.objects.filter(cus_accno=a)
        return render(request,"home.html",{'object_list':b})
    else:
        banks = Customer.objects.all()
        return render(request,"home.html",{'object_list':banks})

def logredi(request):
    if request.user.groups.filter(name="Manager"):
        if BankManager.objects.filter(manager_username=request.user).exists():
            return redirect('/bank/man-home/')
        else:
            logout(request)
            raise Http404("invalid user")
    elif request.user.groups.filter(name="Customer"):
        if Customer.objects.filter(cus_username=request.user).exists():
            return redirect('/bank/cus-det/')
        else:
            logout(request)
            raise Http404("invalid user")
    else:
        raise Http404("invalid user")
@login_required(login_url="/bank/login/")
def manHome(request):
    if request.user.groups.filter(name="Manager"):
        if BankManager.objects.filter(manager_username=request.user).exists():
            b = BankManager.objects.get(manager_username=request.user)
            obj= Bank.objects.get(b_code = b.manager_bcode.b_code)
            return render(request,"manager.html",{'obj':obj})
        else:
            logout(request)
            raise Http404("invalid user")
    else:
        logout(request)
        raise Http404("invalid user")

@login_required(login_url="/bank/login/")
def manAcc(request):
    if request.user.groups.filter(name="Manager"):
        if BankManager.objects.filter(manager_username=request.user).exists():
            obj = BankManager.objects.get(manager_username=request.user)
            return render(request,"manager_acc_detail.html",{'obj':obj})
        else:
            logout(request)
            raise Http404("invalid user")
    else:
        logout(request)
        raise Http404("invalid user")

@login_required(login_url="/bank/login/")
def manCus(request):
    if request.user.groups.filter(name="Manager"):
        if BankManager.objects.filter(manager_username=request.user).exists():
            if request.method=='POST':
                a=request.POST['sb']
                b=Customer.objects.filter(cus_accno=a)
                return render(request,"manager_cus.html",{'cus_list':b})
            else:
                b = BankManager.objects.get(manager_username=request.user)
                obj = Customer.objects.filter(cus_bcode= b.manager_bcode)
                return render(request,"manager_cus.html",{'cus_list':obj})
        else:
            logout(request)
            raise Http404("invalid user")
    else:
        logout(request)
        raise Http404("invalid user")

@login_required(login_url="/bank/login/")
def ben_form(request):
    if request.user.groups.filter(name="Customer"):
        if Customer.objects.filter(cus_username=request.user).exists():
            if request.method == "POST":
                f = BenForm(request.POST)
                ben = f.save(commit=False)
                ben.ben_cusacc= 214146541632
                ben.save()
                return redirect("/bank/cus/")
            else:
                form = BenForm()
                return render(request,"ben_form.html",{'form':form})
        else:
            logout(request)
            raise Http404("invalid user")
    else:
        logout(request)
        raise Http404("invalid user")

@login_required(login_url="/bank/login/")
def cusDet(request):
    if request.user.groups.filter(name="Customer"):
        if Customer.objects.filter(cus_username=request.user).exists():
            obj= Customer.objects.get(cus_username=request.user)
            return render(request,"cus_det.html",{'obj':obj,})
        else:
            logout(request)
            raise Http404("invalid user")
    else:
        logout(request)
        raise Http404("invalid user")

@login_required(login_url="/bank/login/")
def cusTra(request):
    if request.user.groups.filter(name="Customer"):
        if Customer.objects.filter(cus_username=request.user).exists():
            if request.method == "POST":
                return render(request,"cus_trans2.html",{})
            else:
                b= Customer.objects.get(cus_username=request.user)
                obj= Beneficiary.objects.filter(ben_cusacc= b.cus_accno)
                return render(request,"cus_trans.html",{'ben_list':obj,})
        else:
            logout(request)
            raise Http404("invalid user")
    else:
        logout(request)
        raise Http404("invalid user")
@login_required(login_url="/bank/login/")
def cusPay(request):
    if request.user.groups.filter(name="Customer"):
        if Customer.objects.filter(cus_username=request.user).exists():
            if request.method == "POST":
                acc = request.POST['AccNo']
                bn = request.POST['bn']
                ifsc = request.POST['ifsc']
                amo= int(request.POST['Amo'])
                bank= Bank.objects.get(b_name = bn,b_ifsc= ifsc)
                froma = Customer.objects.get(cus_username=request.user)
                if Customer.objects.filter(cus_accno=acc,cus_bcode= bank).exists():
                    to = Customer.objects.get(cus_accno=acc,cus_bcode= bank)
                    if froma.cus_balance >= amo:
                        froma.cus_balance -= amo
                        to.cus_balance += amo
                        froma.save()
                        to.save()
                        return render(request,"payment.html",{})
                    else:
                        raise Http404("insufficient amount")
                else:
                    raise Http404("invalid details")
            else:
                return render(request,"cus_trans2.html",{})
    raise Http404("transaction failed")
