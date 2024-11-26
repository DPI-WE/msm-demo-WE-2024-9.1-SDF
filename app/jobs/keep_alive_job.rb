class KeepAliveJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # TODO: pass in url using args
    KeepAliveService.new("https://msm-we-2024-9-1-sdf.onrender.com/").call
  end
end
