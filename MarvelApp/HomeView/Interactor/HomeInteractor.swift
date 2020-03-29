//
//  HomeInteractor.swift
//  MarvelApp
//
//  Created by David Penagos on 28/03/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    func interactorGetComics() {
        remoteDatamanager?.remoteGetComics()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func remoteCallBackData(with comics: Comics) {
        presenter?.interactorPushDataPresenter(with: comics)
    }
}
