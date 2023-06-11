//
//  ContactsListView.swift
//  ContactsApp
//
//  Created by لجين إبراهيم الكنهل on 18/11/1444 AH.
//

//import SwiftUI
//
//struct ContactsListView: View {
//    @ObservedObject var vm = ContactViewModel()
//    @State private var showingSheet = false
//    @State private var showingSheetEdit = false
//    
//    var body: some View {
//      //  NavigationStack{
//            
//            VStack {
//                
////                    Image(systemName: "plus")
////                        .resizable()
////                        .frame(width: 20,height: 20)
////                        .foregroundColor(.blue)
////                        .padding(.leading,300)
////                        .padding(.top,30)
////                        .onTapGesture {
////                            showingSheet.toggle()
////
////                        }
////                        .sheet(isPresented: $showingSheet) {
////                            AddView(vm: vm)
////                        }
////
////                List(vm.contacts){contact in
////                    NavigationLink(destination: DetailView()){
////
////                        Text(contact.name ?? "")
////                            .sheet(isPresented: $showingSheetEdit) {
////                                EditView()
////                            }
////                    }
////                }.navigationTitle("Contacts")
////                    .scrollContentBackground(.hidden)
////                          .listStyle(PlainListStyle())
////            }
//        }
//    }
//}
//
//
//struct ContactsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactsListView()
//    }
//}
