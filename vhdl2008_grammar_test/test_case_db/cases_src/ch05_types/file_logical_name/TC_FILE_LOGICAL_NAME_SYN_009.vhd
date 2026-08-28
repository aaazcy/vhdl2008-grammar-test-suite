-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive
-- Test Focus: file_logical_name as constant string expression for input file
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fln_syn_const is port(dout:out integer); end entity;
architecture rtl of fln_syn_const is
  type t_intfile is file of integer;
  constant C_INFILE : string := "testvec.dat";
  file f : t_intfile open READ_MODE is C_INFILE;
begin
  process begin dout<=0; wait; end process;
end architecture rtl;
