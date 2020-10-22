#  [SwiftDate](https://github.com/HansongSwiftProject/SwiftDate)

git https://github.com/malcommac/SwiftDate
* Date Parsing

## Date Parsing
```
// All default datetime formats (15+) are recognized automatically
let _ = "2010-05-20 15:30:00".toDate()
// You can also provide your own format!
let _ = "2010-05-20 15:30".toDate("yyyy-MM-dd HH:mm")
// All ISO8601 variants are supported too with timezone parsing!
let _ = "2017-09-17T11:59:29+02:00".toISODate()
// RSS, Extended, HTTP, SQL, .NET and all the major variants are supported!
let _ = "19 Nov 2015 22:20:40 +0100".toRSS(alt: true)

```

## Date Manipulation
```
// Math operations support time units
let _ = ("2010-05-20 15:30:00".toDate() + 3.months - 2.days)
let _ = Date() + 3.hours
let _ = date1 + [.year:1, .month:2, .hour:5]
let _ = date1 + date2
// extract single time unit components from date manipulation
let over1Year = (date3 - date2).year > 1

```
## Date Comparison
```
// Standard math comparison is allowed
let _ = dateA >= dateB || dateC < dateB

// Complex comparisons includes granularity support
let _ = dateA.compare(toDate: dateB, granularity: .hour) == .orderedSame
let _ = dateA.isAfterDate(dateB, orEqual: true, granularity: .month) // > until month granularity
let _ = dateC.isInRange(date: dateA, and: dateB, orEqual: true, granularity: .day) // > until day granularity
let _ = dateA.earlierDate(dateB) // earlier date
let _ = dateA.laterDate(dateB) // later date

// Check if date is close to another with a given precision
let _ = dateA.compareCloseTo(dateB, precision: 1.hours.timeInterval

// Compare for relevant events:
// .isToday, .isYesterday, .isTomorrow, .isWeekend, isNextWeek
// .isSameDay, .isMorning, .isWeekday ...
let _ = date.compare(.isToday)
let _ = date.compare(.isNight)
let _ = date.compare(.isNextWeek)
let _ = date.compare(.isThisMonth)
let _ = date.compare(.startOfWeek)
let _ = date.compare(.isNextYear)
// ...and MORE THAN 30 OTHER COMPARISONS BUILT IN

// Operation in arrays (oldestIn, newestIn, sortedByNewest, sortedByOldest...)
let _ = DateInRegion.oldestIn(list: datesArray)
let _ = DateInRegion.sortedByNewest(list: datesArray)
```
## Date Creation with Region (Timezone, Calendar & Locale)
```
// All dates includes timezone, calendar and locales!
// Create from string
let rome = Region(calendar: Calendars.gregorian, zone: Zones.europeRome, locale: Locales.italian)
let date1 = DateInRegion("2010-01-01 00:00:00", region: rome)!

// Create date from intervals
let _ = DateInRegion(seconds: 39940, region: rome)
let _ = DateInRegion(milliseconds: 5000, region: rome)

// Date from components
let _ = DateInRegion(components: {
    $0.year = 2001
    $0.month = 9
    $0.day = 11
    $0.hour = 12
    $0.minute = 0
}, region: rome)
let _ = DateInRegion(year: 2001, month: 1, day: 5, hour: 23, minute: 30, second: 0, region: rome)

// Random date generation with/without bounds
let _ = DateInRegion.randomDate(region: rome)
let _ = DateInRegion.randomDate(withinDaysBeforeToday: 5)
let _ = DateInRegion.randomDates(count: 50, between: lowerLimitDate, and: upperLimitDate, region: rome)
```
## Derivated Dates
```
let _ = DateInRegion().dateAt(.endOfDay) // today at the end of the day
// Over 20 different relevant dates including .startOfDay,
// .endOfDay, .startOfWeek, .tomorrow, .nextWeekday, .nextMonth, .prevYear, .nearestMinute and many others!
let _ = dateA.nextWeekday(.friday) // the next friday after dateA
let _ = (date.dateAt(.startOfMonth) - 3.days)
let _ = dateA.compare(.endOfWeek)

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
let dates = DateInRegion.enumerateDates(from: fromDate2, to: toDate2, increment: increment2)

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
```
## Components Extraction
```
// Create a date in a region, London but with the lcoale set to IT
let london = Region(calendar: .gregorian, zone: .europeLondon, locale: .italian)
let date = DateInRegion("2018-02-05 23:14:45", format: dateFormat, region: london)!

// You can extract any of the all available time units.
// VALUES ARE EXPRESSED IN THE REGION OF THE DATE (THE RIGHT TIMEZONE).
// (you can still get the UTC/absolute value by getting the inner's absoluteDate).

let _ = date.year // 2018
let _ = date.month // 2
let _ = date.monthNameDefault // 'Febbraio' as the locale is the to IT!
let _ = date.firstDayOfWeek // 5
let _ = date.weekdayNameShort // 'Lun' as locale is the to IT
// ... all components are supported: .year, .month, .day, .hour, .minute, .second,
// .monthName, .weekday, .nearestHour, .firstDayOfWeek. .quarter and so on...
```
## Switch between timezones/locale and calendars
```
// Conversion between timezones is easy using convertTo(region:) function
let rNY = Region(calendar: Calendars.gregorian, zone: Zones.americaNewYork, locale: Locales.english)
let rRome = Region(calendar: Calendars.gregorian, zone: Zones.europeRome, locale: Locales.italian)
let dateInNY = "2017-01-01 00:00:00".toDate(region: rNY)
let dateInRome = dateInNY?.convertTo(region: rRome)!
print(dateInRome.toString()) // "dom gen 01 06:00:00 +0100 2017\n"

// You can also convert single region's attributes
let dateInIndia = dateInNY?.convertTo(timezone: Zones.indianChristmas, locale: Locales.nepaliIndia)
print("\(dateInIndia!.toString())") // "आइत जनवरी ०१ १२:००:०० +0700 २०१७\n"
```
## Date Formatting
```
// Date Formatting
let london = Region(calendar: .gregorian, zone: .europeLondon, locale: .english)
let date = ... // 2017-07-22T18:27:02+02:00 in london region
let _ = date.toDotNET() // /Date(1500740822000+0200)/
let _ = date.toISODate() // 2017-07-22T18:27:02+02:00
let _ = date.toFormat("dd MMM yyyy 'at' HH:mm") // "22 July 2017 at 18:27"

// You can also easily change locale when formatting a region
let _ = date.toFormat("dd MMM", locale: .italian) // "22 Luglio"

// Time Interval Formatting as Countdown
let interval: TimeInterval = (2.hours.timeInterval) + (34.minutes.timeInterval) + (5.seconds.timeInterval)
let _ = interval.toClock() // "2:34:05"

// Time Interval Formatting by Components
let _ = interval.toString {
    $0.maximumUnitCount = 4
    $0.allowedUnits = [.day, .hour, .minute]
    $0.collapsesLargestUnit = true
    $0.unitsStyle = .abbreviated
} // "2h 34m"

```
## Relative Date Formatting (fully customizable!)
```
// Twitter Style
let _ = (Date() - 3.minutes).toRelative(style: RelativeFormatter.twitterStyle(), locale: Locales.english) // "3m"
let _ = (Date() - 6.minutes).toRelative(style: RelativeFormatter.twitterStyle(), locale: Locales.italian) // "6 min fa"

// Default Style
let _ = (now2 - 5.hours).toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.english) // "5 hours ago"
let y = (now2 - 40.minutes).toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.italian) // "45 minuti fa"

```
## Codable Support
```
// Encoding/Decoding a Region
let region = Region(calendar: Calendars.gregorian, zone: Zones.europeOslo, locale: Locales.english)
let encodedJSON = try JSONEncoder().encode(region)
let decodedRegion = try JSONDecoder().decode(Region.self, from: encodedJSON)

// Encoding/Decoding a DateInRegion
let date = DateInRegion("2015-09-24T13:20:55", region: region)
let encodedDate = try JSONEncoder().encode(date)
let decodedDate = try JSONDecoder().decode(DateInRegion.self, from: encodedDate)
```
# [DateToolsSwift](https://github.com/HansongSwiftProject/DateTools)

