-- =============================================================
-- Case ID: TC_DIRECTION_SNN_004
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Omits the direction keyword entirely between two
--   expressions in a range. The BNF requires exactly one direction
--   token. An identifier appears where "to" or "downto" should be.
-- Expected Result: VHDL syntax error: missing direction keyword
-- Dependencies: None
-- =============================================================
entity direction_missing_keyword is
end entity direction_missing_keyword;

architecture missing_direction of direction_missing_keyword is
  constant C_END : integer := 31;
  -- ERROR: "0 C_END" has no direction between expressions
  type t_bad is range 0 C_END;
  signal s : t_bad;
begin
end architecture missing_direction;
