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
    var viewModel = RecipeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureNavBar()
        configureCollectionView()
        
        loadRandomRecipes()
    }
    
    private func loadRandomRecipes() {
        viewModel.fetchRandomRecipesData {
            self.collectionView.dataSource = self
            self.collectionView.reloadData()
        }
    }
    
    func setupView() {
        title = "Home"
        view.backgroundColor = .white
    }
    
    // MARK: - NavigationController
    
    func configureNavBar() {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.3
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 6
        
        let searchButton = UIBarButtonItem(image: UIImage(named: "Search"), style: .plain, target: self, action: #selector(searchButtonTapped))
        searchButton.tintColor = Colors.mainTextColor
        self.navigationItem.rightBarButtonItem  = searchButton
    }
    
    @objc func searchButtonTapped() {
        print("tapped")
    }
    
    // MARK: - CollectionView
    
    func configureCollectionView() {
        // FlowLayout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumInteritemSpacing = 4
        
        // CollectionView
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(RecipeCell.self, forCellWithReuseIdentifier: "RecipeCell")
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        
        // Cell size
        let width = (self.collectionView.frame.size.width - 60) / 2
        let height = collectionView.frame.size.width - 120
        layout.itemSize = CGSize(width: width, height: height)
        
        view.addSubview(collectionView)
    }
    
    // MARK: - DataSource methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        
        cell.recipeImageView.image = UIImage(named: "image-placeholder")
        cell.recipeLabel.text = "Recipe"
        cell.timeLabel.text = "60 minutes"
        
        let recipe = viewModel.cellForRowAt(indexPath: indexPath)
        cell.set(recipe: recipe)
        
        return cell
                
    }
}
