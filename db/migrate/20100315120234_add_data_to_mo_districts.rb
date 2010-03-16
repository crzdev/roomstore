class AddDataToMoDistricts < ActiveRecord::Migration
  def self.up
    list = "Балашиха городской округ;Бронницы городской округ;Волоколамский район;Воскресенский район;Дзержинский городской округ;Дмитровский район;Долгопрудный городской округ;Домодедово городской округ;Егорьевский район;Железнодорожный городской округ;Жуковский городской округ;Зарайский район;Звенигород городской округ;Ивантеевка городской округ;Истринский район;Каширский район;Климовск городской округ;Клинский район;Коломенский район;Коломна городской округ;Королев городской округ;Котельники городской округ;Красноармейск городской округ;Красногорский район;Краснознаменск городской округ;Ленинский район;Лобня городской округ;Лосино-Петровский городской округ;Лотошинский район;Луховицкий район;Лыткарино городской округ;Люберецкий район;Можайский район;Мытищинский район;Наро-Фоминский район;Ногинский район;Одинцовский район;Озерский район;Орехово-Зуевский район;Павлово-Посадский район;Подольск городской округ;Подольский район;Поселок Восход городской округ;Поселок Молодежный городской округ;Пушкинский район;Пущино городской округ;Раменский район;Реутов городской округ;Рошаль городской округ;Рузский район;Сергиево-Посадский район;Серебряно-Прудский район;Серпухов городской округ;Серпуховский район;Солнечногорский район;Ступинский район;Талдомский район;Троицк городской округ;Фрязино городской округ;Химки городской округ;Черноголовка городской округ;Чеховский район;Шатурский район;Шаховской район;Щелковский район;Щербинка городской округ;Электрогорск городской округ;Электросталь городской округ;Юбилейный городской округ".split(";")
    list.each do |el|
      (MoDistrict.new(:name => el)).save
    end
  end

  def self.down
  end
end
