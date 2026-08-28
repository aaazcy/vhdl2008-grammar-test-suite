-- =============================================================
-- Case ID: TC_RANGE_SNN_002
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: SNN: the direction keyword 'upto' is not a legal direction — 'array(0 upto 7)' uses an unknown keyword where the BNF requires 'to' or 'downto', so the range cannot be parsed
-- Expected Result: Triggers syntax error: ')' is expected instead of '<integer>'
-- Dependencies: None
-- =============================================================
entity rng39_ent is end entity;
architecture rtl of rng39_ent is
  type t_bad is array(0 upto 7) of bit;
begin
end architecture;
