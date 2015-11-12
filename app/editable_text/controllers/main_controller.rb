module EditableText
  class MainController < Volt::ModelController
    attr_accessor :section
    reactive_accessor :toggled

    def index
      self.toggled = false
    end

    # def body_element
    #   Element.find('body')
    # end

    # def input_element
    #   Element.find(section.container_node).find('input')
    # end

    def toggle_editing
      self.toggled = !toggled

      if toggled
	`setTimeout(function(){ $(#{section.container_node}).find('input').focus(); }, 0)`
      end
    end

    def edit(event)
      if event.key_code == 13
	#for some reason .stop or stop_propagation thow the following error:
	#undefined method `stop_propagation' for #<Volt::JSEvent:7672>

	#event.stop_propagation

	toggle_editing
      end
    end

    def blur
      toggle_editing
    end

    def value=(newvalue)
      attrs.value = newvalue
    end

    def value
      return attrs.value
    end

    def size
      return attrs.value.size
    end

  end
end
