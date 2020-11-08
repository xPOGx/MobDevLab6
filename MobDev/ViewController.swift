//
//  ViewController.swift
//  MobDev
//
//  Created by POG on 10.10.2020.
//

import UIKit

struct Movie : Decodable {
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
}

struct ResponseData: Decodable {
    private enum CodingKeys : String, CodingKey {
        case search = "Search"
    }
    let search: [Movie]
}

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        movies = loadJson(filename: "MoviesList")!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadJson(filename fileName: String) -> [Movie]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "txt") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                return jsonData.search
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        cell.titleLabel?.text = movie.title
        cell.yearLabel?.text = movie.year
        cell.typeLabel?.text = movie.type
        cell.posterImageView?.image = UIImage(named: movie.poster)
        
        return cell
    }

}

