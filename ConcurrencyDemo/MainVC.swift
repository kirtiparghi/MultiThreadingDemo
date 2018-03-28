//
//  MainVC.swift
//  ConcurrencyDemo
//
//  Created by Kirti Parghi on 3/24/18.
//  Copyright © 2018 Hossam Ghareeb. All rights reserved.
//

import UIKit

let imageURLs = ["https://www.hd-wallpapersdownload.com/script/bulk-upload/high-resolution-nature-pics-dowload.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://image.pbs.org/video-assets/rc6moTn-asset-mezzanine-16x9-RVQaqL3.jpg", "http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"]

class Downloader {
    
    class func downloadImageWithURL(url:String) -> UIImage! {
        let data = NSData.init(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)
    }
}

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSerialDispatchTapped(sender:UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "serialdispatch")
        self.present(controller, animated: true, completion: nil)        
    }
    
    @IBAction func btnConcurrentDispatchTapped(sender:UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "concurrentdispatch")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func btnSerialOperationTapped(sender:UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "serialoperation")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func btnConcurrentOperationTapped(sender:UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "concurrentoperation")
        self.present(controller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
