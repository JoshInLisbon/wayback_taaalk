require 'nokogiri'

taaalks = Dir["t/*/index.html"].map do |path|
  page = Nokogiri::HTML(File.open(path))

  speakers = page.css('.spkr-info').map do |spkr_info|
    info_header = spkr_info.css('h3 a')[0]
    {
      name: info_header.text,
      id: info_header.attr('class').delete("^0-9"),
      side: spkr_info.attr('class').gsub('spkr-info spkr-info-',''),
      profile_path: info_header['href'],
      twitter_handle: spkr_info.css('.twitter-handle').text.strip,
      bio: spkr_info.css('.trix-content').inner_html,
    }
  end

  messages = page.css('.tlk-blob').map do |message|
    {
      speaker_id: message.css('div[class^="name-spkr-"]')[0].attr('class').delete("^0-9"),
      created_at: message.css('div[class="tlk-blob-date"]').text.partition("(")[0].strip,
    }
  end

  {
    title: page.css('h1')[0].text,
    speakers: speakers,
    messages: messages,
  }
end

pp taaalks