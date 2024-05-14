//
//  CatalogViewController.swift
//  Lesson13HW
//

//

import UIKit

class CatalogViewController: UIViewController {
    
    @IBOutlet weak var contentView: CatalogView!
    var model: CatalogModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        model.saveChangesIfNeeded()
    }
    
    private func setupInitialState() {
        
        title = "Catalog"
        
        model = CatalogModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
}

// MARK: - CatalogModelDelegate
extension CatalogViewController: CatalogModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

// MARK: - CatalogViewDelegate
extension CatalogViewController: CatalogViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension CatalogViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.pcItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CatalogCell = tableView.dequeueReusableCell(indexPath: indexPath)
        
        let item = model.pcItems[indexPath.row]
        
        cell.idLabel.text = "\(item.id)"
        cell.nameLabel.text = item.name
        cell.descriptionLabel.text = "\(item.manufacturer),\(item.model)"
        cell.priceLabel.text = "\(item.price),\(item.currency)"
        
        let isFavorite = item.isFavorite ?? false
        cell.updateFavorite(isFavorited: isFavorite)
        
        cell.accessoryType = isFavorite ? .checkmark : .none
        
        cell.setStars(count: item.rating)
        
        cell.onTap = { [weak self] in
            guard let self else { return }
            let isFavorite = !model.pcItems[indexPath.row].favorite()
            model.updateItem(with: isFavorite, at: indexPath.row)
            cell.accessoryType = isFavorite ? .checkmark : .none
            $0.updateFavorite(isFavorited: isFavorite)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.height / 4.8
        
    }
}

// MARK: - UITableViewDelegate
extension CatalogViewController: UITableViewDelegate { }


