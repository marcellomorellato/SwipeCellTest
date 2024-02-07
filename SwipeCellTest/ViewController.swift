//
//  ViewController.swift
//  SwipeCellTest
//
//  Created by Marcello Morellato on 07/02/24.
//
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up collection view
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        // Create a list layout configuration
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        config.leadingSwipeActionsConfigurationProvider = { indexPath in
            // Define actions
            let action1 = UIContextualAction(style: .normal, title: "L") { [weak self] action, view, completion in
                // Handle action 1
                completion(true)
            }
            action1.backgroundColor = .blue
            
            let action2 = UIContextualAction(style: .normal, title: "PZ") { [weak self] action, view, completion in
                // Handle action 2
                completion(true)
            }
            action2.backgroundColor = .yellow
            
            let action3 = UIContextualAction(style: .normal, title: "S") { [weak self] action, view, completion in
                // Handle action 3
                completion(true)
            }
            action3.backgroundColor = .red
            
            // Return swipe actions configuration
            return UISwipeActionsConfiguration(actions: [action1, action2, action3])
        }
        
        // Create a list layout with the configured appearance
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        // Set the collection view's layout
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Assuming you have 10 items in your collection view
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
    }
}

