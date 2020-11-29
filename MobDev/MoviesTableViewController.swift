//
//  MoviesTableViewController.swift
//  MobDev
//
//  Created by POG on 28.11.2020.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var movies = [Movie]()
    
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    
    override func viewDidLoad() {
        //Setup the Search Controller P.S Много пытался Но оно просто не появляется Подскажите потом в комментах пожалуйста))
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        super.viewDidLoad()
        
        loadData()
        
    }
    
    
    
    func loadData(){
        
        guard let jsonUrl = Bundle.main.url(forResource: "movies", withExtension: "json"), let data = try? Data(contentsOf: jsonUrl) else {
            print("movies")
            return
        }
        
        do {
            movies = try JSONDecoder().decode([Movie].self, from: data)
            print(movies.count)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    //Add something Тоже не работает(
    @IBAction func onAddTapped() {
        let alert = UIAlertController(title: "Add Movie", message: nil, preferredStyle: .alert)
        alert.addTextField { (newTitle) in
            newTitle.placeholder = "Enter title"
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let film = alert.textFields?.first?.text else { return }
            self.add(film)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func add(_ film:String) {
        let index = 0        
        let indexPath = IndexPath(row: index, section: 0)
        tableView.insertRows(at: [indexPath], with: .left)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! MovieDetailVC
        guard let row = tableView.indexPathForSelectedRow?.row else { return }

        let movie = movies[row]
        vc.movie = movie
                            
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return movies.count
        }
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        var row: Movie
        
        if isFiltering {
            row = movies[indexPath.row]
        } else {
            row = movies[indexPath.row]
        }
        
        //let row = movies[indexPath.row]

        cell.prepare(movie: row)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        movies.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
}

extension MoviesTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        movies = movies.filter({ (title: Movie) -> Bool in
            return title.title.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}
