//
//  SearchBarController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/22/21.
//

import UIKit

class SearchBarController: UIViewController {

    @IBOutlet weak var searchBarView: UISearchBar!
    @IBOutlet weak var tableResultSearch: UITableView!
    var pendingWorkitem: DispatchWorkItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.isNavigationBarHidden = false
    
    }
    
    //MARK: Search
    
    func config() {
        searchBarView.showsCancelButton = true
        searchBarView.delegate = self
        createArrayName()
        
        tableResultSearch.delegate = self
        tableResultSearch.dataSource = self
        tableResultSearch.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    func createArrayName(){
        for item in coworkingsList {
            names.append(item.name)
        }
    }
    
    func search(text: String) {
        pendingWorkitem?.cancel()
        
        pendingWorkitem = DispatchWorkItem.init(block: {
            if text.isEmpty {
                searchNames = names
            }
            else {
                searchNames = names.filter { names in
                    names.lowercased().contains(text.lowercased())
                }
            }
            self.tableResultSearch.reloadData()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: pendingWorkitem!)
    }

}

extension SearchBarController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = searchNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailCoworkingViewController()
        let name = searchNames[indexPath.row]
        guard let index = coworkingsList.firstIndex(where: {$0.name == name}) else {
            return
        }
        vc.index = index
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchBarController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(text: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(text: "")
    }
}
