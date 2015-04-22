# Volt Editable Text Component

**Note** Currently this only supports Volt 0.8.x, updates for 0.9.x coming soon.

Provides a component that displays text, but becomes editable in a field when clicked on.

## Usage

Add this line to your application's Gemfile:

    gem 'volt-editable-text'

And then execute:

    $ bundle

Then require it as a component in any components' dependencies.rb you want to use it in.

    component 'editable-text'
    
Finally, use the tag.

    <:editable-text value="{{_some_value}}" />
