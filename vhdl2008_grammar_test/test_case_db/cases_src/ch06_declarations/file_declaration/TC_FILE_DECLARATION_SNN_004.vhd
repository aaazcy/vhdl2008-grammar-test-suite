-- =============================================================
-- Case ID: TC_FILE_DECLARATION_SNN_004
-- Rule Type: Syntax
-- BNF Production: FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: file_declaration ::=
--   file identifier_list : subtype_indication
--   [ file_open_information ] ;
-- Test Focus: Invalid file_open_information keyword — BNF
--   defines file_open_information ::=
--   [ open file_open_kind_expression ] is file_logical_name
--   Here 'open' is misspelled as 'opn', causing parse failure
--   at the file_open_information clause
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity file_declaration_snn_004 is
  port (
    clk     : in  bit;
    rst_n   : in  bit;
    val_out : out integer range 0 to 255
  );
end entity file_declaration_snn_004;

architecture rtl of file_declaration_snn_004 is
  type t_int_file is file of integer;

  -- ERROR: misspelled 'open' keyword in file_open_information
  -- Should be: file f_data : t_int_file open read_mode is "data.txt";
  file f_data : t_int_file opn read_mode is "data.txt";

  signal s_val : integer range 0 to 255 := 0;
begin
  val_out <= s_val;
end architecture rtl;
