//
//  MainViewController.swift
//  SmartyHome
//
//  Created by aymen braham on 26/07/2020.
//  Copyright © 2020 AymenBraham. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: Variables
    var name: String = ""
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    // MARK: Configuration TableView
    func setUpTableView() {
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.separatorStyle = .none
    }
    
    // MARK: UserInteraction
    
    // Continue Button Action
    @objc
    func goToHomeScreen() {
        // Register Nib
        if name.isEmpty || name == "" {
            createAlert()
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
        } else {
            // registre Nib
            let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
            // set UserName
            UserDefaults.standard.set(name, forKey: "userName")
            // set User Status
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            // Present View "Modally"
            homeViewController.modalPresentationStyle = .fullScreen
            self.present(homeViewController, animated: false, completion: nil)
        }
        
    }
    
    // TextField DidChange
     @objc func didChangeText(textField: UITextField) {
        name = textField.text!.trimmingCharacters(in: .whitespaces)
        
    }
    
    
    // AlertView
    
    func createAlert() {
        let alert = UIAlertController(title: "Alert", message: "You must enter your name!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style {
              case .default:
                    print("default")
              case .cancel:
                    print("cancel")
              case .destructive:
                    print("destructive")
              @unknown default:
                break
            }}))
        self.present(alert, animated: true, completion: nil)
    }

}

// MARK: TableView Delegate && DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 350
        } else {
            return 280
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
             let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.first as? ImageTableViewCell
             guard let currentcell = cell else {
                 fatalError("Error with the identifier of this cell")
             }
            currentcell.selectionStyle = .none
            return currentcell
        } else {
             let cell = Bundle.main.loadNibNamed("WelcomeTableViewCell", owner: self, options: nil)?.first as? WelcomeTableViewCell
             guard let currentcell = cell else {
                 fatalError("Error with the identifier of this cell")
             }
            currentcell.selectionStyle = .none
            currentcell.continueButton.addTarget(self, action: #selector(goToHomeScreen), for: .touchUpInside)
            currentcell.nameTextField.addTarget(self, action: #selector(didChangeText(textField:)), for: .editingChanged)
            return currentcell
        }

    }
    
    
}
