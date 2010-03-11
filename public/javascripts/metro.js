window.a = {};
window.onload = function() {
    a.metro_s = document.forms[0].metro_s;
    a.metromap = document.getElementById("metro_map");
		//    a["metro[]"] = document.forms[0]["metro[]"];
		//    a["m_s"] = document.forms[0]["m_s"];
		a["search_condition[nearest_subway_stations][]"] = document.forms[0]["search_condition[nearest_subway_stations][]"];
    left_list = document.forms[0]["metro_s"];
		//    right_list = document.forms[0]["metro[]"];
    //right_list = document.forms[0]["m_s"];
		right_list = document.forms[0]["search_condition[nearest_subway_stations][]"];

};
metro = new Array();
metro[85] = new Array("Авиамоторная",0,509,310);metro[13] = new Array("Автозаводская",0,390,491);metro[97] = new Array("Академическая",0,191,585);metro[53] = new Array("Александровский сад",0,223,409);metro[105] = new Array("Алексеевская",0,390,110);metro[135] = new Array("Алтуфьево",0,316,60);metro[156] = new Array("Аннино",0,290,665);metro[50] = new Array("Арбатская",0,207,393);metro[5] = new Array("Аэропорт",0,191,100);metro[109] = new Array("Бабушкинская",0,390,70);metro[57] = new Array("Багратионовская",0,52,297);metro[71] = new Array("Баррикадная",0,179,260);metro[47] = new Array("Бауманская",0,509,229);metro[69] = new Array("Беговая",0,176,199);metro[7] = new Array("Белорусская",0,225,239);metro[93] = new Array("Беляево",0,191,625);metro[131] = new Array("Бибирево",0,316,70);metro[30] = new Array("Библиотека Ленина",0,235,408);metro[120] = new Array("Боровицкая",0,241,419);metro[107] = new Array("Ботанический сад",0,390,90);metro[145] = new Array("Братиславская",0,407,625);metro[195] = new Array("Бунинская аллея",0,290,755);metro[106] = new Array("ВДНХ",0,390,100);metro[16] = new Array("Варшавская",0,365,537);metro[24] = new Array("Вернадского проспект",0,87,645);metro[112] = new Array("Владыкино",0,316,90);metro[2] = new Array("Водный стадион",0,191,70);metro[3] = new Array("Войковская",0,191,80);metro[77] = new Array("Волгоградский проспект",0,490,624);metro[142] = new Array("Волжская",0,407,605);metro[203] = new Array("Волоколамская",0,17,198);metro[157] = new Array("Воробьевы горы",0,87,625);metro[198] = new Array("Выставочная",0,128,348);metro[81] = new Array("Выхино",0,490,664);metro[6] = new Array("Динамо",0,191,110);metro[115] = new Array("Дмитровская",0,265,179);metro[132] = new Array("Добрынинская",0,290,487);metro[21] = new Array("Домодедовская",0,390,655);metro[164] = new Array("Донского Дмитрия бульвар",0,290,697);metro[140] = new Array("Дубровка",0,407,575);metro[43] = new Array("Измайловская",0,509,189);metro[94] = new Array("Калужская",0,191,615);metro[18] = new Array("Кантемировская",0,390,625);metro[17] = new Array("Каховская",0,302,594);metro[15] = new Array("Каширская",0,390,513);metro[52] = new Array("Киевская",0,158,377);metro[74] = new Array("Китай-город",0,354,349);metro[144] = new Array("Кожуховская",0,407,584);metro[14] = new Array("Коломенская",0,390,501);metro[35] = new Array("Комсомольская",0,386,259);metro[92] = new Array("Коньково",0,191,635);metro[22] = new Array("Красногвардейская",0,390,671);metro[133] = new Array("Краснопресненская",0,187,268);metro[36] = new Array("Красносельская",0,490,99);metro[34] = new Array("Красные ворота",0,372,273);metro[139] = new Array("Крестьянская застава",0,456,439);metro[29] = new Array("Кропоткинская",0,210,435);metro[62] = new Array("Крылатское",0,17,228);metro[73] = new Array("Кузнецкий мост",0,317,312);metro[79] = new Array("Кузьминки",0,490,644);metro[60] = new Array("Кунцевская",0,17,262);metro[48] = new Array("Курская",0,421,317);metro[55] = new Array("Кутузовская",0,72,317);metro[98] = new Array("Ленинский проспект",0,191,575);metro[32] = new Array("Лубянка",0,325,320);metro[143] = new Array("Люблино",0,407,614);metro[87] = new Array("Марксистская",0,418,397);metro[146] = new Array("Марьино",0,407,635);metro[8] = new Array("Маяковская",0,229,265);metro[110] = new Array("Медведково",0,390,60);metro[197] = new Array("Международная",0,128,338);metro[117] = new Array("Менделеевская",0,265,212);metro[196] = new Array("Митино",0,17,187);metro[61] = new Array("Молодежная",0,17,237);metro[202] = new Array("Мякининская",0,17,208);metro[124] = new Array("Нагатинская",0,290,558);metro[125] = new Array("Нагорная",0,290,568);metro[126] = new Array("Нахимовский проспект",0,290,578);metro[82] = new Array("Новогиреево",0,509,278);metro[11] = new Array("Новокузнецкая",0,333,399);metro[134] = new Array("Новослободская",0,265,224);metro[89] = new Array("Новоясеневская",0,191,667);metro[95] = new Array("Новые черемушки",0,191,605);metro[100] = new Array("Октябрьская",0,241,479);metro[67] = new Array("Октябрьское поле",0,176,179);metro[20] = new Array("Орехово",0,390,645);metro[111] = new Array("Отрадное",0,316,80);metro[31] = new Array("Охотный Ряд",0,289,356);metro[12] = new Array("Павелецкая",0,384,451);metro[28] = new Array("Парк Культуры",0,196,449);metro[165] = new Array("Парк Победы",0,105,376);metro[44] = new Array("Партизанская",0,509,199);metro[42] = new Array("Первомайская",0,509,179);metro[83] = new Array("Перово",0,509,289);metro[113] = new Array("Петровско-Разумовская",0,290,130);metro[141] = new Array("Печатники",0,407,595);metro[59] = new Array("Пионерская",0,32,277);metro[63] = new Array("Планерная",0,176,139);metro[86] = new Array("Площадь Ильича",0,456,362);metro[49] = new Array("Площадь революции",0,307,374);metro[68] = new Array("Полежаевская",0,176,189);metro[121] = new Array("Полянка",0,290,469);metro[130] = new Array("Пражская",0,290,645);metro[38] = new Array("Преображенская площадь",0,490,80);metro[76] = new Array("Пролетарская",0,456,451);metro[136] = new Array("Проспект Мира",0,353,234);metro[96] = new Array("Профсоюзная",0,191,595);metro[72] = new Array("Пушкинская",0,223,303);metro[1] = new Array("Речной вокзал",0,191,60);metro[104] = new Array("Рижская",0,390,120);metro[138] = new Array("Римская",0,456,374);metro[80] = new Array("Рязанский проспект",0,490,654);metro[116] = new Array("Савеловская",0,265,189);metro[108] = new Array("Свиблово",0,390,80);metro[127] = new Array("Севастопольская",0,290,594);metro[45] = new Array("Семеновская",0,509,209);metro[122] = new Array("Серпуховская",0,290,499);metro[192] = new Array("Скобелевская улица",0,290,725);metro[201] = new Array("Славянский бульвар",0,63,333);metro[51] = new Array("Смоленская",0,192,378);metro[4] = new Array("Сокол",0,191,90);metro[37] = new Array("Сокольники",0,490,90);metro[26] = new Array("Спортивная",0,87,615);metro[200] = new Array("Строгино",0,17,218);metro[54] = new Array("Студенческая",0,82,327);metro[102] = new Array("Сухаревская",0,353,265);metro[64] = new Array("Сходненская",0,176,149);metro[75] = new Array("Таганская",0,414,409);metro[9] = new Array("Тверская",0,229,293);metro[10] = new Array("Театральная",0,298,365);metro[78] = new Array("Текстильщики",0,490,634);metro[91] = new Array("Теплый стан",0,191,645);metro[114] = new Array("Тимирязевская",0,265,169);metro[88] = new Array("Третьяковская",0,322,399);metro[199] = new Array("Трубная",0,297,243);metro[123] = new Array("Тульская",0,290,548);metro[103] = new Array("Тургеневская",0,353,303);metro[65] = new Array("Тушинская",0,176,159);metro[70] = new Array("Улица 1905 года",0,176,209);metro[194] = new Array("Улица Горчакова",0,290,745);metro[40] = new Array("Улица Подбельского",0,490,60);metro[25] = new Array("Университет",0,87,635);metro[193] = new Array("Ушакова адмирала бульвар",0,290,736);metro[58] = new Array("Филевский парк",0,42,287);metro[56] = new Array("Фили",0,62,307);metro[27] = new Array("Фрунзенская",0,87,605);metro[19] = new Array("Царицыно",0,390,635);metro[118] = new Array("Цветной бульвар",0,285,243);metro[39] = new Array("Черкизовская",0,490,70);metro[128] = new Array("Чертановская",0,290,625);metro[119] = new Array("Чеховская",0,235,303);metro[33] = new Array("Чистые пруды",0,353,291);metro[137] = new Array("Чкаловская",0,423,329);metro[99] = new Array("Шаболовская",0,191,565);metro[84] = new Array("Шоссе энтузиастов",0,509,298);metro[41] = new Array("Щелковская",0,509,169);metro[66] = new Array("Щукинская",0,176,169);metro[46] = new Array("Электрозаводская",0,509,219);metro[23] = new Array("Юго-Западная",0,87,660);metro[129] = new Array("Южная",0,290,635);metro[155] = new Array("Янгеля Академика",0,290,655);metro[90] = new Array("Ясенево",0,191,655);mimg = new Array();
for (i = 0; i < 300; i++)
    if (metro[i]) {
        mimg[i] = document.createElement("IMG");
        mimg[i].src = "/images/pp.gif";
        mimg[i].style.position = "absolute";
        mimg[i].style.left = metro[i][2];
        mimg[i].style.top = metro[i][3];
        mimg[i].style.width = 9;
        mimg[i].style.height = 9;
        mimg[i].style.cursor = "hand";
        mimg[i].onclick = (function(idx) { return function() { checkpoint(idx) }; })(i);
    }

