require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'passenger_train'
require_relative 'company'
require_relative 'instance_counter'
require_relative 'validation'


class Main
  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def start
    loop do
      menu
      result = gets.to_i
      case result
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 4
        set_train_route
      when 5
        control_stations
      when 6
        add_carriage
      when 7
        unhook_carriage
      when 8
        route_forward
      when 9
        way_back
      when 10
        stations_list
      when 11
        trains_list
      when 12
        occupied_carriages
      when 13
        list_carriages_train
      when 14
        list_trains_station
      when 15
        break
      end
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
    number = gets.chomp.to_i
    puts 'Введите тип поезда (passenger или cargo)?: '
    type = gets.chomp.to_s
    if type == 'passenger'
      @trains << PassengerTrain.new(number)
    elsif type == 'cargo'
      @trains << CargoTrain.new(number)
    end
  rescue ArgumentError
    puts 'Введите правильно данные'
    retry
  end

  def show(listing)
    listing.each.with_index(1){ |item, index| puts "#{index}: #{item}" }
  end

  def select_listing(listing)
    entity = gets.to_i
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
      station = select_listing(station)
      route.ad_station(station)
    when 2
      show(stations)
      station = select_listing(station)
      route.delete_station(staition)
    end
  end

  def add_carriage
    puts 'Выберите поезд: '
    show(trains)
    train = select_listing(trains)

    if train.type == 'passenger'
      wagon = PassengerCarriages.new(places)
      train.add_wagon(wagon)
    elsif train.type == 'cargo'
      wagon = CargoCarriages.new(size)
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
    train.next_station
  end

  def way_back
    puts 'Выберите поезд: '
    show(trains)
    train = select_listing(trains)
    train.prev_station
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

  end

  def list_carriages_train
    train = select_listing(trains)
    puts "Список вагонов поезда № '#{train.number}': "
    train.each_carriages do |carriages|
      puts "Номер №: #{number}"
      puts "Тип #{carriages.type}"
      if carriages.type == 'passenger'
        puts "Свободных мест: #{carriages.vacant_seats}; Занятых мест: #{carriages.occupied_seats}"
      elsif wagon.type == 'Грузовой'
        puts "Свободный объем: #{carriages.vacant_volume}; Занятый объем: #{carriages.occupied_volume}"
      end
    end
  end

  def list_trains_station
    show(trains)
    puts "Список поездов на станции '#{station.name}': "
    station.each_train { |train| puts "Номер № : #{train.number}; Тип: #{train.type}; Вагонов: #{train.carriages.length}" }
  end
end




