//
//  MovieTableViewCell.swift
//  MobDev
//
//  Created by POG on 08.11.2020
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblCategories: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(movie: Movie) {
        print(movie)
        imgPoster.image = UIImage(named: movie.imageSmall)
        lblTitle.text = movie.title
        lblSummary.text = movie.summary
        lblRating.text = "⭐️ \(movie.rating)/10"
        lblCategories.text = movie.categoriesDescription
    }

}
