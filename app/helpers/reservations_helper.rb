module ReservationsHelper

  AM_TIMES = ['9', '10', '11', '12']
  PM_TIMES = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

  def date_description(plus_days)
    time_to_count = DateTime.now + plus_days
    time_to_count.strftime('%d.%m.%Y')
  end

  def day_description(plus_days)
    time_to_count = DateTime.now + plus_days
    case time_to_count.cwday
      when 1
        'Monday'
      when 2
        'Tuesday'
      when 3
        'Wednesday'
      when 4
        'Thursday'
      when 5
        'Friday'
      when 6
        'Saturday'
      when 7
        'Sunday'
      else
    end
  end

  def am_time(index)
    AM_TIMES[index]
  end

  def pm_time(index)
    PM_TIMES[index]
  end

  def am_times_count
    AM_TIMES.size
  end

  def pm_times_count
    PM_TIMES.size
  end

  def times_count
    am_times_count + pm_times_count
  end

  def times_supported_count
    AM_TIMES.size + PM_TIMES.size
  end
end
