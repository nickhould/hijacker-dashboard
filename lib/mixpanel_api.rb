require 'mixpanel_client'

class MixpanelAPI
  API_KEY    = ENV["mixpanel_key"]
  API_SECRET = ENV["mixpanel_secret"]

  def initialize()
    config = {
      api_key:     API_KEY,
      api_secret:  API_SECRET
    }
    @client = Mixpanel::Client.new(config)
    @from_date = Date.today - 7
    @to_date = Date.today - 1
  end

  def funnel_list(params={})
    @client.request('funnels/list', params)
  end

  def funnel(params={})
    @client.request('funnels', params)
  end

end