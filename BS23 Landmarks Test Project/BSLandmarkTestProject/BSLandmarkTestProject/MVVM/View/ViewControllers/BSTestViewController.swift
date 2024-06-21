//
//  ViewController.swift
//  BSLandmarkTestProject
//
//  Created by mohaimin fahad on 21/6/24.
//

import UIKit
import Combine

class BSTestViewController: UIViewController {
    
    //MARK: View Components
    lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(hexString: "1d2b53")
        collectionView.automaticallyAdjustsScrollIndicatorInsets = false
        return collectionView
    }()
    
    
    private typealias DataSource = UICollectionViewDiffableDataSource<LandMarkListSection<AnyHashable>, AnyHashable>
    private var dataSource: DataSource?
    private var viewModel:LandMarkViewModel = .init()
    private let layout = CollectionViewLayoutBuilder()
    private var cancellables: Set<AnyCancellable> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupUI()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.triggerData()
    }
}

//MARK: View Binding
extension BSTestViewController {
    
    func cancelAllCancellables() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
    
    private func bindViewModel(){
        viewModel.$sectionData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                guard let self = self else {return}
                self.applyData(sectionData: data)
            }
            .store(in: &cancellables)
    }
    
}



//MARK: UI Setup
extension BSTestViewController {
    
    func setupUI(){
        self.view.backgroundColor = UIColor(hexString: "1d2b53")
        buildUI()
        setupCollectionView()
        
    }
    
    func buildUI(){
        self.view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,leading: view.leadingAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,trailing: view.trailingAnchor)
    }
    
    func setupCollectionView(){
        collectionView.register(LandMarkCollectionViewCell.self, forCellWithReuseIdentifier: LandMarkCollectionViewCell.identifier)
        collectionView.collectionViewLayout = makeLayout()


        setupCollectionViewDataSource()
    }
    
}


//MARK: Collectionview Layout
extension BSTestViewController {
    
    private func makeLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else {return nil}
            
            let sectionLayout = self.layout.verticalListLayout()
            return sectionLayout
            
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 10
        config.scrollDirection = .vertical
        layout.configuration = config
        return layout
    }
}


//MARK: Collectionview Data Source
extension BSTestViewController {
    
    private func applyData(sectionData:[LandMarkListSection<AnyHashable>]) {
        var snapshot = NSDiffableDataSourceSnapshot<LandMarkListSection<AnyHashable>, AnyHashable>()
        sectionData.forEach { section in
            guard !section.items.isEmpty else { return }
            snapshot.appendSections([section])
            snapshot.appendItems(section.items, toSection: section)
        }
        dataSource?.apply(snapshot, animatingDifferences: false)
    }
    
    func setupCollectionViewDataSource() {
        //For Regular Cell
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LandMarkCollectionViewCell.identifier, for: indexPath) as? LandMarkCollectionViewCell else {return UICollectionViewCell()}
            
            if let data = itemIdentifier as? LandMarkElement {
                cell.setViewWithData(imageName: data.imageName, title: data.name, subTitle: data.subtitle)
            }
            
            return cell
        })
        
    }
}

