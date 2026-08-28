-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SNN_S01
-- Rule Type: Syntax
-- BNF Production: ATTRIBUTE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Test Focus: attribute_name: missing tick before attribute designator
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity an_e is port(r:out integer); end entity;
architecture bh of an_e is
  signal s:integer:=0;
begin
  r<=sinteger'image(s);  -- ERROR: missing tick
end architecture;
