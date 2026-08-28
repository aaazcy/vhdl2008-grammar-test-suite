-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Positive
-- Test Focus: Partial pathname dot-separated path——`pathname_element.pathname_element.object` describes a hierarchical path in a VHDL 2008 external name and may contain multiple levels of pathname_element
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pp_ent is port(y:out integer); end entity;
architecture bh of pp_ent is
  signal s_local:integer:=42;
begin
  -- In external name: <<signal .pp_ent.bh.s_local : integer>>
  -- partial_pathname = pp_ent.bh.s_local
  y<=s_local;
end architecture bh;
