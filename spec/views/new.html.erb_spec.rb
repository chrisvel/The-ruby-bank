require 'rails_helper'

describe 'sessions/new' do

  it "displays login form" do

    render

    expect(view).to render_template()

  end

end

end
