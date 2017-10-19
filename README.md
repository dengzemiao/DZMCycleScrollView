# DZMCycleScrollView

***
#### 简介:

    通过使用 ScrollView 进行无限滚动。
    
    与一般无限滚动控件不同的地方: 通常都是通过传入Images数组,或者什么模型数组进行轮播。
    
    本Demo是直接传入自定义Views(视图数组进行无限轮播),无内存泄漏问题
    
    同时也支持viewControllers(控制器数组)使用。
    
    UIPageControl可在继承该控件之后自己添加即可,有代理回调,下面有例子
    
***
#### 代码介绍:

```Swift
cycleScrollView = DZMCycleScrollView.cycleScrollView(views: [view1,view2,view3,view4],limitScroll: true, delegate:self)
view.addSubview(cycleScrollView)
cycleScrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100) //Swift
```

***
#### 效果:
![效果](icon0.gif)

***
#### UIPageControl 例子:
![UIPageControl 例子](icon3.png)
