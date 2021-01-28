//
//  RepositoryListRouter.swift
//  githubSearchApp
//
//  Created by wjLee-PC on 2021/01/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol RepositoryListRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol RepositoryListDataPassing
{
  var dataStore: RepositoryListDataStore? { get }
}

class RepositoryListRouter: NSObject, RepositoryListRoutingLogic, RepositoryListDataPassing
{
  weak var viewController: RepositoryListViewController?
  var dataStore: RepositoryListDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: RepositoryListViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: RepositoryListDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}