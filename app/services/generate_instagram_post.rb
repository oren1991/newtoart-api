module Services
  class GenerateInstagramPost
    def initialize(review)
      @review = review
    end

    def run
      generate_post
    end

    private

    def generate_post
      read_template
    end

    def read_template
      template = File.open(Rails.root.join('app', 'templates', 'instagram_post_template.txt'))
      post_text = template
                      .read
                      .gsub('{{r}}', @review.review_text)
                      .gsub('{{c}}', @review.reviewable.caption)
                      .gsub('{{u}}', @review.reviewable.instagram_username)
                      .gsub('{{s}}', @review.reviews_properties.map(&:unicode_text).compact.join("\n"))
    end
  end
end
