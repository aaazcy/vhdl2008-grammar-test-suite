-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Positive
-- Test Focus: Positive: logical_name as a simple identifier for an entity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: logical_name as a simple identifier for an entity
entity logical_name_syn_ent is port(dout:out integer); end entity;
architecture rtl of logical_name_syn_ent is
  constant C_NAME : string := "my_component";
  signal s:integer:=0;
begin s<=s+1; dout<=s; end architecture;