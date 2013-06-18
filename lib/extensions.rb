require 'date'
class Date

  def self.get_date_from_params(params)
    date = {
      year: params['birthday(1i)'].to_i,
      month: params['birthday(2i)'].to_i,
      day: params['birthday(3i)'].to_i
    }
    self.new date[:year],date[:month],date[:day]
  end
end