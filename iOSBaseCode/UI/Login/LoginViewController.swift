//
//  LoginViewController.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import UIKit
class LoginViewController: UIViewController {
    @IBOutlet weak var UILoginAC: UIActivityIndicatorView!
    @IBOutlet weak var UIEmailTF: UITextField!
    @IBOutlet var UIPasswordTF: UITextField!
    @IBOutlet weak var UILoginButton: UIButton!
    var presenter: LoginPresenter!
    override func viewDidLoad() {
        self.setupUI()
        super.viewDidLoad()
        presenter.attachView(view: self)
    }
}

extension LoginViewController: LoginView{
    func showAuthSuccess() {
        print("Success Authentication login");
        self.hideAI();
        self.enableInteractivity();
//        performSegue(withIdentifier: "toDashboardSegue", sender: nil);
        performSegue(withIdentifier: "toTabView", sender: nil);
    }
    func showAuthFailed(message:String) {
        print("Failed Authentication login");
        self.hideAI();
        self.enableInteractivity();
    }
}
//MARK: Button Events
extension LoginViewController{
    @IBAction func LoginOnClick(_ sender: Any) {
        self.showAI();
        self.disableInteractivity();
        presenter.Authorize(email: self.UIEmailTF.text!, password: self.UIPasswordTF.text!);
    }
}
//MARK: UISetup
extension LoginViewController{
    func setupUI(){
        self.hideAI();
    }
    func hideAI(){
        self.UILoginAC.isHidden=true;
        self.UILoginAC.stopAnimating();
    }
    func showAI(){
        self.UILoginAC.isHidden=false;
        self.UILoginAC.startAnimating();
    }
    func disableInteractivity(){
        self.UIEmailTF.isEnabled=false;
        self.UIPasswordTF.isEnabled=false;
        self.UILoginButton.isEnabled=false;
    }
    func enableInteractivity(){
        self.UIEmailTF.isEnabled=true;
        self.UIPasswordTF.isEnabled=true;
        self.UILoginButton.isEnabled=true;
    }
}
//MARK: Segue Handler
extension LoginViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}



