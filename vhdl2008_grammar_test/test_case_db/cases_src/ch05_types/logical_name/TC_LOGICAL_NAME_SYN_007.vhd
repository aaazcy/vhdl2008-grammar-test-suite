-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Positive
-- Test Focus: Positive: logical_name identifier using extended identifier syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: logical_name identifier using extended identifier syntax
entity logical_name_syn_ext is port(dout:out integer); end entity;
architecture rtl of logical_name_syn_ext is
  constant \my file name\ : string := "real.dat";
  signal s:integer:=0;
begin s<=1; dout<=s; end architecture;