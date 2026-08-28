-- =============================================================
-- Case ID: TC_FILE_DECLARATION_SMN_001
-- Related Rule ID: SMN_FILE_DEC_001
-- Rule Type: Semantic
-- BNF Production: FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3, Section 12.3
-- Production: file_declaration ::=
--   file identifier_list : subtype_indication
--   [ file_open_information ] ;
-- Test Focus: File declaration with subtype_indication that
--   does not denote a file type — subtype_indication must
--   resolve to a file type; here integer type is used which
--   is not a file type, triggering a type mismatch
-- Case Type: Negative
-- Error Category: type_error
-- Expected Result: Triggers semantic error: not a file type
-- Dependencies: None
-- =============================================================
entity file_declaration_smn_001 is
  port (
    clk     : in  bit;
    rst_n   : in  bit;
    val_out : out integer range 0 to 255
  );
end entity file_declaration_smn_001;

architecture rtl of file_declaration_smn_001 is
  -- ERROR: integer is not a file type — file_declaration requires
  -- the subtype_indication to resolve to a file type
  file f_bad : integer open read_mode is "data.txt";

  signal s_val : integer range 0 to 255 := 0;
begin
  val_out <= s_val;
end architecture rtl;
