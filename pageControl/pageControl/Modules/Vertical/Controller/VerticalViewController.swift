//
//  VerticalViewController.swift
//  pageControl
//
//  Created by cuongdd on 19/10/2022.
//

import UIKit

class VerticalViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        collectionView.registerCell(PageCollecionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupUI() {
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func tapToShowHorizontalPage(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HorizontalViewController") as! HorizontalViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func scrollToLastItem(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 2) {
            self.collectionView.scrollToItem(at: IndexPath(row: 14, section: 0), at: .bottom, animated: true)
            self.view.layoutIfNeeded()
        }
        
    }
}

extension VerticalViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCollecionViewCell.identifierView, for: indexPath) as! PageCollecionViewCell
        cell.fillData(index: indexPath.row, item: "item")
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
        
        title = "Page \(indexPath.row + 1)"
    }
}

extension VerticalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
