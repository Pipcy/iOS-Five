//
//  StorageManager.swift
//  Instagram
//
//  Created by Jo Harper on 7/1/23.
//

import FirebaseStorage

public class StorageManager {
    static let shared = DatabaseManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    
    //MARK: - Public
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManagerError>) -> Void) {
        bucket.child(reference).downloadURL(completion: {url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
                
            }
            
            completion(.success(url))
        })
    }
    
}

public enum UserPostType {
    case photo, video
}
public struct UserPost {
    let postType: UserPostType
}
