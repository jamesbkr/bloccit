class Rate <ActiveRecord::Base
    has_many :ratings
    belongs_to :rateable, polymorphic: true
    has_many :topics, through: :ratings, source: :rateable, source_type: :Topic
    has_many :posts, through: :ratings, source: :rateable, source_type: :Post
    enum severity: [:PG,:PG13,:R]
end