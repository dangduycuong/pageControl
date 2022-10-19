//
//  UICollectionView+extension.swift
//  pageControl
//
//  Created by cuongdd on 19/10/2022.
//

import UIKit

//
// MARK: - Register View
extension UICollectionView {
    
    /// Helper register cell
    /// The View must conform Identifier protocol
    func registerCell<T: Identifier>(_ viewType: T.Type) {
        self.register(viewType.xib(), forCellWithReuseIdentifier: viewType.identifierView)
    }
    
    func register<T: UICollectionViewCell>(with classType: T.Type) {
        self.register(classType.self, forCellWithReuseIdentifier: classType.identifierView)
    }
    
    /// Register Supplementary
    func registerSupplementaryView<T: Identifier>(_ supplementaryType: T.Type, kind: String) {
        self.register(supplementaryType.xib(), forSupplementaryViewOfKind: kind, withReuseIdentifier: supplementaryType.identifierView)
    }
    
    func registerSupplementary<T: UICollectionReusableView>(_ type: T.Type, kind: String) {
        self.register(type.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.identifierView)
    }
}
