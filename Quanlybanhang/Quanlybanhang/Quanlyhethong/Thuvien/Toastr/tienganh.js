function success(mess) {
	// toastr.options.showMethod = 'slideDown';
	toastr.options.hideMethod = 'slideUp';
	toastr.options.closeMethod = 'fadeOut';
	toastr.options.timeOut = 3000;
	
	toastr.success(mess,'Thông báo');
}
function warning(mess) {
	toastr.options.hideMethod = 'slideUp';
	toastr.options.closeMethod = 'fadeOut';
	toastr.options.timeOut = 1000000000;
	
	toastr.warning(mess,'Thông báo');
}
function error(mess) {
	toastr.options.hideMethod = 'slideUp';
	toastr.options.closeMethod = 'fadeOut';
	toastr.options.timeOut = 3000;
	toastr.error(mess,'Thông báo');
}
