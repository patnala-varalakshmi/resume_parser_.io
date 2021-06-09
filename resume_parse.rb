require "uri"
require "net/http"

def parse_resume(url = "https://assets.promptapi.com/apis/codes/resume_parser/sample_resume.docx")
    url = URI.encode(url)

    url = URI("https://api.promptapi.com/resume_parser/url?url=#{url}")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['apikey'] = "cwRyaJ2urHGfBvJwgvY9M1N0NuItj8WB"


	response = https.request(request)
	puts response.read_body



    puts response
end

parse_resume("/home/varalakshmi/Downloads/akhil_resume.docx")
