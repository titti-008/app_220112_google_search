require 'uri'

class StaticPagesController < ApplicationController

  def home

  end

  def show

    response = search_word(params[:search])
    @search_word = response["queries"]["request"][0]["searchTerms"]
    @items = response["items"]

    # Customsearch = Google::Apis::CustomsearchV1
    # searcher = Customsearch::CustomsearchService.new
    # searcher.key = ENV["SEARCH_API"]

    # query = "ハンターハンター"

    # results = searcher.list_cses(q: query, cx: ENV["SEARCH_ENGINE_ID"])
    # @items = results.items


    # pp items.map {|item| { title: item.title, link: item.link} }

  end


  private ####################################


    def search_word(word)
      

      base_url = "https://www.googleapis.com/customsearch/v1"
      api_key = ENV["API_KEY"]
      id = ENV["SEARCH_ENGINE_ID"]
      escape_word = URI.encode_www_form_component(word)

      uri = URI.parse("#{base_url}?key=#{api_key}&cx=#{id}&q=#{escape_word}")
      # debugger

      request = Net::HTTP::Get.new(uri)
      request["Upgrade-Insecure-Requests"] = "1"
      
      req_options = {
        use_ssl: uri.scheme == "https",
      }
      
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      return JSON.parse(response.body)
    end

end
