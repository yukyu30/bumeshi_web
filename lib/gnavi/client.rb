class Hotpepper::Client
    def find(querey: '')
        request_url=URL('http://webservice.recruit.co.jp/hotpepper/gourmet/v1/')
        request_url = {
            key: ENV['API_KEY'], name_any: querey
        }.to_param        
        uri = URI.parse(request_url.to_s)
        json = Net::HTTP.get(uri)
        result = JSON.parse(json)
        puts result
    end
end