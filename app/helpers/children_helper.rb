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
                :headline=>event.title,
                :text=>event.notes,
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
#         <<EOS
#             {
#             "timeline":
#             {
#                 "headline":"Isla's Learning Loop",
#                 "type":"default",
#                 "text":"People say stuff",
#                 "startDate":"2012,1,26",
#                 "date": [
#                     {
#                         "startDate":"2011,12,12",
#                         "endDate":"2012,1,27",
#                         "headline":"Vine",
#                         "text":"<p>Vine Test</p>",
#                         "asset":
#                         {
#                             "media":"http://localhost:3000/assets/avatars/01.jpg",
#                             "thumbnail":"http://localhost:3000/assets/avatars/01.jpg",
#                             "credit":"",
#                             "caption":""
#                         }
#                     },
#                     {
#                         "startDate":"2012,1,26",
#                         "endDate":"2012,1,27",
#                         "headline":"Sh*t Politicians Say",
#                         "text":"<p>In true political fashion, his character rattles off common jargon heard from people running for office.</p>",
#                         "asset":
#                         {
#                             "media":"http://localhost:3000/assets/avatars/01.jpg",
#                             "thumbnail":"http://localhost:3000/assets/avatars/01.jpg",
#                             "credit":"",
#                             "caption":""
#                         }
#                     }
#                 ]
#             }
#         }
# EOS
    end

end
