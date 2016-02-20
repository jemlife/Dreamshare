module ApplicationHelper
  def alert_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert alert-warning alert-dismissible fade in',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
