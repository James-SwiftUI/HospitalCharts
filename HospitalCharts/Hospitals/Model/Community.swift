import Foundation

struct Community: HospitalItem{
    var id: String
    var name: String
    var description: String
    var wards: [String : Int]
    var totalBeds: Int
    
    
}
