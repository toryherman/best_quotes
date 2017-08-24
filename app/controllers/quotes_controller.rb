class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, :noun => :winking
  end

  def request_info
    render :request_info
  end

  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, :obj => quote, :ua => ua
  end

  def view_test
    @noun = "roller skating"
    render :view_test
  end

  # def quote_1
  #   quote_1 = Rulers::Model::FileModel.find(1)
  #   render :quote, :obj => quote_1
  # end
  #
  # def new_quote
  #   attrs = {
  #     "submitter" => "web user",
  #     "quote" => "A picture is worth one k pixels",
  #     "attribution" => "Me"
  #   }
  #   obj = FileModel.create attrs
  #   render :quote, :obj => obj
  # end

  # call with curl
  # e.g. $ curl http://localhost:3001/quotes/update -d submitter=Frodo -d id=1
  def update
    # exception if not HTTP POST
    raise "Only POST to this route!" unless env["REQUEST_METHOD"] == "POST"
    body = env["rack.input"].read
    astr = body.split("&")
    params = {}
    astr.each do |a|
      name, val = a.split "="
      params[name] = val
    end
    quote = FileModel.find(params["id"].to_i)
    quote["submitter"] = params["submitter"]
    quote.save

    render :quote, :obj => quote
  end
end
