class RentTimeTypes
  @@RENT_TIME_TYPES = [
                 ["любой срок аренды",""],
                 ["короткий срок аренды","short"],
                 ["подневная аренда","day"],
                 ["длительный срок аренды","long"],
                 ["от месяца и более","from_month"],
                 ["сезонная сдача","season"],
                ]
  def self.get_rent_time_types
    @@RENT_TIME_TYPES
  end
end
