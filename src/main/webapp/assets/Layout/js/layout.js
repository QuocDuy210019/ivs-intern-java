/*
 * Constant
 */
var DATE_FORMAT = "dd/mm/yyyy";
var EVENT_ID_INDEX = 'index';
var EVENT_ID_SEARCH = 'search';
var EVENT_ID_RESET = 'reset';
var EVENT_ID_PAGINATE = 'paginate';

/*
 * Initial Event
 */
$(function() {
    if (eventId === "paginate" || eventId === "search") {
        if ($('#paginationAnchor').length > 0) {
            window.location.hash = '#paginationAnchor';
        }
    }
    initDatePicker();
    initICheck();
    initFileInput();
    initListControls();
    initScrollToTopButton();
    createScrollBarForLargeTable();

    if ($('.form-group.has-error').length > 0) {
        var target = $($('.form-group.has-error')[0]).find('input:not(input[type=hidden]), select, textarea');
        if (target.length > 0) {
            $(target[0]).focus();
        }
    }

    $(window).resize(function() {
        createScrollBarForLargeTable();
    });

});

/*Theo dõi trạng thái sidebar*/
function setMenuStatus() {
    var activeTabModuleId = "";
    if ($('.tab-pane.active').length > 0) {
        var activeTabId = $('.tab-pane.active').attr('id');
        activeTabModuleId = activeTabId.substring(activeTabId.length - 1);
    }
    $('#activeTabModuleId').val(activeTabModuleId);
    if ($('#menuStatusBackup').length > 0) {
        $('#menuStatus').val($('#menuStatusBackup').val());
    } else {
        $('#menuStatus').val($('body').hasClass('sidebar-collapse') ? 'sidebar-collapse' : '');
    }
}

/*function submitAction() {
    if (submitted) {
        return;
    }
    submitted = true;
    $.LoadingOverlay("show");
    setMenuStatus();

    var form = $('form');
    var url = './' + arguments[0]
    var params = '';
    for (var i = 1; i < arguments.length; i += 2) {
        params += (params.length > 0 ? '&' : '?') + arguments[i] + '=' + encodeURI(arguments[i + 1]);
    }

    form.attr('action', url + params);
    form.submit();
}

function submitConfirm() {
    if (submitted) {
        return;
    }
    setMenuStatus();
    if (confirm(arguments[1])) {
        submitted = true;
        $.LoadingOverlay("show");
        var form = $('form');
        var url = './' + arguments[0]
        var params = '';
        for (var i = 2; i < arguments.length; i += 2) {
            params += (params.length > 0 ? '&' : '?') + arguments[i] + '=' + encodeURI(arguments[i + 1]);
        }
        form.attr('action', url + params);
        form.submit();
    }
}

function submitDownload() {
    setMenuStatus();

    var form = $('form');
    var url = './' + arguments[0]
    var params = '';
    for (var i = 1; i < arguments.length; i += 2) {
        params += (params.length > 0 ? '&' : '?') + arguments[i] + '=' + encodeURI(arguments[i + 1]);
    }

    form.attr('action', url + params);
    form.submit();
}

function submitConfirmDownload() {
    setMenuStatus();
    if (confirm(arguments[1])) {
        var form = $('form');
        var url = './' + arguments[0]
        var params = '';
        for (var i = 2; i < arguments.length; i += 2) {
            params += (params.length > 0 ? '&' : '?') + arguments[i] + '=' + encodeURI(arguments[i + 1]);
        }
        form.attr('action', url + params);
        form.submit();
    }
}*/

/*
 * Create date-picker.
 */
function initDatePicker(selector) {
    selector = selector || ".datepicker";
    $.each($('input[type="text"]' + selector), function(index, element) {
        var target = $(element);
        target.datepicker({
            autoclose: true,
            format: DATE_FORMAT,
            todayBtn: true,
            todayHighlight: true,
            onClose: function(dateText, inst) {
                $(this).css('color', 'black')
            }
        }).on("hide", function() {
            target.blur()
        });

        target.inputmask(DATE_FORMAT, {
            "placeholder": DATE_FORMAT
        });
        //target.attr("placeholder", DATE_FORMAT);
        target.focus(function() {
            $(this).select();
        });
        if (!target.hasClass("list-filter")) {
            target.wrap("<div class='input-group'>")
            target.before("<span class='input-group-addon'><i class='fa fa-calendar'></i></span>");
        } else {
            target.attr("placeholder", "Any value");
        }
    });
}

