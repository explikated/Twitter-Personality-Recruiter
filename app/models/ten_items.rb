class TenItems < ActiveRecord::Base
  belongs_to :subject, :polymorphic => true

  def self.full_texts
    {
      "extraverted" => "Extraverted, enthusiastic",
      "critical" => "Critical, quarrelsome",
      "dependable" => "Dependable, self-disciplined",
      "anxious" => "Anxious, easily upset",
      "open" => "Open to new experiences, complex",
      "reserved" => "Reserved, quiet",
      "sympathetic" => "Sympathetic, warm",
      "disorganized" => "Disorganized, careless",
      "calm" => "Calm, emotionally stable",
      "conventional" => "Conventional, uncreative"
    }
  end
end
