# TianYue
![天悦阅读](static/images/web-logo.png)
- 演示视频，上个视频失效了
	- 链接:https://pan.baidu.com/s/17MpZ_Rwp0GHt-a2Dszrj-g  密码:g3j6
## Beta 0.1
- 很多没有功能待完成，因为最近家里有事，在家的时间减少
- 目前用了浏览器的 session 和 cookie 在登录成功之后保存账号，有效期为两周
- 用到的知识：`django，mysql，mvt(model, view(controller),template，javascript，javascript ajax请求，html，css，python，python爬虫，验证码用的 python 的 pillow 库，每次网页刷新随机生成验证码图片`
- 验证码用的 `cookie` 传递正确值
- 代码没有网上复制粘贴，就是想知道自己现在的能力是咋样的
- 平台：Mac，编辑器：[neovim](https://neovim.io/)
## 页面
### 登录页面
![LOGIN page](static/screenshot/login_screen.png "opt title")
### 注册页面
![Register page](static/screenshot/register_screen.jpg)
### 重置密码页面
![Reset page](static/screenshot/reset_sceen.jpg)
### 静态文件
- javascript, css, 图片 在 static 文件夹

## 数据来源

### 图书数据
- 图书数据用项目根目录的 get_book.py 在网站上爬取，因为感觉一个一个写太麻烦，就自己写了一个爬虫
### 用户数据
- 用户的数据是用根目录的 spawn_user.py 生成，原因和图书数据一样
