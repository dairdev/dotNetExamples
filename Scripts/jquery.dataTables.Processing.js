jQuery.fn.dataTableExt.oApi.fnProcessingIndicator = function (oSettings, onoff) {
    if (typeof (onoff) == 'undefined') {
        onoff = true;
    }
    this.oApi._fnProcessingDisplay(oSettings, onoff);
}; /* File Created: March 10, 2014 */