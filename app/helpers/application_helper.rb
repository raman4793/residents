module ApplicationHelper

  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_activator(activity, activator)
    if activity.activator_type == 'Member'
      link_to activity.activator.name, member_url(activity.activator, subdomain: activity.activator.residence.subdomain)
    elsif activity.activator_type == 'AssociationAdmin'
      link_to activity.activator.name, residence_association_url(activity.activator.residence_association, subdomain: activity.activator.residence_association.subdomain)
    end
  end

  def link_to_eventable(activity, eventable)
    if activity.eventable_type == 'ResidenceAssociation'
      link_to activity.eventable.name, residence_association_url(activity.eventable, subdomain: activity.eventable.subdomain)
    elsif activity.eventable_type == 'House'
      link_to activity.eventable.name, house_url(activity.eventable, subdomain: activity.eventable.residence_association.subdomain)
    else
      link_to activity.eventable.title, blog_url(activity.eventable, subdomain: activity.eventable.member.house.residence_association.subdomain)
    end
  end

end
