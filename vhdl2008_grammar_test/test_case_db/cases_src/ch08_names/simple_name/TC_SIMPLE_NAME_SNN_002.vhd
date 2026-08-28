-- =============================================================
-- Case ID: TC_SIMPLE_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Production: simple_name ::= identifier
-- Case Type: Negative
-- Test Focus: Reserved word used as simple_name identifier — VHDL reserved words cannot be used as identifiers; using 'signal' as an identifier name where a simple_name is expected violates the identifier rule of simple_name
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity simple_name_snn2_ent is port(r:out integer); end entity;
architecture bh of simple_name_snn2_ent is
  signal signal : integer := 0;  -- ERROR: 'signal' is a reserved word, cannot be identifier
begin
  r <= signal;
end architecture bh;
