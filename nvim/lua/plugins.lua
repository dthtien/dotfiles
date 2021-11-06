local packer = require'packer_init'
packer.startup({
  function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim', opt = true }

    -- Lib
    use { 'svermeulen/vimpeccable', config = function()
      require'vimp'.always_override = true
    end}

    -- Installer
    -- use

  end
})
