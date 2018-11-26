module Intrigue
module Ident
module Check
  class Ookla < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "application",
          :vendor =>"Ookla",
          :product =>"Speedtest Server",
          :match_details => "page title",
          :match_type => :content_body,
          :references => ["https://support.ookla.com/hc/en-us/articles/234578568-How-To-Install-Submit-Server"],
          :match_content => /<title>OoklaServer/,
          :version => nil,
          :verify => ["aWJtI0ludHJpZ3VlOjpFbnRpdHk6OlVyaSNodHRwOi8vOTEuMjExLjU2LjE3OTo4MDgx"],
          :paths => ["#{url}"]
        }
      ]
    end

  end
end
end
end