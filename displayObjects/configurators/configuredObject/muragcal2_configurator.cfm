<cfprocessingdirective pageencoding="UTF-8" suppresswhitespace="yes">
<cfscript>

$=application.serviceFactory.getBean("MuraScope").init(session.siteID);

if ( isjson($.event("params")) ) {
	params=deserializejson($.event("params"));
}
else {
	params={};
}

defaultParams = {
	GCalID="",
	GCalColor="",
	GCalName="",
	GCalMode="MONTH",
	GCalWeekStart=1,
	GCalLang="",
	GCalWidth=300,
	GCalHeight=300,
	GCalPosition="Center",
	GCalTitle=0,
	GCalDate=0,
	GCalNavButtons=0,
	GCalTabs=0,
	GCalTz=0,
	GCalPrintIcon=0,
	GCalBorder=0
};

for ( key in defaultParams ) {
	if ( not structkeyexists(params, key) ) params[key] = defaultParams[key];
}

// convert lists of calendar IDs (GCalID param) and calendar events colors (GCalColor param) to arrays for easier manipulation/looping
arr_gcalid = listtoarray(params.GCalID, "|");
if ( not arraylen(arr_gcalid) ) arrayappend(arr_gcalid, "");

arr_gcalcolor = listtoarray(params.GCalColor, "|");
if ( not arraylen(arr_gcalcolor) ) arrayappend(arr_gcalcolor, "");

