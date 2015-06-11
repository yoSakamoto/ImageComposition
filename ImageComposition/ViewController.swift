//
//  ViewController.swift
//  ImageComposition
//
//  Created by 坂本葉 on 2015/06/09.
//  Copyright (c) 2015年 YoSakamoto. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    // 1枚目の画像.
    let myInputImage1 = CIImage(image: UIImage(named: "ci011_001.jpg"))
    // 2枚目の画像.
    let myInputImage2 = CIImage(image: UIImage(named: "ci011_002.jpg"))
    
    // ImageView.
    var myImageView: UIImageView!
    
    // ボタン.
    let myButton: UIButton = UIButton()
    let deleteButton:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIImageViewの生成.
        myImageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        myImageView.image = UIImage(CIImage: myInputImage1)
        self.view.addSubview(myImageView)
        
        // ボタン.
        myButton.frame = CGRectMake(0,0,80,80)
        myButton.backgroundColor = UIColor.blackColor();
        myButton.layer.masksToBounds = true
        myButton.setTitle("ブレンド", forState: UIControlState.Normal)
        myButton.titleLabel?.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton.layer.cornerRadius = 40.0
        myButton.layer.position = CGPoint(x: self.view.frame.width/2+2, y:self.view.frame.height - 50)
        myButton.tag = 1
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // 背景色を黒.
        self.view.backgroundColor = UIColor.whiteColor()
        
        // UIボタンをViewに追加.
        self.view.addSubview(myButton);
        
        
        
            }
    
    // ボタンイベント.
    func onClickMyButton(sender: UIButton){
        
        // カラーエフェクトを指定してCIFilterをインスタンス化.
        let myComposeFilter = CIFilter(name: "CIMinimumCompositing")
        
        // イメージのセット.
        myComposeFilter.setValue(myInputImage1, forKey: kCIInputImageKey)
        myComposeFilter.setValue(myInputImage2, forKey: kCIInputBackgroundImageKey)
        
        // フィルターを通した画像をアウトプット.
        let myOutputImage : CIImage = myComposeFilter.outputImage
        
        // 再びUIViewにセット.
        myImageView.image = UIImage(CIImage: myOutputImage)
        
        // 再描画.
        myImageView.setNeedsDisplay()
        
    }
    
    }




