from django.shortcuts import render,redirect
from .models import Bank,BankManager,Customer
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
            return redirect('/bank/cus-acc/')
        else:
            logout(request)
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
            b = BankManager.objects.get(manager_username=request.user)
            obj = Customer.objects.filter(cus_bcode= b.manager_bcode)
            return render(request,"manager_cus.html",{'obj':obj})
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
