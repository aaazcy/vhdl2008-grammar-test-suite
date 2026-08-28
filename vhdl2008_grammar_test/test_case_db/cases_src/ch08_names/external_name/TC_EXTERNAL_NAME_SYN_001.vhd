-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= << constant external_pathname : subtype_indication >> | << signal external_pathname : subtype_indication >> | << variable external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External name constant+signal+variable three kinds: <<constant .path : type>> + <<signal .path : type>> + <<variable .path : type>>, VHDL 2008 hierarchical reference syntax, verifying the three entity class prefixes of external_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity en_ent is port(y:out integer); end entity;
architecture bh of en_ent is
  signal s_local:integer:=42;
begin
  y<=s_local;
end architecture bh;
