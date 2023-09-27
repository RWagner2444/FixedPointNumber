class FixedPointNumber
  @intVal;
  @qVal;

  def initialize(x,q)
    if  x.is_a?(Float)
      x = x * (2 ** q)
      @intVal = x
      @qVal = q
    elsif x.is_a?(Integer)
      @intVal = x
      @qVal = q
    end
  end

  def to_double
    new_double = @intVal.to_f / (2**@qVal).to_f
    return new_double
  end

  def to_q_val(q)
    shift = q - @qVal
    if shift >= 0
      new_int_val = @int_val << shift
    else
      new_int_val = @int_val >> -shift
    end
    new_fpn = FixedPointNumber.new(new_int_val,q)
    return new_fpn
  end

  def to_s
    to_double_representation = "%.6f" % to_double
    "#{@intVal},#{@qVal}: #{to_double_representation}"
  end

end