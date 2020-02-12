# frozen_string_literal: true

RSpec.describe 'Tickets' do
  let!(:ticket1) { create(:ticket, :with_excavator) }
  let!(:ticket2) { create(:ticket, :with_excavator) }

  it 'renders needful elements' do
    visit tickets_path
    expect(page).to have_content(ticket1.request_number)
    expect(page).to have_content(ticket2.request_number)

    click_link "Ticket #{ticket1.id}"
    expect(page).to have_selector('#map')
    ticket1.attributes.values.each do |value|
      expect(page).to have_content value
    end
  end
end
