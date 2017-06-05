class TinySerializer
  def self.attributes(*attrs)
    @@attributes = attrs
  end

  def initialize(object)
    @object = object
  end

  def to_h
    @@attributes.map{|attr| [attr, @object.public_send(attr)] }.to_h
  end
end
