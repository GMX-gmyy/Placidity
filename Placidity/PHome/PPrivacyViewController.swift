//
//  PPrivacyViewController.swift
//  Placidity
//
//  Created by 龚梦洋 on 2023/7/29.
//

import Foundation
import UIKit

class PPrivacyViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backEvent), for: .touchUpInside)
        return button
    }()
    
    private lazy var policyScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = .clear
        scrollView.bounces = true
        scrollView.contentSize = CGSize(width: pScreenWidth - 32, height: 6500)
        return scrollView
    }()
    
    private lazy var paraFirstLabel: UILabel = {
        let label = UILabel()
        label.text = "Privacy Policy"
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var paraSecondLabel: UILabel = {
        let label = UILabel()
        label.text = "Last updated: July 27, 2023"
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var paraThirdLabel: UILabel = {
        let label = UILabel()
        label.text = "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var firstTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy."
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var firstTitleFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Interpretation and Definitions"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var firstTitleFirstPointLabel: UILabel = {
        let label = UILabel()
        label.text = "Interpretation"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var firstPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var firstPointSecondParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Definitions"
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var firstPointThirdParaLabel: UILabel = {
        let label = UILabel()
        label.text = "For the purposes of this Privacy Policy:"
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var firstPointFourthParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●Account means a unique account created for You to access our Service or parts of our Service."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var firstTitleSecondPointLabel: UILabel = {
        let label = UILabel()
        label.text = "●Affiliate means an entity that controls, is controlled by or is under common control with a party, where “control”means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var secondPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●Application refers to ConBill, the software program provided by the Company."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var secondPointSecondParaLabe: UILabel = {
        let label = UILabel()
        label.text = "●Application refers to ConBill, the software program provided by the Company."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var firstTitleThirdPointLabel: UILabel = {
        let label = UILabel()
        label.text = "●Company (referred to as either “the Company”, “We”, “Us” or “Our” in this Agreement) refers to ConBill."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●Country refers to: China"
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdPointSecondParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●Device means any device that can access the Service such as a computer, a cellphone or a digital tablet."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdPointThirdParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Personal Data is any information that relates to an identified or identifiable individual."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var firstTitleFourthPointLabel: UILabel = {
        let label = UILabel()
        label.text = "●Service refers to the Application."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var fourthPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●Service Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var firstTitleFifthPointLabel: UILabel = {
        let label = UILabel()
        label.text = "●Usage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit)."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var fifthPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var fifthPointSecondParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Collecting and Using Your Personal Data"
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var secondTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Types of Data Collected"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var secondTitleFirstPointLabel: UILabel = {
            let label = UILabel()
            label.text = "Personal Data"
            label.textColor = .white
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 20)
            return label
        }()
    
    private lazy var secondTitleFirstPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var secondTitleFirstPointSecondParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●Usage Data"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var secondTitleFirstPointThirdParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Usage Data"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var secondTitleFirstPointFourthParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Usage Data is collected automatically when using the Service."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var secondTitleFirstPointFifthParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Usage Data may include information such as Your Device's Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var secondTitleFirstPointSixthParaLabel: UILabel = {
        let label = UILabel()
        label.text = "When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var secondTitleFirstPointSeventhParaLabel: UILabel = {
        let label = UILabel()
        label.text = "We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var secondTitleFirstPointEighthParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Use of Your Personal Data"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var thirdTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "The Company may use Personal Data for the following purposes:"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var thirdTitleFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●To provide and maintain our Service, including to monitor the usage of our Service."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleFirstPointLabel: UILabel = {
        let label = UILabel()
        label.text = "●To manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleFirstPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●For the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleFirstPointSecondParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●To contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application's push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleFirstPointThirdParaLabel: UILabel = {
        let label = UILabel()
        label.text = "To provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleFirstPointFourthParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●To manage Your requests: To attend and manage Your requests to Us."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleFirstPointFifthParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●For business transfers: We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleFirstPointSixthParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●For other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleSecondPointLabel: UILabel = {
        let label = UILabel()
        label.text = "We may share Your personal information in the following situations:"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleSecondPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●With Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleThirdPointLabel: UILabel = {
        let label = UILabel()
        label.text = "●For business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirdTitleThirdPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●With Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var fourthTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "●With business partners: We may share Your information with Our business partners to offer You certain products, services or promotions."
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var fourthTitleFirstPointLabel: UILabel = {
        let label = UILabel()
        label.text = "●With other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var fourthTitleFirstPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "●With Your consent: We may disclose Your personal information for any other purpose with Your consent."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var fifthTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Retention of Your Personal Data"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var fifthTitleFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var fifthTitleSecondParaLabel: UILabel = {
        let label = UILabel()
        label.text = "The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var fifthTitleThirdParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Transfer of Your Personal Data"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var fifthTitleFirstPointLabel: UILabel = {
        let label = UILabel()
        label.text = "Your information, including Personal Data, is processed at the Company's operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var fifthTitleFirstPointFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer."
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var sixthTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information."
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var sixthTitleFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Delete Your Personal Data"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        return label
    }()

    private lazy var seventhTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You."
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var seventhTitleFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Our Service may give You the ability to delete certain information about You from within the Service."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var eighthTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us."
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var eighthTitleFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var ninthTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Disclosure of Your Personal Data"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var ninthTitleFirstParaLabel: UILabel = {
        let label = UILabel()
        label.text = "Business Transactions"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var oneLabel: UILabel = {
        let label = UILabel()
        label.text = "If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var twoLabel: UILabel = {
        let label = UILabel()
        label.text = "Law enforcement"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var threeLabel: UILabel = {
        let label = UILabel()
        label.text = "Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency)."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var fourLabel: UILabel = {
        let label = UILabel()
        label.text = "Other legal requirements"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var fiveLabel: UILabel = {
        let label = UILabel()
        label.text = "The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var sixLabel: UILabel = {
        let label = UILabel()
        label.text = "●Comply with a legal obligation"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var sevenLabel: UILabel = {
        let label = UILabel()
        label.text = "●Protect and defend the rights or property of the Company"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var eightLabel: UILabel = {
        let label = UILabel()
        label.text = "●Prevent or investigate possible wrongdoing in connection with the Service"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var nineLabel: UILabel = {
        let label = UILabel()
        label.text = "●Protect the personal safety of Users of the Service or the public"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var tenLabel: UILabel = {
        let label = UILabel()
        label.text = "●Protect against legal liability"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var eleventLabel: UILabel = {
        let label = UILabel()
        label.text = "Security of Your Personal Data"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var twelveLabel: UILabel = {
        let label = UILabel()
        label.text = "The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var thirteenLabel: UILabel = {
        let label = UILabel()
        label.text = "Children's Privacy"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var fourteenLabel: UILabel = {
        let label = UILabel()
        label.text = "Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var fifteenLabel: UILabel = {
        let label = UILabel()
        label.text = "If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent's consent before We collect and use that information."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var sixteenLabel: UILabel = {
        let label = UILabel()
        label.text = "Links to Other Websites"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var seventeenLabel: UILabel = {
        let label = UILabel()
        label.text = "Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party's site. We strongly advise You to review the Privacy Policy of every site You visit."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var eighteenLabel: UILabel = {
        let label = UILabel()
        label.text = "We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var ninteenLabel: UILabel = {
        let label = UILabel()
        label.text = "Changes to this Privacy Policy"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var twentyLabel: UILabel = {
        let label = UILabel()
        label.text = "We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var twentyoneLabel: UILabel = {
        let label = UILabel()
        label.text = "We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the “Last updated” date at the top of this Privacy Policy."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var twentytwoLabel: UILabel = {
        let label = UILabel()
        label.text = "You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page."
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var twentthreeLabel: UILabel = {
        let label = UILabel()
        label.text = "Contact Us"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var twentyfourLabel: UILabel = {
        let label = UILabel()
        label.text = "If you have any questions about this Privacy Policy, You can contact us:"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var twentyfiveLabel: UILabel = {
        let label = UILabel()
        label.text = "●By email: 102840762@qq.com"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = kColor(r: 207, g: 190, b: 244)
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(kTopSafeHeight + 40)
            make.left.equalTo(24)
            make.width.height.equalTo(24)
        }
        
        view.addSubview(policyScrollView)
        policyScrollView.snp.makeConstraints { make in
            make.top.equalTo(kNavigationBarHeight + 20)
            make.bottom.equalToSuperview()
            make.left.equalTo(16)
            make.width.equalTo(pScreenWidth - 32)
        }
        
        policyScrollView.addSubview(paraFirstLabel)
        paraFirstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(paraSecondLabel)
        paraSecondLabel.snp.makeConstraints { make in
            make.top.equalTo(paraFirstLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(paraThirdLabel)
        paraThirdLabel.snp.makeConstraints { make in
            make.top.equalTo(paraSecondLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(firstTitleLabel)
        firstTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(paraThirdLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(firstTitleFirstParaLabel)
        firstTitleFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTitleLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(firstTitleFirstPointLabel)
        firstTitleFirstPointLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTitleFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
            
        policyScrollView.addSubview(firstPointFirstParaLabel)
        firstPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTitleFirstPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(firstPointSecondParaLabel)
        firstPointSecondParaLabel.snp.makeConstraints { make in
                make.top.equalTo(firstPointFirstParaLabel.snp_bottomMargin).offset(20)
                make.width.equalTo(pScreenWidth - 32)
                make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(firstPointThirdParaLabel)
        firstPointThirdParaLabel.snp.makeConstraints { make in
            make.top.equalTo(firstPointSecondParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(firstPointFourthParaLabel)
        firstPointFourthParaLabel.snp.makeConstraints { make in
            make.top.equalTo(firstPointThirdParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(firstTitleSecondPointLabel)
        firstTitleSecondPointLabel.snp.makeConstraints { make in
            make.top.equalTo(firstPointFourthParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondPointFirstParaLabel)
        secondPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTitleSecondPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(firstTitleThirdPointLabel)
        firstTitleThirdPointLabel.snp.makeConstraints { make in
            make.top.equalTo(secondPointFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdPointFirstParaLabel)
        thirdPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTitleThirdPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdPointSecondParaLabel)
        thirdPointSecondParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdPointFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdPointThirdParaLabel)
        thirdPointThirdParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdPointSecondParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(firstTitleFourthPointLabel)
        firstTitleFourthPointLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdPointThirdParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fourthPointFirstParaLabel)
        fourthPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTitleFourthPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(firstTitleFifthPointLabel)
        firstTitleFifthPointLabel.snp.makeConstraints { make in
            make.top.equalTo(fourthPointFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fifthPointFirstParaLabel)
        fifthPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTitleFifthPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fifthPointSecondParaLabel)
        fifthPointSecondParaLabel.snp.makeConstraints { make in
            make.top.equalTo(fifthPointFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondTitleLabel)
        secondTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(fifthPointSecondParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondTitleFirstPointLabel)
        secondTitleFirstPointLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondTitleFirstPointFirstParaLabel)
        secondTitleFirstPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleFirstPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondTitleFirstPointSecondParaLabel)
        secondTitleFirstPointSecondParaLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleFirstPointFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondTitleFirstPointThirdParaLabel)
        secondTitleFirstPointThirdParaLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleFirstPointSecondParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondTitleFirstPointFourthParaLabel)
        secondTitleFirstPointFourthParaLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleFirstPointThirdParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondTitleFirstPointFifthParaLabel)
        secondTitleFirstPointFifthParaLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleFirstPointFourthParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondTitleFirstPointSixthParaLabel)
        secondTitleFirstPointSixthParaLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleFirstPointFifthParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondTitleFirstPointSeventhParaLabel)
        secondTitleFirstPointSeventhParaLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleFirstPointSixthParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(secondTitleFirstPointEighthParaLabel)
        secondTitleFirstPointEighthParaLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleFirstPointSeventhParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleLabel)
        thirdTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTitleFirstPointEighthParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleFirstParaLabel)
        thirdTitleFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleFirstPointLabel)
        thirdTitleFirstPointLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleFirstPointFirstParaLabel)
        thirdTitleFirstPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleFirstPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleFirstPointSecondParaLabel)
        thirdTitleFirstPointSecondParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleFirstPointFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleFirstPointThirdParaLabel)
        thirdTitleFirstPointThirdParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleFirstPointSecondParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleFirstPointFourthParaLabel)
        thirdTitleFirstPointFourthParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleFirstPointThirdParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleFirstPointFifthParaLabel)
        thirdTitleFirstPointFifthParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleFirstPointFourthParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleFirstPointSixthParaLabel)
        thirdTitleFirstPointSixthParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleFirstPointFifthParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleSecondPointLabel)
        thirdTitleSecondPointLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleFirstPointSixthParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleSecondPointFirstParaLabel)
        thirdTitleSecondPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleSecondPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleThirdPointLabel)
        thirdTitleThirdPointLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleSecondPointFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirdTitleThirdPointFirstParaLabel)
        thirdTitleThirdPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleThirdPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fourthTitleLabel)
        fourthTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(thirdTitleThirdPointFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fourthTitleFirstPointLabel)
        fourthTitleFirstPointLabel.snp.makeConstraints { make in
            make.top.equalTo(fourthTitleLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fourthTitleFirstPointFirstParaLabel)
        fourthTitleFirstPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(fourthTitleFirstPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fifthTitleLabel)
        fifthTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(fourthTitleFirstPointFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fifthTitleFirstParaLabel)
        fifthTitleFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(fifthTitleLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fifthTitleSecondParaLabel)
        fifthTitleSecondParaLabel.snp.makeConstraints { make in
            make.top.equalTo(fifthTitleFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fifthTitleThirdParaLabel)
        fifthTitleThirdParaLabel.snp.makeConstraints { make in
            make.top.equalTo(fifthTitleSecondParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fifthTitleFirstPointLabel)
        fifthTitleFirstPointLabel.snp.makeConstraints { make in
            make.top.equalTo(fifthTitleThirdParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fifthTitleFirstPointFirstParaLabel)
        fifthTitleFirstPointFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(fifthTitleFirstPointLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(sixthTitleLabel)
        sixthTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(fifthTitleFirstPointFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(sixthTitleFirstParaLabel)
        sixthTitleFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(sixthTitleLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(seventhTitleLabel)
        seventhTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(sixthTitleFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(seventhTitleFirstParaLabel)
        seventhTitleFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(seventhTitleLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(eighthTitleLabel)
        eighthTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(seventhTitleFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(eighthTitleFirstParaLabel)
        eighthTitleFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(eighthTitleLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(ninthTitleLabel)
        ninthTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(eighthTitleFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(ninthTitleFirstParaLabel)
        ninthTitleFirstParaLabel.snp.makeConstraints { make in
            make.top.equalTo(ninthTitleLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(oneLabel)
        oneLabel.snp.makeConstraints { make in
            make.top.equalTo(ninthTitleFirstParaLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(twoLabel)
        twoLabel.snp.makeConstraints { make in
            make.top.equalTo(oneLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(threeLabel)
        threeLabel.snp.makeConstraints { make in
            make.top.equalTo(twoLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fourLabel)
        fourLabel.snp.makeConstraints { make in
            make.top.equalTo(threeLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fiveLabel)
        fiveLabel.snp.makeConstraints { make in
            make.top.equalTo(fourLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(sixLabel)
        sixLabel.snp.makeConstraints { make in
            make.top.equalTo(fiveLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(sevenLabel)
        sevenLabel.snp.makeConstraints { make in
            make.top.equalTo(sixLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(eightLabel)
        eightLabel.snp.makeConstraints { make in
            make.top.equalTo(sevenLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(nineLabel)
        nineLabel.snp.makeConstraints { make in
            make.top.equalTo(eightLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(tenLabel)
        tenLabel.snp.makeConstraints { make in
            make.top.equalTo(nineLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(eleventLabel)
        eleventLabel.snp.makeConstraints { make in
            make.top.equalTo(tenLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(twelveLabel)
        twelveLabel.snp.makeConstraints { make in
            make.top.equalTo(eleventLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(thirteenLabel)
        thirteenLabel.snp.makeConstraints { make in
            make.top.equalTo(twelveLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fourteenLabel)
        fourteenLabel.snp.makeConstraints { make in
            make.top.equalTo(thirteenLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(fifteenLabel)
        fifteenLabel.snp.makeConstraints { make in
            make.top.equalTo(fourteenLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(sixteenLabel)
        sixteenLabel.snp.makeConstraints { make in
            make.top.equalTo(fifteenLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(seventeenLabel)
        seventeenLabel.snp.makeConstraints { make in
            make.top.equalTo(sixteenLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(eighteenLabel)
        eighteenLabel.snp.makeConstraints { make in
            make.top.equalTo(seventeenLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(ninteenLabel)
        ninteenLabel.snp.makeConstraints { make in
            make.top.equalTo(eighteenLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(twentyLabel)
        twentyLabel.snp.makeConstraints { make in
            make.top.equalTo(ninteenLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(twentyoneLabel)
        twentyoneLabel.snp.makeConstraints { make in
            make.top.equalTo(twentyLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(twentytwoLabel)
        twentytwoLabel.snp.makeConstraints { make in
            make.top.equalTo(twentyoneLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(twentthreeLabel)
        twentthreeLabel.snp.makeConstraints { make in
            make.top.equalTo(twentytwoLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(twentyfourLabel)
        twentyfourLabel.snp.makeConstraints { make in
            make.top.equalTo(twentthreeLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
        
        policyScrollView.addSubview(twentyfiveLabel)
        twentyfiveLabel.snp.makeConstraints { make in
            make.top.equalTo(twentyfourLabel.snp_bottomMargin).offset(20)
            make.width.equalTo(pScreenWidth - 32)
            make.left.equalToSuperview()
        }
    }
    
    @objc func backEvent() {
        self.navigationController?.popViewController(animated: true)
    }
}
