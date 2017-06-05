require 'json'

class TinySerializer
  def self.attributes(*attrs)
    @@attributes = attrs
  end

  def initialize(object)
    @object = object
  end

  def to_json
    to_h.to_json
  end

  def to_h
    @@attributes.map{|attr| [attr, value_for_attribute(attr)] }.to_h
  end

  private

  def value_for_attribute(attr)
    self.respond_to?(attr) ? self.send(attr) : @object.public_send(attr)
  end
end
