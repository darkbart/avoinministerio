#encoding: utf-8

require 'rake'
require "acceptance/acceptance_helper"

Capybara.javascript_driver = :webkit

feature "Survey" do

  before :each do
    AvoinMinisterio::Application.load_tasks
    ENV['FILE']="surveys/avoin-ministerio-attitudes-1-fi.rb"
    Rake::Task[:'surveyor'].reenable
    Rake::Task[:'surveyor'].invoke
  end

  scenario "User should be to go to survey after sign_up" do
    visit signup_page
    fill_in "Sähköposti", :with => "citizen-kane@example.com"
    fill_in "citizen_password", :with => "salainensana12345"
    fill_in "citizen_password_confirmation", :with => "salainensana12345"
    fill_in "Kutsumanimi", :with => "Cit-Kane"
    fill_in "Etunimet", :with => "Kane City"
    fill_in "Sukunimi", :with => "Citizen"
    click_button "Rekisteröidy"

    should_be_on after_sign_up
    first(:button, 'Osallistu tieteelliseen tutkimukseen -- täytä kysely').click
    page.has_css?('div#surveyor')
  end

end
