import Foundation

// MARK: - Classes and Structs

// Structs to represent data types in the program
struct Resource {
    let name: String
    let type: String
    let cost: Double
    let description: String
}

struct EducationProgram {
    let name: String
    let type: String
    let capacity: Int
    let cost: Double
    let description: String
    let availableResources: [Resource]
}

class Participant {
    // Properties
    let name: String
    let dateOfBirth: Date
    var educationalPrograms: [EducationProgram] = []
    var resources: [Resource] = []
    
    // Initializer
    init(name: String, dateOfBirth: Date) {
        self.name = name
        self.dateOfBirth = dateOfBirth
    }
    
    // Methods
    func enrollIn(_ program: EducationProgram) {
        self.educationalPrograms.append(program)
    }
    
    func request(resource: Resource) {
        self.resources.append(resource)
    }
}

// MARK: - Protocols

protocol EducationProgramProvider {
    var educationPrograms: [EducationProgram] { get set }
    var resources: [Resource] { get set }
    func enroll(_ participant: Participant, in program: EducationProgram)
    func provide(_ resource: Resource, to participant: Participant)
}

// MARK: - Protocol Implementation

class EqualityProgramProvider: EducationProgramProvider {
    // Properties
    var educationPrograms: [EducationProgram]
    var resources: [Resource]
    
    // Initializer
    init(educationPrograms: [EducationProgram], resources: [Resource]) {
        self.educationPrograms = educationPrograms
        self.resources = resources
    }
    
    // Methods
    func enroll(_ participant: Participant, in program: EducationProgram) {
        participant.enrollIn(program)
    }
    
    func provide(_ resource: Resource, to participant: Participant) {
        participant.request(resource: resource)
    }
}

// MARK: - Example Usage

let p1 = Participant(name: "John Smith", dateOfBirth: Date())

// Create resources
let book1 = Resource(name: "Programming in Swift", type: "Book", cost: 20.00, description: "An introductory guide to programming in Swift.")
let website1 = Resource(name: "Free Code Camp", type: "Website", cost: 0.00, description: "Learn to code for free with thousands of hours of tutorials and practice problems.")

// Create programs
let program1 = EducationProgram(name: "Intro to Coding", type: "Beginner", capacity: 15, cost: 50.00, description: "Learn the basics of coding with this online course.", availableResources: [book1, website1])

// Create program provider
let equalityProgramProvider = EqualityProgramProvider(educationPrograms: [program1], resources: [book1, website1])

// Participant enrolls in program
equalityProgramProvider.enroll(p1, in: program1)

// Participant requests resource
equalityProgramProvider.provide(website1, to: p1)