//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Hossam Ghareeb on 11/15/15.
//  Copyright © 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://image.pbs.org/video-assets/rc6moTn-asset-mezzanine-16x9-RVQaqL3.jpg", "http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"]

class Downloader {
    
    class func downloadImageWithURL(url:String) -> UIImage! {
        let data = NSData.init(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didClickOnStart(sender: AnyObject) {

        //EXECUTE TASKS IN GLOBAL QUEUE (CONCURRENT EXECUTION)
        let queue = DispatchQueue(label: "queuename", attributes: .concurrent)
        DispatchQueue.global(qos: .background).async {
            let img = Downloader.downloadImageWithURL(url: imageURLs[0])

            DispatchQueue.main.async {
                self.imageView1.image = img
            }
        }

        DispatchQueue.global(qos: .background).async {
            let img = Downloader.downloadImageWithURL(url: imageURLs[1])

            DispatchQueue.main.async {
                self.imageView2.image = img
            }
        }

//        DispatchQueue.global(qos: .background).async {
//            let img1 = Downloader.downloadImageWithURL(url: imageURLs[2])
//
//            DispatchQueue.main.async {
//                self.imageView3.image = img1
//            }
//        }
//
//        DispatchQueue.global(qos: .background).async {
//            let img1 = Downloader.downloadImageWithURL(url: imageURLs[3])
//
//            DispatchQueue.main.async {
//                self.imageView4.image = img1
//            }
//        }
        
        //EXECUTE TASKS USING NSOPERATIONQUEUE
//        var queue = NSOperationQueue()
//        
//        queue.addOperationWithBlock {
//            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
//            NSOperationQueue.mainQueue().addOperationWithBlock({
//                self.imageView1.image = img1
//            })
//        }
        
        //ADD OPERATION USING NSBLOCKOPERATION
//        let operation1 = NSBlockOperation(block: {
//            
//            
//            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
//            
//            
//            
//            NSOperationQueue.mainQueue().addOperationWithBlock({
//                self.imageView1.image = img1
//            })
//        })
//        
//        operation1.completionBlock = {
//            print("Operation 1 completed")
//        }
//        
//        queue.addOperation(operation1)
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }
}
