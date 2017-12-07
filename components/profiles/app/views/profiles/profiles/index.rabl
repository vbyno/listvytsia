extends 'profiles/profiles/profile'
collection profiles.map { |profile| present(profile) }
