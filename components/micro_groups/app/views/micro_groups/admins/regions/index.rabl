extends 'micro_groups/admins/regions/region'

collection regions.map { |region| present(region) }
