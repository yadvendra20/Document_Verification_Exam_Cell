
from django.urls import path
from . import views
urlpatterns = [
    path('', views.home,name='home'),
    
    path('list_users/', views.list_users, name="list_users"),
    
    path('pendingusers/', views.pendingusers, name="pendingusers"),
     path('form/',views.InsertRecord, name="form"),
    #  path('admin/', admin.site.urls),  
    # path('emp', views.emp),  
    # path('show',views.show),  
    # path('edit/<int:id>', views.edit),  
    # path('update/<int:id>', views.update),  
    # path('delete/<int:id>', views.destroy),
    
]