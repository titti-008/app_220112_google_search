class SearchController < ApplicationController

  def home
  
  end

  def show
    @search_word = params[:search_word]
    @start_index = params[:start_index]

    if @search_word.blank?
      error_flash("検索する文字を入力してください")
      return
    end
    
    @items, @previous_index, @next_index = search_word(@search_word, @start_index)
  end


  private ####################################

    # google custom search engineを使った文字列検索するメソッド
    def search_word(search_word, start_index)

      uri = URI(ENV["API_URL"])
      uri.query = {
        key: ENV["API_KEY"],
        cx: ENV["SEARCH_ENGINE_ID"],
        q: search_word,
        start: start_index
      }.to_param

      response = fetch_search_results(uri)

      if response
        items = response["items"]
        
        # response["queries"]["previousPage"][0]["startIndex"]とすると"previousPage"がnilの場合エラーになる
        previous_index = response.dig("queries", "previousPage", 0,  "startIndex")
        next_index = response.dig("queries", "nextPage", 0, "startIndex")
      end


      return items, previous_index, next_index
    end

    # 引数のuriに対してgetリクエストするメソッド
    def fetch_search_results(uri)
      request = Net::HTTP::Get.new(uri)
      request["Upgrade-Insecure-Requests"] = "1"
      req_options = {
        use_ssl: uri.scheme == "https",
      }

      begin
        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.open_timeout = 5   # 5秒でコネクションが開かなければ例外発生 => Net::OpenTimeout 
          http.read_timeout = 10  # 10秒で読みこめなければ例外発生 => Net::ReadTimeout 
          http.request(request)
        end

        case response
        when Net::HTTPSuccess
          return JSON.parse(response.body)
        when Net::HTTPRedirection
          error_flash("HTTP ERROR: code=#{response.code} message=#{response.message}")
        else
          error_flash("HTTP ERROR: code=#{response.code} message=#{response.message}")
        end

      rescue => e
        error_flash(e.message)
      end

      return false

    end


    def error_flash(message)
      logger.warn(message)
      flash.now[:warning] = message
    end

end
