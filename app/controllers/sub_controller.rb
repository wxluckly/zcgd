class SubController < ApplicationController
  def company
  end

  def company_intro
  end

  def company_aboutus
  end

  def price
    url = 'http://www.chinagolddeal.com/search/list/'
    body = Typhoeus.get(url, nosignal: true, followlocation: true, timeout: 5).body
    doc = Nokogiri::HTML(body)
    @date = doc.css('.news_cent > div')[1].text

    @au9999_91 = doc.search('#list7_1 tr')[1].search('td')[1].text
    @au9995_91 = doc.search('#list7_1 tr')[2].search('td')[1].text
    @au9999_92 = doc.search('#list7_1 tr')[1].search('td')[2].text
    @au9995_92 = doc.search('#list7_1 tr')[2].search('td')[2].text

    @au9999_131 = doc.search('#list7_2 tr')[1].search('td')[1].text
    @au9995_131 = doc.search('#list7_2 tr')[2].search('td')[1].text
    @au9999_132 = doc.search('#list7_2 tr')[1].search('td')[2].text
    @au9995_132 = doc.search('#list7_2 tr')[2].search('td')[2].text

    @au9999_151 = doc.search('#list7_3 tr')[1].search('td')[1].text
    @au9995_151 = doc.search('#list7_3 tr')[2].search('td')[1].text
    @au9999_152 = doc.search('#list7_3 tr')[1].search('td')[2].text
    @au9995_152 = doc.search('#list7_3 tr')[2].search('td')[2].text


    @agtd_91 = doc.search('#list8_1 tr')[1].search('td')[1].text
    @agtd_92 = doc.search('#list8_1 tr')[1].search('td')[2].text

    @agtd_131 = doc.search('#list8_2 tr')[1].search('td')[1].text
    @agtd_132 = doc.search('#list8_2 tr')[1].search('td')[2].text

    @agtd_151 = doc.search('#list8_3 tr')[1].search('td')[1].text
    @agtd_152 = doc.search('#list8_3 tr')[1].search('td')[2].text


    @tzxs_91 = doc.search('#list9_1 tr')[1].search('td')[1].text
    @tzhg_91 = doc.search('#list9_1 tr')[2].search('td')[1].text
    @tzxs_92 = doc.search('#list9_1 tr')[1].search('td')[2].text
    @tzhg_92 = doc.search('#list9_1 tr')[2].search('td')[2].text

    @tzxs_131 = doc.search('#list9_2 tr')[1].search('td')[1].text
    @tzhg_131 = doc.search('#list9_2 tr')[2].search('td')[1].text
    @tzxs_132 = doc.search('#list9_2 tr')[1].search('td')[2].text
    @tzhg_132 = doc.search('#list9_2 tr')[2].search('td')[2].text

    @tzxs_151 = doc.search('#list9_3 tr')[1].search('td')[1].text
    @tzhg_151 = doc.search('#list9_3 tr')[2].search('td')[1].text
    @tzxs_152 = doc.search('#list9_3 tr')[1].search('td')[2].text
    @tzhg_152 = doc.search('#list9_3 tr')[2].search('td')[2].text

  end
end
