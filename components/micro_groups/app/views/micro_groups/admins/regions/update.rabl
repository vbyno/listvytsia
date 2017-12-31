extends 'micro_groups/admins/regions/region'

object present(region)

if region.errors.any?
  node(:errors) { region.errors }
end
