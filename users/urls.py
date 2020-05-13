from django.urls import re_path
from users import views

urlpatterns = [
    re_path(r'^login$', views.login, name='login'),
    re_path(r'^index$', views.index, name='index'),
    re_path(r'^show_args(?P<num>\d+)$', views.show_args),
    #  url(r'^login_check$', views.login_check),
    re_path(r'^test_ajax$', views.test_ajax, name='test_ajax'),
    re_path(r'^ajax_handle$', views.ajax_handle),
    # 显示 ajax 登录页面
    re_path(r'^login_ajax$', views.login_ajax),
    # login_ajax_check 登录 ajax 检查
    re_path(r'^login_ajax_check$', views.login_ajax_check),
    re_path(r'^set_cookie$', views.set_cookie),
    re_path(r'^get_cookie$', views.get_cookie),
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
    # url 反向解析
    re_path(r'^url_reverse$', views.url_reverse),
    # 后台布局
    re_path(r'^admin_index$', views.admin_index),
    # 书籍详情
    re_path(r'^book_detail(?P<bid>\d+)$', views.book_detail),
    # 读书
    re_path(r'^read_book$', views.read_book),
]
