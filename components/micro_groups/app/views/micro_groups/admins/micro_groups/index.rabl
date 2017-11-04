extends 'micro_groups/admins/micro_groups/micro_group'
collection micro_groups.map { |micro_group| present(micro_group) }
