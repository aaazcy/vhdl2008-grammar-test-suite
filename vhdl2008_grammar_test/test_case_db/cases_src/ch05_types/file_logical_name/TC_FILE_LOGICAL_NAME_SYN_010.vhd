-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive
-- Test Focus: file_logical_name as concatenated string expression from prefix and suffix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fln_syn_concat is port(dout:out integer); end entity;
architecture rtl of fln_syn_concat is
  type t_intfile is file of integer;
  constant C_PREFIX : string := "data_";
  constant C_SUFFIX : string := ".dat";
  file f : t_intfile open WRITE_MODE is C_PREFIX & "b000" & C_SUFFIX;
begin
  process begin write(f, 42); dout<=0; wait; end process;
end architecture rtl;
