-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SNN_S01
-- Rule Type: Syntax
-- BNF Production: COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7
-- Test Focus: component_instantiation_statement: missing port map keyword
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity cis_e is port(r:out integer); end entity;
architecture bh of cis_e is
  component comp is port(x:in integer; y:out integer); end component;
  signal s_x,s_y:integer;
begin
  u_comp: comp(x=>s_x,y=>s_y);  -- ERROR: missing "port map"
  r<=s_y;
end architecture;
