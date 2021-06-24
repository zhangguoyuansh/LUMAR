"""gistandard URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.views.static import serve
from gistandard.settings import MEDIA_ROOT

import xadmin

from users.views_user import LoginView, IndexView, LogoutView
from system.views import SystemView
from adm.views import AdmView
from personal import views as personal_views
from personal import views_application as order

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
    url(r'^$', IndexView.as_view(), name='index'),
    # 用户登录
    url(r'^login/$', LoginView.as_view(), name='login'),
    url(r'^logout/$', LogoutView.as_view(), name="logout"),

    url(r'^system/$', SystemView.as_view(), name="system"),
    url(r'^system/basic/', include(('users.urls', 'system-basic'))),
    url(r'^system/rbac/', include(('rbac.urls','system-rbac'))),
    url(r'^system/tools/', include(('system.urls', 'system-tools'))),

    url(r'^adm/$', AdmView.as_view(), name="adm-main"),
    url(r'^adm/bsm/', include(('adm.urls', 'adm-bsm'))),
    url(r'^adm/equipment/', include(('adm.urls_equipment', 'adm-equipment'))),
    url(r'^adm/asset/', include(('adm.urls_asset', 'adm-asset'))),

    url(r'^personal/$', personal_views.PersonalView.as_view(), name="personal"),
    url(r'^personal/userinfo', personal_views.UserInfoView.as_view(), name="personal-user_info"),
    url(r'^personal/uploadimage', personal_views.UploadImageView.as_view(), name="personal-uploadimage"),
    url(r'^personal/passwordchange', personal_views.PasswdChangeView.as_view(), name="personal-passwordchange"),
    url(r'^personal/phonebook', personal_views.PhoneBookView.as_view(), name="personal-phonebook"),
    url(r'^personal/application_Icrt/$', order.ApplicationView.as_view(), name="personal-application_Icrt"),
    url(r'^personal/application_Icrt/list', order.ApplicationListView.as_view(), name="personal-application-list"),
    url(r'^personal/application_Icrt/create', order.ApplicationCreateView.as_view(), name="personal-application-create"),
    url(r'^personal/application_Icrt/detail', order.ApplicationDetailView.as_view(), name="personal-application-detail"),
    url(r'^personal/application_Icrt/delete', order.ApplicationDeleteView.as_view(), name="personal-application-delete"),
    url(r'^personal/application_Icrt/update', order.ApplicationUpdateView.as_view(), name="personal-application-update"),
    url(r'^personal/application_app/$', order.ApplicationView.as_view(), name="personal-application_app"),
    url(r'^personal/application_app/send', order.ApplicationSendView.as_view(), name="personal-workorder-send"),
    url(r'^personal/application_rec/$', order.ApplicationView.as_view(), name="personal-application_rec"),
    url(r'^personal/application_rec/execute', order.ApplicationExecuteView.as_view(), name="personal-workorder-execute"),
    url(r'^personal/application_rec/finish', order.ApplicationFinishView.as_view(), name="personal-workorder-finish"),
    url(r'^personal/application_rec/upload', order.WorkOrderUploadView.as_view(), name="personal-workorder-upload"),
    url(r'^personal/application_rec/invoice', order.WorkOrderInvoiceView.as_view(), name="personal-workorder-invoice"),

    url(r'^personal/application_rec/return', order.WorkOrderReturnView.as_view(), name="personal-workorder-return"),
    url(r'^personal/application_Icrt/upload', order.WorkOrderProjectUploadView.as_view(),
        name="personal-workorder-project-upload"),
    url(r'^personal/application_all/$', order.ApplicationView.as_view(), name="personal-application_all"),
    url(r'^personal/document/$', order.WorkOrderDocumentView.as_view(), name="personal-document"),
    url(r'^personal/document/list', order.WorkOrderDocumentListView.as_view(), name="personal-document-list"),

]
