"""
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
#from django.views.generic import TemplateView
from .views import home,logredi,ben_form,manHome,manAcc,manCus
from django.contrib.auth import views as auth_views
urlpatterns = [
    path('cus/',home),
    path('login/',auth_views.login),
    path('login/logredi/',logredi),
    path('cus/ben',ben_form),
    path('man-home/',manHome),
    path('man-cus/',manCus),
    path('logout/', auth_views.logout, {'next_page': '/'}),
    path('man-acc/',manAcc),
]
