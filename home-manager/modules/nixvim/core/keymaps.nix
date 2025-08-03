programs.nixvim.keymaps = [
{
	action = "find_filies";
	key = "<leader>sf";
	mode = [ "n" ] ;
	options = { desc = "Search files"; };
}
{
	action = "live_grep";
	key = "<leader>sg;
	mode = [ "n" ] ;
	options = { desc = "Search using live grep"; };
}
{
	key = "<leader><leader>";
	action = "buffers";
	mode = [ "n" ] ;
	options = { desc = "List buffers"; };
}
{
	key = "<leader>ss";
	action = "help
		mode = [ "n" ] ;
	options = { desc = " help tags";};
}
];
