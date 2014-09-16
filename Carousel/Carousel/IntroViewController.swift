//
//  IntroViewController.swift
//  Carousel
//
//  Created by Sam Julian on 9/15/14.
//  Copyright (c) 2014 Sam Julian. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var photo4: UIImageView!
    @IBOutlet weak var photo5: UIImageView!
    @IBOutlet weak var photo6: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]

    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = introImage.image!.size
        scrollView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {

        var offset = Float(scrollView.contentOffset.y)

        var tx1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[0], r2Max: 0)
        var ty1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[0], r2Max: 0)
        var scale1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[0], r2Max: 1)
        var rotation1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[0], r2Max: 0)
        photo1.transform =
                CGAffineTransformMakeTranslation(CGFloat(tx1), CGFloat(ty1))
        photo1.transform =
            CGAffineTransformScale(photo1.transform, CGFloat(scale1), CGFloat(scale1))
        photo1.transform =
            CGAffineTransformRotate(photo1.transform, CGFloat(Double(rotation1) * M_PI / 180))
        
        var tx2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[1], r2Max: 0)
        var ty2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[1], r2Max: 0)
        var scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[1], r2Max: 1)
        var rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[1], r2Max: 0)
        photo2.transform =
            CGAffineTransformMakeTranslation(CGFloat(tx2), CGFloat(ty2))
        photo2.transform =
            CGAffineTransformScale(photo2.transform, CGFloat(scale2), CGFloat(scale2))
        photo2.transform =
            CGAffineTransformRotate(photo2.transform, CGFloat(Double(rotation2) * M_PI / 180))

        var tx3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[2], r2Max: 0)
        var ty3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[2], r2Max: 0)
        var scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[2], r2Max: 1)
        var rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[2], r2Max: 0)
        photo3.transform =
            CGAffineTransformMakeTranslation(CGFloat(tx3), CGFloat(ty3))
        photo3.transform =
            CGAffineTransformScale(photo3.transform, CGFloat(scale3), CGFloat(scale3))
        photo3.transform =
            CGAffineTransformRotate(photo3.transform, CGFloat(Double(rotation3) * M_PI / 180))
        
        var tx4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[3], r2Max: 0)
        var ty4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[3], r2Max: 0)
        var scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[3], r2Max: 1)
        var rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[3], r2Max: 0)
        photo4.transform =
            CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
        photo4.transform =
            CGAffineTransformScale(photo4.transform, CGFloat(scale4), CGFloat(scale4))
        photo4.transform =
            CGAffineTransformRotate(photo4.transform, CGFloat(Double(rotation4) * M_PI / 180))
        
        var tx5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[4], r2Max: 0)
        var ty5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[4], r2Max: 0)
        var scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[4], r2Max: 1)
        var rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[4], r2Max: 0)
        photo5.transform =
            CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
        photo5.transform =
            CGAffineTransformScale(photo5.transform, CGFloat(scale5), CGFloat(scale5))
        photo5.transform =
            CGAffineTransformRotate(photo5.transform, CGFloat(Double(rotation5) * M_PI / 180))
        
        var tx6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[5], r2Max: 0)
        var ty6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[5], r2Max: 0)
        var scale6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[5], r2Max: 1)
        var rotation6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[5], r2Max: 0)
        photo6.transform =
            CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
        photo6.transform =
            CGAffineTransformScale(photo6.transform, CGFloat(scale6), CGFloat(scale6))
        photo6.transform =
            CGAffineTransformRotate(photo6.transform, CGFloat(Double(rotation6) * M_PI / 180))
        
        println("content offset: \(scrollView.contentOffset.y)")
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
