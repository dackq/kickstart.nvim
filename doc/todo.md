This file contains a list of changes that I would like to make to this config repository

- [ ] Put all keymappings into one file. If a certain keymapping only needs to be called at a specific event, create a autocommand even to turn the mappings on and off
  - actually I'm not sure if I want this... maybe it's better to have all the keymaps associated to a plugin in the same place... but if I do that I am not sure how to avoid having conflicting keymappings...
- [ ] Move all plugins into separate files
- [ ] Move ensure installed for mason to its own module and ensure that it is only called once
- [ ] make the config adapt to the environment it is in (i.e. if it is running in vscode then don't load certain plugins, if it is running in windows/macos setup different environments
