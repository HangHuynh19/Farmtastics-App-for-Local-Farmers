//
//  PickupPointRow.swift
//  FarmtasticFarmer
//
//  Created by Trang on 23.4.2022.
//  UI component for each Pickup point row inside the PickupPoint Screen


import SwiftUI
import CoreLocation

struct PickupPointRow: View {
    var pickupPoint: PickupPoint
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(pickupPoint.name)").font(.headline).bold()
            Text(Translation().OrderAddress + ": \(pickupPoint.address)")
                .font(.caption)
                .bold()
        }
        .padding()
    }
}

struct PickupPointRow_Previews: PreviewProvider {
    static var previews: some View {
        PickupPointRow(pickupPoint: PickupPoint(id: 3, name: "Pickup point 3", address: "abc 2, 01110 xyz" , coordinate: CLLocationCoordinate2D(latitude: 60.29, longitude: 24.96)))
    }
}