/*
 * Apply iCheck style for check boxes and radio buttons.
 */
function initICheck(selector) {
    selector = selector || "";

    $('input[type="checkbox"]' + selector).iCheck({
        checkboxClass: 'icheckbox_square-blue',
        disabledCheckboxClass: 'icheck-disabled-checkbox'
    });

    $('input[type="radio"]' + selector).iCheck({
        radioClass: 'iradio_square-blue',
        disabledRadioClass: 'icheck-disabled-radio'
    });
}

/*
 * Apply style for file input.
 */
function initFileInput() {
    $('input[type=file]').fileinput({
        showUpload: false,
        showPreview: false,
        allowedFileExtensions: ['txt', 'csv'],
        fileActionSettings: {
            indicatorNew: '<i class="glyphicon glyphicon-ok text-success"></i>',
            indicatorNewTitle: 'Ready for upload',
            indicatorError: '<i class="glyphicon glyphicon-remove text-danger"></i>',
            indicatorErrorTitle: 'Not ready for upload',
        },
    });
}

function initListControls() {
    $('.list-filter').keypress(function(e) {
        if ($(this).prop('tagName').toLowerCase() === 'select') {
            e.preventDefault();
        }
        if (e.which == 13) {
            submitAction(EVENT_ID_SEARCH);
        }
    });

    $('.list-filter').focus(function() {
        $(this).select();
    });

    $('.btn-search').click(function(e) {
        e.preventDefault();
        submitAction(EVENT_ID_SEARCH);
    });

    $('.btn-reset').click(function(e) {
        e.preventDefault();
        submitAction(EVENT_ID_RESET);
    });

    $('ul.pagination li:not(.active):not(.disabled) a').click(function() {
        submitAction(EVENT_ID_PAGINATE + "?page=" + $(this).text());
    });

    var activePage = parseInt($('ul.pagination li.active a:first').text());
    $('.btn-previous').click(function() {
        submitAction(EVENT_ID_PAGINATE + "?page=" + (activePage - 1));
    });

    $('.btn-next').click(function() {
        submitAction(EVENT_ID_PAGINATE + "?page=" + (activePage + 1));
    });
}

function createScrollBarForLargeTable() {
    if ($('.summary-table').length == 0) {
        return;
    }
    var summaryContent = $('#summary-content');
    var displayableWidth = $('.content').width() - 30;
    var displayableHeight = $(window).height() - 70;
    var tableWidth = $('.summary-table').width();
    var tableHeight = summaryContent.height();

    if (tableWidth > displayableWidth) {
        var hasVerticalScrollBar = false;
        if (tableHeight > displayableHeight) {
            summaryContent.slimScroll({
                width: displayableWidth + 'px',
                height: displayableHeight + 'px',
                size: '12px',
                distance: '0px'
            });
            hasVerticalScrollBar = true;
        }

        summaryContent.slimscrollH({
            position: 'bottom',
            height: (tableHeight < displayableHeight ? tableHeight : displayableHeight) + 'px',
            width: displayableWidth + 'px',
            size: '12px',
            distance: hasVerticalScrollBar ? '2px' : '0px'
        });

        $($('.content .slimScrollDiv')[0]).css('border', '1px solid #808080');
        $('.summary-table').css('margin', '-1px -1px 21px -1px');
        $('.summary-table:last-child').css('margin', '-1px');

        window.location.hash = "#summary-anchor";
    } else {
        summaryContent.css('width', 'auto');
        summaryContent.css('height', 'auto');
        $('.summary-table').css('margin', '0 0 20px 0');
        $('.summary-table:last-child').css('margin', '0');

        // Remove horizontal scroll bar
        var slimScrollDiv = $('.content .slimScrollDiv');
        if (slimScrollDiv.length == 2) {
            $(slimScrollDiv[1]).replaceWith(function() {
                return $('#summary-content', this);
            });
        }

        // Remove vertical scroll bar
        slimScrollDiv = $('.content .slimScrollDiv');
        if (slimScrollDiv.length == 1) {
            $(slimScrollDiv[0]).replaceWith(function() {
                return $('#summary-content', this);
            });
        }

    }
}

