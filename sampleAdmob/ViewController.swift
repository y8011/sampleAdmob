//
//  ViewController.swift
//  sampleAdmob
//
//  Created by yuka on 2018/03/08.
//  Copyright © 2018年 yuka. All rights reserved.
//

import UIKit
import GoogleMobileAds   //Admob用

class ViewController: UIViewController {

    let AdMobID = "ca-app-pub-6416476542651492/4921600910"  //バナーのID
    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"  // 個別のiPhoneのID入れます
    // MEMO:AdMobTest = true ,SimulatorTest = falseのときに有効になるID
    // 実機をつないで上記組み合わせで実行するとDebug AreaにTEST_DEVICE_IDに入れるIDが出て来ます。
    let AdMobTest:Bool = true   // 切り替えようのフラグ
    let SimulatorTest:Bool = false  //　切り替えようのフラグ
    
    let AdMobInterstitialID = "ca-app-pub-3940256099942544/4411468910" //テスト用
//    let AdMobInterstitialID = "ca-app-pub-6416476542651492/6643768708" //本番用
    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        admobInterstitial()
        
        admobDisplay()
        
        
    }
    

    func admobDisplay() {
        
        var admobView: GADBannerView = GADBannerView()
        admobView = GADBannerView(adSize: kGADAdSizeLargeBanner)
        print("バナーのサイズ",admobView)
        
        admobView.frame.origin = CGPoint(x: 0, y: self.view.frame.size.height - admobView.frame.height)
        
        admobView.frame.size = CGSize(width: self.view.frame.width, height: admobView.frame.height)
        
        admobView.adUnitID = AdMobID
        admobView.rootViewController = self
        
        let admobRequest:GADRequest = GADRequest()
        
        if AdMobTest {
            if SimulatorTest {
                admobRequest.testDevices = [kGADSimulatorID]
            }
            else {
                admobRequest.testDevices = [TEST_DEVICE_ID]
            }
            
        }
        
        admobView.load(admobRequest)
        
        self.view.addSubview(admobView)
        
    }

    // 以下 interstitinal 広告用
    @IBAction func tapButton(_ sender: UIButton) {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    func admobInterstitial() {
        
        interstitial = GADInterstitial(adUnitID: AdMobInterstitialID)
        
        let request = GADRequest()
        interstitial.load(request)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

