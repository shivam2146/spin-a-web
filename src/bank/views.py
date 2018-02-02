from django.shortcuts import render
from .models import Bank
from django.views.generic import ListView
# Create your views here.
def home(request):
    banks = Bank.objects.all()
    return render(request,"home.html",{'banks':banks})

class CustomerListView(ListView):
    queryset = Bank.objects.all()
    template_name = "home.html"

class CusSearchListView(CustomerListView):
    """
    Display a Blog List page filtered by the search query.
    """
    paginate_by = 10

    def get_queryset(self):
        result = super(CustomerListView, self).get_queryset()
        query = self.request.GET.get('q')
        if query:
            query_list = query.split()
            result = result.filter(
                reduce(operator.and_,
                       (Q(title__icontains=q) for q in query_list))      

        return result
