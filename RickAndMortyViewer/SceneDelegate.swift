//
//  SceneDelegate.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 26.04.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let apiManager = ApiManager(networkService: NetworkService())
    let navController = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

//        presentCharacterDetailView(for: 2)

//        let viewModel = CharacterTableViewModel(apiManager: apiManager)
        let viewController = CharacterListController()
        navController.pushViewController(viewController, animated: false)
//        viewModel.selectedCharacter = { [weak self] id in
//            print("Selected Character: \(id)")
//            self?.presentCharacterDetailView(for: id)
//        }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
    }
    
//    func presentCharacterDetailView(for characterId: Int) {
//        let viewModel = CharacterDetailsViewModel(characterId: characterId, apiManager: apiManager)
//        let viewController = CharacterDetailsViewController()
//        navController.pushViewController(viewController, animated: true)
//    }    
    
    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

}
