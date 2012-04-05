#MuraGCal &trade; 2 Plugin

MuraGCal2 is a plugin for [Mura CMS](http://getmura.com/) which enables you to easily add a *public* Google Calendar to your page and configure its properties and display options. The plugin allows you to combine/aggregate multiple *public* Google Calendars into one, with separate colors for each calendar's events if necessary.

###Tested with:
- Mura Core **5.6.4859**
- Railo **3.3**
- Adobe ColdFusion **9.0.1**

##Installation
Deploy as a regular Mura plugin. Do not forget to select at least one site under 'Site Assignment' on installation.

##Usage
###In Mura Admin back-end
####Adding new MuraGCal2 Calendar to a page:
In the page you want to add a *public* Google Calendar to, click on 'Content Objects' tab. Select Plugins->MuraGCal2 Plugin->MuraGCal2 Calendar under 'Available Content Objects' and add it to desired content area. Configure the calendar properties and display options in the pop-up Configurator modal window.
####Editing existing MuraGCal2 Calendar
On the page's Content Objects tab, double-click the MuraGCal2 Configurator object in its content area to edit its properties and display options.
###Edit existing calendar in Mura front-end
Content editors can edit existing calendar's options using the front-end editor (if enabled). Hover over the MuraGCal2 plugin instance on the page and click the 'edit' button (pencil) to bring up the configurator and edit calendar's properties and display options.

##Configurator Options
###Calendars and Colors
+ Google Calendar ID: ID of a *public* Google Calendar to display; this ID can be found under Calendar Address on the Calendar Settings page of Google Calendar
+ Calendar Events Color: select the color of calendar events; available colors are limited to 42 colors supported by Google
+ 'Add Another Calendar' button: allows you to add more calendars to be aggregated; adds another set of Google Calendar ID and Calendar Event Colors fields to the form
###Calendar Properties
+ Calendar Title: name of the (aggregated) calendar; will be displayed above the calendar data if 'Title' checkbox is selected in 'Show' options (see below)
+ Display Mode: select MONTH, WEEK or AGENDA mode of displaying calendar data
+ Week start day: select first day of week (Sunday, Monday or Saturday)
+ Language: select the language of calendar interface (day names, etc); 'Default' option will default to user's locale or browser language setting
###Display Options
+ Dimensions: width and height, in pixels, of calendar container on the page
+ Alignment: select calendar container alignment on page (Center, Float Left/Right)
+ Show: various calendar interface items; selected checkbox will display the item in the calendar interface

Enjoy!

Azadi Saryev