-- =============================================================
-- Case ID: TC_DIRECTION_SNN_001
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Uses non-existent keyword "upto" in place of "to" in
--   an integer type range definition. The BNF only allows "to" or
--   "downto"; any other token triggers a parse error.
-- Expected Result: VHDL syntax error at "upto"
-- Dependencies: None
-- =============================================================
entity direction_invalid_keyword is
end entity direction_invalid_keyword;

architecture bad_direction of direction_invalid_keyword is
  -- ERROR: "upto" is not a valid direction keyword per BNF
  type t_bad is range 0 upto 255;
  signal s : t_bad;
begin
end architecture bad_direction;
