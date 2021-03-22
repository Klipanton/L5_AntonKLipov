import Foundation

enum Action {
    case swichOnClimate
    case swichOffClimate
    case swichOnMp3
    case swichOffMp3
}

enum TruckType: String {
    case trailer
    case refrigerator
    case tanker
    case van
}

// MARK: - Создаем общий протокол CarProtocol

protocol CarProtocol {
    var brand: String { get set }
    var color: String { get set }
    var mp3: Bool { get set }
    var climateControl: Bool { get set }
    var transsmition: Bool { get set }
    var enginePower: Double { get set }
    var buidYear: Int { get set }
    var trunkOriginalVolume: Double { get set }
    
    func makeAction()
    func printInfo()
}

// MARK: - Создаем расширение протокола CarProtocol

extension CarProtocol {
    
    mutating func swichOnClimate() {
        climateControl = true
        print("Климат-контроль включен")
    }
        
    mutating func swichOffClimate() {
        climateControl = false
        print("Климат-контроль выключен")
    }
            
    mutating func swichOnMp3() {
        mp3 = true
        print("MP3-плеер включен")
    }
                
    mutating func swichOffMp3() {
        mp3 = false
        print("MP3-плеер выключен")
    }
     
    func printInfo() {
        print("Марка авто: \(self.brand)")
        print("Цвет: \(self.color)")
        print("Mp3 плеер: \(self.mp3 ? "имеется" : "не имеется")")
        print("Климат-контроль: \(self.climateControl ? "имеется" : "не имеется")")
        print("Трансмиссия: \(self.transsmition ? "автоматическая" : "ручная")")
        print("Мощность двигателя: \(self.enginePower) лс")
        print("Год выпуска: \(self.buidYear) г")
        print("Объем бака: \(self.trunkOriginalVolume) л")
    }
}

// MARK: - Создаем протоколы печати свойт определенных классов

protocol SportCarPrintProtocol {
    var spoiler: Bool { get set }
    var cabronElements: Bool { get set }
    var maxSpeed: Int { get set }
}

extension SportCarPrintProtocol {
    
    func printInfoSport () {
        print("Cпойлера: \(self.spoiler ? "имеется" : "не имеется")")
        print("Элемента из карбона: \(self.cabronElements ? "имеются" : "не имеются")")
        print("Максимальная скорость: \(self.maxSpeed) км/ч")
    }
}

protocol TruckCarPrintProtocol {
    var truckType: TruckType { get set }
    var bed: Bool { get set }
    var radio: Bool { get set }
    var cargoWeight: Double { get set }
    var cargoVolume: Double { get set }
}

extension TruckCarPrintProtocol {
    func printInfoTruck () {
        print("Тип грузовика: \(truckType)")
        print("Кровать: \(bed  ? "имеется" : "не имеется")")
        print("Радио: \(radio  ? "имеется" : "не имеется")")
        print("Вес груза: \(cargoWeight) т")
        print("Объем груза: \(cargoVolume) л")
    }
}

// MARK: - Создаем класс спортивного автомобиля

class SportСar: CarProtocol, SportCarPrintProtocol {

    var brand: String
    var color: String
    var mp3: Bool
    var climateControl: Bool
    var transsmition: Bool
    var enginePower: Double
    var buidYear: Int
    var trunkOriginalVolume: Double
    
    var spoiler: Bool
    var nitricOxide: Bool
    var cabronElements: Bool
    var maxSpeed: Int
    var sportMode: Bool
    var lowerSuspension: Bool
    
    init(brand: String, color: String, mp3: Bool, climateControl: Bool, enginePower: Double, buidYear: Int, trunkOriginalVolume: Double, spoiler: Bool, nitricOxide: Bool, cabronElements: Bool, maxSpeed: Int,transsmition: Bool, sportMode: Bool, lowerSuspension: Bool) {
        
        self.brand = brand
        self.color = color
        self.mp3 = mp3
        self.climateControl = climateControl
        self.transsmition = transsmition
        self.enginePower = enginePower
        self.buidYear = buidYear
        self.trunkOriginalVolume = trunkOriginalVolume
        self.spoiler = spoiler
        self.nitricOxide = nitricOxide
        self.cabronElements = cabronElements
        self.maxSpeed = maxSpeed
        self.sportMode = sportMode
        self.lowerSuspension = lowerSuspension
    }
    
    func makeAction() {
    }
}

// MARK: - Создаем класс грузовика

class TruckСar: CarProtocol, TruckCarPrintProtocol {

    var brand: String
    var color: String
    var mp3: Bool
    var climateControl: Bool
    var transsmition: Bool
    var enginePower: Double
    var buidYear: Int
    var trunkOriginalVolume: Double
    
    var truckType: TruckType
    var bed: Bool
    var radio: Bool
    var cargoWeight: Double
    var cargoVolume: Double
    var beep: Bool
    
    init(brand: String, color: String, mp3: Bool, climateControl: Bool, enginePower: Double, buidYear: Int, trunkOriginalVolume: Double, truckType: TruckType, bed: Bool, radio: Bool, cargoWeight: Double, cargoVolume: Double, transsmition: Bool, beep: Bool){
    
        self.brand = brand
        self.color = color
        self.mp3 = mp3
        self.climateControl = climateControl
        self.transsmition = transsmition
        self.enginePower = enginePower
        self.buidYear = buidYear
        self.trunkOriginalVolume = trunkOriginalVolume
        
        self.truckType = truckType
        self.bed = bed
        self.radio = radio
        self.cargoWeight = cargoWeight
        self.cargoVolume = cargoVolume
        self.beep = beep
    }
    
    func makeAction() {
    }
}

// MARK: - Создаем CustomStringConvertible

extension SportСar: CustomStringConvertible {
    var description: String {
        return "Я спортивный автомобиль"
    }
}

extension TruckСar: CustomStringConvertible {
    var description: String {
        return "Я грузовой атвомобиль"
    }
}

// MARK: - Создаем объекты каждого класса

var porsche = SportСar(brand: "Porsche", color: "морской волны", mp3: true, climateControl: true, enginePower: 300, buidYear: 2020, trunkOriginalVolume: 40, spoiler: true, nitricOxide: true, cabronElements: false, maxSpeed: 320, transsmition: true,  sportMode: false, lowerSuspension: false)

var kamaz = TruckСar(brand: "Кamaz", color: "красненький", mp3: false, climateControl: false, enginePower: 50, buidYear: 1960, trunkOriginalVolume: 20, truckType: .refrigerator, bed: true,  radio: true, cargoWeight: 3.5, cargoVolume: 800, transsmition: true, beep: true)

// MARK: - Смотрим реализацию протокола CustomStringConvertible

print(porsche)
print(kamaz)
print("-------------------------------------------------------------")

// MARK: - Выводим сами объекты в консоль

porsche.printInfo() // Печать общих свойств
porsche.printInfoSport() // Печать свойств спортивных автомобилей
// Как их объединить в одной функции для элегантности пока не додумался, подскажите?

print("-------------------------------------------------------------")
kamaz.printInfo()
kamaz.printInfoTruck()
