//
//  FullWebsiteViewController.swift
//  ReservationApp
//
//  Created by Admin on 05/10/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class FullWebsiteViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
        }
        let url = URL (string: "http://www4.piac.com.pk/pianew/#");
        
        let requestObj = URLRequest(url: url!);
        webview.loadRequest(requestObj);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        Loader.Start(self)
    }

    @IBAction func openHome(_ sender: AnyObject) {
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
        

    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        Loader.Stop()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
