import Foundation

public class Questions {

    @Published var countries = [Country]()
    public var countryNames = [Int:String]()
    public var countryCapitals = [Int:String]()
    public var allQs = [Question]()
    
    let url = "http://restcountries.eu/rest/v2/all"
    
    public func getQuestions() {
        
        let countryURL = URL(string: url)
        
        do{
            let data = try Data(contentsOf: countryURL!)
            self.countries = try JSONDecoder().decode([Country].self, from: data)
            
            for c in countries {
                if (c.name.starts(with: "Germany")) {
                    allQs.append(Question(statement: " The capital of \(c.name) is \(c.capital)", isTrue: true))}
                if (c.name.starts(with: "China")) {
                    allQs.append(Question(statement: " The capital of \(c.name) is Tokyo", isTrue: false))}
                if (c.name.starts(with: "Cyprus")) {
                    allQs.append(Question(statement: " The capital of \(c.name) is \(c.capital)", isTrue: true))}
                if (c.name.starts(with: "Philippines")) {
                    allQs.append(Question(statement: " The capital of \(c.name) is \(c.capital)", isTrue: true))}
                if (c.name.starts(with: "Mexico")) {
                    allQs.append(Question(statement: " The capital of \(c.name) is London", isTrue: false))}


            }} catch{
                print(error)
            }
    }
    
    public var correctAnswers: Int = 0
    public var totalQuestionsAsked: Int = 0
    private var currentQuestionNumber: Int = 0
    public let allHints = [ "False", "True", "True", "False",
                                  "True"]
    
//    public let allQs = [
//        Question(statement: " capital is Washington DC", isTrue: false),
//        Question(statement: "Central America is a continent", isTrue: false),
//        Question(statement: "Asia is the largest continent", isTrue: true),
//        Question(statement: "Greece borders the Mediterranean sea", isTrue: true),
//        Question(statement: "Rhode Island is the smallest state in the US", isTrue: true ),
//        Question(statement: "Egypt is in Europe", isTrue: false )
//
//    ]
             
    public func correctAnswer() -> Int {
        correctAnswers = correctAnswers + 1
        totalQuestionsAsked = totalQuestionsAsked + 1
        return correctAnswers
    }
    
    public func incorrectAnswer() -> Int {
        totalQuestionsAsked = totalQuestionsAsked + 1
        return correctAnswers
    }
    
    public func nextQuestionNumber() -> Int {
        currentQuestionNumber = currentQuestionNumber + 1
        if currentQuestionNumber == 5{
            currentQuestionNumber = 0
        }
        return currentQuestionNumber % allQs.count
    }
    public func currentQuestionNumbers() -> Int {
           return currentQuestionNumber
}
    
    public func provideHint() -> String {
        return allHints[currentQuestionNumber % 5]
    }
}

