module ApplicationHelper
  def decorate(model_name, decorator_class = nil)
    (decorator_class || "#{model_name.class}Decorator".constantize).new(model_name)
  end
end
