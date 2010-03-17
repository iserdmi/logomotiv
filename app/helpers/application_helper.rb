
module ApplicationHelper
  def asset_icon(asset)
    case asset.data_content_type
      when 'application/pdf': return image_tag ("pdf_icon.gif")
    end
    return  image_tag ("asset_icon.gif")
  end
end
