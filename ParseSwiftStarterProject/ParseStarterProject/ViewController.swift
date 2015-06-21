//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//  we can think of parse as an online database store. it is saving objects. we can upload our variables and objects and then download them later on to use on the same device or a different device.
//we can store a variety of things in parse including variables, arrays, dictionaries, files, boolean variables.

//we will also set up some spinners and alerts. we will use an activity indicator for the spinner

import UIKit
import Parse

//lets create teh activity indicator with a type of UIActivityIndicatorView, we will create an empty one and use it later
var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()

//lets add the uinavigationcontroller class to help us navigate to a different app like photostream or camera and back again. we also uiimagepicker controllerdelegate class
class ViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    //we need to use the built in method that we can us to do something with the user. in this case, all we want to do is display it in the imageView. this will be called when the user selects an image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("it worked")
        //lets dismiss the viewcontroller that the user saw
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //and set the image
        imageView.image = image
    }
    
    //lets enable the user to import images
    //when the user taps the button, it will create the uiimagepickercontroller, which is a view controller, which gos out of the app temporarily to allow the user to choose an image or use the camera.
    
    @IBAction func btnCreateAlert(sender: AnyObject) {
        var alert = UIAlertController(title: "hey there",message: "are you sure?",preferredStyle: UIAlertControllerStyle.Alert) //you have alot of optionos, like adding our own message. the preferred style is just the default.
            //this is a viewe controller and not a view. this will present the viewcontroller to the user. and it will take over anything that is behind it.
        
        //we created the alert variable, lets add an action, a button the user can press. the handler is going to be action, and all we want to do is dismiss the the viewController.
        alert.addAction(UIAlertAction(title: "ok", style: .Default, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        //now lets present the alert to the user. we use self to get access to the viewController. the viewController we are going to use is alert
        self.presentViewController(alert, animated: true, completion: nil)
        
        //we created an alert, that is a UIAlertController, we have added an action to it, saying that when the button is tapped dismiss the view controller, and then present the viewcontroller to the user
        }
    
    
        
    

    @IBAction func btnImport(sender: AnyObject) {
        
        var image = UIImagePickerController()
        //this will help us manage the process topick an image
        
        //like other contollers we are going to set the delegate to the viewController
        image.delegate = self
        
        //lets choose the source type for the image. this is where we choose between camera or the photostream. note, we just change the last paramater to camera if we wanted to.
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        //if we choose below the user can edit the image before it is imported into the app
        image.allowsEditing = false
        
        //the access the viewcontroller with self, then presentViewController, we will use the imagepicker controller. for completion, we don't need to run anyting, so we use nil
        self.presentViewController(image, animated: true, completion: nil)
        //this line above presents the view controller to the user.
        

    }
    
    @IBAction func btnPause(sender: AnyObject) {
        //lets start working with our activity indicator. we will create it again and use a particular view. we aer going to use a frame to define our activity indicator. this is where it goes on the screen
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicator.center = self.view.center
        //we set the center to the viewController, the view inside of it. this just puts it in the center of the screen.
        activityIndicator.hidesWhenStopped = true //we want it to disappear when it stops
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        //lets create the indicator.we will take the main view and add a subview
        view.addSubview(activityIndicator)
        //and lets animate it
        activityIndicator.startAnimating()
        
        //note that with the above code, you are only presenting the activityIndicator. It doesn't stop the app unless you do below.
        //UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        
    }

    @IBAction func btnRestoreImage(sender: AnyObject) {
        
        //now lets restore the app. because we said hidesWhenStopped true, this will hide it as well.
        activityIndicator.stopAnimating()
        
        //lets reactivate the app.
        //UIApplication.sharedApplication().endIgnoringInteractionEvents()
        //note: normally a restore function will only be in use if we are not ignoring interaction events. normally it is used when we are downloading something or log the user in etc. so we can comment out the above for the use of this demo app.
        
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

