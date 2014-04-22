class TwitterApi
  # retrieve from Twitter API; ignore these

  def self.get_bearer_token

    twitter_consumer_key = 'KhfmUr1ela6T6mRITssA'
    twitter_consumer_secret = 'uupoJtIM30b4UyBtveMJ4WMq5rpiUFcThDD2Hj9I'
    bearer_credentials = Base64.encode64(twitter_consumer_key + ":" + twitter_consumer_secret).chomp.gsub(/\n/, '')

    # exchange for bearer token
    url = URI.parse('https://api.twitter.com/oauth2/token')
    http = Net::HTTP.new(url.host, 443)
    http.use_ssl = true
    data = http.post(url.path, "grant_type=client_credentials", {
      'Authorization' => "Basic #{bearer_credentials}",
      'Content-Type' => 'application/x-www-form-urlencoded;charset=UTF-8'
    })

    return JSON.parse(data.body)['access_token']

  end

  def self.get_twitter_response

    bearer_access_token = self.get_bearer_token
    base_uri = 'https://api.twitter.com/1.1/search/tweets.json'
    url = URI.parse(base_uri + '?q=wunwun')
    http = Net::HTTP.new(url.host, 443)
    http.use_ssl = true
    data = http.get(url.to_s, {
      'Authorization' => "Bearer #{bearer_access_token}"
    })

    return data
  end


  def self.generate_header(params)
    header = "OAuth "
    params.each do |k, v|
      header += "#{k}=\"#{v}\", "
    end
    #puts "header: #{header.slice(0..-3)}"
    return header.slice(0..-3)
  end

  def self.twitter_sign(key, base_string)
    digest = OpenSSL::Digest.new('sha1')
    hmac = OpenSSL::HMAC.digest(digest, key, base_string)
    signature = Base64.encode64(hmac).chomp.gsub(/\n/, '')
    #puts "signature: #{signature}"
    return signature
  end

  def self.signature_base_string(method, uri, params)
    encoded_params = params.sort.collect{ |k, v| CGI::escape("#{k}=#{v}") }.join("%26")
    sbs = method + '&' + CGI::escape(uri) + '&' + encoded_params
    #puts "SBS: #{sbs}"
    return sbs
  end

end
