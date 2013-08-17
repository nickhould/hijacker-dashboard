class Tasker

  attr_accessor :mixpanel
  def initialize
    @mixpanel ||= MixpanelAPI.new
  end

  def websites
    params = {
      event: "Sent image",
      name: "website_url",
      type: "general",
      unit: "minute",
      interval: 5,
    }
    events = mixpanel.event_properties(params)
    items = []
    events["data"]["values"].each do |website, results|
      sum = 0
      results.each do |date, count|
        sum += count.to_i
      end
      result = { label: website, value: sum }
      items << (result)
    end
    return items.sort_by {|h| h["value"]}.reverse if items
  end
end



