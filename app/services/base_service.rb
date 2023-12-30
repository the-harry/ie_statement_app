# frozen_string_literal: true

class BaseService
  def self.call(*)
    new.call(*)
  end

  def self.call!(*)
    new.call!(*)
  end

  def call(*args)
    raise NotImplementedError
  end

  def call!(*args)
    raise NotImplementedError
  end
end
