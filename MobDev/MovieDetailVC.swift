//
//  MovieDetailVC.swift
//  MobDev
//
//  Created by POG on 28.11.2020.
//

import UIKit

class MovieDetailVC: UIViewController {

    
    @IBOutlet weak var lblTitle2: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblcat: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblRating: UILabel!    
    @IBOutlet weak var lblSummary: UITextView!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblActors: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblimdbVotes: UILabel!
    @IBOutlet weak var lblProduction: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage(named: movie.imageWide)
        lblTitle2.text = movie.title
        lblRating.text = "\(movie.rating)⭐️"
        lblSummary.text = movie.summary
        lblcat.text = movie.categoriesDescription
        lblDuration.text = movie.duration
        lblYear.text = movie.year
        lblDirector.text = "Director(s): \(movie.director)"
        lblActors.text = "Actors: \(movie.actors)"
        lblLanguage.text = movie.language
        lblCountry.text = movie.country
        lblimdbVotes.text = movie.imdbVotes
        lblProduction.text = movie.production
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
