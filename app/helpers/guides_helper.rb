module GuidesHelper
  def guide_name
  	guide.try(:name) or 'This guide does not exist.'
  end
end
