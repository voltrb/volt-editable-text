module EditableText
  class MainController < Volt::ModelController
    attr_accessor :section
    reactive_accessor :toggled

    def index
      self.toggled = false
    end

    def body_element
      Element.find('body')
    end

    def toggle_editing
      self.toggled = !toggled

      if toggled
        # Editing enabled, bind a listener for when they click on the document to disable
        # it again.
        body_element.on('click.editabletext') do |event|
          # Find the id for the text field inside of this component.
          clicked_id = Element.find(section.container_node).find('input').id

          if clicked_id != event.target.id
            # Didn't click inside of the edit text field, toggle back.
            toggle_editing
          end
        end
      else
        body_element.off('click.editabletext')
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