# frozen_string_literal: true

require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'passenger_train'
require_relative 'company'
require_relative 'instance_counter'
require_relative 'validation'

class Main
  attr_reader :stations, :routes, :trains

  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  MENU = {
    create_station: 'Создать станцию, введите 1: ',
    create_train: 'Создать поезд, введите 2: ',
    create_route: 'Создать маршрут, введите 3: ',
    set_train_route: 'Назначить маршрут поезду, введите 4: ',
    control_stations: 'Управление станциями, введите 5: ',
    add_carriage: 'Добавить вагон к поезду, введите 6: ',
    unhook_carriage: 'Отцепит вагон от поезда, введите 7: ',
    oute_forward: 'Переместить поезд по маршруту вперед, введите 8: ',
    way_back: 'Переместить поезд по маршруту назад, введите 9: ',
    stations_list: 'Список станций, введите 10: ',
    trains_list: 'Список поездов, введите 11: ',
    occupied_carriages: 'Занять место или объем в вагоне, введите 12: ',
    list_carriages_train: 'Список вагонов у поезда, введите 13: ',
    list_trains_station: 'Список поездов на станции, введите 14: ',
    exit: 'Выйти из программы, введите 15: '
  }.freeze

  def start
    loop do
      puts MENU.values
      send(MENU.keys[gets.to_i - 1])
    end
  end

  private

  def menu
    puts 'Создать станцию, введите 1: '
    puts 'Создать поезд, введите 2: '
    puts 'Создать маршрут, введите 3: '
    puts 'Назначить маршрут поезду, введите 4: '
    puts 'Управление станциями, введите 5: '
    puts 'Добавить вагон к поезду, введите 6: '
    puts 'Отцепит вагон от поезда, введите 7: '
    puts 'Переместить поезд по маршруту вперед, введите 8: '
    puts 'Переместить поезд по маршруту назад, введите 9: '
    puts 'Список станций, введите 10: '
    puts 'Список поездов, введите 11: '
    puts 'Занять место или объем в вагоне, введите 12: '
    puts 'Список вагонов у поезда, введите 13: '
    puts 'Список поездов на станции, введите 14: '
    puts 'Выйти из программы, введите 15: '
  end

  def create_station
    puts 'Введите название станции: '
    name = gets.chomp
    station = Station.new(name)
    @stations << station
  rescue ArgumentError
    puts 'Введите правильно'
    retry
  end

  def create_train
    puts 'Введите номер поезда: '
    number = gets.chomp
    puts 'Введите тип поезда (passenger или cargo)?: '
    type = gets.chomp
    if type == 'passenger'
      @trains << PassengerTrain.new(number)
    elsif type == 'cargo'
      @trains << CargoTrain.new(number)
    end
  rescue ArgumentError => e
    puts e.message
    retry
  end

  def show(listing)
    listing.each.with_index(1) { |item, index| puts "#{index}: #{item.name}" }
  end

  def select_listing(listing)
    listing[gets.to_i - 1]
  end

  def show_carriges(listing)
    listing.each.with_index(1) do |carriage, index|
      if carriage.type == 'passenger'
        puts "#{index}: Свободных мест: #{carriage.free_capacity}
                        Занятых мест: #{carriage.occupied_capacity}"
      elsif carriage.type == 'cargo'
        puts "#{index}: Свободный объем: #{carriage.free_capacity}
                        Занятый объем: #{carriage.occupied_capacity}"
      end
    end
  end

  def create_route
    show(stations)
    puts 'Выберите начальную станцию маршрута: '
    start_station = select_listing(stations)
    puts 'Выберите конечную станцию маршрута: '
    final_station = select_listing(stations)
    route = Route.new(start_station, final_station)
    @routes << route
  rescue ArgumentError
    puts 'Введите разные станции'
    retry
  end

  def set_train_route
    puts 'Выберите маршрут: '
    show(routes)
    route = select_listing(routes)
    puts 'Выберите поезд: '
    show(trains)
    train = select_listing(trains)
    train.add_route(route)
  end

  def control_stations
    puts 'Выберите маршрут:'
    show(routes)
    route = select_listing(routes)
    puts 'Добавить станцию, введите 1: '
    puts 'Удалить станцию, введите 2: '
    station_selection = gets.chomp.to_i

    case station_selection
    when 1
      show(stations)
      station = select_listing(stations)
      route.add_station(station)
    when 2
      show(stations)
      station = select_listing(stations)
      route.delete_station(station)
    end
  end

  def add_carriage
    puts 'Выберите поезд: '
    show(trains)
    train = select_listing(trains)
    if train.type == 'passenger'
      puts 'Укажите сколько мест '
      places = gets.to_i
      wagon = PassengerCarriage.new(places)
      train.add_wagon(wagon)
    elsif train.type == 'cargo'
      puts 'Укажите объем '
      size = gets.to_i
      wagon = CargoCarriage.new(size)
      train.add_wagon(wagon)
    end
  end

  def unhook_carriage
    puts 'Выберите поезд: '
    show(trains)
    train = select_listing(trains)
    train.unhook
  end

  def route_forward
    puts 'Выберите поезд: '
    show(trains)
    train = select_listing(trains)
    train.forward
  end

  def way_back
    puts 'Выберите поезд: '
    show(trains)
    train = select_listing(trains)
    train.backward
  end

  def stations_list
    show(stations)
  end

  def trains_list
    show(trains)
  end

  def carriages_list
    show(carriages)
  end

  def occupied_carriages
    puts 'Выберите поезд '
    show(trains)
    train = select_listing(trains)
    puts 'Выберите вагон '
    show_carriges(train.carriages)
    carriage = select_listing(train.carriages)
    if carriage.type == 'passenger'
      carriage.occupy_capacity
      puts 'Вы заняли место'
    elsif carriage.type == 'cargo'
      puts 'Введите объем, который займете '
      carriage.occupy_capacity(gets.to_i)
      puts 'Вы заняли объем'
    end
  end

  def list_carriages_train
    train = select_listing(trains)
    puts "Список вагонов поезда № '#{train.name}': "
    train.each_carriage do |carriage|
      puts "Тип #{carriage.type}"
      if carriage.type == 'passenger'
        puts "Свободных мест: #{carriage.free_capacity}
              Занятых мест: #{carriage.occupied_capacity}"
      elsif carriage.type == 'cargo'
        puts "Свободный объем: #{carriage.free_capacity}
              Занятый объем: #{carriage.occupied_capacity}"
      end
    end
  end

  def list_trains_station
    station = select_listing(stations)
    puts "Список поездов на станции '#{station.name}': "
    station.each_train do |train|
      puts "Номер № : #{train.name}"
      puts "Тип: #{train.type}"
      puts "Вагонов: #{train.carriages.size}"
    end
  end
end

main = Main.new
main.start
