import SwiftUI

struct Community: HospitalItem{
    
    var id: String = UUID().uuidString
    var name: String
    var description: String
    var wards: [String : Int]
    var totalBeds: Int{
        wards.reduce(0) { $0 + $1.value }
    }
    
    //let total = [CommunityDepartments.allCases]
    var totalSeenByDepartment: [CommunityDepartment: Int]
    
    static let example = Community(name: "Small Community Hospital", description: "", wards: ["Goldfinch": 8, "Greenfinch": 10], totalSeenByDepartment: [.MIU : 640, .geriatric : 220, .outreach : 89, .rehabilitation : 220])

        
    
}










struct PatientStay: Identifiable{
    let id = UUID()
    let bedName: String
    let nightsStayed: Int
    let patientName: String
}
