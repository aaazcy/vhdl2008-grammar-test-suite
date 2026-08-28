-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Positive
-- Test Focus: Positive: logical_name identifier in file declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: logical_name identifier in file declaration
entity logical_name_syn_file is port(dout:out integer); end entity;
architecture rtl of logical_name_syn_file is
  type t_intfile is file of integer;
  constant C_FNAME : string := "data.dat";
  file f : t_intfile open WRITE_MODE is C_FNAME;
begin process begin write(f,42); dout<=0; wait; end process; end architecture;