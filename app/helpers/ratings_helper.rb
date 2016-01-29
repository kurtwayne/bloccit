module RatingsHelper
  def rating_to_button(rating)
      raw rating.map { |r| link_to r.name, rating_path(id: r.id), class: 'btn btn-info' }
    end
end
