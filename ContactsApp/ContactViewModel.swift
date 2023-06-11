//
//  ContactViewModel.swift
//  ContactsProjct
//
//  Created by لجين إبراهيم الكنهل on 18/11/1444 AH.
//

import Foundation
import FirebaseFirestore

@MainActor class ContactViewModel: ObservableObject{
    
    @Published var contacts = [
        Contact(id: UUID(), fName: "Lujain", lName: "Ibraheem", company: "Tuwaiq", number: "966 50 444 5678", email: "lujain@gmail.com")]
        
    //@Published var contactsName: [String] = []
    @Published var callerData = [""]
    @Published var callerName: String = ""
    @Published var callerNum: String = ""
                              
    private var db = Firestore.firestore ()
    func fetchData() {
        
        db.collection("contacts")
            .getDocuments() { (querySnapshot, err) in
                if err != nil{
                    print(err?.localizedDescription)
                }
                
                for doc in querySnapshot!.documents{
                    
                    let fname = doc.get("fName") as! String
                    let lname = doc.get("lName") as! String
                    let company = doc.get("company") as! String
                    let num = doc.get("number") as! String
                    let email = doc.get("email") as! String
                    self.contacts.append(Contact(id: UUID(), fName: fname, lName: lname, company: company, number: num, email: email))
                    //let data = doc.data()
                    //self.contactsName.append(data["fName"] as! String )
                }
                
            }
    }
        
        func fetchDocument (){
            let docRef = db.collection("contacts").document(callerName)

            docRef.getDocument { (querySnapshot, error) in
               // for doc in querySnapshot!.documents{
                let data = querySnapshot?.data()
                self.callerName = data?["fName"] as! String
                self.callerData.append(data?["fName"] as! String)
                self.callerNum = data?["number"] as! String
                self.callerData.append(data?["number"] as! String)
              //  }
              //  if let document = document, document.exists {
                  //  let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                   // callerData.append(dataDescription["fName"] as! String )
                 //   callerData.append(dataDescription["number"] as! String )
//                    print("Document data: \(dataDescription)")
//                } else {
//                    print("Document does not exist")
//                }
            }
   }
        
//        db.collection("contacts").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print ("No documents")
//                return
//            }
//            self.contacts = documents.map { (queryDocumentSnapshot) -> Contact in
//                let data = queryDocumentSnapshot.data ()
//                let name = data[ "name"] as? String ?? ""
//                return Contact (name: name)
//            }
//        }
    
    
    func addData (fName: String,lName: String,company: String,number: String,email: String) {
        
        
        let docData: [String: Any] = [
            "fName": fName,
            "lName": lName,
            "company": company,
            "number": number,
            "email": email

        ]
        db.collection("contacts").document(fName).setData(docData){ error in
            if let error = error {
                print (error.localizedDescription)
            } else {
                    print("Document successfully written!")
                }
        }
    }
    //id: UUID,
    func updateData( fName: String,lName: String,company: String,number: String,email: String){
        
        let washingtonRef = db.collection("contacts").document(fName)

       
        washingtonRef.updateData([
           // "id": id,
            "fName": fName,
            "lName": lName,
            "company": company,
            "number": number,
            "email": email
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
}
//[
