import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

let prefixUrl = "https://randomuser.me"

struct DataModel : Decodable {
    
    let results : [PostModel]
    
}

struct PostModel : Decodable {
    let gender: String
}

var items = [PostModel]()

func fetchPosts(){
    guard let url = URL(string: "\(prefixUrl)/api/") else{
            print("test")

        print("Not found url")
        return
    }
    
    URLSession.shared.dataTask(with: url){ (data,res, error) in
        
        if error != nil{
            
            print("error", error?.localizedDescription ?? "")
            return
        }
        
        do{
            
            if let data = data{
                
                let result = try JSONDecoder().decode(DataModel.self, from: data)
                DispatchQueue.main.async {
                    // result.data

                    print(result)
                    // List(0 ..< result.data.count, id: \.self ){ index in

                }
            }else{
                print("No data")
            }
            
        }catch let JsonError{
            print("fetch json error", JsonError.localizedDescription)
        }
        
    }.resume()
    
}

fetchPosts()
