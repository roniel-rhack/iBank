//
//  AddCardView.swift
//  iBank
//
//  Created by Admin on 10/18/20.
//

import SwiftUI
import Combine

struct AddCardView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var number : String = ""
    @State var name : String = ""
    @State var vencto : Date = Date()
    
    var body: some View {
        VStack {
            ZStack {
                Image("cardBandec")
                    .resizable()
                    .frame(width: 320, height: 180, alignment: .center)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 10, y: 10)
                Text(self.formatNumber())
                    .frame(width: 280, height: 40, alignment: .center)
                    .font(.body)
                    .offset(y:8)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 10, y: 10)
                Text(name)
                    .fontWeight(.semibold)
                    .font(.system(size: 12.0))
                    .offset(x:-50, y:40)
                    .shadow(color: Color.white.opacity(0.2), radius: 5, x: 5, y: 5)
                Text(self.formatDate())
                    .fontWeight(.semibold)
                    .font(.system(size: 12.0))
                    .offset(x:-25, y:60)
                    .shadow(color: Color.white.opacity(0.2), radius: 5, x: 5, y: 5)
                Text("CUP")
                    .fontWeight(.semibold)
                    .font(.system(size: 12.0))
                    .offset(x:-120, y:60)
                    .shadow(color: Color.white.opacity(0.2), radius: 5, x: 5, y: 5)
                
                
            }
            
            Spacer()
            VStack(spacing: 10) {
                
                TextField("Numero", text: $number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                    .keyboardType(.numberPad)
                    .onReceive(Just(number)) { _ in limitText(16) }
                
                TextField("Nombre", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                
                DatePicker("Vencimiento", selection: $vencto, displayedComponents: .date)
                
            }
            .padding()
        }
        .navigationBarItems(trailing:
                                Button(action: {
                                    let card = Card(context: self.managedObjectContext)
                                    card.name = self.name
                                    card.number = self.number
                                    card.vencto = self.vencto
                                    do{
                                        try self.managedObjectContext.save()
                                        self.name = ""
                                        self.number = ""
                                        self.vencto = Date()
                                    }catch{
                                        print(error.localizedDescription)
                                    }
                                }, label: {
                                    Text("Guardar")
                                }))
        
        
        
    }
    
    private func formatDate() -> String{
        var fDate : String = "Vence: "
        let year : String = String(self.vencto.description.split(separator: "-")[0])
        let month : String = String(self.vencto.description.split(separator: "-")[1])
        fDate.append("\(month)/\(year)")
        return fDate
        
    }
    
    //Function to keep text length in limits
    func limitText(_ upper: Int) {
        if number.count > upper {
            number = String(number.prefix(upper))
        }
    }
    
    private func formatNumber() -> String{
        var fNumber = Array(self.number)
        
        if fNumber.count > 4 {
            fNumber.insert(" ", at: 4)
        }
        if fNumber.count > 9 {
            fNumber.insert(" ", at: 9)
        }
        if fNumber.count > 14{
            fNumber.insert(" ", at: 14)
        }
        return String(fNumber)
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView()
    }
}
