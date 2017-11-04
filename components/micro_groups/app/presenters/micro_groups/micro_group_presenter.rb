module MicroGroups
  class MicroGroupPresenter < Core::BasePresenter
    presents :micro_group

    def id
      micro_group.id.to_s
    end
  end
end
