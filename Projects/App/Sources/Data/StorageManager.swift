
import Foundation
import FirebaseStorage

final class StorageManager{
    
    static let shared = StorageManager()
    
    private let storage = Storage.storage().reference()
    
    typealias UploadPictureCompletionHandler = (Result<String, Error>) -> Void
        
    func uploadProfilePicture(with data: Data, fileName: String, completionHandler: @escaping UploadPictureCompletionHandler) {
        storage.child("images/\(fileName)").putData(data, metadata: nil) { metadata, error in
            guard
                let metadata = metadata,
                error == nil else {
                    completionHandler(.failure(StorageErrors.failedToUpload))
                    return
            }
            let reference = self.storage.child("images/\(fileName)").downloadURL { url, error in
                guard
                    let url = url,
                    error == nil else {
                    completionHandler(.failure(StorageErrors.failedtToGetDownloadUrl))
                    return
                }
                let urlString = url.absoluteString
                print("downloaded urlString: " + urlString)
                completionHandler(.success(urlString))
            }
        }
    }
    enum StorageErrors: LocalizedError {
        case failedToUpload
        case failedtToGetDownloadUrl
    }
}
    
