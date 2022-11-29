//
//  ViewController.swift
//  UpDownGame
//
//  Created by 혜리 on 2022/10/18.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var upDownManager = UpDownManager()
    
    // 앱의 화면에 들어오면 가장 처음에 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
       
        reset()
    }
    
    func reset() {
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        upDownManager.resetNum()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        // 1) 버튼의 숫자를 가져와야 함
        guard let numString = sender.currentTitle else { return }
        
        // 2) numberLabel이 숫자에 따라 변하도록
        numberLabel.text = numString
        
        // 3) 선택한 숫자를 변수에다가 저장 (선택) 문자열 ---> 숫자로 변환한 다음 저장
        guard let num = Int(numString) else { return }
        upDownManager.setUsersNum(num: num)
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        guard let myNumString = numberLabel.text,
              let myNumber = Int(myNumString) else { return }
        
        upDownManager.setUsersNum(num: myNumber)
        mainLabel.text = upDownManager.getUpDownResult()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        reset()
    }
}
