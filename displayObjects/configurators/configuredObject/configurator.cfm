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
	if ( not structKeyExists(params,"GCalTabs") ) params.GCalTabs=0;
	if ( not structKeyExists(params,"GCalNavButtons") ) params.GCalNavButtons=0;
	if ( not structKeyExists(params,"GCalPrintIcon") ) params.GCalPrintIcon=0;
	if ( not structKeyExists(params,"GCalBorder") ) params.GCalBorder=0;
	if ( not structKeyExists(params,"GCalWeekStart") ) params.GCalWeekStart=1;
	if ( not structKeyExists(params,"GCalColor") ) params.GCalColor="##36c";
	
	if ( not structKeyExists(params,"GCalBgColor") ) params.GCalBgColor="##fff"; // for future use - not user-changable
	//if ( not structKeyExists(params,"GCalFooter") ) params.GCalFooter=""; // for future use - not user-changable
</cfscript>
<cfoutput>
<div id="availableObjectParams" data-object="plugin" data-name="Example Configured Object" data-objectid="#$.event('objectID')#">
	<dl class="singleColumn" style="margin-bottom:6px">
		<dt title="ID(s) of Google Calendar(s) to render.  Calendar(s) must be PUBLIC! Separate multiple IDs with | (pipe). Calendar ID can be found on Calendar Details tab in Google Calendar settings.">
		<strong>Google Calendar ID/s</strong>
		</dt>
		<dd><input name="GCalID" class="objectParam" value="#HTMLEditFormat(params.GCalID)#" required style="width:350px;"></dd>
	</dl>
	<dl class="singleColumn" style="margin-bottom:6px">
		<dt title="Title of this Calendar. Control display using 'Show Calendar Title?' option below.">
		<strong>Calendar Title</strong>
		</dt>
		<dd><input name="GCalName" class="objectParam" value="#HTMLEditFormat(params.GCalName)#" style="width:350px;"></dd>
	</dl>
	<dl class="singleColumn" style="margin-bottom:6px">
		<dt title="Width and Height of calendar container (in px)">
		<strong>Calendar Dimensions</strong> (Width and Height, in px)
		</dt>
		<dd>
			<label title="Width (px)">W:&nbsp;<input name="GCalWidth" class="objectParam" value="#HTMLEditFormat(params.GCalWidth)#" size="5" required>px</label> 
			<label title="Height (px)">H:&nbsp;<input name="GCalHeight" class="objectParam" value="#HTMLEditFormat(params.GCalHeight)#" size="5" required>px</label>
		</dd>
	</dl>
	<dl class="singleColumn" style="margin-bottom:6px">
		<dt title="Select the way calendar data is displayed">
		<strong>Calendar Display Mode</strong>
		</dt>
		<dd>
			<select name="GCalMode" class="objectParam" required>
				<option value="AGENDA" <cfif params.GCalMode eq "AGENDA">selected</cfif>>Agenda View</option>
				<option value="MONTH" <cfif params.GCalMode eq "MONTH">selected</cfif>>Month View</option>
				<option value="WEEK" <cfif params.GCalMode eq "WEEK">selected</cfif>>Week View</option>
			</select>
		</dd>
	</dl>
	<dl class="singleColumn" style="margin-bottom:6px">
		<dt title="Select calendar container's alignment on page">
		<strong>Calendar Position</strong>
		</dt>
		<dd>
			<select name="GCalPosition" class="objectParam" required>
				<option value="Center" <cfif params.GCalPosition eq "Center">selected</cfif>>Centered</option>
				<option value="Left" <cfif params.GCalPosition eq "Left">selected</cfif>>Float Left</option>
				<option value="Right" <cfif params.GCalPosition eq "Right">selected</cfif>>Float Right</option>
			</select>
		</dd>
	</dl>
	<dl class="singleColumn" style="margin-bottom:6px">
		<dt title="Select which interface items to show on the calendar">
		<strong>Show:</strong>
		</dt>
		<dd>
			<label title="Show Calendar Title?"><input name="GCalTitle" type="checkbox" class="objectParam" value="#val(params.GCalTitle)#" <cfif val(params.GCalTitle)>checked</cfif> onclick="this.value=(this.checked)?1:0">Title</label> 
			<label title="Show Date Selector?"><input name="GCalDate" type="checkbox" class="objectParam" value="#val(params.GCalDate)#" <cfif val(params.GCalDate)>checked</cfif> onclick="this.value=(this.checked)?1:0">Date&nbsp;Selector</label> 
			<label title="Show Previous/Next Navigation Buttons?"><input name="GCalNavButtons" type="checkbox" class="objectParam" value="#val(params.GCalNavButtons)#" <cfif val(params.GCalNavButtons)>checked</cfif> onclick="this.value=(this.checked)?1:0">Navigation</label><br />
			<label title="Show Display Mode tabs?"><input name="GCalTabs" type="checkbox" class="objectParam" value="#val(params.GCalTabs)#" <cfif val(params.GCalTabs)>checked</cfif> onclick="this.value=(this.checked)?1:0">Tabs</label> 
			<label title="Show Print Icon?"><input name="GCalPrintIcon" type="checkbox" class="objectParam" value="#val(params.GCalPrintIcon)#" <cfif val(params.GCalPrintIcon)>checked</cfif> onclick="this.value=(this.checked)?1:0">Print&nbsp;Icon</label> 
			<label title="Show border around calendar container?"><input name="GCalBorder" type="checkbox" value="#val(params.GCalBorder)#" class="objectParam" <cfif val(params.GCalBorder)>checked</cfif> onclick="this.value=(this.checked)?1:0">Border</label> 
		</dd>
	</dl>
	<dl class="singleColumn" style="margin-bottom:6px">
		<dt title="Select first day of week">
		<strong>Week start day</strong>
		</dt>
		<dd>
			<select name="GCalWeekStart" class="objectParam" required>
				<option value="1" <cfif val(params.GCalWeekStart) eq 1>selected</cfif>>Sunday</option>
				<option value="2" <cfif val(params.GCalWeekStart) eq 2>selected</cfif>>Monday</option>
				<option value="7" <cfif val(params.GCalWeekStart) eq 7>selected</cfif>>Saturday</option>
			</select>
		</dd>
	</dl>
	<dl class="singleColumn" style="margin-bottom:6px">
		<dt title="Hex code of calendar events' color in ##xxx or ##xxxxxx format. If using multiple calendars, separate colors for each with | (pipe). First color is assumed as default and will be used for any calendar which does not have a color specified (i.e. if you specified 3 calendar IDs but only 2 colors, the 3rd calendar will be displayed using the first color code here).">
		<strong>Event Color/s</strong>
		</dt>
		<dd><input name="GCalColor" class="objectParam color-picker" value="#HTMLEditFormat(params.GCalColor)#" size="7" maxlength="7" required></dd>
	</dl>
	<input type="hidden" name="GCalBgColor" class="objectParam" value="#HTMLEditFormat(params.GCalBgColor)#">
</div>			
</cfoutput>