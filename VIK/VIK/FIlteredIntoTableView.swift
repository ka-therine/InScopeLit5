//
//  FIlteredIntoTableView.swift
//  VIK
//
//  Created by Katherine Lam on 8/19/22.
//

import UIKit

class FIlteredIntoTableView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    
//filtering system's tag && information storage
    struct opportunity {
        var interestTag: String
        var gradeLevel1: String
        var gradeLevel2: String
        var educationLevel: Bool
        var names: String
        var description: String
        var link: String
    }
    
//user's input
    var userEducationLevel = false
    var userGradeLevel = "11TH"
    var userInterest = "STEM"
    var userOpportunities : [opportunity] = []
    
//All the Opportunities unflitered
    let opportunity1 = opportunity(interestTag: "STEM", gradeLevel1: "FRESH", gradeLevel2: "SOPH", educationLevel: true, names: "Google STEP", description: "The internship program has a focus of providing development opportunities to students from groups historically underrepresented in tech, through technical training and professional development. Our unique internship offers the opportunity to work on a software project alongside other STEP interns and full-time Googlers, and provides the chance to bridge the gap between academic understanding and practical professional experience.", link: "https://buildyourfuture.withgoogle.com/programs/step")
    let opportunity2 = opportunity(interestTag: "STEM", gradeLevel1: "SOPH", gradeLevel2: "NONE", educationLevel: true, names: "Twitter Academy", description: "Here’s your opportunity to learn, while getting paid––sweet deal. Our summer internship program for historically underrepresented second-year computer science students gives you real, hands-on experience in the tech industry.", link: "https://twitteracademy21.splashthat.com")
    let opportunity3 = opportunity(interestTag: "STEM", gradeLevel1: "FRESH", gradeLevel2: "SOPH", educationLevel: true, names: "Meta University", description: "Meta University is an immersive ten-week paid internship program that enables students from underrepresented communities to get to know Meta’s people, products, and services.", link: "Meta University is an immersive ten-week paid internship program that enables students from underrepresented communities to get to know Meta’s people, products, and services.")
    let opportunity4 = opportunity(interestTag: "STEM", gradeLevel1: "FRESH", gradeLevel2: "SOPT", educationLevel: true, names: "Uber STAR", description: "UberSTAR is a program open to all eligible students and is especially committed to exposing students historically underrepresented in this field to career opportunities in the industry. Students from all schools and students who identify with a group that is historically underrepresented in the technology industry, including but not limited to Black, Hispanic, Native American, students with disabilities, veterans are encouraged to apply.", link: "https://university-uber.icims.com/jobs/116956/job?iis=marketing&iisn=TheMuse&iisp=paid&rx_job=116956&rx_medium=post&rx_paid=1&rx_r=none&rx_source=themuse&rx_ts=20220811T225001Z&rx_viewer=5be4147d1a6011ed943d57ed9dc3fe9c3314aa920d024430964f42492d69b582&mobile=true&width=428&height=746&bga=true&needsRedirect=false&jan1offset=-300&jun1offset=-240")
    let opportunity5 = opportunity(interestTag: "STEM", gradeLevel1: "SOPH", gradeLevel2: "NONE", educationLevel: true, names: "Palantir Path", description: "We launched Palantir Path to reach students who may not have had prior exposure to technical opportunities in an academic or industry setting, or who are earlier in their engineering journey, especially those from underrepresented communities.", link: "https://www.palantir.com/careers/students/path/")
    let opportunity6 = opportunity(interestTag: "STEM", gradeLevel1: "FRESH", gradeLevel2: "SOPH", educationLevel: true, names: "Microsoft Explore", description: "Explore Microsoft is a 12-week summer internship program specifically designed for students in their first or second year of a bachelor’s degree program who would like to learn more about careers in software development through a collaborative learning program.", link: "https://careers.microsoft.com/students/us/en/job/1388848/Explore-Microsoft-Intern-Opportunities-for-University-Students")
    let opportunity7 = opportunity(interestTag: "STEM", gradeLevel1: "10TH", gradeLevel2: "NONE", educationLevel: false, names: "Women’s Technology Program for High School Students", description: "The MIT Women's Technology Program (WTP) is a rigorous four-week summer academic experience to introduce high school students to engineering through hands-on classes, labs, and team-based projects in the summer after 11th grade.", link: "http://wtp.mit.edu")
    let opportunity8 = opportunity(interestTag: "STEM", gradeLevel1: "11TH", gradeLevel2: "NONE", educationLevel: false, names: "WISTEM at Harvey Mudd College", description: "The WISTEM program is open to high school seniors (or equivalent) that are U.S. citizens or permanent residents (who live within the United States). WISTEM will introduce participants to women of color currently working in STEM fields in addition to preparing participants for college and careers in STEM.", link: "https://www.hmc.edu/admission/wistem/")
    let opportunity9 = opportunity(interestTag: "STEM", gradeLevel1: "ALL", gradeLevel2: "NONE", educationLevel: false, names: "Girls Who Code Summer Immersion Program", description: "Students gain the computer science skills they need to make an impact and prepare for tech careers in our free, virtual summer programs. Summer program participants get exposure to tech jobs, meet leaders in tech careers, and find community in our supportive sisterhood.", link: "https://girlswhocode.com/programs/summer-immersion-program")
    let opportunity10 = opportunity(interestTag: "STEM", gradeLevel1: "11TH", gradeLevel2: "12TH", educationLevel: false, names: "The Anson L. Clark Scholars Program", description: "The Anson L. Clark Scholar Program is an intensive seven-week summer research program for twelve highly qualified high school juniors and seniors.", link: "https://www.depts.ttu.edu/honors/academicsandenrichment/affiliatedandhighschool/clarks/")
    let opportunity11 = opportunity(interestTag: "STEM", gradeLevel1: "ALL", gradeLevel2: "NONE", educationLevel: false, names: "UPMC Hillman Cancer Center Academy", description: "Students will... Have a unique, authentic, and cutting edge research project. Receive mentorship from Pitt faculty and researchers. Participate in career and professional development.activities.", link: "https://hillmanacademy.upmc.com/apply-now/")
    let opportunity12 = opportunity(interestTag: "STEM", gradeLevel1: "ALL", gradeLevel2: "NONE", educationLevel: false, names: "Seattle Children’s Research Institute Research Training Program for High School Students", description: "Students will learn how to work in a research laboratory environment and learn about topics including biochemistry, immunotherapy, gene editing and infectious diseases. Students will also participate in workshops on college readiness and career exploration. These programs provide students with a solid foundation for a future career in biomedical research. There is no cost to participate.", link: "https://www.seattlechildrens.org/research/centers-programs/science-education-department/high-school-training-programs/")
    let opportunity13 = opportunity(interestTag: "STEM", gradeLevel1: "11TH", gradeLevel2: "12TH", educationLevel: false, names: "Stanford Institutes of Medicine Summer Research Program", description: "The Stanford Institutes of Medicine Summer Research Program (SIMR) is an eight-week program in which high school students from diverse backgrounds are invited to perform basic research with Stanford faculty, postdoctoral fellows, students and researchers on a medically-oriented project. The goals of the program include increasing interest in biological sciences and medicine in high school students, helping students to understand how scientific research is performed, and increasing diversity of students and researchers in the sciences.", link: "https://simr.stanford.edu")
    let opportunity14 = opportunity(interestTag: "STEM", gradeLevel1: "11TH", gradeLevel2: "12TH", educationLevel: false, names: "MIT Online Science, Technology, and Engineering Community (MOSTEC) program", description: "The six-month MIT Online Science, Technology, and Engineering Community (MOSTEC) program serves rising high school seniors from across the country – many of whom come from underrepresented or underserved communities. Students selected to participate in MOSTEC demonstrate in their applications a strong academic record and interest in science and engineering.", link: "https://oeop.mit.edu/programs/mostec/program-details")


    lazy var allOpportunity = [
        opportunity1,
        opportunity2,
        opportunity3,
        opportunity4,
        opportunity5,
        opportunity6,
        opportunity7,
        opportunity8,
        opportunity9,
        opportunity10,
        opportunity11,
        opportunity12,
        opportunity13,
        opportunity14
    ]
//filtering conditionals which append to user's opportunies
    var userOpportunitiesName = [String]()
    
    override func viewDidLoad() {
        for opportunities in allOpportunity {
            if opportunities.educationLevel == userEducationLevel{
                if opportunities.gradeLevel1 == userGradeLevel || opportunities.gradeLevel1 == "ALL" || opportunities.gradeLevel2 == "ALL"{
                    if opportunities.interestTag == userInterest {
                        userOpportunities.append(opportunities)
                  }
                }
              }
        }
        
        for nameOfOpportunities in userOpportunities{
            userOpportunitiesName.append("\(nameOfOpportunities.names) \(nameOfOpportunities.description)")
        }
    tableView.delegate = self
    tableView.dataSource = self
    }
    

    // MARK: - Table view data source
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userOpportunitiesName.count
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
        cell.textLabel?.text = userOpportunitiesName[indexPath.row]
        return cell
    }
}

