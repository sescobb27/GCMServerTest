SmartOut.Entity = DS.Model.extend
  entity_email: DS.attr('string')
  entity_name: DS.attr('string')
  entity_telephone_number: DS.attr('string')

# example data
SmartOut.Entity.FIXTURES = [
      {
            id: 1,
            entity_email: 'correo@correo.com',
            entity_name: 'San Carbon',
            entity_telephone_number: '222-22-22',
            # categories: %w(Typical Gourmet),
            # locations: %w(laureles poblado belen la_estrella)
      },
      {
            id: 2,
            entity_email: 'correo1@correo.com',
            entity_name: 'Mondongos',
            entity_telephone_number: '222-22-22',
            # categories: %w(Typical Gourmet),
            # locations: %w(los_colores estadio envigado las_vegas)
      },
      {
            id: 3,
            entity_email: 'correo2@correo.com',
            entity_name: 'Crysta',
            entity_telephone_number: '222-22-22',
            # categories: %w(Techno Reggaeton),
            # locations: %w(el_tesoro guadalcanal unicentro san_lucas)
      },
      {
            id: 4,
            entity_email: 'correo3@correo.com',
            entity_name: 'Shupa Shots',
            entity_telephone_number: '222-22-22',
            # categories: %w(Shots Cocktails Crossover),
            # locations: %w(el_centro estadio el_tesoro las_vegas laureles lleras bulerias)
      }
]