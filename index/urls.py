from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^$',index_views,name='index'),
    url(r'^login/$', login_views),
    url(r'^register/$', register_views),
    url(r'^checkphone/$', checkphone_views),
    url(r'^all_type_goods/$', all_type_goods_views),
    url(r'^check_login/$', check_login_views),
    url(r'^logout/$', logout_views),
    url(r'^add_cart/$', add_cart_views),
    url(r'^cart/$', cart_views, name='cart'),
    url(r'^loadcart/$', loadcart_views),
    url(r'^update_cart/$', update_cart_views),
    url(r'^delete_cart/$', delete_cart_views),
    url(r'^check_cart/$', check_cart_views),
    url(r'^balance', balance_views),
    url(r'^confirm_balance', confirm_balance_views),
    url(r'^store_center', store_center_views, name='store_center'),
    url(r'^detail/(\d+)$', detail_views, name='detail'),
    url(r'^check_aoi/$', check_aoi_views),
    url(r'^pay/', pay_views),
    url(r'^pay_ok/', pay_ok_views),
    url(r'^user_orders/$', user_orders_views),
    url(r'^confirm_reciept/', confirm_reciept_views),
    url(r'^comment/(\d+)/', comment_views),
]
