import Foundation

struct Acute: HospitalItem{
    
    var id: String = UUID().uuidString
    var name: String
    var description: String
    //ward name : total beds
    var wards: [String: Int]

    //within the hospital
    var totalBeds: Int{
        wards.reduce(0) { $0 + $1.value }
    }
    
    var totalSeenByDepartment: [AcuteDepartment: Int]?
    
    
    static let example = Acute(name: "Large Acute Hospital", description: "", wards: ["Ash Ward": 18, "Beech Ward" : 22, "Birch Ward": 14], totalSeenByDepartment: [.AandE: 890, .cardiology: 350, .ent: 912, .surgery: 52])
}






