
"""django_online_exam_test URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
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
from django.views import static
from django.conf import settings
# from . import views



from django.urls import path
from . import views
from django.contrib.staticfiles.urls import  staticfiles_urlpatterns
from django.conf.urls import url
urlpatterns = [
    url(r'^static/(?P<path>.*)$', static.serve, {'document_root': settings.STATIC_ROOT}, name='static'),


    path('index',views.index),
    path('login',views.login),
    path('login1',views.login1),
    path('unlock',views.unlock),
    path('unlock1',views.unlock1),
    path('unlock2',views.unlock2),
    path('unlock3',views.unlock3),
    path('registe',views.registe),
    path('registe1',views.registe1),
    path('historyData2',views.historyData2),
    # path('nowData1',views.nowData1),
    path('dataPhoto',views.dataPhoto),
    path('pollutionTracing',views.pollutionTracing),
    path('pollutionTracing1',views.pollutionTracing1),
    path('pollutionPredict',views.pollutionPredict),
    path('pollutionPredict1',views.pollutionPredict1),
    path('userSystem',views.userSystem),
    path('setSystem',views.setSystem),
    path('Logout',views.Logout),
    path('user_update',views.user_update),
    # path('list',views.list,name='list'),
    path('info',views.info),
    path('nowData_filter',views.nowData_filter),

    # url(r'^$',views.index,name='index')，
    # url(r'^$',index),
    path('', views.index, name="index"), 
    url(r'^dele/$',views.dele,name='dele'),
    url(r'^traceData/$',views.traceData,name='traceData'),
    url(r'^traceData_del/$',views.traceData_del,name='traceData_del'),
    url(r'^nowData_del/$',views.nowData_del,name='nowData_del'),
    url(r'^del_all',views.del_all,name='del_all'),
    url(r'^list/$',views.list,name='list'),
    url(r'^nowData1/$',views.nowData1,name='nowData1'),

]
urlpatterns+=staticfiles_urlpatterns()

# 配置异常页面
handler403 = views.page_permission_denied
handler404 = views.page_not_found
handler500 = views.page_inter_error