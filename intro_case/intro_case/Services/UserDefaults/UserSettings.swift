//
//  UserSettings.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 20.03.2023.
//

import Foundation

class Users: NSObject, NSCoding {

    var firstname: String?
    var lastname: String?
    var email: String?
    var password: String?

    override init() {
        super.init()
    }

     init (email: String, firstname: String, lastname: String, password: String){
        super.init()
        self.email = email
        self.firstname = firstname
        self.lastname = lastname
        self.password = password
    }

    // MARK: Serialization via UserDefaults
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.firstname, forKey: "firstname")
        aCoder.encode(self.lastname, forKey: "lastname")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.password, forKey: "password")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.firstname = aDecoder.decodeObject(forKey: "firstname") as? String
        self.lastname = aDecoder.decodeObject(forKey: "lastname") as? String
        self.email = aDecoder.decodeObject(forKey: "enail") as? String
        self.password = aDecoder.decodeObject(forKey: "password") as? String
    }

    // Implement Equatable
    static func ==(lhs:Users, rhs:Users) -> Bool {
        return (lhs.firstname == rhs.firstname && lhs.lastname == rhs.lastname && lhs.email == rhs.email && lhs.password == rhs.password)
    }
}

class UserSettings {

//MARK: - Events

    var itemsRemoved: ((Users)->Void)?

//MARK: - Properties

    static let shared = UserSettings()
    var userDefaults = UserDefaults.standard

//MARK: -Methods

    func appendItem(item: Users) {
        saveItemToUserDefaults(item: item)
    }

    func removeItemForKey(key: String)  {
        if isKeyPresentInUserDefaults(key: key){
            removeItemFromUserDefaults(key: key)
        }
    }

    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return userDefaults.object(forKey: key) != nil
    }
    func getFullNameFromStoredItems(key: String) -> String {
        guard isKeyPresentInUserDefaults(key: key) else { return " " }
        let encodedUser = userDefaults.object(forKey: key) as? NSData

        if (encodedUser != nil)
        {
//            let user = NSKeyedUnarchiver.unarchiveObject(with: encodedUser! as Data) as? Users
            do {
               
                let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedUser! as Data) as! Users
               return (unarchivedData.firstname)! + " " + (unarchivedData.lastname)!
            }
            catch {
                fatalError("Didn't work")
            }
//            if (user != nil)
//            {
//
//                return user!.firstname! + " " + user!.lastname!
//            }
        
        }
        return " "
    }

    func getPasswordFromStoredItems(key: String) -> String {
        guard isKeyPresentInUserDefaults(key: key) else { return " " }
        let encodedUser = userDefaults.object(forKey: key) as? NSData

        if (encodedUser != nil)
        {
//            let user = NSKeyedUnarchiver.unarchiveObject(with: encodedUser! as Data) as? Users
//            if (user != nil)
//            {
//                return user!.password!
//            }
            
            do {
               
                let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedUser! as Data) as! Users
               return (unarchivedData.password)!
            }
            catch {
                fatalError("Didn't work")
            }
        }
        return " "
    }

//MARK: - Private Methods

    private func saveItemToUserDefaults(item: Users) {
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: item, requiringSecureCoding: false) else { return }
        UserDefaults.standard.set(data, forKey: item.firstname!)
        
        
//        let encodedLanguageTranslateFrom = NSKeyedArchiver.archivedData(withRootObject: item)
//        userDefaults.set(encodedLanguageTranslateFrom, forKey: item.firstname!)
        //userDefaults.set(item, forKey: item.firstname!)
     }
    private func removeItemFromUserDefaults(key: String) {
         userDefaults.set(nil, forKey: key)
     }
}
