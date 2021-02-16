//
//  SceneDelegate.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 08/01/21.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        configureNavigationBar()
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = setTabBarControllers()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = Colors.primaryColor
    }
    
    func setTabBarControllers() -> [UINavigationController] {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = Colors.primaryColor
        
        let firstView = HomeViewController()
        firstView.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), tag: 0)
        let vc1 = UINavigationController(rootViewController: firstView)
        
        let secondView = UploadRecipeViewController()
        secondView.tabBarItem = UITabBarItem(title: "Upload", image: UIImage(named: "Upload"), tag: 1)
        let vc2 = UINavigationController(rootViewController: secondView)
        
        let thirdView = UploadRecipeViewController()
        thirdView.tabBarItem = UITabBarItem(title: "Notification", image: UIImage(named: "Notification"), tag: 2)
        let vc3 = UINavigationController(rootViewController: thirdView)
        
        let fourthView = UploadRecipeViewController()
        fourthView.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "Profile"), tag: 3)
        let vc4 = UINavigationController(rootViewController: fourthView)
                
        return [vc1, vc2, vc3, vc4]
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

