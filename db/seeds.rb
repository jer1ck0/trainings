# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
body_parts = [      
{ slug: 'back', name: 'Спина' },
{ slug: 'chest', name: 'Грудь' },
{ slug: 'legs', name: 'Ноги' },
{ slug: 'hands', name: 'Руки' },
{ slug: 'cardio', name: 'Кардио' },
{ slug: 'base', name: 'База' },
{ slug: 'abdominal', name: 'Пресс' },
{ slug: 'common', name: 'Вспомогательные' },]

body_parts.each do |body_part|
  bp = BodyPart.find_or_create_by(body_part)
  p bp
end