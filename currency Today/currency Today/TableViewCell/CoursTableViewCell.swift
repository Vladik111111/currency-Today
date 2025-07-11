//
//  CoursTableViewCell.swift
//  currency Today
//
//  Created by Student on 03.07.25.
//

import UIKit

class CoursTableViewCell: UITableViewCell {
    static    let identifier = "CoursTableViewCell"
    
    private let iconContainer:UIView = {
        let view = UIView()
        
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.backgroundColor = .systemMint
        return view
    }()
    
    private let countrytitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.textColor = .black
        return title
    }()
    
    private let Currencytitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.textColor = .black
        return title
    }()
    
    
    
    private let iconimage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        return image
    }()
     
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(iconContainer)
        contentView.addSubview(countrytitle)
        contentView.addSubview(Currencytitle)
        contentView.addSubview(Courstitle)
        iconContainer.addSubview(iconimage)
        contentView.clipsToBounds = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 10
        iconContainer.frame  = CGRect(x:15,
                                      y:5,
                                      width: size,
                                      height: size)
        countrytitle.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: -10,
            width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
        
       Currencytitle.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 10,
            width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
        
        Courstitle.frame = CGRect(
            x: contentView.frame.size.width - 60,
            y: 0,
            width: contentView.frame.size.width - 100 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
        
        let imageSize:CGFloat = size/1.5
        iconimage.frame = CGRect(
            x:(size - imageSize)/2,
            y: (size - imageSize)/2,
            width: imageSize,
            height: imageSize)
        
    }
    
    
    public func configure(width modal: CoursOption ){
        
        iconContainer.backgroundColor = modal.backgroundColor
        iconimage.image = modal.backgroundImage
        countrytitle.text = modal.name
        Currencytitle.text = modal.currency
        Courstitle.text = modal.course
    }
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let Courstitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.textColor = .systemTeal
        return title
    }()
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
