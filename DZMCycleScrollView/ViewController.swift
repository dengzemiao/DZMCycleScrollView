//
//  ViewController.swift
//  DZMCycleScrollView
//
//  Created by 邓泽淼 on 2017/3/10.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DZMCycleScrollViewDelegate {
    
    var cycleScrollView:DZMCycleScrollView!
    
    @IBOutlet weak var label: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UILabel()
        view1.text = "0"
        view1.textAlignment = .center
        view1.font = UIFont.systemFont(ofSize: 20)
        view1.backgroundColor = UIColor.red
        
        
        let view2 = UILabel()
        view2.text = "1"
        view2.textAlignment = .center
        view2.font = UIFont.systemFont(ofSize: 20)
        view2.backgroundColor = UIColor.green
        
        
        let view3 = UILabel()
        view3.text = "2"
        view3.textAlignment = .center
        view3.font = UIFont.systemFont(ofSize: 20)
        view3.backgroundColor = UIColor.yellow
        
        
        let view4 = UILabel()
        view4.text = "3"
        view4.textAlignment = .center
        view4.font = UIFont.systemFont(ofSize: 20)
        view4.backgroundColor = UIColor.blue
        
        // 创建方法一
//        cycleScrollView = DZMCycleScrollView.cycleScrollView(views: [view1,view2,view3,view4],limitScroll: true, delegate:self)
//        view.addSubview(cycleScrollView);
//        cycleScrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100)
        
        
        // 创建方式二
        cycleScrollView = DZMCycleScrollView()
        
        cycleScrollView.delegate = self
        
        // 是否开启无限滚动
        cycleScrollView.limitScroll = true
        
        // 动画时间
        cycleScrollView.animateDuration = 0.25
        
        // 初始化选中页面
        cycleScrollView.initSelectIndex = 0
        
        // 是否开启点击手势
        cycleScrollView.openTap = false
        
        // 允许滚动控件有额外滚动区域 scrollView.bounces
        cycleScrollView.bounces = true
        
        // 添加定时器 如果开启了定时器不建议手动调用 next() 会照成混乱 由定时器跟手势切换即可 cycleScrollView.selectIndex 也可以使用
        cycleScrollView.openTimer = true
        
        // 定时器间隔时间
        cycleScrollView.timeInterval = 1.0
        
        // 传view数组即可 包括 控制器View
        cycleScrollView.setupViews(views: [view1,view2,view3,view4])
        
        view.addSubview(cycleScrollView)
        cycleScrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100)
        
        /*
         无限轮播 直接传入View数组即可轮播 方便了自定义View
         1.支持中途修改轮播数组
         2.可在重置过程中 随意切换 无限轮播 以及 不无限轮播
         3.支持 控制器View 无限轮播使用 可用于做导航栏轮播View
         4.支持点击手势的开关(传按钮数组的话可以关掉点击手势)  以及回调代理
         
         ----定时器使用:
         
         cycleScrollView.next() 即可自定进行下一页
         
         ----手动选择页面: 可选动画
         
         cycleScrollView.selectIndex(index: NSInteger, animated: Bool)
         
         ----中途动态切换轮播View数组:
         
         cycleScrollView.setupViews(views: [view1,view2])
         
         ----代理:
         
         /// 开始拖拽
         @objc optional func cycleScrollViewWillBeginDragging(cycleScrollView:DZMCycleScrollView)
         
         /// 结束拖拽
         @objc optional func cycleScrollViewDidEndDragging(cycleScrollView:DZMCycleScrollView)
         
         /// 正在滚动
         @objc optional func cycleScrollViewDidScroll(cycleScrollView:DZMCycleScrollView)
         
         /// 准备减速
         @objc optional func cycleScrollViewWillBeginDecelerating(cycleScrollView:DZMCycleScrollView)
         
         /// 停止滚动
         @objc optional func cycleScrollViewDidEndDecelerating(cycleScrollView:DZMCycleScrollView)
         
         /// 滚动到哪一个index
         @objc optional func cycleScrollView(cycleScrollView:DZMCycleScrollView,scrollToIndex index:NSInteger)
         
         /// 点击了哪一个index
         @objc optional func cycleScrollView(cycleScrollView:DZMCycleScrollView,touchToIndex index:NSInteger)
         
         */
        
        
    }
    
    // MARK: -- 使用方法
    
    // 下一个 用于定时器使用方便
    @IBAction func next(_ sender: Any) {
        
        if !cycleScrollView.openTimer { // 如果开启定时器不建议手动调用该方法 会混乱
            
            cycleScrollView.next()
        }
    }
    
    // 动态更换轮播数组
    @IBAction func change(_ sender: Any) {
        
        let view1 = UIImageView()
        view1.image = UIImage(named:"temp")
        
        let view2 = UIImageView()
        view2.image = UIImage(named:"temp1")
        
        cycleScrollView.setupViews(views: [view1,view2])
    }
    
    // 选中指定索引 可选择动画
    @IBAction func selectIndex(_ sender: Any) {
        
        cycleScrollView.scrollIndex(index: (label.text! as NSString).integerValue, animated: true)
    }
    
    
    
    // MARK: -- DZMCycleScrollViewDelegate
    
    func cycleScrollView(cycleScrollView: DZMCycleScrollView, touchToIndex index: NSInteger) {
        
        print("点击了 \(index)")
    }
    
    func cycleScrollView(cycleScrollView: DZMCycleScrollView, scrollToIndex index: NSInteger) {
        
        print("滚动到了 \(index)")
    }
    
    func cycleScrollViewWillBeginDragging(cycleScrollView: DZMCycleScrollView) {
        
//        print("开始拖拽")
    }
    
    func cycleScrollViewDidEndDragging(cycleScrollView: DZMCycleScrollView) {
        
//        print("结束拖拽")
    }
    
    func cycleScrollViewDidScroll(cycleScrollView: DZMCycleScrollView) {
        
//        print("正在滚动")
    }
    
    func cycleScrollViewWillBeginDecelerating(cycleScrollView: DZMCycleScrollView) {
        
//        print("准备减速")
    }
    
    func cycleScrollViewDidEndDecelerating(cycleScrollView: DZMCycleScrollView) {
        
//        print("结束减速")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

