class Task < ApplicationRecord
   validates :title, presence: true, length: { maximum: 20 }
   validates :starting,  presence: true
   validates :ending,  presence: true
   validates :memo, length: { maximum: 500 }
   validate :start_end_check

   def start_end_check
     errors.add(:ending, "は開始日より前の日付は登録できません。") unless
     self.starting < self.ending
    end
end