## Time Ago
```
let timeAgoDate = 2.days.earlier
print("Time Ago: ", timeAgoDate.timeAgoSinceNow)
print("Time Ago: ", timeAgoDate.shortTimeAgoSinceNow)

```
##  languages supports
ar (Arabic)
bg (Bulgarian)
ca (Catalan)
zh_Hans (Chinese Simplified)
zh_Hant (Chinese Traditional)
cs (Czech)
da (Danish)
nl (Dutch)
en (English)
fi (Finnish)
fr (French)
de (German)
gre (Greek)
gu (Gujarati)
he (Hebrew)
hi (Hindi)
hu (Hungarian)
is (Icelandic)
id (Indonesian)
it (Italian)
ja (Japanese)
ko (Korean)
lv (Latvian)
ms (Malay)
nb (Norwegian)
pl (Polish)
pt (Portuguese)
ro (Romanian)
ru (Russian)
sl (Slovenian)
es (Spanish)
sv (Swedish)
th (Thai)
tr (Turkish)
uk (Ukrainian)
vi (Vietnamese)
cy (Welsh)
hr (Croatian)
##  Date Components
```
//Create calendar
let calendar = Calendar(identifier: .gregorian)
let dateComponents = calendar.dateComponents(Set<Calendar.Component>([.month,.year]), from: Date())
        
//Get components
let year = dateComponents.year!
let month = dateComponents.month!

```

