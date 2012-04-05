<cfprocessingdirective pageencoding="UTF-8" suppresswhitespace="yes">
<cfscript>
$=application.serviceFactory.getBean("MuraScope").init(session.siteID);

params=$.event("params");

if ( isJSON(params) ) {
	params=deserializeJSON(params);
}
else {
	params=structNew();
}

if ( not structKeyExists(params,"GCalID") ) params.GCalID="";
if ( not structKeyExists(params,"GCalName") ) params.GCalName="";
if ( not structKeyExists(params,"GCalWidth") ) params.GCalWidth=300;
if ( not structKeyExists(params,"GCalHeight") ) params.GCalHeight=300;
if ( not structKeyExists(params,"GCalMode") ) params.GCalMode="AGENDA";
if ( not structKeyExists(params,"GCalPosition") ) params.GCalPosition="Center";
if ( not structKeyExists(params,"GCalTitle") ) params.GCalTitle='0';
if ( not structKeyExists(params,"GCalDate") ) params.GCalDate=0;
if ( not structKeyExists(params,"GCalNavButtons") ) params.GCalNavButtons=0;
if ( not structKeyExists(params,"GCalTabs") ) params.GCalTabs=0;
if ( not structkeyexists(params,"GCalTz") ) params.GCalTz=0;
if ( not structKeyExists(params,"GCalPrintIcon") ) params.GCalPrintIcon=0;
if ( not structKeyExists(params,"GCalBorder") ) params.GCalBorder=0;
if ( not structKeyExists(params,"GCalWeekStart") ) params.GCalWeekStart=1;
if ( not structKeyExists(params,"GCalColor") ) params.GCalColor="##36c";
if ( not structkeyexists(params,"GCalLang") ) params.GCalLang="";

