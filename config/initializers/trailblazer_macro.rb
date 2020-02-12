# frozen_string_literal: true

Dir[Rails.root.join('lib', 'macro', '**', '*.rb')].each(&method(:require))