## Date Editing
```
//Create calendar
NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:[NSDate defaultCalendar]];
NSDateComponents *components = [[NSDateComponents alloc] init];

//Make changes
[components setYear:1];

//Get new date with updated year
NSDate *newDate = [calendar dateByAddingComponents:components toDate:date options:0];

becomes this:


NSDate *newDate = [date dateByAddingYears:1];
```
## Date Comparison
```
NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:[NSDate defaultCalendar]];
NSDate *earliest = [firstDate earlierDate:secondDate];
NSDate *latest = (secondDate == firstDate) ? secondDate : firstDate;
NSInteger multiplier = (secondDate == firstDate) ? -1 : 1;
NSDateComponents *components = [calendar components:allCalendarUnitFlags fromDate:earliest toDate:latest options:0];
NSInteger yearsApart = multiplier*(components.month + 12*components.year);


NSInteger yearsApart = [firstDate yearsFrom:secondDate];

```
## Time Periods

```
DTTimePeriod *timePeriod = [[DTTimePeriod alloc] initWithStartDate:startDate endDate:endDate];

DTTimePeriod *timePeriod = [DTTimePeriod timePeriodWithSize:DTTimePeriodSizeHour amount:5 startingAt:[NSDate date]];

```
#### Time Period Info
* hasStartDate
* hasEndDate
* isMoment
* durationIn
#### Shifting
```
shiftEarlierWithSize:amount:

shiftLaterWithSize:amount
```
#### Lengthening/Shortening

```
DTTimePeriod *timePeriod  = [DTTimePeriod timePeriodWithSize:DTTimePeriodSizeMinute endingAt:[NSDate date]];
[timePeriod lengthenWithAnchorDate:DTTimePeriodAnchorEnd size:DTTimePeriodSizeMinute amount:1];
```
## Time Period Groups 
#### [Time Period Collections](https://github.com/HansongSwiftProject/DateTools#time-period-collections)
```
//Create collection
DTTimePeriodCollection *collection = [DTTimePeriodCollection collection];

//Create a few time periods
 DTTimePeriod *firstPeriod = [DTTimePeriod timePeriodWithStartDate:[dateFormatter dateFromString:@"2014 11 05 18:15:12.000"] endDate:[dateFormatter dateFromString:@"2015 11 05 18:15:12.000"]];
    DTTimePeriod *secondPeriod = [DTTimePeriod timePeriodWithStartDate:[dateFormatter dateFromString:@"2015 11 05 18:15:12.000"] endDate:[dateFormatter dateFromString:@"2016 11 05 18:15:12.000"]];

//Add time periods to the colleciton
[collection addTimePeriod:firstPeriod];
[collection addTimePeriod:secondPeriod];

//Retreive collection items
DTTimePeriod *firstPeriod = collection[0];

```
#### Time Period Chains
```
//Create chain
DTTimePeriodChain *chain = [DTTimePeriodChain chain];

//Create a few time periods
 DTTimePeriod *firstPeriod = [DTTimePeriod timePeriodWithStartDate:[dateFormatter dateFromString:@"2014 11 05 18:15:12.000"] endDate:[dateFormatter dateFromString:@"2015 11 05 18:15:12.000"]];
DTTimePeriod *secondPeriod = [DTTimePeriod timePeriodWithStartDate:[dateFormatter dateFromString:@"2015 11 05 18:15:12.000"] endDate:[dateFormatter dateFromString:@"2016 11 05 18:15:12.000"]];

//Add test periods
[chain addTimePeriod:firstPeriod];
[chain addTimePeriod:secondPeriod];

//Retreive chain items
DTTimePeriod *firstPeriod = chain[0];
```
