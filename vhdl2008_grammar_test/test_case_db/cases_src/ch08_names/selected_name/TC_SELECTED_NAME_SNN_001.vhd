-- =============================================================
-- Case ID: TC_SELECTED_NAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Negative
-- Test Focus: SNN: missing dot separator——in s_rec field the prefix and suffix are separated by a space instead of the '.' dot; a selected_name must join prefix and suffix with a dot
-- Expected Result: Triggers syntax error at missing dot
-- Dependencies: None
-- =============================================================
entity sel_name_miss_dot is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of sel_name_miss_dot is
  type t_rec is record x : integer; y : bit; end record;
  signal s_rec : t_rec := (x => 0, y => '0');
begin
  -- ERROR: Missing '.' between prefix and suffix
  q <= s_rec y;
end architecture vhdl2008;
