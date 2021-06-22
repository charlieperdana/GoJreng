//
//  HomeHelper.swift
//  GoJreng
//
//  Created by Angelica Janissia on 19/06/21.
//

import Foundation

class HomeHelper{

  static func checkHSinited(){
    let defaults = UserDefaults.standard
    let keyArr = ["initChecked", "hS1", "hS2", "hS3"]

    if (defaults.value(forKey: "initChecked") != nil) != true{ //returns true if initChecked == nil
        print("not checked")
        defaults.setValue(true, forKey: "initChecked")
        defaults.setValue(0, forKey: "hS1")
        defaults.setValue(0, forKey: "hS2")
        defaults.setValue(0, forKey: "hS3")
    }
    else {
        print("defaults set:")
        let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
                if keyArr.contains(key){
                    print(key)
                    print(defaults.value(forKey: key)!)
                    print("============")
                }
            }
    }
  }
    
    
    static func resetHS(){
      let defaults = UserDefaults.standard
      let keyArr = ["initChecked", "hS1", "hS2", "hS3"]

        if ((defaults.value(forKey: "initChecked")) != nil){
          print("RESET HS")
          defaults.setValue(true, forKey: "initChecked")
          defaults.setValue(0, forKey: "hS1")
          defaults.setValue(0, forKey: "hS2")
          defaults.setValue(0, forKey: "hS3")
      }
    }
  
}
