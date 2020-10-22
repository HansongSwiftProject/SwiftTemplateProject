//
//  DemoSwiftDateVC.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/19/20.
//

import UIKit
import SwiftDate
import DateToolsSwift
class DemoSwiftDateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    @IBAction func buttonSend(_ sender: UIButton) {
        switch sender.tag {
        case 101:
            dateParsing()
        case 102:
            dateManipulation()
        case 103:
            dateComparsion()
        case 104:
            dateCreationwithRegion()
        case 105:
            dateCreationwithRegion()
        case 106:
            componentsExtraction()
        case 107:
            switchBetweenTimezonesToLocaleAndCalendars()
        case 108:
            dateFormatting()
        case 109:
            relativeDateFormatting()
        case 110:
            codableSupport()
        case 111:
            timePeriods()
        break
        case 112:
//            codableSupport()
        break
        default:
            break
        }
    }
    //MARK: 1 Date Parsing
    func dateParsing(){
    // All default datetime formats (15+) are recognized automatically
    let date1 = "2010-05-20 15:30:00".toDate()
    print("date1"+(date1?.description ?? ""))
    // You can also provide your own format!
    let date2 = "2010-05-20 15:30".toDate("yyyy-MM-dd HH:mm")
    print("date2"+(date2?.description ?? ""))
    // All ISO8601 variants are supported too with timezone parsing!
    let date3 = "2017-09-17T11:59:29+02:00".toISODate()
    print("date3"+(date3?.description ?? ""))
    // RSS, Extended, HTTP, SQL, .NET and all the major variants are supported!
    let date4 = "19 Nov 2015 22:20:40 +0100".toRSSDate(alt: true)
    print("date4"+(date4?.description ?? ""))
}
    //MARK: 2 Date Manipulation
    func dateManipulation(){
        // Math operations support time units
        let date1 = ("2010-05-20 15:30:00".toDate()! + 3.months - 2.days)
        print("date1"+(date1.description ))
        //FIXME:
//        let date2 = Date() + 3.hours
        let date2 = Date()
        print("date2"+(date2.description ))
        let date3 = date1 + [.year:1, .month:2, .hour:5]
        print("date3"+(date2.description ))
        //FIXME:
//        let date4 = date1.date + date2.date
        //FIXME:
        // extract single time unit components from date manipulation
        

//        let over1Year = (date3 - date2).year > 1
        let over1year = (date3.year - date2.year)>1
        print(over1year)
        
    }
    //MARK: 3 Date Comparsion
    func dateComparsion(){
        let dateA = "2010-05-20 15:30:00".toDate()!
        let dateB = "2014-05-20 15:30:00".toDate()!
        let dateC = "2016-05-20 15:30:00".toDate()!
        
        // Standard math comparison is allowed
        let _ = dateA >= dateB || dateC < dateB

        // Complex comparisons includes granularity support // granularity 粒度
        let dateA1 = dateA.compare(toDate: dateB, granularity: .hour) == .orderedSame
        let dateA2 = dateA.isAfterDate(dateB, orEqual: true, granularity: .month) // > until month granularity
        let dateA3 = dateC.isInRange(date: dateA, and: dateB, orEqual: true, granularity: .day) // > until day granularity
        let dateA4 = dateA.earlierDate(dateB) // earlier date
        let dateA5 = dateA.laterDate(dateB) // later date

        // Check if date is close to another with a given precision
        let dateC1 = dateA.compareCloseTo(dateB, precision: 1.hours.timeInterval)

        // Compare for relevant events:
        // .isToday, .isYesterday, .isTomorrow, .isWeekend, isNextWeek
        // .isSameDay, .isMorning, .isWeekday ...
        
        let date = "2020-10-21 19:13:00".toDate()!
        
        let dateB1 = date.compare(.isToday)
        let dateB12 = date.compare(.isNight)
        let dateB13 = date.compare(.isNextWeek)
        let dateB14 = date.compare(.isThisMonth)
        let dateB15 = date.compare(.isThisWeek)
        let dateB16 = date.compare(.isNextYear)
        // ...and MORE THAN 30 OTHER COMPARISONS BUILT IN

        // Operation in arrays (oldestIn, newestIn, sortedByNewest, sortedByOldest...)
        let datesArray = [dateA,dateB,dateC,date]
        
        
        let dateC2 = DateInRegion.oldestIn(list: datesArray)
        let dateC3 = DateInRegion.sortedByNewest(list: datesArray)
        
    }
    //MARK: 4 Date Creation with Region (Timezone, Calendar & Locale)
    func dateCreationwithRegion(){
        // All dates includes timezone, calendar and locales!
        // Create from string
        let rome = Region(calendar: Calendars.gregorian, zone: Zones.europeRome, locale: Locales.italian)
        let date1 = DateInRegion("2010-01-01 00:00:00", region: rome)!

        // Create date from intervals
        let date11 = DateInRegion(seconds: 39940, region: rome)
        let date12 = DateInRegion(milliseconds: 5000, region: rome)

        // Date from components
        let date13 = DateInRegion(components: {
            $0.year = 2001
            $0.month = 9
            $0.day = 11
            $0.hour = 12
            $0.minute = 0
        }, region: rome)
        let date14 = DateInRegion(year: 2001, month: 1, day: 5, hour: 23, minute: 30, second: 0, region: rome)

        // Random date generation with/without bounds
        let date15 = DateInRegion.randomDate(region: rome)
        let date16 = DateInRegion.randomDate(withinDaysBeforeToday: 5)
        let lowerLimitDate =  DateInRegion("2010-01-01 00:00:00", region: rome)!
        let upperLimitDate =  DateInRegion("2029-01-01 00:00:00", region: rome)!
        let date17 = DateInRegion.randomDates(count: 50, between: lowerLimitDate, and: upperLimitDate, region: rome)
    }
    //MARK: 5 Derivated Dates
    func derivatedDates(){
        let dateA = "2010-05-20 15:30:00".toDate()!
        let dateB = "2014-05-20 15:30:00".toDate()!
        let dateC = "2016-05-20 15:30:00".toDate()!
        let rome = Region(calendar: Calendars.gregorian, zone: Zones.europeRome, locale: Locales.italian)
        let date = DateInRegion().dateAt(.endOfDay) // today at the end of the day
        // Over 20 different relevant dates including .startOfDay,
        // .endOfDay, .startOfWeek, .tomorrow, .nextWeekday, .nextMonth, .prevYear, .nearestMinute and many others!
        let _ = dateA.nextWeekday(.friday) // the next friday after dateA
        let _ = (date.dateAt(.startOfMonth) - 3.days)
        //FIXME: dateA.compare(.endOfWeek)
//        let _ = dateA.compare(.endOfWeek)

        // Enumerate dates in range by providing your own custom
        // increment expressed in date components
        let from = DateInRegion("2015-01-01 10:00:00", region: rome)!
        let to = DateInRegion("2015-01-02 03:00:00", region: rome)!
        let increment2 = DateComponents.create {
            $0.hour = 1
            $0.minute = 30
            $0.second = 10
        }
        // generate dates in range by incrementing +1h,30m,10s each new date
        let dates = DateInRegion.enumerateDates(from: from, to: to, increment: increment2)

        // Get all mondays in Jan 2019
        let mondaysInJan2019 = Date.datesForWeekday(.monday, inMonth: 1, ofYear: 2019)

        // Altering time components
        let _ = dateA.dateBySet(hour: 10, min: 0, secs: 0)

        // Truncating a date
        let _ = dateA.dateTruncated(at: [.year,.month,.day]) // reset all time components keeping only date

        // Rounding a date
        let _ = dateA.dateRoundedAt(.toMins(10))
        let _ = dateA.dateRoundedAt(.toFloor30Mins)

        // Adding components
        let _ = dateA.dateByAdding(5,.year)

        // Date at the start/end of any time component
        let _ = dateA.dateAtEndOf(.year) // 31 of Dec at 23:59:59
        let _ = dateA.dateAtStartOf(.day) // at 00:00:00 of the same day
        let _ = dateA.dateAtStartOf(.month) // at 00:00:00 of the first day of the month
    }
    //MARK: 6 Components Extraction
    func componentsExtraction(){

        //ZoneConvertible
        let london = Region.init(calendar:Calendar.Identifier.gregorian, zone:Zones.europeLondon, locale:Locales.italian)
//            Region(calendar:, zone: .europeLondon, locale: .italian)
        
        print(london)
        let date = DateInRegion("2018-02-05 23:14:45", format: "yyyy-MM-dd HH:mm:ss", region: london)
        print(date)

        let date1 = date?.year ?? 0 // 2018
        print("date1="+date1.description)
        let date2 = date?.month ?? 0// 2
        print("date2="+date2.description)
        let date3 = date?.monthName(SymbolFormatStyle.default) ?? "name" // 'Febbraio' as the locale is the to IT!
        print("date3"+date3.description)
        let date4 = date?.firstDayOfWeek ?? 5// 5
        print("date4"+date4.description)
        let date5 = date?.weekdayName(SymbolFormatStyle.short) ?? "NAME" // 'Lun' as locale is the to IT
        print("date5"+date5.description)
        // ... all components are supported: .year, .month, .day, .hour, .minute, .second,
        // .monthName, .weekday, .nearestHour, .firstDayOfWeek. .quarter and so on...

    }
    //MARK: 7 Switch between timezones/locale and calendars
    func switchBetweenTimezonesToLocaleAndCalendars(){
        // Conversion between timezones is easy using convertTo(region:) function
        let rNY = Region(calendar: Calendars.gregorian, zone: Zones.americaNewYork, locale: Locales.english)
        let rRome = Region(calendar: Calendars.gregorian, zone: Zones.europeRome, locale: Locales.italian)
        let dateInNY = "2017-01-01 00:00:00".toDate(region: rNY)
        let dateInRome = dateInNY?.convertTo(region: rRome)
        print(dateInRome!.toString()) // "dom gen 01 06:00:00 +0100 2017\n"

        // You can also convert single region's attributes
        let dateInIndia = dateInNY?.convertTo(timezone: Zones.indianChristmas, locale: Locales.nepaliIndia)
        print("\(dateInIndia!.toString())") // "आइत जनवरी ०१ १२:००:०० +0700 २०१७\n"
    }
    //MARK: 8 Date Formatting
    func dateFormatting(){
        // Date Formatting
        let london = Region(calendar: Calendar.Identifier.gregorian, zone: Zones.europeLondon, locale: Locales.english)
        print("london"+london.description)
        let  date = DateInRegion.init()
        print("date"+date.description)
        let date1 = date.toDotNET() // /Date(1500740822000+0200)/
        print("date1"+date1.description)
        let date2 = date.toISO() // 2017-07-22T18:27:02+02:00
        print("date2"+date2.description)
        let date3 = date.toFormat("dd MMM yyyy 'at' HH:mm") // "22 July 2017 at 18:27"
        print("date3"+date3.description)
        // You can also easily change locale when formatting a region
        let date4 = date.toFormat("dd MMM", locale: Locales.italian) // "22 Luglio"
        print("date4"+date4.description)
        // Time Interval Formatting as Countdown
        let interval: TimeInterval = (2.hours.timeInterval) + (34.minutes.timeInterval) + (5.seconds.timeInterval)
        let date5 = interval.toClock() // "2:34:05"
        print("date5"+date5.description)
        // Time Interval Formatting by Components
        let date6 = interval.toString {
            $0.maximumUnitCount = 4
            $0.allowedUnits = [.day, .hour, .minute]
            $0.collapsesLargestUnit = true
            $0.unitsStyle = .abbreviated
        } // "2h 34m"
        print("date6"+date6.description)
    }
    //MARK: 9 Relative Date Formatting (fully customizable!)
    func relativeDateFormatting(){
        // Twitter Style
        let X1 = (DateInRegion.init() - 3.minutes).toRelative(style: RelativeFormatter.twitterStyle(), locale: Locales.english) // "3m"
        print("X1"+X1.description)
        let Y1 = (DateInRegion.init() - 6.minutes).toRelative(style: RelativeFormatter.twitterStyle(), locale: Locales.italian) // "6 min fa"
        print("Y1"+Y1.description)
        // Default Style
        let X = (DateInRegion.init() - 5.hours).toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.english) // "5 hours ago"
        print("X"+X.description)
        let y = (DateInRegion.init() - 40.minutes).toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.italian) // "45 minuti fa"
        print("y"+y.description)
        
    }
    //MARK: 10 Codable Support
    func codableSupport(){
        // Encoding/Decoding a Region
        let region = Region(calendar: Calendars.gregorian, zone: Zones.europeOslo, locale: Locales.english)
        let encodedJSON = try! JSONEncoder().encode(region)
        let decodedRegion = try! JSONDecoder().decode(Region.self, from: encodedJSON)
        print("decodedRegion"+decodedRegion.description)
        // Encoding/Decoding a DateInRegion
        let date = DateInRegion("2015-09-24T13:20:55", region: region)
        let encodedDate = try! JSONEncoder().encode(date)
    //FIXME:  let decodedDate = try! JSONDecoder().decode(DateInRegion.self, from: encodedDate)
//        let decodedDate = try! JSONDecoder().decode(DateInRegion.self, from: encodedDate)
        print("decodedDate"+encodedDate.description)
    }
    //MARK: 11   Time Periods
    func timePeriods(){
        let toDate = DateInRegion().dateAtStartOf(.day) // now at 00:00
        let fromDate = toDate - 3.days // 3 days ago at 00:00
        let period = TimePeriod(start: fromDate , end: toDate)
        
        
      //MARK: Time Ago
        let timeAgoDate = 2.days.earlier
        print("Time Ago: ", timeAgoDate.timeAgoSinceNow)
        print("Time Ago: ", timeAgoDate.shortTimeAgoSinceNow)
//        DateComponents2()
//        DateEditing()
//        DateComparison2()
        TestTimePeriods()
     

    }
