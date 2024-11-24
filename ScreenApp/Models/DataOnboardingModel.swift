//
//  DataOnboardingModel.swift
//  ScreenApp
//
//  Created by Jhonatan Chavez on 22/11/24.
//

import UIKit

struct OnboardingItem{
    let title: String
    let subtitle: String
    let img: UIImage
}

class DataOnboardingModel{
    private let arrayData : [OnboardingItem] = [
        OnboardingItem(
            title: "¿Cansado de navegar en el caosssss?",
            subtitle: "Ordena tus ideas, y apunta al éxito",
            img: ImageHelper.img1 ?? UIImage()
        ),
        OnboardingItem(
            title: "Prioriza tus ideas",
            subtitle: "Y ocupa más tiempo en ti, y en los tuyos",
            img: ImageHelper.img2 ?? UIImage()
        ),
        OnboardingItem(
            title: "Sumérgete en un mundo nuevo",
            subtitle: "¿Estás preparado para iniciar el camino?",
            img: ImageHelper.img3 ?? UIImage()
        )
    ]
    
    func numberOfItems() -> Int {
        return arrayData.count
    }
    
    func getItem(at index: Int) -> OnboardingItem? {
        guard index >= 0 && index < arrayData.count else { return nil }
        return arrayData[index]
    }
    
    
}
