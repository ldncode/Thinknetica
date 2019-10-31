class Train
  attr_accessor :speed, :carriages
  attr_reader :number, :type, :route, :current_station

  def initialize(number, type)
    @speed = 0
    @number = number
    @type = type
  end

  def add_wagon
    if speed.zero?
      @carriages += 1
    else
      puts 'Поезд в движении'
    end
  end

  def unhook
    if speed.zero?
      @carriages -= 1
    else
      puts 'Поезд в движении'
    end
  end

  def add_route(route)
    @route = route
    @current_station = route.start_station
    @current_station.arrival(train)
  end

  def station_index
    @route.all_stations.index(current_station)
  end

  def  next_station
    @route.all_stations[@station_index + 1]
  end

  def prev_station
    if station_index != 0
      @route.all_stations[@station_index - 1]
    end
  end

  def forward
    if next_station
      @current_station.out(train)
      @current_station = next_station
      @current_station.arrival(train)
    else
      puts 'Поезд на конечной станции'
    end
  end

  def backward
    if prev_station
      @current_station.out(train)
      @current_station = prev_station
      @current_station.arrival(train)
    else
      puts 'Поезд на начальной станции'
    end
  end
end

