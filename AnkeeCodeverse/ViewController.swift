//
//  ViewController.swift
//  AnkeeCodeverse
//
//  Created by AnkeeCodeverse on 21/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- @IBOutlet
    @IBOutlet var lblExample : UILabel!
    @IBOutlet var imageView : UIImageView!
    
    // MARK:- LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIInMain()
        interactivePriority()
        userInitiatedPriority()
        utilityPriority()
        backgroundPriority()
    }
    
    // MARK:- CUSTOM FUNCTION
    
    func updateUIInMain(){
        // Update the UI on the main queue.
        DispatchQueue.main.async {
            self.lblExample.text = "Hello, world!"
        }
        
    }
    func interactivePriority(){
        // Update the UI on the main queue in the user interactive priority.
        DispatchQueue.main.async(qos: .userInteractive) {
            self.lblExample.text = "Hello, world!"
        }
        
    }
    func userInitiatedPriority() {
        // Download an image in the background with the user initiated priority.
        DispatchQueue.global(qos: .userInitiated).async {
            let image = self.downloadImage()
            
            // Update the UI when the image is downloaded.
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    func utilityPriority(){
        // Compress a large image in the background with the utility priority.
        DispatchQueue.global(qos: .utility).async {
            let image = UIImage(named: "largeImage.jpg")!
            let compressedImage = image.jpegData(compressionQuality: 0.5)
            
            // Save the compressed image to disk.
            // ...
        }
    }
    func backgroundPriority (){
        
        // Send an email in the background with the background priority.
        DispatchQueue.global(qos: .background).async {
            let email = Mail(to: "someone@example.com", subject: "Test email", body: "This is a test email.")
            // you can send data like this
            email.send(to: "someone@example.com", subject: "Test email", body: "This is a test email.")
        }
        
    }
    private func downloadImage() -> UIImage {
        // Download the image from the internet.
        // ...
        let image = UIImage()
        return image
    }
    
   
}

class Mail {

  var to: String
  var subject: String
  var body: String

  init(to: String, subject: String, body: String) {
    self.to = to
    self.subject = subject
    self.body = body
  }
    func send(to: String, subject: String, body: String) {
      // Create a MFMailComposeViewController object.
      // Set the recipient, subject, and body of the email.
    }
}
