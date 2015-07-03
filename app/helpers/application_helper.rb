module ApplicationHelper
	def bootstrap_for_flash(flash_type)
		{success: "alert-success",
		 alert: "alert-warning",
		 error: "alert-danger",
		 notice: "alert-info",
		 info: "alert-info"}[flash_type.to_sym] || flash_type
	end
end
