local autocmd = require('utils').autocmd

autocmd('packer_user_config', [[BufWritePost plugins.lua source <afile> | PackerCompile]], true)
autocmd('go_org_imports', [[BufWritePre *.go lua go_org_imports()]], true)
