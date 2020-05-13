from django.urls import re_path
from users import views

urlpatterns = [
    # 显示 ajax 登录页面
    re_path(r'^login$', views.login, name='login'),
    re_path(r'^index$', views.index, name='index'),
    # login_ajax_check 登录 ajax 检查
    re_path(r'^login_ajax_check$', views.login_ajax_check),
    # 重置密码
    re_path(r'^reset_password$', views.reset_password),
    # 重置密码检查
    re_path(r'^reset_password_check$', views.reset_password_check),
    # 注册账号
    re_path(r'^register_id$', views.register_id),
    # 注册检查
    re_path(r'^register$', views.register),
    # 验证码
    re_path(r'^verify_code$', views.verify_code),
    # 书籍详情
    re_path(r'^book_detail(?P<bid>\d+)$', views.book_detail),
    # 读书
    re_path(r'^read_book$', views.read_book),
]
