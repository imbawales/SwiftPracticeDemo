# SwiftPracticeDemo
#### 前言
看到github上很多什么30天每天1demo学Swift的,于是决定自己也效仿下.  
Swift练习demo, 计划写30个小demo, 
在过程中不断记录自己敲swift时候的感受和收获.

##### 2018.2.28  
搭建菜单tableview, 第一次敲swift敲tableview都敲挺久..  
发现swift里面没有oc里面的"宏"这个东西,取而代之是用全局常量和函数.  
敲方法的技巧:敲"UIView("或者敲"UIView.init"都会有方法提示  
![image](https://github.com/imbawales/SwiftPracticeDemo/blob/master/MySwiftDemo/allpics/Snip20180228_3.png)

##### 2018.3.13
###### 秒表demo  
![gif](https://github.com/imbawales/SwiftPracticeDemo/blob/master/MySwiftDemo/allpics/stopWatch.gif)  


##### 2018.3.13  
###### 自定义字体demo  
- 设置颜色时候, 用OC的话要敲[UIColor blackColor], 现在只用敲.black  
- 在OC里面要敲的枚举值, 现在只用敲 . 然后就会有提示, 如.touchUpInside, .none, .normal  
- 添加自定义字体的步骤:  
1.把字体的.ttf或者.otf文件拉进项目.  
2.在info.plist里面添加Fonts provided by application,  
  里面加上font的item, item的value为字体文件的全名(包括.ttf后缀, 如MFZhiHei_Noncommercial-Regular.ttf).  
  
![image](https://github.com/imbawales/SwiftPracticeDemo/blob/master/MySwiftDemo/allpics/CustomFont1.png)  
![gif](https://github.com/imbawales/SwiftPracticeDemo/blob/master/MySwiftDemo/allpics/CustomFont.gif)  
