-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Positive
-- Test Focus: Positive: logical_name used as a configuration identifier
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: logical_name used as a configuration identifier
entity logical_name_syn_cfg is port(dout:out integer); end entity;
architecture rtl of logical_name_syn_cfg is
  constant C_ARCH : string := "rtl";
  signal s:integer:=0;
begin s<=1; dout<=s; end architecture;