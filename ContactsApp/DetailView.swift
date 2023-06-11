

import SwiftUI

struct DetailView: View {
    @ObservedObject var vmDetail = DetailViewModel()
    @EnvironmentObject var vm: ContactViewModel
    @State private var showingSheetEdit = false
    var body: some View {
        VStack{
            
            Button("Edit"){
                showingSheetEdit.toggle()
            }
                .bold()
                .padding(.leading,300)
                //.padding(.top)
    
                .sheet(isPresented: $showingSheetEdit) {
                    EditView()//vm: vm
                }
            
            ZStack{
                Rectangle()
                    .frame(width: 130,height: 130)
                    .foregroundColor(.secondary)
                    .cornerRadius(100)
                Text("AB")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                
            }
            Text(vm.callerName )
                .font(.largeTitle)
                .bold()
            HStack{
                ForEach(vmDetail.items){item in
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 80,height: 70)
                            .foregroundColor(.gray
                                .opacity(0.3))
                            .cornerRadius(15)
                        VStack{
                            Image(systemName: item.image)
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                                .foregroundColor(.blue)
                            
                            
                            Button(item.name){
                                
                            }
                            
                        }
                    }
                }
            }
            ZStack{
                Rectangle()
                    .frame(width: 350,height: 70)
                    .foregroundColor(.gray
                        .opacity(0.3))
                    .cornerRadius(15)
                VStack(alignment: .leading){
                    Text("mobile")
                        .foregroundColor(.primary)
                    Text(vm.callerNum)
                        .foregroundColor(.blue)
                }.padding(.trailing,170)
            }.padding(.bottom,500)
            Spacer()
        }.onAppear{
           // vm.fetchDocument()
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(ContactViewModel())
    }
}
