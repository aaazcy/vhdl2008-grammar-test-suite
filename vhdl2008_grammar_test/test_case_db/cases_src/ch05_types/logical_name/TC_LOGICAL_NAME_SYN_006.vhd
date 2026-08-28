-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Positive
-- Test Focus: Positive: multiple logical names in a package declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: multiple logical names in a package declaration
entity logical_name_syn_pkg is port(dout:out integer); end entity;
architecture rtl of logical_name_syn_pkg is
  constant C_FILE1 : string := "input.txt";
  constant C_FILE2 : string := "output.txt";
  signal s:integer:=0;
begin s<=1; dout<=s; end architecture;