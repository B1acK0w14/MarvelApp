//
//  HomePresenter.swift
//  MarvelApp
//
//  Created by David Penagos on 28/03/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {    
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.interactorGetComics()
    }
    
    func transformDateToShow(with date: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        let dateToParse = dateFormatter.date(from: date)!
        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "dd MMM, yyyy"
        return dateFormatterString.string(from: dateToParse)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func interactorPushDataPresenter(with receivedComics: Comics) {
        view?.presenterPushDataView(with: receivedComics)
    }
}