//MARK: DateTools
    //MARK: Date Components
    func DateComponents2() {
        //Create calendar
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = calendar.dateComponents(Set<Calendar.Component>([.month,.year]), from: Date())
                
        //Get components
        let year = dateComponents.year!
        let month = dateComponents.month!

        let year1 = Date().year
        let month1 = Date().month
    }
    
    //MARK:Date Editing
    func DateEditing(){
        //Create calendar
        let calendar = Calendar.init(identifier:Calendar.Identifier.coptic)
        var components = DateComponents.init()
        components.year = 1
        let newDate = calendar .date(byAdding: components, to: Date(), wrappingComponents:false)
        print(newDate)
        
        
        let newDate2 = Date().dateByAdding(1,.year)
        print(Date())
        print(newDate2)
        


    }
    //MARK:Date Editing
    func DateComparison2(){
        let calendar2 = Calendar.init(identifier: Calendar.Identifier.gregorian)
        let firstDate =  "2010-05-20 15:30:00".toDate()
        let secondDate = "2014-05-20 15:30:00".toDate()
       
        let earliest = firstDate?.earlierDate(secondDate!)
        
        let latest = (secondDate == firstDate) ? secondDate : firstDate
        
//        let multiplier:Int = (secondDate == firstDate) ? -1 : 1
        //FIXME: multiplier:Int
        
//        let multiplier = firstDate?.
        
        
//        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:[NSDate defaultCalendar]];
//        NSDate *earliest = [firstDate earlierDate:secondDate];
//        NSDate *latest = (secondDate == firstDate) ? secondDate : firstDate;
//        NSInteger multiplier = (secondDate == firstDate) ? -1 : 1;
//        NSDateComponents *components = [calendar components:allCalendarUnitFlags fromDate:earliest toDate:latest options:0];
//        NSInteger yearsApart = multiplier*(components.month + 12*components.year);
        //FIXME: yearsApart
//        NSInteger yearsApart = [firstDate yearsFrom:secondDate];
    }
    
    func TestTimePeriods(){
        let startDate =  "2010-05-20 15:30:00".toDate()
        let endDate = "2014-05-20 15:30:00".toDate()
        let timePeriod = TimePeriod.init(start:startDate, end:endDate)
        print(timePeriod)

    }
}
