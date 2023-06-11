
import SwiftUI


struct ContentView: View {
   
    @StateObject var vm = ContactViewModel()
    @State private var showingSheet = false
  
    @State var search = ""
//
    var body: some View {
        VStack{

//            Image(systemName: "plus")
//                .resizable()
//                .frame(width: 20,height: 20)
//                .foregroundColor(.blue)
//                .padding(.leading,300)
//                .padding(.top,30)
//                .onTapGesture {
//                    showingSheet.toggle()
//
//                }
//                .sheet(isPresented: $showingSheet) {
//                    AddView()//vm: vm
//                }
          NavigationStack{
          
              VStack {

                  HStack{
                     

                      ZStack{
                          Rectangle()
                              .frame(width: 60,height: 60)
                              .foregroundColor(.gray)
                              .cornerRadius(40)
                          Image(systemName: "person.fill")
                              .resizable()
                              .frame(width: 40,height: 40)
                              .cornerRadius(16)
                      }
                      
                      Text("My Card")
                          .foregroundColor(.gray)
                      Spacer()
                  }.padding(.leading)
                 
                 
                  List(vm.contacts.filter{(self.search.isEmpty ? true :$0.fName.localizedCaseInsensitiveContains(self.search))}, id: \.id){name in
                          NavigationLink(destination: DetailView()){
                              
                              Button(name.fName){
                                  vm.callerName = name.fName
                              }
                              
                          }
                      }
                      .navigationTitle("Contacts")
                      .navigationBarItems(trailing:
                                            Image(systemName: "plus")
                                                .resizable()
                                                .frame(width: 20,height: 20)
                                                .foregroundColor(.blue)
                                                .padding(.leading,300)
                                                .padding(.top,30)
                                                .onTapGesture {
                                                    showingSheet.toggle()

                                                }
                                                .sheet(isPresented: $showingSheet) {
                                                    AddView()//vm: vm
                                                }
                      )
                      
                        .scrollContentBackground(.hidden)
                              .listStyle(PlainListStyle())
                             
                }
           } .environmentObject(vm)
                .searchable(text:$search)
        } .padding(.horizontal)
            .padding(.vertical,2)
            .onAppear {
               //
                vm.fetchData()
                        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          
    }
}

