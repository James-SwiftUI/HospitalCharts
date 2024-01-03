import Foundation

enum AcuteDepartment: Identifiable, CaseIterable{
    case AandE
    case cardiology
    case critcal
    case ent
    case surgery
    
    var id: Self { return self }
    
    var abbreviatedName: String{
        switch self{
            
        case .AandE:
            "A&E"
        case .cardiology:
            "CAR"
        case .critcal:
            "CC"
        case .ent:
            "ENT"
        case .surgery:
            "SUR"
        }
    }
    
    var displayName: String{
        switch self{
            
        case .AandE:
            "Accident and emergency (A&E)"
        case .cardiology:
            "Cardiology"
        case .critcal:
            "Critical care"
        case .ent:
            "Ear, Nose & Throat"
        case .surgery:
            "General Surgery"
        }
    }
    
    
    
}
