//
//  LanguageView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//  UI component for selecting language in app

import SwiftUI

struct LanguageView: View {
    let language: Language
    @Binding var selectedLanguage: Language
    
    var body: some View {
        HStack {
            Text(Translation().translateLanguage(lang: language.name.lowercased()))
                .padding(4)
            Spacer()
            if selectedLanguage == language {
                Image(systemName: "checkmark.circle").foregroundColor(Color("DarkGreen"))
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .onTapGesture {
            selectedLanguage = language
        }
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView(language: .en, selectedLanguage: .constant(.en))
    }
}
