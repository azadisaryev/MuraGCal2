function initMuraGCalConfigurator(data) {
		
	initConfigurator(
		data,
		{
			url:'../plugins/MuraGCal2/displayObjects/configurators/configuredObject/muragcal2_configurator.cfm',
			pars:'',
			title: 'MuraGCal2 Configurator',
			init: function() {
				
				// load custom stylesheet for this plugin
				jQuery('<link rel="stylesheet" type="text/css" />').attr({href:"../plugins/MuraGCal2/assets/css/muragcal2.css?v=20120405"}).appendTo(jQuery("head"));
				
				// load colorPicker
				jQuery.getScript('../plugins/MuraGCal2/assets/js/jquery.colorPicker.min.js', function(data, textStatus){
					jQuery(".muragcal2-color-picker").colorPicker(); // apply colorPicker to existing GCalColor fields
				});
				
				// bind checkbox click event to change checkbox's value to 1 (checked) or 0 (un-checked) - work-around for a 'bug' in Mura's /admin/js/architecture.js
				//jQuery("input.cboxtoggleval", "#availableObjectParams").click(function(){this.value=(this.checked)?1:0});
				
				// bind click event to 'Remove this Calendar' icon (span)
				jQuery("#mgc2calendars").on("click", "span.removeGCalID", function(event){
					var $this = jQuery(this), ok2delete = false;
					if ( jQuery("input", $this.parent().next()).val == '' ) {
						ok2delete = true;
					}
					else {
						if ( confirm('Are you sure you want to remove this Calendar ID?') ) ok2delete = true;
					}
					if (ok2delete) {
						$this.parent().parent().remove();
						muraGCal2Counter--;
					}
				});
				
				// 'Add Another Calendar' button click event handling
				jQuery("#mgc2BtnAddCalendar").click(function(){
					var $this = jQuery(this), ok2add = true;
					if (muraGCal2Counter>=3) ok2add = confirm("Are you sure you want to add another calendar?\n\nToo many calendars aggregated into one may become difficult to read."); // sanity check
					if (ok2add) {
						muraGCal2Counter++;
						jQuery('<dl class="singleColumn mgc2_calendar"><dt>Calendar '+muraGCal2Counter+'<span class="removeGCalID"></span></dt><dd><legend>Google Calendar ID: <input name="GCalID" class="objectParam" value="" style="width:250px;"></legend></dd><dd class="colorpicker"><legend>Calendar Events Color: <input name="GCalColor" class="objectParam muragcal2-color-picker" value="" size="7"></legend></dd></dl>')
							.insertBefore($this)
							.find(".muragcal2-color-picker").colorPicker();
					}
				});
				
			},
			destroy: function() {
				// TODO: un-bind events
			},
			validate: function() {
				var paramscontainer = jQuery("#availableObjectParams"), isValid = true;
				//jQuery("div.mgc2error", paramscontainer).remove();
				jQuery(".mgc2error").removeClass("mgc2error").find("div").remove();
				jQuery("input[name='GCalID']", paramscontainer).each(function() {
					var $gcalid = jQuery(this), $gcalcolor = jQuery("input[name='GCalColor']", $gcalid.parents('dd').next());
					if ( $gcalid.val().replace(/\s/g, '')=='' ) {
						$gcalid.parents('dd').append('<div class="mgc2error">Calendar ID is required</div>').end().parent().addClass("mgc2error");
						isValid = false;
					}
					if ( $gcalcolor.val() == '' ) {
						$gcalcolor.parents('dd').append('<div class="mgc2error">Events Color is required</div>').end().parent().addClass("mgc2error");
						isValid = false;
					}
					else {
						var regex = /^(#([0-9a-fA-F]{3}){1,2}\|?)+$/;
						if (!regex.test($gcalcolor.val())) {
							jQuery('<div class="mgc2error">Events Color must be a valid Hex code in #xxx or #xxxxxx format</div>').appendTo($gcalcolor.parents('dd'));
							$gcalcolor.parent().addClass("mgc2error");
							isValid = false;
						}
					}
				});
				if ( jQuery("#GCalWidth").val().replace(/\s/g, '')=='' || jQuery("#GCalHeight").val().replace(/\s/g, '')=='' ) {
					jQuery('<div class="mgc2error">Calendar Width and Height are required</div>').appendTo(jQuery("#GCalWidth").parents('dd')).parents('dd').find("label").addClass('mgc2error');
					isValid = false;
				}
				else if ( isNaN( parseInt(jQuery("#GCalWidth").val()) ) || isNaN( parseInt(jQuery("#GCalHeight").val()) ) || parseInt(jQuery("#GCalWidth").val()) <= 0 || parseInt(jQuery("#GCalHeight").val()) <= 0 ) {
					jQuery('<div class="mgc2error">Calendar Width and Height must be positive integer</div>').appendTo(jQuery("#GCalWidth").parents('dd')).parents('dd').find("label").addClass('mgc2error');
					isValid = false;
				}
				return isValid;
			}
		}
	);
			
	return true;
}

/* OVER-RIDE OF updateAvailableObject() FUNCTION IN architecture.js TO PROPERLY HANDLE CHECKBOXES */
function updateAvailableObject(){
	var availableObjectParams={};
					
	jQuery("#availableObjectParams").find(".objectParam").each(
		function(){
			var item=jQuery(this);
			if ( (item.attr("type") != "radio" && item.attr("type") != "checkbox") || ( (item.attr("type")=="radio" || item.attr("type")=="checkbox") && item.is(':checked') ) ) {
				if(typeof(availableObjectParams[item.attr("name")]) == 'undefined'){
					availableObjectParams[item.attr("name")] = item.val();
				} else {
					if( !jQuery.isArray(availableObjectParams[item.attr("name")]) ){
						var tempArray=[];
						tempArray[0]=availableObjectParams[item.attr("name")];
						availableObjectParams[item.attr("name")]=tempArray;
					}

					availableObjectParams[item.attr("name")].push(item.val());

				}
			}
		}
	)
	availableObject=jQuery.extend({},availableObjectTemplate);
	availableObject.params=availableObjectParams;	
}
