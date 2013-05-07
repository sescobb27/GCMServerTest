=begin
 Datos para probrar la base de datos
=end
entities = [{
        entity_email: 'correo@correo.com',
        entity_name: 'San Carbon',
        entity_telephone_number: '222-22-22',
        categories: %w(Typical Gourmet)
        },{
         entity_email: 'correo1@correo.com',
         entity_name: 'Mondongos',
         entity_telephone_number: '222-22-22',
         categories: %w(Typical Gourmet)
        },{
         entity_email: 'correo2@correo.com',
         entity_name: 'Crysta',
         entity_telephone_number: '222-22-22',
         categories: %w(Techno Reggaeton)
        },{
         entity_email: 'correo3@correo.com',
         entity_name: 'Shupa Shots',
         entity_telephone_number: '222-22-22',
         categories: %w(Shots Cocktails Crossover)
        }]

 entities.each do |entity|
   new_entity = Entity.new entity_email: entity[:entity_email],
           entity_name: entity[:entity_name],
           entity_telephone_number: entity[:entity_telephone_number]
   new_entity.add_categories entity[:categories]
 end