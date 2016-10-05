class UserPresenter < Burgundy::Item
  def name; h.send(:h, item.name); end
  def email; h.send(:h, item.email); end

  def user_avatar(css = true, size = nil, tooltip = false)
    html_classes = %W(img-avatar img-avatar#{size} img-avatar-thumb).uniq.join(" ")
    html_attrs   = {}
    html_data    = {}
    avatar_url   = item.try(:avatar).present? ? item.avatar_url : gravatar_url(size)
    html_attrs.update(class: html_classes) if css
    html_data.update(toggle: "tooltip", placement: "top") if tooltip
    html_data.update(:"original-title" => item.event_name) if tooltip && item.try(:event_name)
    html_attrs.update(data: html_data) if html_data.present?
    h.image_tag(avatar_url, html_attrs)
  end

  def gravatar_url(size = nil)
    return h.asset_path("user.png") unless item.try(:email).present?

    size        = 64 if size.in?([nil, 'small', :small])
    gravatar_id = Digest::MD5.hexdigest(item.email.downcase)
    host_opts   = configatron.urls.production.to_h.slice(:host, :protocol)
    default_url = h.asset_path("user.png", host_opts)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{default_url}"
  end
end
