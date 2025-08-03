{programs.nixvim.keymaps =  [
{
	action = "<cmd>Telescope find_files<CR>";
	key = "<leader>sf";
	mode = [ "n" ] ;
	options = { desc = "Search files";
	};
}
{
	action = "<cmd>Telescope live_grep<CR>";
	key = "<leader>sg";
	mode = [ "n" ] ;
	options = { desc = "Search using live grep";
	};
}
{
	action = "<cmd>Telescope buffers<CR>";
	key = "<leader><leader>";
	mode = [ "n" ] ;
	options = { desc = "List buffers";
	};
}
{
	action = "<cmd>Telescope<CR>";
	key = "<leader>ss";
	mode = [ "n" ] ;
	options = { desc = " help tags";
	};
}
];

programs.nixvim.lsp.keymaps =

[
{
	key = "gd";
	lspBufAction = "definition";
}
{
	key = "gD";
	lspBufAction = "references";
}
{
	key = "gt";
	lspBufAction = "type_definition";
}
{
	key = "gi";
	lspBufAction = "implementation";
}
{
	key = "K";
	lspBufAction = "hover";
}
{
	action = "<CMD>Lspsaga hover_doc<Enter>";
	key = "K";
}
];
}
