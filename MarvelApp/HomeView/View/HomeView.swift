//
//  HomeView.swift
//  MarvelApp
//
//  Created by David Penagos on 28/03/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class HomeView: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var presenter: HomePresenterProtocol?
    let searchController = UISearchController(searchResultsController: nil)
    var comics: [Result] = [Result]()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        homeCollectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    func presenterPushDataView(with receivedComics: Comics) {
        guard let receivedComics = receivedComics.data?.results else {return}
        self.comics = receivedComics
        DispatchQueue.main.async {
            self.homeCollectionView.reloadData()
        }
    }
}

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: - Redirect to other view when user tap on cell
    }
}

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.comics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCellView
        cell.titleMovieLabel.text = self.comics[indexPath.row].title
        if let datePublish = self.comics[indexPath.row].dates?[0].date {
            cell.datePublishMovieLabel.text = presenter?.transformDateToShow(with: datePublish)
        } else {
            cell.datePublishMovieLabel.text = "Don't have!"
        }
        if let imageComic = self.comics[indexPath.row].thumbnail {
            cell.titleMovieImage.kf.setImage(with: URL(string: (imageComic.path! + "." + imageComic.thumbnailExtension!)))
        }
        return cell
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    //ANNOTATION: - Change size of collectionViewCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

//MARK: - SearchController extension
extension HomeView: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //TODO: - Make a search into the collectionView
    }
}
