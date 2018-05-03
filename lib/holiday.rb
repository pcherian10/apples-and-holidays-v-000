require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the Christmas AND the New Year's arrays
    holiday_hash.each do |season, holiday_data|
      holiday_data.each do |holidays, supplies|
        supplies << supply if(holidays == :christmas || holidays == :new_years)
      end
   end
   holiday_hash
end


def add_supply_to_memorial_day (holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
    holiday_hash.each do |season, holiday_data|
      holiday_data.each do |holidays, supplies|
          supplies << supply if(holidays == :memorial_day)
      end
    end
    holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season] = {holiday_name => supply_array}
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

    holiday_supplies.each do |season, holiday_data|
        season = season.to_s
        puts season.capitalize+":"
        holiday_data.each do |holiday, supplies|
          holiday = holiday.to_s.split("_")
          holiday = holiday.collect {|holiday| holiday.capitalize}
          holiday = holiday.join(" ")
          puts "  #{holiday}: #{supplies.join(", ")}"
        end
      end

end

def all_holidays_with_bbq(holiday_hash)
    result = []
    holiday_hash.each do |season, holiday_data|
      holiday_data.each do |holiday, supplies|
        result << holiday if supplies.include? ("BBQ")
      end
    end
  result
end
