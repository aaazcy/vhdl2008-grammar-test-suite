-- =============================================================
-- Case ID: TC_FILE_DECLARATION_SNN_001
-- Rule Type: Syntax
-- BNF Production: FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: file_declaration ::=
--   file identifier_list : subtype_indication
--   [ file_open_information ] ;
-- Test Focus: Missing colon in file declaration — BNF requires
--   a colon between identifier_list and subtype_indication;
--   here the colon is omitted, causing the parser to fail
--   when it encounters the subtype_indication token
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity file_declaration_snn_001 is
  port (
    clk     : in  bit;
    rst_n   : in  bit;
    val_out : out integer range 0 to 255
  );
end entity file_declaration_snn_001;

architecture rtl of file_declaration_snn_001 is
  type t_char_file is file of character;

  -- ERROR: missing colon between identifier and subtype_indication
  -- Should be: file f_data : t_char_file;
  file f_data t_char_file;

  signal s_val : integer range 0 to 255 := 0;
begin
  val_out <= s_val;
end architecture rtl;
