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
        era_group = Hash.new
        child.events.each do |event|
            event_picture_url = asset_path("events/" + event.picture_url) unless event.picture_url.blank?
            events << {
                :startDate=>event.occurred_on.strftime("%Y,%m,%d"),
                :headline=>event.indicator,
                :text=>event.observations,
                :tag=>event.category.name,
                :asset=> {
                    :media => event_picture_url,
                    :credit => "",
                    :caption => ""
                }
            }

            if era_group.has_key?(event.category.name)
              era_group[event.category.name] = event
            end

        end

        era = []
        era_group.each do |event|
            era << {
                :startDate=>child.events.select {|e| e.category.name == event.category.name}.sort { |a,b| a.occurred_on.strftime("%Y,%m,%d") <=> b.occurred_on.strftime("%Y,%m,%d") }.first.occurred_on.strftime("%Y,%m,%d"),
                :endDate=>child.events.select {|e| e.category.name == event.category.name}.sort { |a,b| b.occurred_on.strftime("%Y,%m,%d") <=> a.occurred_on.strftime("%Y,%m,%d") }.first.occurred_on.strftime("%Y,%m,%d"),
                :headline=>event.category.description,
                :text=>"<p>" + event.category.description + "</p>",
                :tag=>event.category.name
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
                :era => era
            }
        }
        timeline.to_json.html_safe
    end

end
