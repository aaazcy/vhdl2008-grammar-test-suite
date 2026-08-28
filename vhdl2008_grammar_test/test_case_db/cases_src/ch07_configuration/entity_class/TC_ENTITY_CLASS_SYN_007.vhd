-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SYN_007
-- Rule Type: Syntax
-- BNF Production: ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Positive
-- Test Focus: use of entity class "file" and "procedure" — an attribute applied to a file type declaration (file class), an attribute applied to a procedure signature (procedure class), verifies these two keywords are legal in attribute_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ec_file_proc is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ec_file_proc is
  type t_line is file of string;
  file f_data : t_line;
  procedure p_delay(signal s : out bit; constant d : in time) is
  begin
    s <= a after d;
  end procedure;
  attribute note : string;
  attribute note of f_data : file is "text_line_type";
  attribute note of p_delay[bit, time] : procedure is "delay_proc";
  signal s_buf : bit;
begin
  p_delay(s_buf, 1 ns);
  y <= s_buf;
end architecture rtl;
