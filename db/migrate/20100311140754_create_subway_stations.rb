class CreateSubwayStations < ActiveRecord::Migration
  def self.up
    create_table :subway_stations do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :subway_stations
  end

  def add_stations
    list = "Улица Подбельского;Черкизовская;Преображенская площадь;Сокольники;Красносельская;Комсомольская;Красные ворота;Чистые пруды;Лубянка;Охотный ряд;Библиотека имени Ленина;Кропоткинская;Парк Культуры;Фрунзенская;Спортивная;Воробьёвы горы;Университет;Проспект Вернадского;Юго-Западная ;Речной вокзал ;Водный стадион;Войковская;Сокол;Аэропорт;Динамо;Белорусская;Маяковская;Тверская;Театральная;Новокузнецкая;Павелецкая;Автозаводская;Коломенская;Каширская;Кантемировская;Царицыно;Орехово;Домодедовская;Красногвардейская ;Щёлковская ;Первомайская;Измайловская;Партизанская;Семеновская;Электрозаводская;Бауманская;Курская;Площадь Революции;Арбатская;Смоленская;Киевская;Парк Победы ;Александровский сад ;Арбатская;Смоленская;Киевская;Деловой центр;Студенческая;Кутузовская;Фили;Багратионовская;Филёвский парк;Пионерская;Кунцевская;Молодёжная;Крылатское ;Парк культуры ;Октябрьская;Добрынинская;Павелецкая;Таганская;Курская;Комсомольская;Проспект Мира;Новослободская;Белорусская;Краснопресненская;Киевская ;Медведково ;Бабушкинская;Свиблово;Ботанический сад;ВДНХ;Алексеевская;Рижская;Проспект Мира;Сухаревская;Тургеневская;Китай-город;Третьяковская;Октябрьская;Шаболовская;Ленинский проспект;Академическая;Новые Черёмушки;Профсоюзная;Калужская;Беляево;Коньково;Тёплый Стан;Ясенево;Битцевский парк ;Планерная ;Сходненская;Тушинская;Щукинская;Октябрьское поле;Полежаевская;Беговая;Улица 1905 года;Баррикадная;Пушкинская;Кузнецкий мост;Китай-город;Таганская;Пролетарская;Волгоградский проспект;Текстильщики;Кузьминки;Рязанский проспект;Выхино ;Третьяковская ;Марксистская;Площадь Ильича;Авиамоторная;Шоссе Энтузиастов;Перово;Новогиреево ;Алтуфьево ;Бибирево;Отрадное;Владыкино;Петровско-Разумовская;Тимирязевская;Дмитровская;Савёловская;Менделеевская;Цветной бульвар;Чеховская;Боровицкая;Полянка;Серпуховская;Тульская;Нагатинская;Нагорная;Нахимовский проспект;Севастопольская;Чертановская;Южная;Пражская;Улица Академика Янгеля;Аннино;Бульвар Дмитрия Донского ;Чкаловская ;Римская;Крестьянская застава;Дубровка;Кожуховская;Печатники;Волжская;Люблино;Братиславская;Марьино ;Каширская ;Варшавская;Каховская ;Бутовская линия лёгкого метро;Улица Старокачаловская ;Улица Скобелевская;Бульвар Адмирала Ушакова;Улица Горчакова;Бунинская аллея ;Международная ;Славянский бульвар;Троице-Лыково;Строгино;Мякининская;Волоколамская;Митино;Сретенский бульвар;Трубная;Достоевская;Марьина роща;Жулебино;Новокосино;Братеево;Зябликово;Борисово;Шипиловская;Битцевский парк ;Аэропорт Внуково ;Неработающие и закрытые станции;Волоколамская ;Первомайская;Калужская;Площадь Гагарина".split(";")
    list.each do |el|
      (SubwayStation.new(el)).save()
    end
  end

end
