class FactoryGirlController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    set_factory
    set_traits
    set_attributes
    object = FactoryGirl.send(:create, *arguments)
    render json: object
  end

  private

  def arguments
    @arguments ||= []
  end

  def set_factory
    arguments << sanitize(params[:factory]).to_sym
  end

  def set_traits
    if params[:traits].present?
      arguments += params[:traits].split(',').map(&:strip).map{ |val| sanitize(val) }.map(&:to_sym)
    end
  end

  def set_attributes
    if params[:attributes].present?
      attributes_array = params[:attributes].split(',').map(&:strip)
      attributes_hash = {}
      attributes_array.each { |a_item| attributes_hash[sanitize(a_item.split(':')[0].strip)] = sanitize(a_item.split(':')[1].strip) }
      attributes_hash.symbolize_keys!
      arguments << attributes_hash
    end
  end

  def sanitize(str)
    ActionController::Base.helpers.sanitize(str)
  end
end
