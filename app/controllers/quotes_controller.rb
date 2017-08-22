class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, :noun => :winking
  end

  def request_info
    render :request_info
  end
end