function add_m() {
    var left_sel = left_list.options.selectedIndex;

    if (left_sel != -1) {
        var src = left_list.options[left_sel];
        var len_right = right_list.options.length;

        var is_added = false;
        for (i = 0; i < len_right; i++)
            if (right_list.options[i].value == src.value) {
                is_added = true;
                break;
            }

        if (!is_added)
            right_list.options[len_right] = new Option(src.text, src.value);

        metro[src.value][1] = 1;
        if (mimg[src.value])
            a.metromap.appendChild(mimg[src.value]);
    }
}

function del_m() {
    var right_sel = right_list.options.selectedIndex;

    if (right_sel != -1) {
        var right_val = right_list.options[right_sel].value;

        right_list.remove(right_sel);

        metro[right_val][1] = 0;
        if (mimg[right_val])
            metromap.removeChild(mimg[right_val]);
    }
}

function checkpoint(map_sel) {
    metro[map_sel][1] = 0 + !metro[map_sel][1]; // toggle

    var right_len = right_list.options.length;

    if (metro[map_sel][1] == 1) {
       var left_idx = -1;
       for (i = 0; i < left_list.options.length; i++)
           if (left_list.options[i].value == map_sel) {
               left_idx = i;
               break;
           }

       if (left_idx != -1) {
           right_list.options[right_len] = new Option(left_list.options[left_idx].text, left_list.options[left_idx].value);
           if (mimg[map_sel])
               metromap.appendChild(mimg[map_sel]);
       }
    }
    else {
        if (mimg[map_sel])
            metromap.removeChild(mimg[map_sel]);

        var right_idx = -1;
        for (i = 0; i < right_len; i++)
           if (right_list.options[i].value == map_sel) {
               right_idx = i;
               break;
           }

        if (right_idx != -1)
            right_list.remove(right_idx);
    }
}

function fsubmit() {
    left_list.value = null;
    for (i = 0; i < right_list.options.length; i++)
        right_list.options[i].selected = true;
    document.forms[0].submit();
}

function freset() {
    while (right_list.options.length > 0) {
        var right_val = right_list.options[0].value;

        right_list.remove(0);

        metro[right_val][1] = 0;
        if (mimg[right_val])
            metromap.removeChild(mimg[right_val]);
    }
}