</cfscript>
<cfoutput>
<div id="availableObjectParams" data-object="plugin" data-name="MuraGCal2 Configurator" data-objectid="#$.event('objectID')#">
	<h4 class="mgc2-section">Calendars &amp; Colors</h4>
	<div id="mgc2calendars">
		<cfloop from="1" to="#arraylen(arr_gcalid)#" index="mgc2gcalid">
		<dl class="singleColumn mgc2_calendar">
			<dt>Calendar #mgc2gcalid#<cfif mgc2gcalid gt 1><span class="removeGCalID" title="Remove this calendar"></span></cfif></dt>
			<dd>
				<label>Google Calendar ID: <input name="GCalID" class="objectParam" value="#htmleditformat(arr_gcalid[mgc2gcalid])#" style="width:250px;" /></label>
			</dd>
			<dd>
				<label class="colorpicker">Calendar Events Color: <input name="GCalColor" class="objectParam muragcal2-color-picker" value="<cfif arraylen(arr_gcalcolor) gte mgc2gcalid>#htmleditformat(arr_gcalcolor[mgc2gcalid])#</cfif>" /></label>
			</dd>
		</dl>
		</cfloop>
		<button type="button" id="mgc2BtnAddCalendar">Add Another Calendar</button>
		<div style="text-align:right; color:##ccc; clear:both;">Multiple calendars are aggregated into a single one, with each calendar's events displayed in selected color.</div>
	</div>
	<h4 class="mgc2-section">Calendar Properties</h4>
	<dl class="singleColumn">
		<dd title="Title of this Calendar. Control display using 'Show: Title' checkbox under Display Options below."><label><strong>Title:</strong> <input name="GCalName" id="GCalName" class="objectParam" value="#htmleditformat(params.GCalName)#" style="width:300px;" /></label></dd>
	</dl>
	<dl class="singleColumn">
		<dd title="Select the way calendar data is displayed">
			<label><strong>Display Mode: </strong>
			<select name="GCalMode" id="GCalMode" class="objectParam">
				<option value="AGENDA" <cfif params.GCalMode eq "AGENDA">selected="selected"</cfif>>Agenda View</option>
				<option value="MONTH" <cfif params.GCalMode eq "MONTH">selected="selected"</cfif>>Month View</option>
				<option value="WEEK" <cfif params.GCalMode eq "WEEK">selected="selected"</cfif>>Week View</option>
			</select>
			</label>
		</dd>
	</dl>
	<dl class="singleColumn">
		<dd title="Select first day of week">
			<label><strong>Week start day: </strong>
			<select name="GCalWeekStart" id="GCalWeekStart" class="objectParam">
				<option value="1" <cfif val(params.GCalWeekStart) eq 1>selected="selected"</cfif>>Sunday</option>
				<option value="2" <cfif val(params.GCalWeekStart) eq 2>selected="selected"</cfif>>Monday</option>
				<option value="7" <cfif val(params.GCalWeekStart) eq 7>selected="selected"</cfif>>Saturday</option>
			</select>
			</label>
		</dd>
	</dl>
	<dl class="singleColumn">
		<dd title="Select calendar interface language">
			<label><strong>Language: </strong>
			<select name="GCalLang" id="GCalLang" class="objectParam"><option value="" <cfif params.GCalLang eq "">selected</cfif>>Default</option><option value="in" <cfif params.GCalLang eq "in">selected</cfif>>Bahasa Indonesia</option><option value="ca" <cfif params.GCalLang eq "ca">selected</cfif>>Català</option><option value="da" <cfif params.GCalLang eq "da">selected</cfif>>Dansk</option><option value="de" <cfif params.GCalLang eq "de">selected</cfif>>Deutsch</option><option value="en_GB" <cfif params.GCalLang eq "en_GB">selected</cfif>>English (UK)‎</option><option value="en" <cfif params.GCalLang eq "en">selected</cfif>>English (US)‎</option><option value="es">Español</option><option value="tl">Filipino</option><option value="fr">Français</option><option value="hr">Hrvatski</option><option value="it">Italiano</option><option value="lv">Latviešu</option><option value="lt" <cfif params.GCalLang eq "lt">selected</cfif>>Lietuvių</option><option value="hu" <cfif params.GCalLang eq "hu">selected</cfif>>Magyar</option><option value="nl" <cfif params.GCalLang eq "nl">selected</cfif>>Nederlands</option><option value="no" <cfif params.GCalLang eq "no">selected</cfif>>Norsk (bokmål)‎</option><option value="pl" <cfif params.GCalLang eq "pl">selected</cfif>>Polski</option><option value="pt_BR" <cfif params.GCalLang eq "pt_BR">selected</cfif>>Português (Brasil)‎</option><option value="pt_PT" <cfif params.GCalLang eq "pt_PT">selected</cfif>>Português (Portugal)‎</option><option value="ro" <cfif params.GCalLang eq "ro">selected</cfif>>Română</option><option value="sk" <cfif params.GCalLang eq "sk">selected</cfif>>Slovenský</option><option value="sl" <cfif params.GCalLang eq "sl">selected</cfif>>slovenščina</option><option value="fi" <cfif params.GCalLang eq "fi">selected</cfif>>Suomi</option><option value="sv" <cfif params.GCalLang eq "sv">selected</cfif>>Svenska</option><option value="tr" <cfif params.GCalLang eq "tr">selected</cfif>>Türkçe</option><option value="vi" <cfif params.GCalLang eq "vi">selected</cfif>>Tiếng Việt</option><option value="cs" <cfif params.GCalLang eq "cs">selected</cfif>>Český</option><option value="el" <cfif params.GCalLang eq "el">selected</cfif>>Ελληνικά</option><option value="ru" <cfif params.GCalLang eq "ru">selected</cfif>>Русский</option><option value="sr" <cfif params.GCalLang eq "sr">selected</cfif>>Српски</option><option value="uk" <cfif params.GCalLang eq "uk">selected</cfif>>Українська</option><option value="bg" <cfif params.GCalLang eq "bg">selected</cfif>>Български</option><option value="iw" <cfif params.GCalLang eq "iw">selected</cfif>>עברית</option><option value="ar" <cfif params.GCalLang eq "ar">selected</cfif>>العربية</option><option value="hi" <cfif params.GCalLang eq "hi">selected</cfif>>हिन्दी</option><option value="th" <cfif params.GCalLang eq "th">selected</cfif>>ภาษาไทย</option><option value="zh_TW" <cfif params.GCalLang eq "zh_TW">selected</cfif>>中文（繁體）‎</option><option value="zh_CN" <cfif params.GCalLang eq "zh_CN">selected</cfif>>中文（简体）‎</option><option value="ja" <cfif params.GCalLang eq "ja">selected</cfif>>日本語</option><option value="ko" <cfif params.GCalLang eq "ko">selected</cfif>>한국어</option></select>
			</label>
		</dd>
	</dl>
	<h4 class="mgc2-section">Display Options</h4>
	<dl class="singleColumn">
		<dd title="Width and Height of calendar container (in px)"><strong>Dimensions:</strong> 
			<label title="Calendar container width (px)">Width:&nbsp;<input name="GCalWidth" id="GCalWidth" class="objectParam" value="#htmleditformat(params.GCalWidth)#" size="5" />px</label> 
			<label title="Calendar container height (px)">Height:&nbsp;<input name="GCalHeight" id="GCalHeight" class="objectParam" value="#htmleditformat(params.GCalHeight)#" size="5" />px</label>
		</dd>
	</dl>
	<dl class="singleColumn">
		<dd title="Select calendar container alignment on page">
			<label><strong>Alignment: </strong>
			<select name="GCalPosition" id="GCalPosition" class="objectParam">
				<option value="Center" <cfif params.GCalPosition eq "Center">selected="selected"</cfif>>Centered</option>
				<option value="Left" <cfif params.GCalPosition eq "Left">selected="selected"</cfif>>Float Left</option>
				<option value="Right" <cfif params.GCalPosition eq "Right">selected="selected"</cfif>>Float Right</option>
			</select>
			</label>
		</dd>
	</dl>
	<dl class="singleColumn">
		<dt title="Select which interface items to show on the calendar">Show:</dt>
		<dd>
			<label title="Show Calendar Title?">
			<input type="checkbox" name="GCalTitle" class="objectParam cboxtoggleval" value="#val(params.GCalTitle)#" <cfif val(params.GCalTitle)>checked="checked"</cfif> />Title
			</label> 
			<label title="Show Date Selector?">
			<input type="checkbox" name="GCalDate" class="objectParam cboxtoggleval" value="#val(params.GCalDate)#" <cfif val(params.GCalDate)>checked="checked"</cfif> />Date&nbsp;Selector
			</label> 
			<label title="Show Prev/Next Buttons?">
			<input type="checkbox" name="GCalNavButtons" class="objectParam cboxtoggleval" value="#val(params.GCalNavButtons)#" <cfif val(params.GCalNavButtons)>checked="checked"</cfif> />Navigation
			</label>
			<br />
			<label title="Show Display Mode tabs?">
			<input type="checkbox" name="GCalTabs" class="objectParam cboxtoggleval" value="#val(params.GCalTabs)#" <cfif val(params.GCalTabs)>checked="checked"</cfif> />Tabs
			</label> 
			<label title="Show Time Zone?">
			<input type="checkbox" name="GCalTz" class="objectParam cboxtoggleval" value="#val(params.GCalTz)#" <cfif val(params.GCalTz)>checked="checked"</cfif> />Time Zone
			</label> 
			<label title="Show Print Icon?">
			<input type="checkbox" name="GCalPrintIcon" class="objectParam cboxtoggleval" value="#val(params.GCalPrintIcon)#" <cfif val(params.GCalPrintIcon)>checked="checked"</cfif> />Print&nbsp;Icon
			</label> 
			<label title="Show border around calendar container?">
			<input type="checkbox" name="GCalBorder" class="objectParam cboxtoggleval" value="#val(params.GCalBorder)#" <cfif val(params.GCalBorder)>checked="checked"</cfif> />Border
			</label> 
		</dd>
	</dl>
</div>
<input type="hidden" name="configuredDTS" class="objectParam" value="#now()#" />
<input type="hidden" name="configuredBy" class="objectParam" value="#htmleditformat($.currentUser('LName'))#, #htmleditformat($.currentUser('FName'))#" />
<script>var muraGCal2Counter = #arraylen(arr_gcalid)#;</script><!--- counter of calendar ids added to this instance of MuraGCal2 plugin --->
</cfoutput>
</cfprocessingdirective>