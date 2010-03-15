window.a = {};
window.onload = function() {
		a["search_condition[highways][]"] = document.forms[0]["search_condition[highways][]"];
    left_list = document.forms[0]["highways[highway]"];
		right_list = document.forms[0]["search_condition[highways][]"];

};
function add_h() {
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

function del_h() {
    var right_sel = right_list.options.selectedIndex;

    if (right_sel != -1) {
        var right_val = right_list.options[right_sel].value;

        right_list.remove(right_sel);

        metro[right_val][1] = 0;
        if (mimg[right_val])
            metromap.removeChild(mimg[right_val]);
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
