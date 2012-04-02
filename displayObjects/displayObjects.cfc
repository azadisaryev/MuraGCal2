<cfcomponent extends="mura.plugin.pluginGenericEventHandler" output="no"><cfscript>
public any function dspMuraGCalObject($){
	
	var oParams = $.event('objectParams');
	var str = "";
	var strCalsColors = "";
	var i = 1;
	var arrSources = listtoarray(oParams.GCalID, "|");
	var arrColors = listtoarray(oParams.GCalColor, "|");
	
	for ( i=1; i lte arraylen(arrSources); i=i+1 ) {
		if ( arraylen(arrColors) lt i ) arrayappend(arrColors, arrColors[1]);
		strCalsColors = strCalsColors & '&amp;src=' & urlencodedformat(arrSources[i]) & '&amp;color=' & urlencodedformat(arrColors[i]);
	}
	str = '<iframe class="MuraGCal_iframe" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="true" src="https://www.google.com/calendar/embed?showCalendars=0&amp;showTz=0' & strCalsColors & '&amp;mode=' & oParams.GCalMode & '&amp;width=' & oParams.GCalWidth & '&amp;height=' & oParams.GCalHeight & '&amp;wkst=' & oParams.GCalWeekStart & '&amp;bgcolor=' & urlencodedformat(oParams.GCalBgColor);
	if ( not val(oParams.GCalTitle) ) {
		str = str & '&amp;showTitle=0';
	}
	else {
		if ( len(trim(oParams.GCalName)) ) str = str & '&amp;title=' & urlencodedformat(trim(oParams.GCalName));
	}
	if ( not val(oParams.GCalDate) ) str = str & '&amp;showDate=0';
	if ( not val(oParams.GCalTabs) ) str = str & '&amp;showTabs=0';
	if ( not val(oParams.GCalNavButtons) ) str = str & '&amp;showNav=0';
	if ( not val(oParams.GCalPrintIcon) ) str = str & '&amp;showPrint=0';
	str = str & '" width="' & oParams.GCalWidth & '" height="' & oParams.GCalHeight & '" frameborder="0" scrolling="no" style="margin:0;';
	if ( val(oParams.GCalBorder) ) {
		str = str & 'border:1px solid ##777;';
	}
	else {
		str = str & 'border-width:0;';
	}
	str = str & 'float:';
	if ( oParams.GCalPosition eq 'Left' or oParams.GCalPosition eq 'Right' ) {
		str = str & lcase(oParams.GCalPosition) & ';';
	}
	else {
		str = str & 'none !important; clear:both;';
	}
	str = str & '"></iframe>';
	// for future use - not used atm
	//if ( len(trim(oParams.GCalFooter)) ) str = str & '<div class="MuraGCal_footer" style="clear:both;">' & trim(oParams.GCalFooter) & '</div>';
	if ( oParams.GCalPosition eq 'Center' ) str = '<div class="MuraGCal" style="margin:0 auto;">' & trim(str) & '</div>';
	
	return str;
}
</cfscript></cfcomponent>