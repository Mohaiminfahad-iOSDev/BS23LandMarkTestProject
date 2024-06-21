//
//  LandMarkCollectionViewCell.swift
//  BSLandmarkTestProject
//
//  Created by mohaimin fahad on 21/6/24.
//

import UIKit

class LandMarkCollectionViewCell: UICollectionViewCell {
    
    static var identifier:String = "LandMarkCollectionViewCell"
    
    lazy var baseView:UIView = {
       var view = UIView()
        view.backgroundColor = UIColor(hexString: "1d2b53")
        return view
    }()
    
    lazy var horizontalStackView:UIStackView = {
       var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = RM.shared.width(10)
        return stackView
    }()
    
    lazy var verticalStackView:UIStackView = {
       var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = RM.shared.width(5)
        return stackView
    }()
    
    
    lazy var landMarkIcon:UIImageView = {
        var imageView = UIImageView(image: UIImage(systemName: "photo.artframe.circle.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    lazy var titleLabel:UILabel = {
       var label = UILabel()
        label.text = "Title"
        label.font = UIFont(name: "Helvetica-Bold", size: RM.shared.height(18))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    lazy var subTitleLabel:UILabel = {
       var label = UILabel()
        label.text = "Sub title"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: RM.shared.height(14))
        label.numberOfLines = 0
        label.textColor = UIColor(hexString: "0abab5")
        return label
    }()
    
    lazy var lineView:UIView = {
       var view = UIView()
        view.backgroundColor = .white
        view.anchor(height: 1)
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        self.landMarkIcon.layer.cornerRadius = self.landMarkIcon.frame.height/2
    }
}


//MARK: View Setup
extension LandMarkCollectionViewCell {
    
    func setupView(){
        addSubViews()
    }
    
    func addSubViews(){
        self.addSubview(baseView)
        baseView.fillSuperview(padding: .init(top: 0, left: RM.shared.width(5), bottom: 0, right: RM.shared.width(5)))
        baseView.addSubview(horizontalStackView)
        horizontalStackView.fillSuperview(padding: .init(top: RM.shared.width(5), left: RM.shared.width(5), bottom: RM.shared.width(8), right: RM.shared.width(8)))
        horizontalStackView.addArrangedSubview(landMarkIcon)
        landMarkIcon.anchor(height: RM.shared.height(70),multiplier: 1)
        
        horizontalStackView.addArrangedSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subTitleLabel)
        
        baseView.addSubview(lineView)
        lineView.anchor(leading: baseView.leadingAnchor,bottom: baseView.bottomAnchor,trailing: baseView.trailingAnchor)
    }
    
    
    func setViewWithData(imageName:String?,title:String?,subTitle:String?){
        self.landMarkIcon.image = UIImage(named: imageName ?? "photo.artframe.circle.fill")
        self.titleLabel.text = title ?? "Title"
        self.subTitleLabel.text = subTitle ?? "Sub Title"
    }
}
