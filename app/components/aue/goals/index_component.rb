class AUE::Goals::IndexComponent < ApplicationComponent
  attr_reader :goals, :header
  delegate :link_list, to: :helpers

  def initialize(goals, header:)
    @goals = goals
    @header = header
  end

  private

    def title
      t("aue.goals.title")
    end

    def goal_links
      goals.map { |goal| goal_link(goal) }
    end

    def goal_link(goal)
      [icon(goal), aue_goal_path(goal.code)]
    end

    def icon(goal)
      render AUE::Goals::IconComponent.new(goal)
    end
end
