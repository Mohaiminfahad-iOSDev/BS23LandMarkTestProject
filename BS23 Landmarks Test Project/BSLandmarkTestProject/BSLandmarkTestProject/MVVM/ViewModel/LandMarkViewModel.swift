//
//  LandMarkViewModel.swift
//  BSLandmarkTestProject
//
//  Created by mohaimin fahad on 21/6/24.
//

import Foundation
import Combine

final class LandMarkViewModel:ObservableObject {
    
    
    @Published var sectionData:[LandMarkListSection<AnyHashable>] = []
    
    
    init() {
        
    }
    
    
    func triggerData(){
        
        sectionData.removeAll()
        if let landMarks = self.loadJson(fileName: "landmarkData") {
            sectionData.append(.init(sectionType: .main, items: landMarks))
        }
        
    }
    
    
    func loadJson(fileName: String) -> [LandMarkElement]?{
        
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
            let models = try JSONDecoder().decode([LandMarkElement].self, from: jsonData)
            return models
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
