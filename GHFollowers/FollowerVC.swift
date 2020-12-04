//
//  FollowerVC.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/15/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

protocol FollowerListVCDelegate {
    func didRequestFollowers(for username: String)
}

class FollowerVC: UIViewController {
    
    enum seccion {
        case main
        
    }
    
    
    var aDelegar: FollowerListVCDelegate!
    
    var username: String!
    var followers = [Follower] ()
    
    var filterFollowers = [Follower] ()
    var isSearching = false
    
    var collectionView: UICollectionView!
    
    var pageCounter = 1
    var hasMoreFollowers = true
    
    
    // tiene que conformar a hasshable y los enums son hashabel by default
    var dataSource: UICollectionViewDiffableDataSource<seccion,Follower>!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSerachController ()
        
        navigationController?.isNavigationBarHidden = false
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
                 
        navigationItem.rightBarButtonItem = addButton
        configureCollectionView ()
        configureDataSource ()
        
        
        getFollwers(username: username, page: pageCounter)
        // Do any additional setup after loading the view.
    }
    
    
    // la inicializamos y le damos el tamano del frame y le pasamos el default FlowLayout
    
    // FLOWLAYOUT DETERMINA BASICAMENTE COMO SE VA A VER LA COLLECTION VIEW
    
    
    
    func getFollwers (username:String, page:Int) {
        
        showLoadingView ()
        
        NetworkManager.shared.getFollowers(for: username, page: page) { followers,errorDescipcion in
                  
                  guard let followers = followers else {
                      self.presentReuserAlertInMainTreath(title: "Bad stuff happend 😭", message: errorDescipcion!.rawValue, buttonTitle: "Ok")
                      return
                  }
            
            self.stopLoadingView()
                  
                 if followers.count < 100 {
                self.hasMoreFollowers = false
                     }
            self.followers.append(contentsOf: followers)
                  print(followers.count)
            
            if self.followers.isEmpty {
                
                DispatchQueue.main.async {
                    
                    self.showEmptyUser (with:"This user doesnt have any followers", in: self.view)
                    return
                }
                
                
            }
                
             self.updateData(lista: self.followers)
               //   print(followers)
                  
                  
              }
        
        
        
        
        
    }
    
    func configureSerachController () {
        
        let searchController = UISearchController ()
        
        searchController.searchResultsUpdater = self
        
        searchController.searchBar.delegate = self
        
        searchController.searchBar.placeholder = "Enter the username"
        
        navigationItem.searchController = searchController
        
    }

    
    func createFlowLayoutToCollectioView () -> UICollectionViewFlowLayout {
        
        let widht = view.bounds.width
        
        let padding: CGFloat = 12
        
        let minimunSpacing: CGFloat = 10
        
        let availableSpace = widht - (padding * 2) - (minimunSpacing * 2)
        
        let itemWidth = availableSpace / 3
        
        
        let flowLayout = UICollectionViewFlowLayout ()
        
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
    private func configureCollectionView () {
        
        
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayoutToCollectioView ())
        
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID)
        
        
    }

    func configureDataSource () {
        
        
        dataSource = UICollectionViewDiffableDataSource<seccion,Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follwer) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseID, for: indexPath) as! FollowerCollectionViewCell
            cell.set(follower: follwer)
            return cell
        })
        
        
    }
    
    
    func updateData(lista: [Follower]) {
        
        var snapData = NSDiffableDataSourceSnapshot<seccion,Follower> ()
        
        snapData.appendSections([.main])
        snapData.appendItems(lista)
        
        DispatchQueue.main.async {
            
            self.dataSource.apply(snapData, animatingDifferences: true, completion: nil)
            
        }
        
    }
    
    
    @objc func addButtonTapped () {
        
        
        
    }
}


// Extendemos para poder hacer la paginacion


extension FollowerVC: UICollectionViewDelegate {
    
    
    //
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        
        // tenemos que primero determinar el tamanao del scrool view
        
        let offsetY = scrollView.contentOffset.y
        
        let contentHeigh = scrollView.contentSize.height
        
        let heigh = scrollView.frame.height
        
      
        if offsetY > contentHeigh - heigh {
            
              guard hasMoreFollowers else { return }
            pageCounter += 1
            getFollwers(username: username!, page: pageCounter)
            
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let follower = isSearching ? filterFollowers[indexPath.item] : followers[indexPath.item]
            
     
        
        
        let usuarioSeleccionado = UserInfoViewController ()
        
        usuarioSeleccionado.userName = follower.login
        
        usuarioSeleccionado.delegate = self
        
  
        // en vez de presentarlo modaly que nos que es
        // navigationController?.pushViewController(usuarioSeleccionado, animated: true)
        
        let navigationController = UINavigationController(rootViewController: usuarioSeleccionado)
        
       
        present(navigationController, animated: true)
        
        // que basicamente modaly es eso que me aparece sin estar en toda la pantalla
        
        
    }
    
}


extension FollowerVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    // Everytime the serach change llama al
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let filtro = searchController.searchBar.text, !filtro.isEmpty else {return}
        
        isSearching = true
        
        // El famoso simbolo de $ representa el item ni mas ni menos.
        
        filterFollowers = followers.filter { $0.login.lowercased().contains(filtro.lowercased()) }
        
        updateData(lista: filterFollowers)
        
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        isSearching = true
        
        updateData(lista: followers)
    }
    
    
    
}



extension FollowerVC: FollowerListVCDelegate {
    
    
    func didRequestFollowers(for username: String) {
        
        // get followers for that user
        
        self.username = username
        pageCounter = 1
        title = username
        
        followers.removeAll()
        filterFollowers.removeAll()
        
        collectionView.setContentOffset(.zero, animated: true)
        
        getFollwers(username: username, page: pageCounter)
    }
    
    
    
}
