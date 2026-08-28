-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SNN_S01
-- Rule Type: Syntax (Negative, Production-Specific)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: SNN: range of range_constraint missing direction and right bound - in 't_base range 255' a single bound has neither a direction keyword nor a right bound after it, verifying the range form requires simple_expression direction simple_expression
-- Expected Result: Triggers syntax error: 'to' or 'downto' expected
-- Dependencies: None
-- =============================================================
entity rc42_ent is
  port ( flag : out bit );
end entity rc42_ent;
architecture rtl of rc42_ent is
  type t_base is range 0 to 255;
  subtype t_null is t_base range 255;
begin
  flag <= '0';
end architecture rtl;