// convert lists of calendar IDs (GCalID param) and calendar events colors (GCalColor param) to arrays for easier manipulation/looping
// TODO: check if params structure is an OK place to store these, or if it affects data saved with the object in some way... Maybe create a diff struct to store these?
params.arr_gcalid = listtoarray(params.GCalID, "|");
params.arr_gcalcolor = listtoarray(params.GCalColor, "|");
</cfscript>
<cfoutput>
<div id="availableObjectParams" data-object="plugin" data-name="MuraGCal2 Configurator" data-objectid="#$.event('objectID')#">
	<h4 class="mgc2-section">Calendars &amp; Colors</h4>
	<div id="mgc2calendars">
		<cfloop from="1" to="#arraylen(params.arr_gcalid)#" index="mgc2gcalid">
		<dl class="singleColumn mgc2_calendar">
			<dt>Calendar #mgc2gcalid#<cfif mgc2gcalid gt 1><span class="removeGCalID" title="Remove this calendar"></span></cfif></dt>
			<dd><label>Google Calendar ID: <input name="GCalID" class="objectParam" value="#HTMLEditFormat(params.arr_gcalid[mgc2gcalid])#" style="width:250px;"></label></dd>
			<dd><label class="colorpicker">Calendar Events Color: <input name="GCalColor" class="objectParam muragcal2-color-picker" value="<cfif arraylen(params.arr_gcalcolor) gte mgc2gcalid>#HTMLEditFormat(params.arr_gcalcolor[mgc2gcalid])#<cfelse>##36c</cfif>" size="7"></label></dd>
		</dl>
		</cfloop>
		<button type="button" id="mgc2BtnAddCalendar">Add Another Calendar</button>
		<div style="text-align:right; color:##ccc;">Multiple calendars will be aggregated into a single one with each calendar's event displayed in selected color.</div>
	</div>
	<h4 class="mgc2-section">Calendar Properties</h4>
	<dl class="singleColumn">
		<dd title="Title of this Calendar. Control display using 'Show Calendar Title?' option below."><label><strong>Title:</strong> <input name="GCalName" id="GCalName" class="objectParam" value="#HTMLEditFormat(params.GCalName)#" style="width:350px;"></label></dd>
	</dl>
	<dl class="singleColumn">
		<dd title="Select first day of week"><label><strong>Week start day:</strong> 
			<select name="GCalWeekStart" id="GCalWeekStart" class="objectParam">
				<option value="1" <cfif val(params.GCalWeekStart) eq 1>selected</cfif>>Sunday</option>
				<option value="2" <cfif val(params.GCalWeekStart) eq 2>selected</cfif>>Monday</option>
				<option value="7" <cfif val(params.GCalWeekStart) eq 7>selected</cfif>>Saturday</option>
			</select></label>
		</dd>
	</dl>
	<dl class="singleColumn">
		<dd title="Select interface language"><label><strong>Language:</strong> <select name="GCalLang" id="GCalLang" class="objectParam"><option value="" <cfif params.GCalLang eq "">selected</cfif>>Default</option><option value="in" <cfif params.GCalLang eq "in">selected</cfif>>Bahasa Indonesia</option><option value="ca" <cfif params.GCalLang eq "ca">selected</cfif>>Català</option><option value="da" <cfif params.GCalLang eq "da">selected</cfif>>Dansk</option><option value="de" <cfif params.GCalLang eq "de">selected</cfif>>Deutsch</option><option value="en_GB" <cfif params.GCalLang eq "en_GB">selected</cfif>>English (UK)‎</option><option value="en" <cfif params.GCalLang eq "en">selected</cfif>>English (US)‎</option><option value="es">Español</option><option value="tl">Filipino</option><option value="fr">Français</option><option value="hr">Hrvatski</option><option value="it">Italiano</option><option value="lv">Latviešu</option><option value="lt" <cfif params.GCalLang eq "lt">selected</cfif>>Lietuvių</option><option value="hu" <cfif params.GCalLang eq "hu">selected</cfif>>Magyar</option><option value="nl" <cfif params.GCalLang eq "nl">selected</cfif>>Nederlands</option><option value="no" <cfif params.GCalLang eq "no">selected</cfif>>Norsk (bokmål)‎</option><option value="pl" <cfif params.GCalLang eq "pl">selected</cfif>>Polski</option><option value="pt_BR" <cfif params.GCalLang eq "pt_BR">selected</cfif>>Português (Brasil)‎</option><option value="pt_PT" <cfif params.GCalLang eq "pt_PT">selected</cfif>>Português (Portugal)‎</option><option value="ro" <cfif params.GCalLang eq "ro">selected</cfif>>Română</option><option value="sk" <cfif params.GCalLang eq "sk">selected</cfif>>Slovenský</option><option value="sl" <cfif params.GCalLang eq "sl">selected</cfif>>slovenščina</option><option value="fi" <cfif params.GCalLang eq "fi">selected</cfif>>Suomi</option><option value="sv" <cfif params.GCalLang eq "sv">selected</cfif>>Svenska</option><option value="tr" <cfif params.GCalLang eq "tr">selected</cfif>>Türkçe</option><option value="vi" <cfif params.GCalLang eq "vi">selected</cfif>>Tiếng Việt</option><option value="cs" <cfif params.GCalLang eq "cs">selected</cfif>>Český</option><option value="el" <cfif params.GCalLang eq "el">selected</cfif>>Ελληνικά</option><option value="ru" <cfif params.GCalLang eq "ru">selected</cfif>>Русский</option><option value="sr" <cfif params.GCalLang eq "sr">selected</cfif>>Српски</option><option value="uk" <cfif params.GCalLang eq "uk">selected</cfif>>Українська</option><option value="bg" <cfif params.GCalLang eq "bg">selected</cfif>>Български</option><option value="iw" <cfif params.GCalLang eq "iw">selected</cfif>>עברית</option><option value="ar" <cfif params.GCalLang eq "ar">selected</cfif>>العربية</option><option value="hi" <cfif params.GCalLang eq "hi">selected</cfif>>हिन्दी</option><option value="th" <cfif params.GCalLang eq "th">selected</cfif>>ภาษาไทย</option><option value="zh_TW" <cfif params.GCalLang eq "zh_TW">selected</cfif>>中文（繁體）‎</option><option value="zh_CN" <cfif params.GCalLang eq "zh_CN">selected</cfif>>中文（简体）‎</option><option value="ja" <cfif params.GCalLang eq "ja">selected</cfif>>日本語</option><option value="ko" <cfif params.GCalLang eq "ko">selected</cfif>>한국어</option></select></label></dd>
	</dl>
	<dl class="singleColumn">
		<dd title="Select the way calendar data is displayed"><label><strong>Display Mode:</strong> 
			<select name="GCalMode" id="GCalMode" class="objectParam">
				<option value="AGENDA" <cfif params.GCalMode eq "AGENDA">selected</cfif>>Agenda View</option>
				<option value="MONTH" <cfif params.GCalMode eq "MONTH">selected</cfif>>Month View</option>
				<option value="WEEK" <cfif params.GCalMode eq "WEEK">selected</cfif>>Week View</option>
			</select></label>
		</dd>
	</dl>
	<dl class="singleColumn">
		<dd title="Width and Height of calendar container (in px)"><strong>Dimensions:</strong> 
			<label title="Width (px)">Width:&nbsp;<input name="GCalWidth" id="GCalWidth" class="objectParam" value="#HTMLEditFormat(params.GCalWidth)#" size="5">px</label> 
			<label title="Height (px)">Height:&nbsp;<input name="GCalHeight" id="GCalHeight" class="objectParam" value="#HTMLEditFormat(params.GCalHeight)#" size="5">px</label>
		</dd>
	</dl>
	<h4 class="mgc2-section">Display Options</h4>
	<dl class="singleColumn">
		<dd title="Select calendar container's alignment on page"><label><strong>Alignment:</strong> 
			<select name="GCalPosition" id="GCalPosition" class="objectParam">
				<option value="Center" <cfif params.GCalPosition eq "Center">selected</cfif>>Centered</option>
				<option value="Left" <cfif params.GCalPosition eq "Left">selected</cfif>>Float Left</option>
				<option value="Right" <cfif params.GCalPosition eq "Right">selected</cfif>>Float Right</option>
			</select></label>
		</dd>
	</dl>
	<dl class="singleColumn">
		<dt title="Select which interface items to show on the calendar">Show:</dt>
		<dd>
			<label title="Show Calendar Title?"><input type="checkbox" name="GCalTitle" class="objectParam cboxtoggleval" value="#val(params.GCalTitle)#" <cfif val(params.GCalTitle)>checked</cfif>>Title</label> 
			<label title="Show Date Selector?"><input type="checkbox" name="GCalDate" class="objectParam cboxtoggleval" value="#val(params.GCalDate)#" <cfif val(params.GCalDate)>checked</cfif>>Date&nbsp;Selector</label> 
			<label title="Show Prev/Next Buttons?"><input type="checkbox" name="GCalNavButtons" class="objectParam cboxtoggleval" value="#val(params.GCalNavButtons)#" <cfif val(params.GCalNavButtons)>checked</cfif>>Navigation</label><br />
			<label title="Show Display Mode tabs?"><input type="checkbox" name="GCalTabs" class="objectParam cboxtoggleval" value="#val(params.GCalTabs)#" <cfif val(params.GCalTabs)>checked</cfif>>Tabs</label> 
			<label title="Show Time Zone?"><input type="checkbox" name="GCalTz" class="objectParam cboxtoggleval" value="#val(params.GCalTz)#" <cfif val(params.GCalTz)>checked</cfif>>Time Zone</label> 
			<label title="Show Print Icon?"><input type="checkbox" name="GCalPrintIcon" class="objectParam cboxtoggleval" value="#val(params.GCalPrintIcon)#" <cfif val(params.GCalPrintIcon)>checked</cfif>>Print&nbsp;Icon</label> 
			<label title="Show border around calendar container?"><input type="checkbox" name="GCalBorder" class="objectParam cboxtoggleval" value="#val(params.GCalBorder)#" <cfif val(params.GCalBorder)>checked</cfif>>Border</label> 
		</dd>
	</dl>
</div>
<script>var muraGCal2Counter = #arraylen(params.arr_gcalid)#;</script><!--- counter of total calendar ids added to this instance of MuraGCal2 plugin --->
</cfoutput>
</cfprocessingdirective>