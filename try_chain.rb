class Object
  def try_chain(*args)
    chain = self
    args.each do |method|
      method.is_a?(Hash) ? (method, arguments = method.first) : arguments = []
      chain = chain.try(method.to_sym, *arguments)
    end
    chain
  end

  def blank_try(meth, *args)
    result = self.try(meth, *args)
    result.presence
  end

  def presence_chain(*args)
    chain = self
    args.each do |method|
      method.is_a?(Hash) ? (method, arguments = method.first) : arguments = []
      chain = chain.blank_try(method.to_sym, *arguments)
    end
    chain
  end
end
