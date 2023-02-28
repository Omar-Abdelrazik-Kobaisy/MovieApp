//
//  CollectionViewController.swift
//  swift_9_task
//
//  Created by Omar on 10/02/2023.
//

import UIKit
import Kingfisher
import Reachability
import CoreData
private let reuseIdentifier = "item"

class CollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    var movie : Data?
    
    
    var arr : [String]=[]
    var arr_img : [String]=[]
    let API_URL = "https://imdb-api.com/en/API/BoxOffice/k_sd2mgk42"
    var viewModel = HomeViewModel()
    let reachability = try! Reachability()
//    var context : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
//        context = appDelegate.persistentContainer.viewContext
//
        let activityindicator : UIActivityIndicatorView = UIActivityIndicatorView.init(style: .large)
        
        activityindicator.center = view.center
        
        activityindicator.startAnimating()
        
        view.addSubview(activityindicator)
        
            viewModel.bindingResultToHomeView={ [weak self] data in
                self?.movie = data
                DispatchQueue.main.async { [self] in
                    activityindicator.stopAnimating()
                    self?.collectionView.reloadData()
                }
            }
            viewModel.bindingArrayOfTitleToHomeView = { [weak self] arr_of_title in
                self?.arr = arr_of_title
                DispatchQueue.main.async { [self] in
                    activityindicator.stopAnimating()
                    self?.collectionView.reloadData()
                }
            }
            viewModel.bindingArrayOfImageToHomeView = { [weak self] arr_of_img in
                self?.arr_img = arr_of_img
                DispatchQueue.main.async { [self] in
                    activityindicator.stopAnimating()
                    self?.collectionView.reloadData()
                }
            }
        
        
        if reachability.connection == .wifi{
            print("Reachable via WiFi")
            viewModel.getMovies()
            //            fetchData { data in
            //                            self.movie = data
            //                for i in 0..<(data?.items.count ?? 0){
            //                    self.arr.append(data?.items[i].title ?? "")
            //                    self.arr_img.append(data?.items[i].image ?? "")
            //
            //                }
            //                if self.dataBaseIsEmpty() {
            //                    self.saveToDataBase(arr_title: self.arr, arr_image: self.arr_img)
            //
            //                }
            //                DispatchQueue.main.async {
            //                    activityindicator.stopAnimating()
            //                    self.collectionView.reloadData()
            //                }
            //            }
        }else{
            print("No Connection")
//            fetchFromDataBase()
            for item in CoreDataManager.fetchFromDataBase()
            {
                arr.append(item.name)
                arr_img.append(item.image)
            }
            activityindicator.stopAnimating()
        }
    }
    
    //    func fetchData(complition : @escaping (Data?) ->Void ){
    //        let url = URL(string: "https://imdb-api.com/en/API/BoxOffice/k_sd2mgk42")
    //
    //        guard let myurl = url else{return}
    //
    //        let req = URLRequest(url: myurl)
    //
    //        let session = URLSession(configuration: URLSessionConfiguration.default)
    //
    //        let task = session.dataTask(with: req) { data, response, error in
    //            do
    //            {
    //                let res = try JSONDecoder().decode(Data.self, from: data!)
    //                complition(res)
    //
    //            }catch{
    //                complition(nil)
    //                print(error.localizedDescription)
    //            }
    //        }
    //        task.resume()
    //    }
    
//    func saveToDataBase(arr_title:[String] , arr_image:[String]){
//        guard let myContext = context else {return}
//
//
//        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: myContext)
//
//
//        guard let myEntity = entity else{return}
//        do
//        {
//            for (movie_title , movie_image) in zip(arr_title , arr_image)
//            {
//                let movie = NSManagedObject(entity: myEntity, insertInto: myContext)
//                movie.setValue(movie_title, forKey: "title")
//                print("successfully saved title")
//                movie.setValue(movie_image, forKey: "image")
//                print("successfully saved image")
//            }
//            try myContext.save()
//        }catch let error
//        {
//            print(error)
//        }
//        print("successfully saved")
//
//    }
//    func saveToDataBase(movies:Data?){
//        guard let myContext = context else {return}
//
//
//        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: myContext)
//
//
//        guard let myEntity = entity else{return}
//        do
//        {
//            for i in 0..<(movies?.items.count ?? 0)
//            {
//                let movie = NSManagedObject(entity: myEntity, insertInto: myContext)
//                movie.setValue(movies?.items[i].title, forKey: "title")
//                print("successfully saved title")
//                movie.setValue(movies?.items[i].image, forKey: "image")
//                print("successfully saved image")
//            }
//            try myContext.save()
//        }catch let error
//        {
//            print(error)
//        }
//        print("successfully saved")
//
//    }
//
//    func fetchFromDataBase(){
//
//        //        var movies : [NSManagedObject]?
//        guard let myContext = context else {return}
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
//
//        do
//        {
//            let movies = try myContext.fetch(fetchRequest)
//
//            for item in movies
//            {
//                arr.append(item.value(forKey: "title") as! String)
//                arr_img.append(item.value(forKey: "image") as! String)
//            }
//        }catch let error{
//            print(error)
//        }
//
//    }
//
//    func dataBaseIsEmpty()->Bool{
//        var movies : [NSManagedObject]?
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
//
//        do
//        {
//            movies = try context?.fetch(fetchRequest)
//            guard let items = movies else {return false}
//            if items.count == 0
//            {
//                return true
//            }
//        }catch let error{
//            print(error)
//        }
//
//        return false
//    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
//        return movie?.items.count ?? 0
        return arr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        // Configure the cell
        cell.layer.cornerRadius = 15
        cell.title.text = arr[indexPath.row]

        let url = URL(string: arr_img[indexPath.row])
        cell.img_view.kf.setImage(with: url)
//        cell.title.text = movie?.items[indexPath.row].title
//        let url = URL(string: movie?.items[indexPath.row].image ?? "")
//                cell.img_view.kf.setImage(with: url)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
        let detailsView = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController

        detailsView.movie_title = movie?.items[indexPath.row].title ?? ""
        detailsView.movie_imge = movie?.items[indexPath.row].image ?? ""
        detailsView.movie_rank = movie?.items[indexPath.row].rank ?? ""
        detailsView.movie_weekend = movie?.items[indexPath.row].weekend ?? ""
        detailsView.movie_gross = movie?.items[indexPath.row].gross ?? ""

        if movie == nil {
            detailsView.movie_title = arr[indexPath.row]
            detailsView.movie_imge = arr_img[indexPath.row]

        }

        self.navigationController?.pushViewController(detailsView, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/2.065, height: 250)
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
