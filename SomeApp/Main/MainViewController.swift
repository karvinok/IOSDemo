//
//  ViewController.swift
//  SomeApp
//
//  Created by Олександр Палагнюк on 12.11.2020.
//

import UIKit

class MainViewController: UIViewController, MainViewControllerProtocol, UITableViewDataSource {

    @IBOutlet weak var someSwitch: UISwitch!
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)

    var presenter : MainPresenterProtocol!
    let configurator : MainConfiguratorProtocol = MainConfigurator()
    
    private var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        
        
        
        initViews()
    }

    func initViews(){
        someSwitch.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        
        self.view.addSubview(self.tableView)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        self.tableView.dataSource = self
        self.updateLayout(with: self.view.frame.size)
        
        presenter.requestEmployees()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
          cell.textLabel?.text = self.data[indexPath.row]
          return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       switch tableView {
       case self.tableView:
          return self.data.count
        default:
          return 0
       }
    }
    
    @objc func switchChanged(sw : UISwitch){
        presenter.requestEmployees()
    }
    
    func showEmployees(employees: [Employee]) {
        print("_________________________")
        print(employees)
        
        for item in employees {
            
            data.append(item.employee_name)
        }
        
        tableView.reloadData()
    }
    
    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    class TableViewCell: UITableViewCell {

    }
    
}

protocol MainViewControllerProtocol: class {
    func showEmployees(employees: [Employee])
}

