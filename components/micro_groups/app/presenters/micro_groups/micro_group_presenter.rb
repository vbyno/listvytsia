module MicroGroups
  class MicroGroupPresenter < Core::BasePresenter
    SHORT_NAME_SIZE = 40

    presents :micro_group

    def name
      micro_group.name.delete("«»")
    end

    def short_name
      name.truncate(SHORT_NAME_SIZE)
    end
  end
end
