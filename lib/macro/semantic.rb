# frozen_string_literal: true

module Macro
  def self.Semantic(success: nil, failure: nil, **)
    task = lambda { |(ctx, flow_options), **|
      ctx[:semantic_success] = success
      ctx[:semantic_failure] = failure

      [Trailblazer::Activity::Right, [ctx, flow_options]]
    }

    { task: task, id: "semantic_id#{task.object_id}" }
  end

  class Semantic
  end
end
