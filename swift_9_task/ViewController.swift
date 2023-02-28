//
//  ViewController.swift
//  swift_9_task
//
//  Created by Omar on 10/02/2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    var movie_title : String?
    var movie_imge  : String?
    var movie_rank  : String?
    var movie_weekend : String?
    var movie_gross : String?
    
    
    
    @IBOutlet weak var imge_movie: UIImageView!
    
    @IBOutlet weak var title_movie: UILabel!
    
    
    @IBOutlet weak var rank_movie: UILabel!
    
    @IBOutlet weak var rank_label: UILabel!
    
    @IBOutlet weak var weekend_movie: UILabel!
    
    @IBOutlet weak var weekend_label: UILabel!
    
    @IBOutlet weak var gross_movie: UILabel!
    
    @IBOutlet weak var gross_label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let movieImage = movie_imge else {return}
        imge_movie.kf.setImage(with: URL(string: movieImage))
        
        guard let movieTitle = movie_title else {return}
        title_movie.text = movieTitle
        
        guard let movieRank = movie_rank else {
//            rank_movie.text = NSLocalizedString("غير متصل", comment: "")
            return}
        rank_movie.text = movieRank
        rank_label.text = NSLocalizedString("rank", comment: "")
        
        guard let movieWeekEnd = movie_weekend else{
//            weekend_movie.text = NSLocalizedString("غير متصل", comment: "")
            return}
        weekend_movie.text = movieWeekEnd
        weekend_label.text = NSLocalizedString("weekend", comment: "")
        
        guard let movieGroos = movie_gross else {
//            gross_movie.text = NSLocalizedString("غير متصل", comment: "")
            return}
        gross_movie.text = movieGroos
        gross_label.text = NSLocalizedString("gross", comment: "")
        
        
//        let collectionVC = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as!CollectionViewController
        
//        if collectionVC.movie == nil
//        {
//            rank_movie.text = NSLocalizedString("غير متصل", comment: "")
//            weekend_movie.text = NSLocalizedString("غير متصل", comment: "")
//            gross_movie.text = NSLocalizedString("غير متصل", comment: "")
//        }
        
        
        
        
    }


}

