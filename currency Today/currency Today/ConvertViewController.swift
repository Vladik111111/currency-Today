//
//  ConvertViewController.swift
//  currency Today
//
//  Created by Student on 02.07.25.
//

import UIKit

class ConvertOption{
    var name: String
    var backgroundColor:UIColor
    var backgroundImage:UIImage
    var api: String
    
    
    init(name: String, backgroundColor: UIColor, backgroundImage:UIImage, api: String) {
        self.name = name
        self.backgroundColor = backgroundColor
        self.backgroundImage = backgroundImage
        self.api = api
    }
}


class ConvertViewController: UIViewController {

    
    @IBOutlet weak var TableView: UITableView!
    var models = [ConvertOption]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        TableView.delegate = self
        TableView.dataSource = self
        TableView.register(ConvertTableViewCell.self, forCellReuseIdentifier: ConvertTableViewCell.identifier)
        configure()
    }
    
    
    func configure(){
        models.append(contentsOf: [
            ConvertOption(name: "AMD", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!, api: "https://open.er-api.com/v6/latest/AMD"),
                ConvertOption(name: "RUB", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!, api: "https://open.er-api.com/v6/latest/RUB"),
                ConvertOption(name: "USD", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!, api: "https://open.er-api.com/v6/latest/USD"),
            ConvertOption(name: "EUR", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!, api: "https://open.er-api.com/v6/latest/EUR"),
            ConvertOption(name: "BRL", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!, api: "https://open.er-api.com/v6/latest/BRL"),
            ConvertOption(name: "GEL", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!, api: "https://open.er-api.com/v6/latest/GEL"),
            ConvertOption(name: "IRR", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!, api: "https://open.er-api.com/v6/latest/IRR"),
            ConvertOption(name: "UAH", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!, api: "https://open.er-api.com/v6/latest/UAH"),
            ConvertOption(name: "CAD", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!, api: "https://open.er-api.com/v6/latest/CAD"),
            ConvertOption(name: "CAR", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "gear")!, api: "https://open.er-api.com/v6/latest/CAR"),
        ])
    }
    
   
     
    @IBAction func homeButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CoursViewController") as? CourseViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overCurrentContext
        self.present(vc!, animated: true)
    }
    @IBAction func setting(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overCurrentContext
        self.present(vc!, animated: true)
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




extension ConvertViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier:ConvertTableViewCell.identifier , for: indexPath) as? ConvertTableViewCell
        else{
            return UITableViewCell()
        }
        cell.configure(width: model)
        return cell
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.TableView.deselectRow(at: indexPath, animated: true)
        }
    }


