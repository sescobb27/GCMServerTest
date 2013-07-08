=begin
 Datos para probrar la base de datos
=end
entities = [{
        entity_email: 'correo@correo.com',
        entity_name: 'San Carbon',
        entity_telephone_number: '222-22-22',
        categories: %w(Typical Gourmet),
        locations: %w(laureles poblado belen la_estrella)
        },{
         entity_email: 'correo1@correo.com',
         entity_name: 'Mondongos',
         entity_telephone_number: '222-22-22',
         categories: %w(Typical Gourmet),
         locations: %w(los_colores estadio envigado las_vegas)
        },{
         entity_email: 'correo2@correo.com',
         entity_name: 'Crysta',
         entity_telephone_number: '222-22-22',
         categories: %w(Techno Reggaeton),
         locations: %w(el_tesoro guadalcanal unicentro san_lucas)
        },{
         entity_email: 'correo3@correo.com',
         entity_name: 'Shupa Shots',
         entity_telephone_number: '222-22-22',
         categories: %w(Shots Cocktails Crossover),
         locations: %w(el_centro estadio el_tesoro las_vegas laureles lleras bulerias)
        }]

 entities.each do |entity|
   new_entity = Entity.new entity_email: entity[:entity_email],
           entity_name: entity[:entity_name],
           entity_telephone_number: entity[:entity_telephone_number]
   new_entity.add_categories entity[:categories]
   new_entity.add_location entity[:locations].each { |str| str.gsub! /_/, ' ' }
 end