-- =============================================================
-- Case ID: TC_DIRECTION_SNN_002
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Uses truncated "down" instead of the full keyword
--   "downto" in an array type definition. The BNF requires the
--   complete reserved word "downto".
-- Expected Result: VHDL syntax error at "down"
-- Dependencies: None
-- =============================================================
entity direction_truncated_keyword is
end entity direction_truncated_keyword;

architecture bad_downto of direction_truncated_keyword is
  -- ERROR: "down" is not "downto"; not a reserved word in this position
  type t_vec is array(7 down 0) of bit;
  signal s : t_vec;
begin
end architecture bad_downto;
