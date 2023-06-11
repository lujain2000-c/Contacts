//
//  ContactModal.swift
//  ContactsProjct
//
//  Created by لجين إبراهيم الكنهل on 18/11/1444 AH.
//

import Foundation

struct Contact: Codable, Identifiable{
    
    var id = UUID()
    let fName: String
    let lName: String
    let company: String
    let number: String
    let email: String
}

//struct contactsName: Identifiable{
//    var id = UUID()
//    let name: String
//}

