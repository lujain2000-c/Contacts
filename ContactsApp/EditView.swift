

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = ContactViewModel()
    @EnvironmentObject var contacts: ContactViewModel
    @State var name = ""
    @State var firstNTextField: String = ""
    @State var lastNTextField: String = ""
    @State var companyTextField: String = ""
    @State var phoneNumTextField: String = ""
    @State var emailTextField: String = ""
    var body: some View {
        VStack{
           // ScrollView{
                
                HStack(spacing: 270){
                    
                    Button("Cancel") {
                        dismiss()
                        
                    }
                   //id: UUID(),
                    Button("Done") {
                        vm.updateData( fName: firstNTextField, lName: lastNTextField, company: companyTextField, number: phoneNumTextField, email: emailTextField)
                        dismiss()
                    }
                }.font(.footnote)
                    .padding(.top)
                    .foregroundColor(.blue)
                    .bold()
                    .padding(.bottom)
                    .padding(.horizontal)
                
                
                ZStack{
                    Rectangle()
                        .frame(width: 200,height: 200)
                        .foregroundColor(.gray)
                        .cornerRadius(100)
                 //   if firstNTextField == ""{
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 150,height: 150)
                            .cornerRadius(70)
                 //   }else{
                       // var ltr =
                        
                      //  Text("\(firstNTextField[firstNTextField.startIndex])")
                  //  }
                    
                }
                Button("Add Photo"){
                    
                }
                
                ZStack{
                    Color(.gray)
                        .frame(width: 400,height: 200)
                        .opacity(0.2)
                        .cornerRadius(9)
                    Form {
                        Section {
                            TextField("Frist name",text: $firstNTextField)

                            TextField("Last name",text: $lastNTextField)


                            TextField("Company",text: $companyTextField)
                        }

                        Section {
                            HStack{
                                Image(systemName: "plus.circle.fill")
                                TextField("add phone",text: $phoneNumTextField)
                            }
                        }
                        Section {
                            TextField("add email",text: $emailTextField)
                        }
                    }.foregroundColor(Color.primary)


                }
           // }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
