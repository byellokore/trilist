# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home

  end

  def contact
    by = 10
    ExampleJob.perform_later
  end

end
