//
//  detailVC.swift
//  ReservationApp
//
//  Created by Admin on 04/10/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class detailVC: UIViewController {

    @IBOutlet weak var infoMessage: UITextView!
    var InfoId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(InfoId == 0)
        {
        self.infoMessage.text = "Checking-In for a PIA flight is truly easy.\n" +
        "No Weight, No Wait\n" +
        "If you have no baggage to check in, and are traveling only with hand luggage, special \"No Wait\" counters await you at the Karachi, Lahore, and Islamabad Airports. No more waiting around!\n\n" +
        "* City Check-In\n\n" +
        "PIA's City Check-In facility enables you to get your Boarding Pass 72 hours before your flight. Not only do you not have to stand in a queue, you can report directly to the boarding gate just 30 minutes before departure.\n" +
        "This facility is only available for passengers traveling without checked baggage*\n" +
        "City Check-In Boarding Passes can also be obtained if you intend to return to your port of origin within 72 hours\n" +
        "Note: Boarding Passes without Coupons will not be accepted.\n\n" +
        "* Return Check-In\n\n" +
        "PIA offers return check-in facility for travelers who travel between the two destinations within 12 hours time period from Karachi, Islamabad and Lahore. The travelers can obtain the boarding passes for boarding at both the destinations in advance.\n\n" +
        "* Through Check-In\n\n" +
        "PIA takes one more step to facilitate the passengers who are traveling to destinations requiring transit procedures. Passengers can now obtain boarding Multiple Boarding Passes and have hassle-free transits.\n\n" +
        "* Kerb -side Check In\n\n" +
        "If you are traveling as an Economy Plus passenger on domestic our flights from Karachi with no baggage to check in, you can easily check-in through our Kerb-side counters without any waiting at all !"
        }
    else if(InfoId == 1)
        {
            self.infoMessage.text = "IMPORTANT INFORMATION FOR PIA PASSENGERS\n" +
            "Passenger should reach airport: \n\n" +
            "   Minimum 2 hours before departure time for domestic flights &\n" +
            "   Minimum 4 hours before departure time for international flights\n" +
            "Counters will be strictly closed 01HR before the departure time.\n\n" +
            "No wheel chairs requests will be entertained at check-in counter less than 01 hr 15 min prior to departure time.\n\n" +
            "Only 01 piece of hand carry allowed of weighing 7kgs.\n\n" +
            "No liquids/Gels/Perfumes/Creams allowed in your hand carry, otherwise security will confiscate these items.\n\n" +
            "* Information For Passengers Travelling Through UK\n\n" +
            "All passengers travelling through United Kingdom and holding the following documents require a Direct Airside Transit Visa (DATV):\n\n" +
            "Passengers travelling to USA\n\n" +
            "Alien resident card (green card) issued before 21st April,1998.\n\n" +
            "I-551 stamp (red colour wet stamp). This stamp is issued to passengers whose alien resident card is under process.\n\n" +
            "Refugee passport. However, passenger doesnot require DATV if also holding permanent resident card issued after 21st April,1998.\n\n" +
            "Transportation letter.\n\n" +
            "Letter of parole.\n\n" +
            "Carriage of Expectant Mothers\n\n" +
            "At the time of booking/purchasing ticket, expectant mother/legally authorized person shall declare that she is in a family way/expectant mother is travelling.\n\n" +
            "The permissible limit of pregnancy is up to 27 weeks i.e. expectant mothers shall not be accepted for carriage if they exceed this limit. Please ensure that their date of travel must not fall in the 28th week of pregnancy." +
            "\n\n" +
            "Delay – A cash sum will be paid after a specified length of delay, such as eight hours, up to a maximum amount set out in the policy.\n" +
            " \n\n" +
            "Missed departure - Should bad weather prevent you from getting to the airport, check with your travel insurer for advice.\n" +
            " \n\n" +
            "‘Abandoned’ trip - Where cancellation or delay forces you to abandon your travel plans when leaving the UK, policies may also pay a lump sum.\n" +
            "\n" +
            "REMEMBER - The extent and level of any cover will vary between policies, so check your travel insurance."

        }
        else if(InfoId == 2)
        {
            self.infoMessage.text = "Issued in compliance with 14 C.F.R. § 259.5\n\n" +
                "The Pakistan International Airlines (“PIA”) Customer Service Plan is the result of rules put into effect by the U.S. Department of Transportation (“DOT”) to improve the air travel environment for consumers. Our Customer Service Plan meets the requirements imposed by DOT and applies on all of our scheduled flights to or from the United States, and includes the following assurances to our customers:\n\n" +
                "Disability Assistance Form\n\n" +
                "1. Advise about lowest available fares\n\n" +
                "2.\tNotify customers of known delays, cancellations and diversions\n\n" +
                "3.\tDeliver baggage on time\n\n" +
                "4.\tAllow reservations to be cancelled for a certain period after purchase\n\n" +
                "5.\tProvide prompt ticket refunds\n" +
                "6.\tProperly accommodate passengers with disabilities and other special needs\n\n" +
                "7.\tMeet customers' essential needs during lengthy tarmac delays\n\n" +
                "8.\tTreat passengers fairly and consistently in the case of oversales\n\n" +
                "9.\tDisclose cancellation policies, frequent flyer rules, aircraft seating configuration and lavatory availability\n\n" +
                "10.\tNotify customers about travel itinerary changes in a timely manner\n\n" +
                "11.\tEnsure responsiveness to customer complaints\n\n" +
            "12.\tProvide services to mitigate inconveniences resulting from cancellations and misconnections."

        }
        else if(InfoId == 3)
        {
            self.infoMessage.text = "PIA’s Business Plus class offers a range of exclusive services, from the time you leave your home till you land at your destination.\n\n" +
            "Business Plus Seats\n\n" +
            "A comfortable seat makes all the difference on a long flight. PIA's Business Plus Seats elevate the concept of luxury to a new level, fully endorsing your decision to choose PIA Business Plus. Our customized seats are designed in Italy and Switzerland and provide amazing levels of leg-room and shoulder space. PIA's Business Plus Seats ensure that your personal space is truly your own, and you'll never feel cramped. \n\n" +
            "Whether you're sleeping, eating, working, reading a book, or just lying back and enjoying our in-flight entertainment, PIA's Business Plus Seats will make you feel right at home. There is simply no better way to fly."
        }
        else if(InfoId == 4)
        {
            self.infoMessage.text = "PIA offers a range of baggage services for Economy, Economy Plus, and Business Plus passengers. This section provides helpful information about baggage allowances, as well as a list of restricted items and advice on items that should be packed in your checked baggage.\n\n" +
            "BAGGAGE RULES AND RESTRICTIONS\n\n" +
            "For the safety of our passengers and aircraft, passengers are prohibited from carrying the following items in either checked or hand baggage:\n" +
            "Explosives, munitions, fireworks, and flares\n\n" +
            "Security-type cases/boxes incorporating goods such as lithium batteries or pyrotechnics\n\n" +
            "Compressed gases (flammable, non-flammable, or poisonous) such as butane, propane, aqualung cylinders, lighter fuels, or refills\n\n" +
            "Oxidizing substances such as bleaching powder and peroxides\n" +
            "Flammable liquids such as paints and adhesives\n\n" +
            "Flammable solids such as safety matches and articles which are easily ignited\n\n" +
            "Disabling devices such as mace or pepper sprays, with irritant properties\n\n" +
            "Poisons such as arsenic, cyanides, or insecticides\n\n" +
            "Radioactive Materials\n\n" +
            "Corrosive materials such as mercury (which may be contained in thermometers or blood pressure gauges,) acids, alkalis, and wet cell batteries\n\n" +
            "Any other substances which, during a flight, present a danger not covered above, such as magnetized, offensive, or irritating materials\n\n" +
            "Lighters (butane, absorbed fuel, electric, battery-powered, and novelty lighters) are not to be carried in the carry-on and checked baggage. This ruling by The Transportation Security Administration (TSA) applies to all passengers arriving into or departing from United States of America.\n\n" +
            "In addition, passengers are not allowed to carry the following items in their hand baggage for passengers' safety and security reasons. To minimize inconvenience, you are advised to check in or put these items in your checked baggage instead"

        }
        else if(InfoId == 5)
        {
            self.infoMessage.text = "What is Air Cargo?\n\n" +
                "How can I book my shipment through PIA Cargo? Procedure, Documentations, Regulations?\n\n" +
                "What Quantity of Shipment can be booked as Cargo on PIA?\n\n" +
                "How is Cargo Tariff Calculated?\n\n" +
                "How to book Live Animals?\n\n" +
            "What are Dangerous Goods? How to Ship Dangerous Goods?"

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
