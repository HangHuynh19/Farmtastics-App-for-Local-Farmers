//
//  ProductAddScreen.swift
//  FarmtasticFarmer
//
//  Created by Trang on 15.4.2022.
//  Struct to create add product UI view

import SwiftUI

struct ProductAddScreen: View {
    
    @EnvironmentObject var productDataController: ProductDataController
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var tabSelection: Int
    @State var isUpdating: Bool
    @State var productId: Int?
    @State var category: String = ""
    @State var productName: String = ""
    @State var quantity: Double = 0.0
    @State var price: Double = 0.0
    @State var harvestDate: Date = Date()
    @State var selectedUnit = 0
    @State var selectedCategory = 0
    @State private var productImage: UIImage?
    
    let categories = ["Meat", "Vegetables", "Fruit", "Egg & Dairy"]
    let units = ["kg", "liter", "piece"]
    let formatterDecimal: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        VStack {
            ScreenLayout(screenTitle: "product.addProduct", hasBackButton: true)
            AddProductForm(tabSelection: $tabSelection,
                           isUpdating: isUpdating, productId: productId, selectedUnit: $selectedUnit, selectedCategory: $selectedCategory, productName: $productName, quantity: $quantity, price: $price, harvestDate: $harvestDate, productImage: $productImage)
            
        }
        .navigationBarHidden(true)
    }
    
}

struct ProductAddScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductAddScreen(tabSelection: Binding.constant(Constants.productTab), isUpdating: false)
    }
}

