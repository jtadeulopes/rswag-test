class Parking < ApplicationRecord
  PLATE_REGEX = /\A[A-Z]{3}-[0-9]{4}\z/

  validates :plate,
    format: { with: PLATE_REGEX, message: 'invalid plate' },
    presence: true

  def pay!
    update(paid: true, paid_at: Time.current) unless paid?
  end

  def ticket
    "PK-#{id.to_s.last(4).upcase}"
  end
end
