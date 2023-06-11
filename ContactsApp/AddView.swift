

import SwiftUI

struct AddView: View {
    @ObservedObject var vm = ContactViewModel()
   
    @Environment(\.dismiss) var dismiss
    @State var name = ""
    @State var firstNTextField: String = ""
    @State var lastNTextField: String = ""
    @State var companyTextField: String = ""
    @State var phoneNumTextField: String = ""
    @State var emailTextField: String = ""
    var body: some View {
        VStack{
          //  ScrollView{
                
                HStack(spacing: 100){
                    
                    Button("Cancel") {
                        dismiss()
                        
                    }
                    Text("New Contact")
                        .foregroundColor(.primary)
                        .bold()
                    
                    Button("Done") {
                       vm.addData(fName: firstNTextField, lName: lastNTextField, company: companyTextField, number: phoneNumTextField, email: emailTextField)
                        dismiss()
                    }
                }.font(.footnote)
                    .padding(.top)
                    .foregroundColor(.blue)
                    .bold()
                    .padding(.bottom)
                    .padding(.horizontal)
                Header()
                
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
                        //.environmentObject(contacts)

                }
           // }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
           // .environmentObject(ContactViewModel())
    }
}
