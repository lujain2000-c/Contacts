//
//  HeaderView.swift
//  ContactsApp
//
//  Created by لجين إبراهيم الكنهل on 20/11/1444 AH.
//

import Foundation
import SwiftUI

struct Header: View {
    var body: some View {
        
        
        
        ZStack{
            Rectangle()
                .frame(width: 200,height: 200)
                .foregroundColor(.gray)
                .cornerRadius(100)
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 150,height: 150)
                .cornerRadius(70)
        }
        Button("Add Photo"){
            
        }
    }
}
