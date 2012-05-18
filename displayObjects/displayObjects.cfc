<cfcomponent extends="mura.plugin.pluginGenericEventHandler" output="false"><cfscript>
public any function dspMuraGCalObject(required struct $){
	
	var oParams = $.event('objectParams');
	var str = "";
	var strCalsColors = "";
	var i = 1;
	var arrSources = oParams.GCalID;
	var arrColors = oParams.GCalColor;
	
	// param checkboxes
	var defaultParams = {
		GCalTitle=0,
		GCalDate=0,
		GCalNavButtons=0,
		GCalTabs=0,
		GCalTz=0,
		GCalPrintIcon=0,
		GCalBorder=0
	};
	for ( i in defaultParams ) {
		if ( not structkeyexists(oParams, i) ) oParams[i] = defaultParams[i];
	}
	
	if ( !isarray(arrSources) ) arrSources = listtoarray(oParams.GCalID, ",| ");
	if ( !isarray(arrColors) ) arrColors = listtoarray(oParams.GCalColor, ",| ");

	for ( i=1; i lte arraylen(arrSources); i=i+1 ) {
		if ( arraylen(arrColors) lt i ) arrayappend(arrColors, arrColors[1]);
		strCalsColors = strCalsColors & '&amp;src=' & urlencodedformat(arrSources[i]) & '&amp;color=' & urlencodedformat(arrColors[i]);
	}
	str = '<iframe class="MuraGCal2_iframe" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="true" src="https://www.google.com/calendar/embed?showCalendars=0' & strCalsColors & '&amp;mode=' & oParams.GCalMode & '&amp;width=' & oParams.GCalWidth & '&amp;height=' & oParams.GCalHeight & '&amp;wkst=' & oParams.GCalWeekStart;
	if ( len(trim(oParams.GCalLang)) ) str = str & '&amp;hl=' & urlencodedformat(oParams.GCalLang);
	if ( not val(oParams.GCalTitle) ) {
		str = str & '&amp;showTitle=0';
	}
	else {
		if ( len(trim(oParams.GCalName)) ) str = str & '&amp;title=' & urlencodedformat(trim(oParams.GCalName));
	}
	if ( not val(oParams.GCalDate) ) str = str & '&amp;showDate=0';
	if ( not val(oParams.GCalNavButtons) ) str = str & '&amp;showNav=0';
	if ( not val(oParams.GCalTabs) ) str = str & '&amp;showTabs=0';
	if ( not val(oParams.GCalTz) ) str = str & '&amp;showTz=0';
	if ( not val(oParams.GCalPrintIcon) ) str = str & '&amp;showPrint=0';
	str = str & '" width="' & oParams.GCalWidth & '" height="' & oParams.GCalHeight & '" style="margin:0 0 30px;';
	if ( val(oParams.GCalBorder) ) {
		str = str & 'border:1px solid ##777;';
	}
	else {
		str = str & 'border-width:0;';
	}
	str = str & 'float:';
	if ( listfindnocase("left,right", oParams.GCalPosition) ) {
		str = str & lcase(oParams.GCalPosition) & ';';
	}
	else {
		str = str & 'none !important; clear:both;';
	}
	str = str & '"></iframe>';
	if ( oParams.GCalPosition eq 'Center' ) str = '<div style="margin:0 auto;">' & trim(str) & '</div>';
	
	return str;
}
</cfscript></cfcomponent>