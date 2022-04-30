//
//  ActiveOrderScreen.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 21.4.2022.
// UI View for the list of active orders (data from JSON)

import SwiftUI

struct ActiveOrderScreen: View {
    //@ObservedObject var loader = ActiveOrderLoader()
    @State var selectedDate = Date.now
    @State var orders = loadData()
    
    var filteredList: [ActiveOrder] {
        return orders.filter {
            $0.pickup_date == dateFormat(selectedDate)
        }
    }
    
    var body: some View {
        VStack {
            ScreenLayout(screenTitle: "profile.orderList", hasBackButton: true)
            HStack {
                DatePicker(Translation().SelectPickupDate, selection: $selectedDate, in: Date()..., displayedComponents: .date)
                Spacer()
                NavigationLink(destination: MapUIView(selectedDate: $selectedDate, orders: filteredList).navigationBarBackButtonHidden(true)) {
                    Image(systemName: "map").font(.title).foregroundColor(Color("PinkishRed"))
                }
            }.padding(.horizontal, 20)
            
            List {
                ForEach(filteredList, id: \.order_id) { order in
                    OrderRow(order: order)
                }
            }
            
        }.navigationBarHidden(true)
    }
}

struct ActiveOrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActiveOrderScreen()
    }
}

func dateFormat(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-dd"
    return dateFormatter.string(from: date)
}

func loadData() -> [ActiveOrder] {
    let path = Bundle.main.path(forResource: "orders", ofType: "json")
    let url = URL(fileURLWithPath: path!)
    var orders: [ActiveOrder] = []
    do {
        let data = try Data(contentsOf: url)
        let json = try JSONDecoder().decode([ActiveOrder].self, from: data)
        orders = json
    } catch {
        print(error)
    }
    
    return orders
}
