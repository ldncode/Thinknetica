require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_carriages'
require_relative 'cargo_train'
require_relative 'passenger_carriages'
require_relative 'passenger_train'
require_relative 'carriages'
require_relative 'company'
require_relative 'instance_counter'


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
    puts 'Выйти из программы, введите 12: '
  end

  def create_station
    puts 'Введите название станции: '
    name = gets.chomp
    station = Station.new(name)
    @stations << station
    puts "Вы создали станцию: #{name}"
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
    else

    end
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
end




