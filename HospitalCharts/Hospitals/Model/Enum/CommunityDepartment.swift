import Foundation

enum CommunityDepartment: Identifiable, CaseIterable, Hashable{
    case MIU
    case rehabilitation
    case outreach
    case geriatric
    
    var id: Self { return self }
    
    var displayName: String{
        switch self{
            
        case .MIU:
            "Minor Injury Units"
        case .rehabilitation:
            "Rehabilitation"
        case .outreach:
            "Outreach"
        case .geriatric:
            "Geriatric"
        }
    }
    
    var abbreviatedName: String{
        switch self{
        case .MIU:
            "MIU"
        case .rehabilitation:
            "RHB"
        case .outreach:
            "OTR"
        case .geriatric:
            "GER"
        }
    }
    
    var description: String{
        switch self{
            
        case .MIU:
            "Minor Injuries Units (MIUs) in the UK are clinics in community hospitals treating less serious injuries like cuts, eye injuries, broken bones, and minor burns. They provide a quicker alternative to Accident and Emergency departments for non-acute cases. Staffed by emergency nurse practitioners, some MIUs also have X-ray facilities. "
        case .rehabilitation:
            "The primary aim of the service is to support patients with physical health problems such as falls, orthopedic conditions, chest/urine infections, cardiac problems and palliative conditions."
            
        case .outreach:
            "The Outreach Community and Residential Services in UK Community Hospitals primarily work with adults who have learning disabilities and/or mental health needs. Their goal is to enable these individuals to live independent lives by providing support as and when needed. "
        case .geriatric:
            "Geriatric services in UK hospitals provide comprehensive care for older adults, focusing on conditions like frailty, dementia, and mobility issues. Key functions include assessment for community services, managing acute illnesses, rehabilitation, discharge planning, and end-of-life care. They also support surgical departments with older patients and lead in developing community care for frail elderly. A patient-centric approach, understanding of complex health conditions, and expertise in medication management are essential aspects of their role."
        }
    }
    
}

//https://www.lscft.nhs.uk/our-services/service-finder-z/community-rehabilitation-service
