-- =============================================================
-- Case ID: TC_AGGREGATE_SNN_S01
-- Rule Type: Syntax
-- BNF Production: AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3
-- Test Focus: aggregate: missing arrow in named association
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ag_e is port(r:out integer); end entity;
architecture bh of ag_e is
  type t_rec is record a:integer; b:bit; end record;
  signal s:t_rec;
begin
  s<=(a 1, b=>'0');  -- ERROR: missing => for a
  r<=s.a;
end architecture;
