-- =============================================================
-- Case ID: TC_DIRECTION_SNN_003
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Uses comma in place of direction keyword in a range
--   expression. The BNF requires the "direction" nonterminal here,
--   not a separator. This targets the specific token position.
-- Expected Result: VHDL syntax error at comma
-- Dependencies: None
-- =============================================================
entity direction_comma_not_keyword is
end entity direction_comma_not_keyword;

architecture bad_separator of direction_comma_not_keyword is
  -- ERROR: comma is not a valid substitution for direction keyword
  type t_bad is range 0 , 15;
  signal s : t_bad;
begin
end architecture bad_separator;
