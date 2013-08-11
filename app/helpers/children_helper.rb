module ChildrenHelper

    def format_address(child)
        child.address
    end

    def format_health_notes(child)
        if child.health_notes.empty?
            "<em>No health concerns</em>".html_safe
        else
            child.health_notes
        end
    end

    def child_timeline_json(child)
        events = []
        child.events.each do |event|
            event_picture_url = asset_path("events/" + event.picture_url) unless event.picture_url.blank?
            events << {
                :startDate=>event.occurred_on.strftime("%Y,%m,%d"),
                :headline=>event.indicator,
                :text=>event.observations,
                :asset=> {
                    :media => event_picture_url,
                    :credit => "",
                    :caption => ""
                }
            }
        end

        timeline = {
            :timeline => {
                :headline => "#{child.first_name}'s Learning Loop",
                :type => "default",
                :text => "",
                :startDate=>"2012",
                :asset => {
                    :thumbnail => asset_path("avatars/" + child.picture_url),
                },
                :date => events,
            }
        }
        timeline.to_json.html_safe
    end

end
