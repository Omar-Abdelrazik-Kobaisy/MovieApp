//
//  HomeViewModel.swift
//  swift_9_task
//
//  Created by Omar on 22/02/2023.
//

import Foundation

class HomeViewModel {
    let API_URL = "https://imdb-api.com/en/API/BoxOffice/k_sd2mgk42"
    //------------------
    var bindingArrayOfTitleToHomeView : (([String]) -> Void) = {_ in}
    var arr : [String]=[]{
        didSet{
            bindingArrayOfTitleToHomeView(arr)
        }
    }
    //-------------------
    var bindingArrayOfImageToHomeView : (([String]) -> Void) = {_ in}
    var arr_img : [String]=[]{
        didSet{
            bindingArrayOfImageToHomeView(arr_img)
        }
    }
    //--------------------
    var bindingResultToHomeView : ((Data?) -> Void) = {_   in }
    var result : Data? {
        didSet{
            //binding the result
            bindingResultToHomeView(result)
        }
    }
    //-------------------
    func getMovies()
    {
        NetworkManager.fetchData(url: API_URL) {[weak self] (data:Data?) in
            self?.result = data
            for i in 0..<(data?.items.count ?? 0){
                self?.arr.append(data?.items[i].title ?? "")
                self?.arr_img.append(data?.items[i].image ?? "")
                
            }
            DispatchQueue.main.async {
            if CoreDataManager.dataBaseIsEmpty() {
                
                    CoreDataManager.saveToDataBase(arr_title: self?.arr ?? [], arr_image: self?.arr_img ?? [])
                }
               
            }
        }
    }
}
