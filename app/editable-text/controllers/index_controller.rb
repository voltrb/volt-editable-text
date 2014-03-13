module EditableText
  class IndexController < ModelController
    attr_accessor :section

    def index
      @toggled = ReactiveValue.new(false)
    end

    def toggled
      @toggled
    end

    def body_element
      Element.find('body')
    end

    def toggle_editing
      controller._toggled = (!controller._toggled).cur

      if controller._toggled.cur
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
        event.stop

        toggle_editing
      end
    end
  end
end