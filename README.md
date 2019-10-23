基于SSM框架的花椒社区平台的设计与实现
=
开发环境：IDEA + Maven + Druid + Log4j + jdk8<br>
技术选型：Spring + SpringMVC + MyBaits + MySQL+ Redis<br>
项目介绍：主要分为用户模块，话题模块，评论模块，随笔模块，管理员模块<br>

    1、用户模块实现了拥护注册、登陆、更新信息、修改密码 以及用户间互相关注等功能；
    2、话题模块实现了话题的分类，以及用户对话题的关注；
    3、评论模块实现了每一篇帖子的评论信息展示，和评论的回复；
    4、随笔模块和评论模块使用了wangEditor实现编辑功能；并采用DFA算法实现了敏感词过滤；
    5、管理员模块完成了上述模块的增删查改，批量删除；以及对用户的封号，禁言等功能；
    6、利用feed流的思想，在首页动态展示所关注人的信息；
    7、使用MyBatis插件PageHelper实现分页；使用redis做评论页面的缓存等。
数据库脚本放在项目的目录上mybatis.sql，在MySQL中执行数据库脚本<br><br>
redis的安装和打开服务参考https://www.runoob.com/redis/redis-install.html<br><br>
# 项目展示<br>
根据登录用户动态生成关注人的信息<br><br>
![Image text](https://github.com/Rong0912/SSM/blob/master/image/index.png)<br><br>
用户互相关注<br><br>
![Image text](https://github.com/Rong0912/SSM/blob/master/image/concern.png )<br>
管理员界面（在浏览器直接输入localhost：8080/YourAnswer/manage即可）<br><br>
![Image text](https://github.com/Rong0912/SSM/blob/master/image/administrator.png )<br>



