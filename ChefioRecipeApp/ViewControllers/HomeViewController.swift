//
//  HomeViewController.swift
//  ChefioRecipeApp
//
//  Created by Giovanna Pezzini on 14/01/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var recipe = [Recipe]()
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureCollectionView()
    }
    
    func setupView() {
        title = "Home"
        view.backgroundColor = .white
    }
    
    func configureCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumInteritemSpacing = 4
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(RecipeCell.self, forCellWithReuseIdentifier: "RecipeCell")
        collectionView?.backgroundColor = .systemGray5
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        layout.itemSize = CGSize(width:(self.collectionView.frame.size.width - 60) / 2, height: (self.collectionView.frame.size.width) / 2)
    }
    
    // MARK: - DataSource methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        
        cell.recipeImageView.image = UIImage(named: "image-placeholder")
        cell.recipeLabel.text = "Recipe"
        cell.timeLabel.text = "60 minutes"
        cell.backgroundColor = .red
        
        return cell
    }
}
