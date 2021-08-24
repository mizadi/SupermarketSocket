//
//  ViewController.swift
//  Supermarket
//
//  Created by Adi Mizrahi on 09/08/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var cvProducts: UICollectionView!
    @IBOutlet weak var lbCouldNotLoadData: UILabel!
    var presenter: MainPresenter!
    
    var collectionController: ProductsCollectionController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter(self)
        presenter.initSocket()
        setNavigationBar()
        initCollectionView()
    }
    
    func initCollectionView() {
        collectionController = ProductsCollectionController(data: [SuperMarketProduct]())
        cvProducts.delegate = collectionController
        cvProducts.dataSource = collectionController
    }
    
    func setNavigationBar() {
        self.title = "Review Cart"
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    }
    
    deinit {
        print("killed")
    }
}

extension MainViewController: MainPresenterDelegate {
    func productRecevied(product: SuperMarketProduct) {
        collectionController.addProdcut(product)
        cvProducts.performBatchUpdates({
            cvProducts.reloadSections(IndexSet(integer: 0))
        }, completion: nil)
    }
    
    func failedToFetchProducts() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5) {
                self.lbCouldNotLoadData.alpha = 1.0
                self.cvProducts.alpha = 0.0
            }
        }
    }
    
}

