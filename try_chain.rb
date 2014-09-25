class Object
  def try_chain(*args)
    chain_up(:try, *args)
  end

  def blank_try(meth, *args)
    self.try(meth, *args).presence
  end

  def presence_chain(*args)
    chain_up(:blank_try, *args)
  end

  def chain_up(which_method, *args)
    chain = self
    args.each do |method|
      method.is_a?(Hash) ? (method, arguments = method.first) : arguments = []
      chain = chain.__send__(which_method, method, *arguments)
    end
    chain
  end
end