function initScrollToTopButton() {
    var slideToTop = $("<div />");
    slideToTop.html('<i class="fa fa-chevron-up"></i>');
    slideToTop.css({
        position: 'fixed',
        bottom: '20px',
        right: '25px',
        width: '40px',
        height: '40px',
        color: '#eee',
        'font-size': '',
        'line-height': '40px',
        'text-align': 'center',
        'background-color': '#222d32',
        cursor: 'pointer',
        'border-radius': '5px',
        'z-index': '99999',
        opacity: '.7',
        'display': 'none'
    });
    slideToTop.on('mouseenter', function() {
        $(this).css('opacity', '1');
    });
    slideToTop.on('mouseout', function() {
        $(this).css('opacity', '.7');
    });
    $('.wrapper').append(slideToTop);
    $(window).scroll(function() {
        if ($(window).scrollTop() >= 150) {
            if (!$(slideToTop).is(':visible')) {
                $(slideToTop).fadeIn(500);
            }
        } else {
            $(slideToTop).fadeOut(500);
        }
    });
    $(slideToTop).click(function() {
        $("html,body").animate({
            scrollTop: 0
        }, 500);
    });
    $(".sidebar-menu li:not(.treeview) a").click(function() {
        var $this = $(this);
        var target = $this.attr("href");
        if (typeof target === 'string') {
            $("html,body").animate({
                scrollTop: ($(target).offset().top) + "px"
            }, 500);
        }
    });
    // Skin switcher
    var current_skin = "skin-blue";
    $('#layout-skins-list [data-skin]').click(function(e) {
        e.preventDefault();
        var skinName = $(this).data('skin');
        $('body').removeClass(current_skin);
        $('body').addClass(skinName);
        current_skin = skinName;
    });
}

/*
 *  Auto Complete Zipcode
 */
function chooseZipCode(zip, addr1, addr2) {
    if ($('#' + zip + 'lastValue').length == 0) {
        $('#' + zip).after(
            '<input type="hidden" id="' + zip + 'lastValue" value="" />');
    }

    var pattern = new RegExp(/^[0-9]{6}$/);

    var value = $('#' + zip).val();

    if (value == $('#' + zip + "lastValue").val()) {
        return;
    } else {
        $('#' + zip + "lastValue").val(value);
    }

    if (!pattern.test(value)) {
        $('#' + addr1).val("");
        $('#' + addr2).val("");
        return;
    }

    var request = $.ajax({
        type: "POST",
        url: "/sms/sutil/sutilS01/index",
        dataType: 'json',
        data: {
            searchPostCode: value
        },
        success: function(data, b, c) {
            if (data.isSuccess) {
                if (data.postcodes.length > 1) {
                    makeModalDialog('<i class="fa fa-location-arrow"></i> Select Address', makeSelectAddressDialogBody(data));
                } else {
                    var address1Value = data.postcodes[0].buildingNumber + " " + data.postcodes[0].streetName;
                    var address2Value = data.postcodes[0].buildingName;
                    setAddress(addr1, address1Value, addr2, address2Value);
                }
            } else {
                alert(data.errorDetails + " (error code: " + data.errorCode + ")");
                $('#' + addr1).val("");
                $('#' + addr2).val("");
            }
        }
    });

    request.fail(function(jqXHR, textStatus) {
        alert("Request failed: " + textStatus);
    });

    function makeSelectAddressDialogBody(data) {
        var html = '<div class="table-responsive">' +
            '<table class="table table-bordered table-striped">' +
            '<thead>' +
            '<tr class="bg-aqua">' +
            '<th style="width:16%;"></th>' +
            '<th style="width:42%;">Address 1</th>' +
            '<th style="width:42%;">Address 2</th>' +
            '</tr>' +
            '</thead>' +
            '<tbody>'
        $.each(data.postcodes, function(index, zipData) {
            html += '<tr>' +
                '<td class="text-center">' +
                '<button type="button" id="btnSelect_' + index + '" class="btn btn-default" onclick="javascript:onSelectAddress(this,\'' + addr1 + '\',\'' + addr2 + '\')">Select</button>' +
                '</td>' +
                '<td id="address1_' + index + '">' + zipData.buildingNumber + " " + zipData.streetName + '</td>' +
                '<td id="address2_' + index + '">' + zipData.buildingName + '</td>' +
                '</tr>'
        });
        html += '</tbody></table>';
        return html;
    }
}

