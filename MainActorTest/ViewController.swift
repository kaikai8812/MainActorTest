//
//  ViewController.swift
//  MainActorTest
//
//  Created by 青山凱 on 2023/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Task {
//            print("1 isMainThread?: \(Thread.isMainThread)")
//        }
//        
//        Task.detached {
//            print("2 isMainThread?: \(Thread.isMainThread)")
//        }
        
        //  mainスレッドで実行されない → detachedされている
//        Task(priority: .low){
//            Task.detached(priority: .high){
//                print("3 isMainThread:\(Thread.isMainThread)")
//            }
//        }
        
        //  mainスレッドで実行されあい → detachedされている
//        Task.detached(priority: .low){
//            Task(priority: .high){
//                print("4 isMainThread:\(Thread.isMainThread)")
//            }
//        }
        
        //  IsMainActorクラスに対して、MainActorマクロをつけることで、helloメソッドが、メインスレッドで呼ばれるようになる！
        let ac = IsMainActor()
        Task.detached {
            await ac.hello()
        }
    }
    
//    @MainActor
    func test()  {
        Task.detached {
            print("\(Thread.isMainThread)")
        }
    }
}

//@MainActor
class IsMainActor{
    
    func hello(){
        print("Thread.isMainThread:\(Thread.isMainThread)") // どこからよばれてもtrue
    }
}

