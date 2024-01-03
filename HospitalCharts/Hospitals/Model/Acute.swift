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






let acuteHospitals: [Acute] = [
    Acute(name: "Red Robin General Hospital", description: "", wards: ["Ash Ward": 20, "Oak Ward": 22, "Elm Ward": 18, "Elder Ward" : 13,"Hazel Ward" : 17, "Hawthorn Ward": 19, "Larch Ward" : 15, "Maple Ward": 16, "Olive Ward" : 21], totalSeenByDepartment:  [.AandE: 890, .cardiology: 350, .ent: 912, .surgery: 52]),
    Acute(name: "Pheasant Hill Regional Hospital", description: "", wards: ["Apple Ward": 24, "Beech Ward": 20, "Birch Ward": 22, "Yew Ward": 18, "Pine Ward" : 17, "Spruce Ward": 19, "Sycamore Ward": 20,"Willow Ward" : 28], totalSeenByDepartment: [.AandE: 890, .cardiology: 350, .ent: 912, .surgery: 52])
]
