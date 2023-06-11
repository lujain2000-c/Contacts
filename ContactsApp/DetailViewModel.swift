//
//  DetailViewModel.swift
//  ContactsApp
//
//  Created by لجين إبراهيم الكنهل on 20/11/1444 AH.
//

import Foundation


extension DetailView{
    @MainActor class  DetailViewModel: ObservableObject{
        @Published var items: [DetailModel] = [
            DetailModel(name: "message", image: "message.fill"), DetailModel(name: "call", image: "phone.fill"), DetailModel(name: "video", image: "video.fill"), DetailModel(name: "mail", image: "envelope.fill")
        ]
        
        
        
    }
}
