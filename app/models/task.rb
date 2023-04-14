class Task < ApplicationRecord

   validates :title, presence: true, length: { maximum: 20 }
   validates :starting,  presence: true
   validates :ending,  presence: true
   validates :memo, length: { maximum: 500 }
   validate :start_end_check
   validate :date_before_start

  def start_end_check
    starting ||= 1
    ending ||= 2

    errors.add(:ending, "は開始日より前の日付は登録できません。") unless
    starting < ending 
    end
  end

  def date_before_start
    return if starting.blank?
    errors.add(:starting, "は今日以降のものを選択してください") if starting < Date.today
  end
