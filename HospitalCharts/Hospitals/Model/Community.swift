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




let communityHospitals: [Community] = [
    Community(name: "Kingfisher Community Hospital", description: "", wards: ["Daffodil Ward": 18, "Primrose Ward": 22], totalSeenByDepartment: [.MIU : 310, .geriatric : 287, .outreach : 128, .rehabilitation : 185]),
    Community(name: "Nightingale Cottage Hospital", description: "", wards: ["Bluebell Ward": 17, "Snowdrop Ward": 19], totalSeenByDepartment: [.MIU : 482, .geriatric : 252, .outreach : 176, .rehabilitation : 98]),
    Community(name: "Heron Park Hospital", description: "", wards: ["Foxglove Ward": 21, "Poppy Ward":18], totalSeenByDepartment: [.MIU : 453, .geriatric : 193, .outreach : 248, .rehabilitation : 68]),
    Community(name: "Kestral Ridge Health Centre", description: "", wards: ["Heather Ward": 23, "Honeysuckle": 22], totalSeenByDepartment: [.MIU : 579, .geriatric : 303, .outreach : 250, .rehabilitation : 96]),
    Community(name: "Skylark View Community Hospital", description: "", wards: ["Gorse Ward": 16, "Pansy Ward": 20], totalSeenByDepartment: [.MIU : 636, .geriatric : 348, .outreach : 94, .rehabilitation : 108]),
    Community(name: "The Sunrise Centre", description: "", wards: ["Shamrock Ward": 17, "Buttercup Ward": 19], totalSeenByDepartment: [.MIU : 258, .geriatric : 539, .outreach : 117, .rehabilitation : 309])

]

