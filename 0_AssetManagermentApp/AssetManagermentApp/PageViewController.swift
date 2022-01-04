//
//  PageViewController.swift
//  AssetManagermentApp
//
//  Created by miori Lee on 2022/01/04.
//

import SwiftUI
import UIKit

//UIKit으로 만들어진 UIView를 SwiftUI에서 사용하는 방법

struct PageViewController <Page : View> : UIViewControllerRepresentable {
    var pages : [Page]
    
    // MARK: - @Binding property는 SwiftUI -> UIKit 으로의 변수 전달이고, Coordinator의 경우 UIKit -> SwiftUI로의 데이터 전달
    
    //현재 어떤 페이지가 보여지고 있는지의 상태
    @Binding var currentPage : Int

    // SwiftUI-UIKit간의 브릿지 역할을 하는Coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // MARK: - two requirements for the UIViewControllerRepresentable protocol
    
    // 생성 및 초기화
    func makeUIViewController(context: Context) ->  UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    // 업데이트가 필요할 때 호출
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator : NSObject, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
        var parent : PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController : PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map {UIHostingController(rootView: $0)}
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {return nil}
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.lastIndex(of: viewController) else {return nil}
            
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
        
    }

}
