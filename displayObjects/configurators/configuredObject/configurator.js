function initMuraGCalConfigurator(data) {
		
	initConfigurator(
		data,
		{
			url:'../plugins/MuraGCal2/displayObjects/configurators/configuredObject/configurator.cfm',
			pars:'',
			title: 'MuraGCal2 Configuratorinator',
			init: function() {
				jQuery.getScript('../plugins/MuraGCal2/assets/js/jquery.miniColors.min.js', function(data, textStatus){
					jQuery(".color-picker").miniColors({letterCase: 'uppercase'})
				});
				//TODO: code for 'addCalendar' button/link to add and display another GCalID and GCalColor inputs
			},
			destroy: function() {},
			validate: function() {
				var isValid = true;
				/*var errContainer = jQuery('<ul class="errContainer"></ul>');
				var errElement = jQuery('<li></li>');*/
				return isValid;
			}
		}
	);
			
	return true;
}