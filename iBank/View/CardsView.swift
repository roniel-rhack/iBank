//
//  CardsView.swift
//  iBank
//
//  Created by Admin on 10/18/20.
//

import SwiftUI

struct CardsView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Card.getAllCards()) var cards : FetchedResults<Card>
    
    @State var showAddCard : Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Tarjetas")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .center, spacing: 5){
                    if !self.cards.isEmpty{
                        ForEach(self.cards){card in
                            CardView(number: card.number!, name: card.name!, vencto: card.vencto!)
                        }
                    }
                    CardView(number: "ADICIONAR TARJETA", name: "", vencto: Date())
                        .onTapGesture(count: 1, perform: {
                            self.showAddCard.toggle()
                        })
                        .sheet(isPresented: $showAddCard, content: {
                            AddCardView()
                        })
                }
            })
           
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