function onSelectAddress(selectButton, address1Id, address2Id) {
    var index = $(selectButton).attr('id').replace('btnSelect_', '');
    var address1Value = $('#address1_' + index).text();
    var address2Value = $('#address2_' + index).text();
    $('#modalDialog').modal('hide');
    setAddress(address1Id, address1Value, address2Id, address2Value);
}

function setAddress(address1Id, address1Value, address2Id, address2Value) {
    var address1 = $('#' + address1Id);
    var address2 = $('#' + address2Id);
    var blinkTime = 300;
    address1.fadeOut(blinkTime);
    address2.fadeOut(blinkTime);
    setTimeout(function() {
        address1.val(address1Value);
        address2.val(address2Value);
    }, blinkTime);
    address1.fadeIn(blinkTime);
    address2.fadeIn(blinkTime);
}

function makeModalDialog(title, bodyHtml) {
    var dialog = $('#modalDialog');
    if (dialog.length > 0) {
        $('#modalLabel').html(title);
        $('#modalBody').html(bodyHtml);
        $('#modalDialog').modal('show');
        return dialog;
    }
    var html = '<div class="modal fade" id="modalDialog" tabindex="-1" role="dialog" aria-labelledby="modalLabel">' +
        '<div class="modal-dialog modal-lg" role="document">' +
        '<div class="modal-content">' +
        '<div class="modal-header">' +
        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
        '<h4 class="modal-title" id="modalLabel">' + title + '</h4>' +
        '</div>' +
        '<div class="modal-body" id="modalBody">' +
        bodyHtml +
        '</div>' +
        '<div class="modal-footer">' +
        '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '</div>';

    $('body').append(html);

    dialog = $('#modalDialog');
    dialog.modal('show');

    return dialog;
}
/*
 *  Auto Swift Code
 */
function initAutoCompleteSwiftCode() {
    var jSwiftCode = $('input[name="swiftCode"]');
    var jBankName = $('input[name="bankName"]');
    jSwiftCode.autoComplete({
        minChars: 1,
        source: function(term, suggest) {
            term = term.toLowerCase();
            var choices = bankList;
            var suggestions = [];
            for (i = 0; i < choices.length; i++) {
                if ((choices[i][0] + ' ' + choices[i][1]).toLowerCase().indexOf(term) >= 0) {
                    suggestions.push(choices[i]);
                }
            }
            suggest(suggestions);
        },
        renderItem: function(item, search) {
            search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
            var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
            var html = '<div class="autocomplete-suggestion" data-swiftcode="' + item[0] + '" data-bankname="' + item[1] + '" data-val="' + search + '"><span class="autocomplete-swiftcode">' + item[0].replace(re, "<b>$1</b>") + '</span><span>' + item[1].replace(re, "<b>$1</b>") + '</span></div>';
            return html;
        },
        onSelect: function(e, term, item) {
            jSwiftCode.val(item.data('swiftcode'));
            jBankName.val(item.data('bankname'));
            jSwiftCode.focusout();
            return false;
        }
    });

    jSwiftCode.on('keyup change', function() {
        var value = jSwiftCode.val().toUpperCase();
        jSwiftCode.val(value);
        for (var i = 0; i < bankList.length; i++) {
            if (value == bankList[i][0]) {
                jBankName.val(bankList[i][1]);
                break;
            } else {
                jBankName.val("");
            }
        }
    });
}