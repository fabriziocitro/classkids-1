//
//  CardsViewController.swift
//  chemistry
//
//  Created by Louis Debaere on 02/02/2018.
//  Copyright © 2018 The Horcruxes. All rights reserved.
//

import UIKit

// Dummy data
let data = ["H": "Hhydrogen", "He": "Helium"]


class CardsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var widthCollectionView: NSLayoutConstraint!
    @IBOutlet weak var heightCollectionView: NSLayoutConstraint!
    
    let cellSide: CGFloat = 100.0
    
    var cards: [CardModel]!
    var level: [CardModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cards = DataManager.shared.makeCardsArray()
        
        levelCreator()
        
        widthCollectionView.constant = cellSide*4 + 20*3
        heightCollectionView.constant = cellSide*4 + 20*3
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
//    - levelCreator create the level with 8 random matches (16 cards) and remove them from the storage
    
    func levelCreator () {
        
////        DataManager.shared.initialize()
//        print(DataManager.shared.storage)
//        print("------------------------")
//
        for i in 0...7 {
            let myIndex = cards.randomItem()
            level.append(cards[myIndex])
            cards.remove(at: myIndex)
            print(level[i].element)
            print(level[i].image)
        }
        print(cards.count)
    }
    
}



extension CardsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return level.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSide, height: cellSide)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CardCell
        cell.cardImage.image = level[indexPath.row].image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.transition(with: cell!, duration: 0.5, options: [.transitionFlipFromLeft], animations: {
            switch cell?.backgroundColor {
            case UIColor.blue?:
                cell?.backgroundColor = .green
            default:
                cell?.backgroundColor = .blue
            }
        }, completion: nil)
    }
    
    
}




//   - this function return a random item from the storage

extension Array {
    func randomItem() -> (Int) {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return index
    }
}


