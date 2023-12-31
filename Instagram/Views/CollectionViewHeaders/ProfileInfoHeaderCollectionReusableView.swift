//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Jo Harper on 7/4/23.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostsButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowerButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}
final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Harper's Memory Collection"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "hello from the other side ~~~ I wish you well"
        label.textColor = .label
        label.numberOfLines = 0 //line wrap
        return label
    }()
    
    // MARK: - init

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()
        backgroundColor = .systemBackground //backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    private func addSubviews() {
        addSubview(profilePhotoImageView)
        addSubview(followersButton)
        addSubview(followingButton)
        addSubview(postsButton)
        addSubview(bioLabel)
        addSubview(nameLabel)
        addSubview(editProfileButton)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addButtonActions()
    {
        followersButton.addTarget(self, action: #selector(didTapFollowerButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        postsButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(x: 5, y: 5, width: profilePhotoSize, height: profilePhotoSize).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0 //for circle profile iamge
        let buttonheight = profilePhotoSize/2
        
        
        let countButtonWidth = (width-10-profilePhotoSize)/3
        
        nameLabel.frame = CGRect(x: profilePhotoImageView.right, y: 10, width: countButtonWidth*3, height: buttonheight).integral
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        let nameBioHeight = buttonheight+bioLabelSize.height
        bioLabel.frame = CGRect(x: profilePhotoImageView.right, y: nameLabel.bottom, width: countButtonWidth*3, height: bioLabelSize.height).integral
        
        postsButton.frame = CGRect(x: profilePhotoImageView.right, y: nameBioHeight+5, width: countButtonWidth, height: buttonheight).integral
        followersButton.frame = CGRect(x: postsButton.right, y: nameBioHeight+5, width: countButtonWidth, height: buttonheight).integral
        followingButton.frame = CGRect(x: followersButton.right, y: nameBioHeight+5, width: countButtonWidth, height: buttonheight).integral
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right, y: 5+buttonheight+nameBioHeight, width: countButtonWidth*3, height: buttonheight).integral
        
        
        
        
    }
    
    //MARK: - actions
    
    @objc private func didTapFollowerButton() {
        delegate?.profileHeaderDidTapFollowerButton(self)
    }
    
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTapPostsButton(self)
    }
    
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
}
