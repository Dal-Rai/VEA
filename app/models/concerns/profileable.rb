module Profileable
  extend ActiveSupport::Concern

  included do
    attr_accessor :name, :full_name

    def name
      name = []
      name << profile.firstname if profile.respond_to? :firstname
      name << profile.lastname if profile.respond_to? :lastname
      name.empty? ? email : name.join(" ")
    end

    def full_name
      salutation = I18n.t("salutation.#{profile.salutation.downcase}")
      name = [salutation, profile.firstname, profile.lastname].compact
      name.empty? ? email : name.join(" ")
    end
  end
end